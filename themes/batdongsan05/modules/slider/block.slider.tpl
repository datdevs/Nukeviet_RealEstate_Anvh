<!-- BEGIN: main -->
<link rel="stylesheet" type="text/css" href="{NV_BASE_SITEURL}themes/batdongsan05/css/owl.carousel.min.css"/>
<link rel="stylesheet" type="text/css" href="{NV_BASE_SITEURL}themes/batdongsan05/css/animate.min.css"/>
<script type="text/javascript" src="{NV_BASE_SITEURL}themes/batdongsan05/js/owl.carousel.min.js"></script>

<div id="slider_home" class="owl-carousel">
	<!-- BEGIN: loop -->
	<div class="item">	
		<img class="" src="{DATA.image}" alt="Bất Động Sản 456 Việt Nam - Dịch Vụ Môi Giới Mua Bán Cho Thuê">
	</div>
	<!-- END: loop -->
</div>
<script>
$('#slider_home').owlCarousel({
    loop:true,
	autoplay:1000,
	smartSpeed:2000,
	animateOut: 'fadeOut',
    animateIn: 'fadeIn',
    margin:0,
    responsiveClass:true,
	dots:false,
    responsive:{
        0:{
            items:1,
            nav:false
        },
        600:{
            items:1,
            nav:false
        },
        1000:{
            items:1,
            nav:false
        }
    }
})
</script>
<!-- END: main --> 