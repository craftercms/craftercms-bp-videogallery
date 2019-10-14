<#import "/templates/web/layout/default-layout.ftl" as layout/>
<#import "/templates/web/includes/utils.ftl" as utils/>
<#import "/templates/system/common/cstudio-support.ftl" as studio />

<@layout.default>
<div class="content" <@studio.iceAttr iceGroup="visible" path=contentModel.storeUrl />>
			<div class="section group">				
				<div class="col span_1_of_3">
					<div class="contact_info">
			    	 	<h3>${contentModel.imageTitle_t}</h3>
							<img src="${contentModel.image_s}"></img>
      				</div>
				</div>				
				<div class="col span_2_of_3">
				  <div class="contact-form">
				  	<h3>${contentModel.mainInformationTitle_t}</h3>
                    	${contentModel.mainInformation_html}
				    </div>
  				</div>				
			  </div>
		</div>
	</div>
</@layout.default>