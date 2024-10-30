<#macro renderHeader>
      <#list contentModel.defaultHeader_o.item as header>
            <@renderComponent component = header/>
      </#list>
</#macro>

<#macro renderFooter>
      <#list contentModel.defaultFooter_o.item as footer>
            <@renderComponent component = footer/>
      </#list>
</#macro>
