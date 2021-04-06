<#import "/templates/web/layout/default-layout.ftl" as layout/>
<#import "/templates/web/includes/utils.ftl" as utils/>
<#import "/templates/system/common/ice.ftl" as studio />

<@layout.default>
	<div class="content">
		<div class="section group">
			<div class="col span_1_of_3">
				<div class="contact_info">
					<@studio.h3 $field="imageTitle_t">
						${contentModel.imageTitle_t}
					</@studio.h3>
					<@studio.img
						$field="image_s"
						src=(contentModel.image_s)
					/>
				</div>
			</div>
			<div class="col span_2_of_3">
				<div class="contact-form">
					<@studio.h3 $field="mainInformationTitle_t">
						${contentModel.mainInformationTitle_t}
					</@studio.h3>
					<@studio.tag $field="mainInformation_html">
						${contentModel.mainInformation_html}
					</@studio.tag>
				</div>
			</div>
		</div>
	</div>
</@layout.default>