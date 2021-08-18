
<footer id="footer" class="footer pt-5">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-6">
				<div class="mb-4">
					<a title="{SITE_NAME}" href="{THEME_SITE_HREF}"><img src="{LOGO_SRC}" width="{LOGO_WIDTH}" height="{LOGO_HEIGHT}" alt="{SITE_NAME}" /></a>
				</div>
				[COL_1]
			</div>
			<div class="col-xs-12 col-sm-2 col-md-2" data-aos="fade-left">
                [MENU_FOOTER]
            </div>          		
			<div class="col-xs-12 col-sm-2 col-md-2" data-aos="fade-left">
				[COL_2]
			</div>
            <div class="col-xs-12 col-sm-2 col-md-2" data-aos="fade-left">	
				[FEATURED_PRODUCT]
			</div>
        </div>
        <hr>
		<div class="row">
			<div class="col-xs-6 col-sm-8 col-md-8 mt-3">
				[COL_3]
			</div>
			<div class="col-xs-6 col-sm-4 col-md-4">
				[COL_4]
			</div>
		</div>
	</div>
</footer>
        {ADMINTOOLBAR}
    
    <!-- SiteModal Required!!! -->
    <div id="sitemodal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <em class="fa fa-spinner fa-spin">&nbsp;</em>
                </div>
                <button type="button" class="close" data-dismiss="modal"><span class="fa fa-times"></span></button>
            </div>
        </div>
    </div>
    [HOTLINE_MOBILE]
	
	
	
	<script type="text/javascript">
		var h = $(window).height();
		$(window).scroll(function(){
			if ($(this).scrollTop() > 20) {
				$('.header-sticky').css('transition','all 0.3s ease-out 0s');
				$('.header-sticky').addClass("active");
		
			}else {
				$('.header-sticky').removeClass("active");
			}
		});
	</script>
	
	
	
	
	
	
	
	
	
	
