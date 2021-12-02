<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.div>
<div class="footer">
  <div class="wrap">

    <div class="box1">
      <@crafter.h4 $field="socialTitle_t">
        ${contentModel.socialTitle_t}
      </@crafter.h4>
      <ul class="social">
        <#list contentModel.socialOptions_o.item as media>
          <#if media.show_b >
            <li>
              <i class="fa-custom ${media.socialSite_s}"></i>
              <a href="${media.url_s}">${media.displayName_t}</a>
            </li>
          </#if>
        </#list>
      </ul>
    </div>
    <div class="clear"></div>
  </div>
</div>
<div class="clear"></div>
<#if contentModel.showCopyright_b>
  <div class="copy-right">
    <p>&#169 2021 All rights Reserved | Design by &nbsp;<a href="http://w3layouts.com">W3Layouts</a>
    </p>
  </div>
</#if>
</@crafter.div>