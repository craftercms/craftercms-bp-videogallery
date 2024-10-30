<#import "/templates/web/layout/default-layout.ftl" as layout/>
<#import "/templates/system/common/crafter.ftl" as crafter />

<@layout.default>
  <div class="content">
    <div class="inner-page">
      <div class="searchbar">
        <div class="search-left">
          <@crafter.p $field="title_t">
            ${contentModel.title_t}
          </@crafter.p>
        </div>
        <div class="clear"></div>
      </div>
      <div class="title">
        <@crafter.h3 $field="title_t">
          ${contentModel.title_t}
        </@crafter.h3>
        <ul>
          <li>
            <h4>By:</h4>
          </li>
          <li>
            <@crafter.a $field="author_t" href="#">
              ${contentModel.author_t!""}
            </@crafter.a>
          </li>
        </ul>
      </div>
      <div class="video-inner">
        <#assign posterImage="">
        <#if contentModel.thumbnail_s??>
          <#assign posterImage="${contentModel.thumbnail_s}">
        </#if>
        <@crafter.video $field="video_s" controls="true" poster=(posterImage) preload="auto">
          <source src="${contentModel.video_s}" type="video/mp4">
          <p>Your browser does not support H.264/MP4.</p>
        </@crafter.video>
      </div>
      <div class="viwes">
        <div class="view-links">
          <div id="share"></div>
        </div>
        <div class="clear"></div>
      </div>
      <div class="clear"></div>
      <div class="video-details">
        <ul>
          <li>
            <p>
              Uploaded on
              <a href="#">
                ${contentModel.createdDate_dt?datetime?string[contentModel.dateFormat_s]!""}
              </a>
            </p>
          </li>
          <li>
            <@crafter.span $field="description_t">
              ${contentModel.description_t}
            </@crafter.span>
          </li>
        </ul>
      </div>
      <div class="clear"></div>
      <div class="tags">
        <ul>
          <li>
            <h3>Tags:</h3>
          </li>
            <#if contentModel.tags_o.item??>
              <#list contentModel.tags_o.item as tag>
                <#assign index = tag?index>
                <li>
                  <a onClick="categoryRedirect('${tag.tagName_t}')">
                    <@crafter.span $field="tags_o.tagName_t" $index=index>
                      ${tag.tagName_t}
                    </@crafter.span>
                  </a>,
                </li>
              </#list>
            </#if>
        </ul>
      </div>
      <div class="clear"></div>
    </div>
    <div class="clear"></div>
  </div>
</@layout.default>
