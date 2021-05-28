<#import "/templates/web/layout/default-layout.ftl" as layout/>
<#import "/templates/web/includes/utils.ftl" as utils/>
<#import "/templates/system/common/crafter.ftl" as crafter />

<@layout.default>
	<div class="content">
		<div class="section group">
			<div class="col span_1_of_3">
				<div class="contact_info">
					<@crafter.h3 $field="imageTitle_t">
						${contentModel.imageTitle_t}
					</@crafter.h3>
					<@crafter.img
						$field="image_s"
						src=(contentModel.image_s)
					/>
				</div>
			</div>
			<div class="col span_2_of_3">
				<div class="contact-form">
					<@crafter.h3 $field="mainInformationTitle_t">
						${contentModel.mainInformationTitle_t}
					</@crafter.h3>
					<@crafter.tag $field="mainInformation_html">
						${contentModel.mainInformation_html}
					</@crafter.tag>
				</div>
			</div>
		</div>
	</div>
</@layout.default>