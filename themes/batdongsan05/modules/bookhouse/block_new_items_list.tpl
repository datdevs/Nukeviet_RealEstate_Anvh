<!-- BEGIN: main -->
<div class="row" data-aos-easing="ease-in-out-sine"  data-aos-duration="400" data-aos-delay="0" >
	<!-- BEGIN: newloop -->
			<div class="col-xs-12 col-md-4 col-sm-6" {clear}>
					<div class="rentex-listing-grid-item" data-aos="fade-up">
						<div class="rentex-listing-thumbnail-panel">
							<div class="rentex-thumbnail-panel-top">
								<div class="rentext-listing-category">
									<span>Bán</span><span>Thuê</span>
								</div>
							</div>
							<div class="ulisting-thumbnail-panel">
								<div class="thumbnail-box-listing">
									<a class="ulisting-thumbnail-box-link" title="{blocknew_items.title}" href="{blocknew_items.link}"> </a>
									
									<img src="{blocknew_items.imgurl}" alt="{blocknew_items.title}"/>
							
								</div>
							</div>
							<div class="rentex-thumbnail-panel-bottom">
								<div class="rentex-main-content">
									<div class="ulisting-listing-price"> 
										<span class="ulisting-listing-price-new">
											{blocknew_items.price}   {blocknew_items.money_unit}/{blocknew_items.price_time}
										</span>
									</div>
									<div class="rentex-meta-extra">
										<div class="ulisting-attribute-template">
											<div class="attribute-parts-wrap">
												<span class="fa fa-bed" aria-hidden="true"></span>
												<span class="attribute-value">{blocknew_items.phong_ngu}</span>
											</div>
										</div> 
										<div class="ulisting-attribute-template">
											<div class="attribute-parts-wrap">
												<span class="fa fa-bath" aria-hidden="true"></span>
												<span class="attribute-value">{blocknew_items.phong_tam}</span>
											</div>
										</div> 
										<div class="ulisting-attribute-template">
											<div class="attribute-parts-wrap">
												<span class="fa fa-clone" aria-hidden="true"></span>
												<span class="attribute-value">{blocknew_items.area} {LANG.m2}</span>
											</div>
										</div> 
										<div class="ulisting-attribute-template">
											<div class="attribute-parts-wrap">
												<span class="fa fa-map-signs" aria-hidden="true"></span>
												<span class="attribute-value">{blocknew_items.way_id}</span>
											</div>
										</div> 
									</div>
								</div>
							</div>
						</div>
						<h3 class="rentex-meta-size">
							{blocknew_items.title}
						</h3> 
					</div>
			</div>
	<!-- END: newloop -->
</div>
<div class="text-center">
<a href="{module_link}" class="elementor-button" role="button">
	<span class="elementor-button-content-wrapper">
		<span class="elementor-button-text">{LANG.xemthem}</span>
		<i class="fa fa-long-arrow-right" aria-hidden="true"></i>
	</span>
</a>
</div>
<!-- END: main -->


<h3><a title="{blocknew_items.title}" href="{blocknew_items.link}" style="color: {blocknew_items.color}">{blocknew_items.title}</a></h3>

<p class="dia_chi">{blocknew_items.location}</p>