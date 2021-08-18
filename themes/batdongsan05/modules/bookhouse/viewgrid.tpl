<!-- BEGIN: main -->
<div class="row" data-aos-easing="ease-in-out-sine"  data-aos-duration="600" data-aos-delay="0">
		<!-- BEGIN: loop -->	
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
							<a class="ulisting-thumbnail-box-link" href="{DATA.link}" title="{DATA.title}"></a>
							<img src="{DATA.imghome}" alt="{DATA.title}"/>
						</div>
					</div>
					<div class="rentex-thumbnail-panel-bottom">
							<div class="rentex-main-content">
									<div class="ulisting-listing-price"> 
										<span class="ulisting-listing-price-new">
										<!-- BEGIN: price -->
											{DATA.price} 
											{DATA.money_unit}/{DATA.price_time}
										<!-- END: price --> 
										</span>
									</div>
									<div class="rentex-meta-extra">
										<div class="ulisting-attribute-template">
											<div class="attribute-parts-wrap">
												<span class="fa fa-bed" aria-hidden="true"></span>
												<span class="attribute-value">{DATA.phong_ngu}</span>
											</div>
										</div> 
										<div class="ulisting-attribute-template">
											<div class="attribute-parts-wrap">
												<span class="fa fa-bath" aria-hidden="true"></span>
												<span class="attribute-value">{DATA.phong_tam}</span>
											</div>
										</div> 
										<div class="ulisting-attribute-template">
											<div class="attribute-parts-wrap">
												<span class="fa fa-clone" aria-hidden="true"></span>
												<span class="attribute-value">{DATA.area} {LANG.m2}</span>
											</div>
										</div> 
										<div class="ulisting-attribute-template">
											<div class="attribute-parts-wrap">
												<span class="fa fa-map-signs" aria-hidden="true"></span>
												<span class="attribute-value">{DATA.way_id}</span>
											</div>
										</div> 
									</div>
								</div>
					</div>
				</div>
				<h3 class="rentex-meta-size">
					{DATA.title}
				</h3> 
			</div>
		</div>
	<!-- END: loop -->	
</div>
<!-- END: main -->