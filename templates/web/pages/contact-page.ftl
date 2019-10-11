<#import "/templates/web/layout/default-layout.ftl" as layout/>
<#import "/templates/web/includes/utils.ftl" as utils/>
<#import "/templates/system/common/cstudio-support.ftl" as studio />
<#import "/templates/system/common/craftercms-common.ftl" as crafterCommon/>

<@layout.default>
<div class="content" <@studio.iceAttr iceGroup="visible" path=contentModel.storeUrl />>
			<div class="section group">				
				<div class="col span_1_of_3">
					<div class="contact_info">
			    	 	<h3>${contentModel.locationTitle_t}</h3>
			    	 		<div class="map">
					   			 <div class="ourmap" style="height:175px"></div>
					   		</div>
      				</div>
      			<div class="company_address">
				     	<h3>${contentModel.informationTitle_t}</h3>
						    	<p>${contentModel.companyMainAddress_t},</p>
						   		<p>${contentModel.companySecondAddress_t}</p>
				   		<p>Phone: ${contentModel.companyPhone_t}</p>
				   		<p>Fax: ${contentModel.companyFax_t}</p>
				 	 	<p>Email: <span><a href="mailto:${contentModel.companyEmail_t}">${contentModel.companyEmail_t}</a></span></p>
				   </div>
				</div>				
				<div class="col span_2_of_3">
				  <div class="contact-form">
				  	<h3>${contentModel.contactFormTitle_t}</h3>
					    <form id="contact" action="/doContact" method="post">
					    	<div>
						    	<span><label>${contentModel.contactNameLabel_t}</label></span>
						    	<span><input name="name" id="name" type="text" value="" required=""></span>
						    </div>
						    <div>
						    	<span><label>${contentModel.contactEmailLabel_t}</label></span>
						    	<span><input  name="email"  id="email" type="email" value="" required=""></span>
						    </div>
						    <div>
						     	<span><label>${contentModel.contactMobileLabel_t}</label></span>
						    	<span><input  name="mobile"  id="mobile" type="text" value="" required=""></span>
						    </div>
						    <div>
						    	<span><label>${contentModel.contactSubjectLabel_t}</label></span>
						    	<span><textarea name="message" id="message" type="text" required=""></textarea></span>
						    </div>
						   <div>
                                <input type="submit" id="form-submit" value="${contentModel.buttonSubmitTitle_t}">
						  </div>
					    </form>
				    </div>
  				</div>				
			  </div>
		</div>
	</div>
</@layout.default>