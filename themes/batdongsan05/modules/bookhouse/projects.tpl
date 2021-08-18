<!-- BEGIN: main -->
<!-- lay bo loc Ajax tin ra -->
<section class="bg_white pt-4 pb-4">
	<div class="container">	
		<h1 class="elementor-heading-title mt-2">DỰ ÁN</h1>
		<div class="well">	
			
				<i class="fa fa-sort-amount-desc" aria-hidden="true"></i>
				<span class="control-label">Lọc tin: </span>
				<label class="control-label ml-3"> Mới nhất </label>
				<label class="control-label ml-3"> Phổ biến </label>
				<label class="control-label ml-3"> Giá cao đến thấp </label>
				<label class="control-label ml-3"> Giá thấp đến cao </label>
				<a id="view-list" class="active float-right ml-3" data-show="1">
					<i class="fa fa-list-ul" aria-hidden="true"></i>
				</a> 
				<a id="view-gird1" class="float-right ml-3" data-show="2">
					<i class="fa fa-th-large" aria-hidden="true"></i>
				</a> 			
		</div>
		<hr class="mt-0">
		BỔ SUNG BỘ LỌC
	</div>
</section>	
<!-- Kết thúc -->
<div class="container pt-5 pb-5" data-aos-easing="ease-in-out-sine"  data-aos-duration="400" data-aos-delay="0">	
		<div class="row">
			<!-- BEGIN: loop -->
			<div class="col-xs-12 col-md-6" data-aos="zoom-in">
				<div class="populated-item mb-4"> 
						<a href="{DATA.link}" class="bl-img"> 
							<img class=" loaded loaded" alt="{DATA.title}" src="{DATA.homeimg}"> 
						</a> 
						<div class="bl-info"> 
						<div class="img"> '	
							<i class="fa fa-building" aria-hidden="true"></i>
						</div> 
						<div class="info"> 
							<p class="p-title">{DATA.title}</p> 
							<p class="p-count">{LANG.chudautu} : <b>{DATA.chudautu}</b></p> 
							<p class="p-a"><a href="{DATA.link}">Khám phá <i class="ic ic-arrow"></i></a></p>
						</div> 
					</div>
				</div>		
			</div>
			<!-- END: loop -->
		</div>
		
		<!-- BEGIN: page -->
			{PAGE}
		<!-- END: page -->
</div>

<!-- END: main -->



<div class="populated-item"> 
					<div class="rentex-listing-thumbnail-panel">
							
							<div class="ulisting-thumbnail-panel">
								<div class="thumbnail-box-listing">
									<a class="ulisting-thumbnail-box-link"  href="{DATA.link}" title="{DATA.title}"></a>
									<!-- BEGIN: homeimg -->
										<img src="{DATA.homeimg}" alt="{DATA.title}"/>
									<!-- END: homeimg -->
								</div>
							</div>
							<div class="rentex-thumbnail-panel-bottom">
								<div class="ulisting-listing-price">
									<span class="ulisting-listing-price-new">
										{LANG.giaban}: <strong> {DATA.giaban}</strong>
									</span> <br>
									<span class="ulisting-listing-price-new">
										{LANG.giathue}: <strong> {DATA.giathue}</strong>
									</span>
								</div> 
							</div>
					</div>
					<div class="rentex-listing-content-panel">
						<div class="rentex-main-content">
							<div class="listing-single-title style_1">
									<h3 class="title">
										<a href="{DATA.link}" title="{DATA.title}">{DATA.title}</a>
									</h3>
									<span class="attribute-value">{LANG.chudautu}: </span><strong> {DATA.chudautu}</strong>
									<hr class="mt-0">
									<div class="rentex-meta-extra1">	
										<div class="row">	
											<div class="col-md-6">	
												<div class="ulisting-attribute-template attribute_style_2 attribute_bedrooms">
													<div class="attribute-parts-wrap">
														<span class="fa fa-bed" aria-hidden="true"></span>
														<span class="attribute-value">{DATA.sophong}</span>
														<span class="attribute-affix"></span>
													</div>
												</div> 
											</div> 
											<div class="col-md-6">	
												<div class="ulisting-attribute-template attribute_style_2 attribute_bathrooms">
													<div class="attribute-parts-wrap">
														<span class="fa fa-building" aria-hidden="true"></span>
														<span class="attribute-value">{DATA.soblock}</span>
														<span class="attribute-affix"></span>
													</div>
												</div> 
											</div> 
											<div class="col-md-6">
												<div class="ulisting-attribute-template attribute_style_2 attribute_bathrooms">
													<div class="attribute-parts-wrap">
														<span class="fa fa-level-up" aria-hidden="true"></span>
														<span class="attribute-value">{DATA.sotang}</span>
														<span class="attribute-affix"></span>
													</div>
												</div> 
											</div> 
											<div class="col-md-6">
												<div class="ulisting-attribute-template attribute_style_2 attribute_bathrooms">
													<div class="attribute-parts-wrap">
														<span class="fa fa-home" aria-hidden="true"></span>
														<span class="attribute-value">{DATA.socanho}</span>
														<span class="attribute-affix"></span>
													</div>
												</div> 
											</div> 
											<div class="col-md-6">
												<div class="ulisting-attribute-template attribute_style_2 attribute_area">
													<div class="attribute-parts-wrap">
														<span class="fa fa-arrows-alt" aria-hidden="true"></span>
														<span class="attribute-value">{DATA.dientich} </span>
													</div> 
												</div> 
											</div> 
										</div>	
									</div>
									<div class="rentex-meta-size rentex-short-desc">
										42 Nguyễn Kiệm
									</div>	