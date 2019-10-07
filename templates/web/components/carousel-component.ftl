<#import "/templates/system/common/craftercms-common.ftl" as crafterCommon/>
<#import "/templates/web/navigation2/navigation.ftl" as nav/>
<#import "/templates/web/includes/utils.ftl" as utils/>

<#macro carousel listVideos>
<div class="searchbar">
  <div class="search-left">
    <p>Featured Videos</p>
  </div>
  <div class="clear"> </div>
</div>
<div class="slider">
  <#list listVideos as video>
    <div class="grid">
      <h3>${video.title}</h3>
      <#assign posterImage="">
      <#if video.thumbnail??>
        <#assign posterImage="${video.thumbnail}">
      </#if>
      <video id ="vid-carousel-${video['folder-name']}" class="video-carousel" poster="${posterImage}" preload="auto">
        <source src="${video.video}" type="video/mp4">
          <source src="${video.video}" type="video/webm">
        <p>Your browser does not support H.264/MP4.</p>
      </video>

      <div class="carousel-player-container" id="player-carousel-${video['folder-name']}">
        <span></span>
      </div>
      <div class="watch" class="time-video-carousel">
        <a href="${utils.renderURL(video.localId)}" data-test="">Watch now</a>
      </div>
      <div class="time" id="time-carousel-${video['folder-name']}">
        <span class= "time-video-carousel" id="span-carousel-${video['folder-name']}">${video.duration}</span>
      </div>
      <div class="grid-info">
        <div class="clear"> </div>        
        <div class="lables">
          <p>Tags:
          	<#if video.tags.item??>
                  <#list video.tags.item as tag>
                  	<#if tag??>
                      <a onClick="categoryRedirect('${tag.tagName}')" title="Go to 'Watch now' for more information">${tag.tagName}</a>,
                    </#if>
                  </#list>
                  <#else>
              		There are no tags for this video
              </#if>
           </p>
        </div>
      </div>
    </div>
  </#list>
  </div>
</#macro>
