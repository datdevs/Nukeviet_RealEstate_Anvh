<!-- BEGIN: main -->
<link rel="stylesheet" type="text/css" href="/themes/batdongsan05/css/owl.carousel.min.css"/>
<script type="text/javascript" src="/themes/batdongsan05/js/owl.carousel.min.js"></script>
<div id="detail">
	<!-- BEGIN: image -->
	<div id="slider_site" class="owl-carousel owl-theme">
		<!-- BEGIN: loop -->
			<div class="item">
				<img src="{IMAGE}" alt="Hinh-{DATA.title}" />
			</div>
		<!-- END: loop -->
	</div>
	<!-- END: image -->
	<section class="pt-4 pb-4 t-detail">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="elementor-button ma_tin"> Mã tin đăng:{DATA.id}</div>
					<h1 class="title_bds">{DATA.title}</h1>
					<p class="diachi">
						<i class="fa fa-map-marker"></i> {DATA.address}
					</p>
					<p class="ulisting-price">
						{DATA.price} {DATA.money_unit}/{DATA.price_time}  
					</p>
					<div class="label mb-10">
						<span class="label-1">Bán</span>   
						<span class="label-2">Đã thẩm định</span> 
						<span class="label-3">Mã {DATA.id}</span> 
					</div>
					<div class="detailroom">
						<ul>
							<li>
								<i class="fa fa-bed" aria-hidden="true"></i> 
								<span class="sp-text">Phòng ngủ</span> 
								<span class="sp-info">{DATA.phong_ngu}</span> 
							</li>
							<li>
								<i class="fa fa-bath" aria-hidden="true"></i>
								<span class="sp-text">Phòng tắm</span> 
								<span class="sp-info">{DATA.phong_tam}</span> 
							</li>
							<li>
								<!-- BEGIN: area -->
									<i class="fa fa-clone" aria-hidden="true"></i>
									<span class="sp-text">Diện tích</span> 
									<span class="sp-info">{DATA.area}{LANG.m2}</span>
								<!-- END: area -->
							</li> 
							<li>
								<i class="fa fa-map-signs" aria-hidden="true"></i>
								<span class="sp-text">Hướng</span> 
								<span class="sp-info"> {DATA.way_id}</span>
							</li> 
							<li>
								<i class="fa fa-tag" aria-hidden="true"></i>
								<span class="sp-text">Nội thất</span> 
								<span class="sp-info"> {noi_that_daydu}</span>
							</li> 
							<li>
								<i class="fa fa-tag" aria-hidden="true"></i>
								<span class="sp-text">Tiện ích</span> 
								<span class="sp-info"> {tien_ich_daydu}</span>
							</li> 
							
						</ul>
					</div>
									
					<div class="accordion" id="accordionPanelsStayOpenExample">
						  <div class="accordion-item">
							<h2 class="accordion-header" id="panelsStayOpen-headingOne">
							  <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
								{LANG.gioithieu_d}
							  </button>
							</h2>
							<div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
							  <div class="accordion-body">
									<p><strong>{DATA.hometext}</strong></p>
									{DATA.bodytext}
							  </div>
							</div>
						  </div>
						  
						  
						  <div class="accordion-item">
							<h2 class="accordion-header" id="panelsStayOpen-headingTwo">
							  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
									Chi Tiết
							  </button>
							</h2>
							<div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
							  <div class="accordion-body">
									<div class="info_basic">
										<div class="row">
											<div class="col-md-5">
												<ul>
													<li> <span class="sp-title"> 
														<i class="fa fa-bed" aria-hidden="true"></i>  	 {LANG.phongngu} 
														</span> 
														<span class="sp-info"> {DATA.phong_ngu} </span> 
													</li>
													<li> <span class="sp-title"> 
														<i class="fa fa-h-square" aria-hidden="true"></i>	
														Phòng khách </span> 
														<span class="sp-info"> {DATA.phong_khach} </span> 
													</li>
													<li> <span class="sp-title"> 
														<i class="fa fa-bath" aria-hidden="true"></i> Phòng tắm </span> 
														<span class="sp-info"> {DATA.phong_tam} </span> 
													</li>
													<li> <span class="sp-title"> 
														<i class="fa fa-map-signs" aria-hidden="true">
														</i> Hướng</span> 
														<span class="sp-info"> {DATA.way_id} </span> 
													</li>
													<li> <span class="sp-title"> 
														<i class="fa fa-cog" aria-hidden="true"></i> Kết cấu</span> 
														<span class="sp-info"> Cập nhật </span> 
													</li>
													<li> <span class="sp-title"> 
														<i class="fa fa-registered" aria-hidden="true"></i> Pháp lý</span> 
														<span class="sp-info"> {DATA.legal} </span> 
													</li>
												</ul>
											</div>	
											<div class="col-md-5 offset-2">
												<ul>
													<li> <span class="sp-title"> 
														<i class="fa fa-clone" aria-hidden="true"></i> {LANG.area} </span> 
														<span class="sp-info"> {DATA.area} {LANG.m2} </span> 
													</li>
													<li> <span class="sp-title"> 
														<i class="fa fa-arrows-h" aria-hidden="true"></i>  {LANG.cd} </span> 
														<span class="sp-info"> {DATA.size_v} </span> 
													</li>
													<li> <span class="sp-title"> 
														<i class="fa fa-arrows-v" aria-hidden="true"></i>  {LANG.cr}</span> 
														<span class="sp-info"> {DATA.size_h} </span> 
													</li>
													<li> <span class="sp-title"> 
														<i class="fa fa-truck" aria-hidden="true"></i> Đường rộng</span> 
														<span class="sp-info"> {DATA.front} </span> 
													</li>
													<li> <span class="sp-title"> 
														<i class="fa fa-barcode" aria-hidden="true"></i> Mặt tiền</span> 
														<span class="sp-info"> {DATA.road} </span> 
													</li>
													<li> <span class="sp-title"> 
														<i class="fa fa-eye" aria-hidden="true"></i> View</span> 
														<span class="sp-info"> Cập nhật </span> 
													</li>
												</ul>
											</div>	
										</div>	
									</div>				
							  </div>
							</div>
						  </div>
						  
						  <div class="accordion-item">
							<h2 class="accordion-header" id="panelsStayOpen-headingThree">
							  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
									{LANG.noi_that}
							  </button>
							</h2>
							<div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
							  <div class="accordion-body">
								<div class="info_basic2">
									<ul class="row">
										<!-- BEGIN: noi_that -->
											<li class="col-md-5">
												<span class="text_a">
														{noi_that.title} 
												</span>
												<span class="text-icon">
													{checked}	
												</span>
											</li>
										<!-- END: noi_that -->
									</ul>
								</div>
							  </div>
							</div>
						  </div>
					
						  
						  <div class="accordion-item">
							<h2 class="accordion-header" id="panelsStayOpen-heading4">
							  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse4" aria-expanded="false" aria-controls="panelsStayOpen-collapse4">
									{LANG.tien_ich}
							  </button>
							</h2>
							<div id="panelsStayOpen-collapse4" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-heading4">
							  <div class="accordion-body">
									<div class="info_basic2">
										<ul class="row">
											<!-- BEGIN: tien_ich -->
												<li class="col-md-5">
													<span class="text_a">
														{tien_ich.title}
													</span>
													<span class="text-icon">
														{checked}
													</span>
												</li>
											<!-- END: tien_ich -->
										</ul>
									</div>
								</div>
						  </div>
						
						</div>

						  <div class="accordion-item">
							<h2 class="accordion-header" id="panelsStayOpen-heading5">
							  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse5" aria-expanded="false" aria-controls="panelsStayOpen-collapse5">
									Tiện ích khu vực
							  </button>
							</h2>
							<div id="panelsStayOpen-collapse5" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-heading5">
							  <div class="accordion-body">
									<script>
			if (!$('#googleMapAPI').length) {
				var script = document.createElement('script');
				script.type = 'text/javascript';
				script.id = 'googleMapAPI';
				script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&callback=initializeMap&key={MAPS.maps_appid}';
				document.body.appendChild(script);
			} else {
				initializeMap();
			}
		
			function initializeMap() {
				var ele = 'company-map';
				var map, marker, ca, cf, a, f, z;
				ca = parseFloat($('#' + ele).data('clat'));
				cf = parseFloat($('#' + ele).data('clng'));
				a = parseFloat($('#' + ele).data('lat'));
				f = parseFloat($('#' + ele).data('lng'));
				z = parseInt($('#' + ele).data('zoom'));
				map = new google.maps.Map(document.getElementById(ele), {
					zoom: z,
					center: {
						lat: ca,
						lng: cf
					}
				});
				marker = new google.maps.Marker({
					map: map,
					position: new google.maps.LatLng(a, f),
					draggable: false,
					animation: google.maps.Animation.DROP
				});
			}
			</script>
		
			<div class="m-bottom" id="company-map" style="width: 100%; height: 300px"
				data-clat="{MAPS.maps_mapcenterlat}"
				data-clng="{MAPS.maps_mapcenterlng}" data-lat="{MAPS.maps_maplat}"
				data-lng="{MAPS.maps_maplng}" data-zoom="{MAPS.maps_mapzoom}"></div>
							  </div>
							</div>
						  </div>
						  	
					</div>
					
				</div>
				<div class="col-md-4">
					<div class="card mb-3 mg_top">
						<div class="card-body">
							[LIEN_HE]
						</div>	
					</div>			
				</div>
			</div>
		</div>
	</section>
	<section class="pt-4 pb-4 bg_detail">
		<div class="container pt-1 pb-2">
		<div class="text-center  mb-3">
			<span class="elementor-widget">Đề xuất</span>
			<h2 class="elementor-heading-title"><a href="javascript:void(0);">NHÀ ĐẤT CÙNG LOẠI</a></h2>
		</div>
		<div class="row">
			<div class="col-md-12">
					<!-- BEGIN: other -->
					<div id="bds_cungloai" class="owl-carousel">
						<!-- BEGIN: loop -->
						<div class="item">
							<div class="rentex-listing-grid-item" data-aos="fade-up">
								<div class="rentex-listing-thumbnail-panel">
									<div class="rentex-thumbnail-panel-top">
										<div class="rentext-listing-category">
											<span>Bán</span><span>Thuê</span>
										</div>
									</div>
									<div class="ulisting-thumbnail-panel">
										<div class="thumbnail-box-listing">
											<a class="ulisting-thumbnail-box-link" title="{OTHER.title}" href="{OTHER.link}"> </a>
											
											<img src="{IMAGE}" alt="{OTHER.title}"/>
									
										</div>
									</div>
									<div class="rentex-thumbnail-panel-bottom">
										<div class="rentex-main-content">
											<div class="ulisting-listing-price"> 
												<span class="ulisting-listing-price-new">
													{OTHER.price}   {OTHER.money_unit}/{OTHER.price_time}
												</span>
											</div>
											<div class="rentex-meta-extra">
										<div class="ulisting-attribute-template">
											<div class="attribute-parts-wrap">
												<span class="fa fa-bed" aria-hidden="true"></span>
												<span class="attribute-value">{OTHER.phong_ngu}</span>
											</div>
										</div> 
										<div class="ulisting-attribute-template">
											<div class="attribute-parts-wrap">
												<span class="fa fa-bath" aria-hidden="true"></span>
												<span class="attribute-value">{OTHER.phong_tam}</span>
											</div>
										</div> 
										<div class="ulisting-attribute-template">
											<div class="attribute-parts-wrap">
												<span class="fa fa-clone" aria-hidden="true"></span>
												<span class="attribute-value">{OTHER.area} {LANG.m2}</span>
											</div>
										</div> 
										<div class="ulisting-attribute-template">
											<div class="attribute-parts-wrap">
												<span class="fa fa-map-signs" aria-hidden="true"></span>
												<span class="attribute-value">{OTHER.way_id}</span>
											</div>
										</div> 
									</div>
										</div>
									</div>
								</div>
								<h3 class="rentex-meta-size">
									{OTHER.title}
								</h3> 
							</div>
						</div>
						<!-- END: loop -->
					</div>	
					<!-- END: other -->	
			</div>	
		</div>	
	</div>		
	</section>

</div>	

<script>

$('#bds_cungloai').owlCarousel({
	stagePadding: 0,
    loop:true,
	autoplay:1000,
	smartSpeed:2000,
    margin:25,
    responsiveClass:true,
	dots:true,
    responsive:{
        0:{
            items:1,
            nav:false
        },
        600:{
            items:2,
            nav:false
        },
        1000:{
            items:3,
            nav:true,
			navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"]
        }
    }
})
</script>

<script>

$('#slider_site').owlCarousel({
    loop:true,
	autoplay:3000,
	smartSpeed:1000,
    margin:0,
	autoWidth:true,
    responsiveClass:true,
	dots:false,
    responsive:{
        0:{
            items:1,
            nav:false 
        },
        600:{
            items:2,
            nav:false
        },
        1000:{
            items:3,
            nav:true,
			navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"]
        }
    }
})
</script>

<!-- END: main -->

 