<#import "/templates/web/layout/default-layout.ftl" as layout/>
<#import "/templates/web/includes/utils.ftl" as utils/>
<#import "/templates/system/common/crafter.ftl" as crafter />

<@layout.default>
  <div class="content">
    <div class="section group">
      <div class="col span_1_of_3">
        <div class="contact_info">
					<@crafter.h3 $field="locationTitle_t">
						${contentModel.locationTitle_t}
					</@crafter.h3>
          <div class="map">
            <div class="ourmap" style="height:175px"></div>
          </div>
        </div>
        <div class="company_address">
					<@crafter.h3 $field="informationTitle_t">
						${contentModel.informationTitle_t}
					</@crafter.h3>
          <p>
						<@crafter.span $field="companyMainAddress_t">
							${contentModel.companyMainAddress_t}
						</@crafter.span>
						,
					</p>
					<@crafter.p $field="companySecondAddress_t">
						${contentModel.companySecondAddress_t}
					</@crafter.p>
					<p>
						Phone:
						<@crafter.span $field="companyPhone_t">
							${contentModel.companyPhone_t}
						</@crafter.span>
					</p>
					<p>
						Fax:
						<@crafter.span $field="companyFax_t">
							${contentModel.companyFax_t}
						</@crafter.span>
					</p>
          <p>
						Email:
						<span>
							<a href="mailto:${contentModel.companyEmail_t}">
								<@crafter.span $field="companyEmail_t">
									${contentModel.companyEmail_t}
								</@crafter.span>
							</a>
						</span>
					</p>
        </div>
      </div>
      <div class="col span_2_of_3">
        <div class="contact-form">
					<@crafter.h3 $field="contactFormTitle_t">
						${contentModel.contactFormTitle_t}
					</@crafter.h3>
          <form id="contact" action="/doContact" method="post">
            <div>
              <span><label>${contentModel.contactNameLabel_t}</label></span>
              <span><input name="name" id="name" type="text" value="" required=""></span>
            </div>
            <div>
              <span><label>${contentModel.contactEmailLabel_t}</label></span>
              <span><input name="email" id="email" type="email" value="" required=""></span>
            </div>
            <div>
              <span><label>${contentModel.contactMobileLabel_t}</label></span>
              <span><input name="mobile" id="mobile" type="text" value="" required=""></span>
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