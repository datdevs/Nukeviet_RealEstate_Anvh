<!-- BEGIN: main -->
<link rel="stylesheet" type="text/css" href="{NV_BASE_SITEURL}themes/batdongsan05/css/swiper-bundle.min.css"/>

<script type="text/javascript" src="{NV_BASE_SITEURL}themes/batdongsan05/js/swiper-bundle.min.js"></script>

<div class="text-center  mb-3">
	<span class="elementor-widget">Đang mở bán</span>
	<h2 class="elementor-heading-title"><a href="#">DỰ ÁN MỚI</a></h2>
</div>

<div class="swiper-container">
      <div class="swiper-wrapper">
        <!-- BEGIN: loop -->
        <div class="swiper-slide" style="margin-top:0px">
			<div class="populated-item populated-item{stt}"> 
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
	  <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
      <div class="swiper-pagination"></div>
</div>

<script>
	// slider productHot 
var swiper = new Swiper('.swiper-container', {
    slidesPerView: 2,
    slidesPerColumn: 2,
    spaceBetween:25,
    autoplay: {
        delay: 3000,
    },
	navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
    },

});
// procuctCategory
</script>

<!-- END: main -->



<a href="" title="{DATA.title}">
				<img src="" class="product_hot_img" alt="{DATA.homeimg}">
			</a>
			
						<div class="populated_bds">
							<div class="p-5 mt-3 mb-3">
						<span class="elementor-widget">
							Dự án đang mở bán
						</span>
						<h2 class="elementor-heading-title">
							</a>
						</h2> 
						<p class="pt-1 pb-1">
							{DATA.description}
						</p>
						
						<ul class="row elementor-icon-list-items">	
							<li class="col-md-6">
								<i class="fa fa-check" aria-hidden="true"></i> 
								<span>: <strong> </strong></span>
							</li>
							
							<li class="col-md-6">
								<i class="fa fa-check" aria-hidden="true"></i> 
								<span>{LANG.soblock}:<strong> {DATA.soblock}</strong></span>
							</li>
							<li class="col-md-6">
								<i class="fa fa-check" aria-hidden="true"></i> 
								<span>{LANG.sotang}:<strong> {DATA.sotang}</strong></span>
							</li>
							<li class="col-md-6">
								<i class="fa fa-check" aria-hidden="true"></i> 
								<span>{LANG.dientichxd}:<strong> {DATA.dientichxd}</strong></span>
							</li>
							<li class="col-md-6">
								<i class="fa fa-check" aria-hidden="true"></i> 
								<span>{LANG.socan}:<strong> {DATA.socanho}</strong></span>
							</li>
							<li class="col-md-6">
								<i class="fa fa-check" aria-hidden="true"></i> 
								<span>{LANG.sophong}:<strong>{DATA.sophong}</strong>
								</span>
							</li>					
							<li class="col-md-6">
								<i class="fa fa-check" aria-hidden="true"></i> 
								<span>{LANG.giaban}: <strong> {DATA.giaban}</strong></span>
							</li>
							<li class="col-md-6">
								<i class="fa fa-check" aria-hidden="true"></i> 
								<span>{LANG.giathue}: <strong> {DATA.giathue}</strong>
								</span>
							</li>
						</ul>	
						
						<a href="{DATA.link}"  class="elementor-button-link elementor-button elementor-size-md" role="button">
							<span class="elementor-button-content-wrapper">
								<span class="elementor-button-text">Xem thêm</span>
								<i class="fa fa-long-arrow-right" aria-hidden="true"></i>
							</span>
						</a>

					</div>
				</div>
					</div>
				</div>
			</div>