function videoHandler(videoClass) {
  return $(videoClass).on('click', function () {
    var formatedId = this.id.split('-').splice(1, this.id.length).join('-');
    var video = document.getElementById('vid-' + formatedId)
    var playerIcon = document.getElementById('player-' + formatedId)
    var timeContainer = document.getElementById('time-' + formatedId)

    video.onseeking = function () {
      video.controls = true;
      video.paused = false;
      playerIcon.style.visibility = "hidden";
    }

    video.onseeked = function () {
      video.controls = true;
      video.paused = false;
      playerIcon.style.visibility = "hidden";
    }


    video.onwebkitfullscreenchange = function () {
      if (!document.webkitFullscreenElement) {
        document.webkitExitFullscreen()
        setTimeout(function () {
          $('.slider').slick('refresh')
          video.paused = false;
        }, 500)
      }
    }



    video.onplaying = function () {
      playerIcon.style.visibility = "hidden";
      video.paused = false;
      if (videoClass === '.carousel-player-container') {
        timeContainer.style.display = "none";
        $('.slick-arrow').css({ display: 'none' })
      }
    }

    video.onpause = function () {
      video.controls = true;
      playerIcon.style.visibility = "visible";
      $('.slick-arrow').css({ display: 'block' })
    }

    if (video.paused) {
      video.play()
      video.controls = true;
      playerIcon.style.visibility = "hidden";
    }
  })
}

function generateTags(tags) {
  if (!tags || tags && tags.length === 0) return ["There are no tags"]

  return tags.map(function (tag) {
    if (!tag.tagName) return

    return tag.tagName
  })
}

function generateVideoUrl(url) {
  return url.split('/').splice(3).filter(function (item) {
    return item != 'index.xml'
  }).join('/')
}

function generateGridVideos(data) {
  const iceOn = $('html').hasClass('craftercms-ice-on');
  var container = $("#gridContainer")

  if (iceOn) {
    deregisterItems(container[0]);
  }

  container.empty();
  if (data.length === 0) {
    var content = document.getElementById("no-results-table-template")
    if (!content) return
    var source = content.innerHTML;
    var template = Handlebars.compile(source);
    var context = {};
    var html = template(context);
    container.append(html);
    return
  }
  const videos = data.responseVideos.map(function (video) {
    const { parseDescriptor } = craftercms.content;
    const model = parseDescriptor(video);
    video.iceAttrs = getICE(model);
    video.titleIceAttrs = getICE(model, 'title_t');
    video.videoIceAttrs = getICE(model, 'video_s');

    video.videoUrl = generateVideoUrl(video.localId);
    if ( video.tags_o ) {
      video.tags = Array.isArray(video.tags_o.item) ? video.tags_o.item : [video.tags_o.item];
    }
    var content = document.getElementById("video-table-template");
    if (!content) return;
    var source = content.innerHTML;
    var template = Handlebars.compile(source);
    var html = template(video);
        
    return html;
  });
  container.append(videos);

  if (iceOn) {
    registerItems(container[0]);
  }
}

function searchVideos(start, videoText, path) {
  currentSearchVale = videoText
  var api = "/api/1/services/search.json?start=" + start + "&searchValue=" + videoText.toLowerCase() + "&path=" + path
  $.get(api)
    .done(function (data) {
      if (data) {
        var p = new Promise(function (resolve) {
          generateGridVideos(data)
          resolve('success')
        })
        p.then(function () {
          $("#gridContainer").css("display", "block");
          generatePagination((data.totalCount / 10) + 1, data.selectedPage)
          handlePagination()
          $('#input-search-text').val(currentSearchVale)
          window.amplify && window.amplify.publish('INIT_ICE_REGIONS');
        })
      }
    })
    .fail(function (error) {
      console.log(error)
    });
}

function requestVideos(start, categoryPath) {
  $.get("/api/1/services/videos.json?start=" + start + "&category=" + categoryPath + "&searchInput=" + currentSearchVale)
    .done(function (data) {
      if (data) {
        var p = new Promise(function (resolve) {
          generateGridVideos(data)
          resolve('success')
        })
        p.then(function () {
          $("#gridContainer").css("display", "block");
          generatePagination((data.totalCount / 10) + 1, data.selectedPage)
          handlePagination()
          window.amplify && window.amplify.publish('INIT_ICE_REGIONS');
        })
      }
    })
    .fail(function (error) {
      console.log(error)
    });
}

function categoryRedirect(tagName) {
  const iceOn = $('html').hasClass('craftercms-ice-on');

  if (!iceOn) {
    currentSearchVale = tagName;
    localStorage.removeItem('jstree');
    localStorage.setItem('tagName', tagName);
    window.location.replace("/categories");
  }
}

function getICE(model, fieldId) {
  const iceAttrs = craftercms.guest.getICEAttributes({
    model,
    isAuthoring: isAuthoring(),
    ...(
      fieldId
      ? { fieldId }
      : {}
    )
  });

  let iceAttrsString = '';
  Object.keys(iceAttrs).forEach(key => {
    iceAttrsString += `${key}="${iceAttrs[key]}" `;
  });

  return iceAttrsString;
}

function registerItems(container) {
  container.querySelectorAll('[data-craftercms-model-id]').forEach((element) => {
    let //
      path = element.getAttribute('data-craftercms-model-path'),
      modelId = element.getAttribute('data-craftercms-model-id'),
      fieldId = element.getAttribute('data-craftercms-field-id'),
      index = element.getAttribute('data-craftercms-index'),
      label = element.getAttribute('data-craftercms-label');

    if ((index !== null) && (index !== undefined) && !index.includes('.')) {
      index = parseInt(index, 10);
    }

    craftercms?.guest?.elementRegistry.register({ element, modelId, fieldId, index, label, path });
  });
}

function deregisterItems(container) {
  container.querySelectorAll('[data-craftercms-model-id]').forEach((el) => {
    const record = craftercms.guest.elementRegistry.fromElement(el);

    // This is supposed to be before updating DOM, but query is returning both old and new elements
    if (record) {
      craftercms?.guest?.elementRegistry.deregister(record.id);
    }
  });
}

function isAuthoring() {
  const html = document.documentElement;
  const attr = html.getAttribute('data-craftercms-preview');

  return (
    attr === '${modePreview?c}' || // Otherwise disable/enable if you want to see pencils in dev server.
    attr === 'true'
  );
}