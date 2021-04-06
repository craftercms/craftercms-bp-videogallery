<#import "/templates/web/navigation2/navigation.ftl" as nav/>
<#import "/templates/web/includes/utils.ftl" as utils/>
<#import "/templates/system/common/ice.ftl" as studio />

<#macro carousel listVideos>
<div class="searchbar">
  <div class="search-left">
    <p>Featured Videos</p>
  </div>
  <div class="clear"> </div>
</div>
<div class="slider">
  <#list listVideos as video>
    <@studio.componentRootTag $model=video class="grid">
      <@studio.h3 $model=video $field="title_t">
        ${video.title_t}
      </@studio.h3>
      <#assign posterImage="">
      <#if video.thumbnail_s??>
        <#assign posterImage="${video.thumbnail_s}">
      </#if>

      <@studio.video $model=video $field="video_s" id ="vid-carousel-${video['folder-name']}" class="video-carousel" poster="${posterImage}" preload="auto">
        <source src="${video.video_s}" type="video/mp4">
        <source src="${video.video_s}" type="video/webm">
        <p>Your browser does not support H.264/MP4.</p>
      </@studio.video>

      <div class="carousel-player-container" id="player-carousel-${video['folder-name']}">
        <span></span>
      </div>
      <div class="watch" class="time-video-carousel">
        <a href="${utils.renderURL(video.localId)}" data-test="">Watch now</a>
      </div>
      <div class="time" id="time-carousel-${video['folder-name']}">
        <span class= "time-video-carousel" id="span-carousel-${video['folder-name']}">${video.duration_s}</span>
      </div>
      <div class="grid-info">
        <div class="clear"> </div>
        <div class="lables">
          <p>Tags:
          <#if video.tags_o.item??>
            <#list video.tags_o.item as tag>
              <#assign index = tag?index>
              <#if tag??>
                <a onClick="categoryRedirect('${tag.tagName_t}')" title="Go to 'Watch now' for more information">
                  <@studio.span $model=video $field="tags_o.tagName_t" $index=index>
                    ${tag.tagName_t}
                  </@studio.span>
                </a>,
              </#if>
            </#list>
          <#else>
            There are no tags for this video
          </#if>
          </p>
        </div>
      </div>
    </@studio.componentRootTag>
  </#list>
  </div>
</#macro>
