<!-- BEGIN: main -->
 
<div class="tabs content_form_block ulisting-search_box ulisting-search_box_style_1">
	<form action="{NV_BASE_SITEURL}index.php" method="get" class="form-horizontal">
		<input type="hidden" name="{NV_LANG_VARIABLE}" value="{NV_LANG_DATA}" /> 
		<input type="hidden" name="{NV_NAME_VARIABLE}" value="{MODULE_NAME}" /> 
		<input type="hidden" name="{NV_OP_VARIABLE}" value="{OP_NAME}" />
		<input type="hidden" name="tab_index" id="tab_index" value="0" />
		<input type="hidden" name="search" value="1" />
		<div class="ulisting-search_box_wrapper">
			<ul class="nav nav-tabs" role="tablist">
			<!-- BEGIN: tab -->
			<li role="presentation" class="{TAB.active}">
				<a href="#block_search_type_tab" aria-controls="block_search_type_tab" role="tab" data-toggle="tab" data-catid="{stt}" data-index="{TAB.index}">{TAB.title}</a>
			</li>
			<!-- END: tab -->
		</ul>
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="block_search_type_tab">
					<div class="stm-row"> 
						<div class="stm-col basic-search-item-col"> 
							<div class="ulisting-form-gruop rentex-search-filter"> 
								<input type="text" value="{SEARCH.keywords}" class="form-control" name="keywords" placeholder="{LANG.keywords_tim}">
							</div>
						</div>
						<div class="stm-col basic-search-item-col listing-type-btn"> 	
								<!-- BEGIN: cat -->  
								<select name="catid" class="form-control tab_cat {CAT_HIDDEN}" id="search_tab_{stt}" {DISABLED}>
									
									<!-- BEGIN: loop -->
									<option value="{CAT.id}"{CAT.selected}>{CAT.space}{CAT.title}</option>
									<!-- END: loop -->
								</select> 
								<!-- END: cat --> 
						</div>	
						<div class="stm-col basic-search-item-col rentex-search-btn">			
							 <a class="rentex-button rentex-button-full  bton_search">{LANG.search}</a>
						</div>
						<div class="stm-col advanced-search-btn themdk">
							<div class="advanced-search-btn-wrapper">
								<i class="fa fa-plus-circle" aria-hidden="true"></i>
								<div class="btn-text">Tìm lọc nâng cao</div>
							</div>
						</div>
						<div class="advanced-search-item-wrap">
							 <div class="display_none11">
									<div class="row">
										<div class="col-12 mb-3">
											{LOCATION}
										</div>
										<div class="col-4  mb-3">
										
										<!-- BEGIN: language_search_vi -->
											<select name="price_spread" class="form-control">
												<option value="0">---{LANG.khoanggia}---</option>
												<option value="0-10000000" class="advance-options">Dưới 10 triệu</option>
												<option value="10000000-20000000">10 đến 20 triệu</option>
												<option value="20000000-40000000">20 đến 40 triệu</option>
												<option value="40000000-100000000">40 đến 100 triệu</option>
												<option value="100000000-500000000">100 đến 500 triệu</option>
												<option value="500000000-1000000000">500 đến 1 tỷ</option>
												<option value="1000000000-3000000000">1 đến 3 tỷ</option>
												<option value="3000000000-5000000000">3 đến 5 tỷ</option>
												<option value="5000000000-7000000000">5 đến 7 tỷ</option>
												<option value="7000000000-10000000000">7 đến 10 tỷ</option>
												<option value="10000000000-20000000000">10 đến 20 tỷ</option>
												<option value="20000000000-0">Trên 20 tỷ</option>
											</select>
										<!-- END: language_search_vi -->
										<!-- BEGIN: language_search_en -->
											<select name="price_spread" class="form-control">
												<option value="0">---{LANG.khoanggia}---</option>
												<option value="0-500" class="advance-options">under $500</option>
												<option value="500-1000">$500 to $1000</option>
												<option value="1000-2000">$1000 to $2000</option>
												<option value="2000-5000">$2000 to $5000</option>
												<option value="5000-25000">$5000 to $25000</option>
												<option value="25000-50000">$25000 to $50000</option>
												<option value="50000-150000">$50000 to $150000</option>
												<option value="150000-275000">$150000 to $275000</option>
												<option value="275000-350000">$275000 to $350000</option>
												<option value="350000-500000">$350000 to $500000</option>
												<option value="500000-1000000">$500000 to $1000000</option>
												<option value="1000000-0">Over $1000000</option>
											</select>
										<!-- END: language_search_en -->
										</div>

										<div class="col-4  mb-3">
											
												<select chon="{SEARCH.area}" class="form-control" name="area">
														<option value="">{LANG.chondientich}</option>
														<option value="0-30">&lt;= 30 {LANG.m2}</option>
														<option value="30-50">30 - 50 {LANG.m2}</option>
														<option value="50-80">50 - 80 {LANG.m2}</option>
														<option value="80-100">80 - 100 {LANG.m2}</option>
														<option value="100-150">100 - 150 {LANG.m2}</option>
														<option value="150-200">150 - 200 {LANG.m2}</option>
														<option value="200-250">200 - 250 {LANG.m2}</option>
														<option value="250-300">250 - 300 {LANG.m2}</option>
														<option value="300-500">300 - 500 {LANG.m2}</option>
														<option value="500-0">&gt;= 500 {LANG.m2}</option>
											</select>
											
										</div>
										<div class="col-4  mb-3">
											
							<select chon="{SEARCH.chonphongngu}" name="chonphongngu" class="form-control">
								<option value="0">{LANG.chonphongngu}</option>
								<option value="1">1 {LANG.phongngu}</option>
								<option value="2">2 {LANG.phongngu}</option>
								<option value="3">3 {LANG.phongngu}</option>
								<option value="4">4 {LANG.phongngu}</option>
								<option value="5">5 {LANG.phongngu}</option>
								<option value="6">> 5 {LANG.phongngu}</option>
							</select>
								<!-- BEGIN: size1 -->
								<div class="form-group">
									<input type="text" class="form-control" name="size_v" value="{SEARCH.size_v}" placeholder="{LANG.size_v}" />
								</div>
								<div class="form-group">
									<input type="text" class="form-control" name="size_h" value="{SEARCH.size_h}" placeholder="{LANG.size_h}" />
								</div>
								<!-- END: size1 -->
						</div>
										
										<div class="col-4  mb-3">
											
												<select class="form-control" name="huong_bds">
													<option value="0">-- {LANG.way_chosen} --</option>
													<!-- BEGIN: huong -->
													<option value="{huong.id}">-- {huong.title} --</option>
													<!-- END: huong -->
												</select>
											
										</div>
										
										
										<div class="col-4  mb-3">
											<div class="phong_ngu_s row">
												<div class="col-xs-10 col-sm-10 col-md-12">{LANG.chonphongkhach} </div>
												<div class="col-xs-14 col-sm-14 col-md-12 sophongkhach">
													<input type="hidden" name="phong_khach"/>
													<span value="1">1</span><span value="2">2</span><span value="3">3</span><span value="4">+4</span>
												</div>
											</div>
										</div>
										<div class="col-4  mb-3">
											<div class="phong_tam_s row">
												<div class="col-xs-10 col-sm-10 col-md-12">			{LANG.chonphongtam}  
												</div>
												<div class="col-xs-14 col-sm-14 col-md-12 sophongtam">
												<input type="hidden" name="phong_tam"/>
												<span value="1">1</span><span value="2">2</span><span value="3">3</span><span value="4">+4</span>
												</div>
											</div>
										</div>
								</div>
							</div>
						</div>
						</div>
			
					</div>
				</div>
			</div>
		</div>
	</form>
</div>


<script type="text/javascript" src="{NV_BASE_SITEURL}themes/default/js/bookhouse_autoNumeric-1.9.41.js"></script>
 
<script>

	$('.sophongkhach span').click(function(){
		var v = $(this).attr('value');
		$(this).parent().find('span').removeClass('border_s');
		$(this).addClass('border_s');
		$('input[name=phong_khach]').val(v);
	
	});
	
	$('.sophongtam span').click(function(){
		var v = $(this).attr('value');
		$(this).parent().find('span').removeClass('border_s');
		$(this).addClass('border_s');
		$('input[name=phong_tam]').val(v);
	
	});
	
	
	$('.bton_search').click(function(){ 
		$('.content_form_block form').submit();
		
		//alert(link);
		
	});
	
	function link_alias(title)
	{
	var html = '';
	if (title != '') {
		$.ajax({
				type : 'POST',
				async: false,
				url : nv_base_siteurl + 'index.php?' + nv_lang_variable + '=' + nv_lang_data + '&' + nv_name_variable + '=nha-dat&' + nv_fc_variable + '=main',
				data : { get_alias_title : title},
				success : function(res){
					html = res;
				}
			});
		}
		return html;
	}
	
</script>

<script>
	$(document).ready(function() {
	
		// selected
		var area = $('select[name=area]').attr('chon');
		$("select[name=area] option").each(function() {
			if($(this).val() == area)
			{
				$(this).attr('selected','selected');
			}
		});
		
		var price_spread = $('select[name=price_spread]').attr('chon');
		$("select[name=price_spread] option").each(function() {
			if($(this).val() == price_spread)
			{
				$(this).attr('selected','selected');
			}
		});
		
	
		
		// end selected
		var Options = {
			aSep : '{DES_POINT}',
			aDec : '{THOUSANDS_SEP}',
			vMin : '0',
			vMax : '999999999'
		};
		$('.price').autoNumeric('init', Options);
		$('.price').bind('blur focusout keypress keyup', function() {
			$(this).autoNumeric('get', Options);
		});

	
		$('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
			var catid = $(this).attr('data-catid');
			
			$('#block_search_type_tab select').show();
			$('#block_search_type_tab .themdk').show();
			
			$('#tab_index').val($(this).attr('data-index'));
			$('.tab_cat').addClass('hidden').attr('disabled', true);
			$('#search_tab_' + $(this).attr('data-catid')).removeClass('hidden').attr('disabled', false);
			
			var data_index = $(this).attr('data-index');
			
			if(data_index == 2)
			{
				$('#block_search_type_tab select').hide();
				$('#block_search_type_tab .themdk').hide();
			}
			
		});
		
	
		var data_index = $('.nav-tabs li.active a').attr('data-index');
		if(data_index == 2)
			{
				$('#block_search_type_tab select').hide();
				$('#block_search_type_tab .themdk').hide();
			}
		
	});
</script>

<script>
	var flag = true;
	$('.themdk').click(function(){
		if(flag)
			{
				$(this).parent().find('.display_none11').slideDown();
				$('.themdk .btn-text').text('{LANG.thugon}');
				flag = false;
			}
			else{
				$(this).parent().find('.display_none11').slideUp();
				$('.themdk .btn-text').text('{LANG.loctimnangcao}');
				flag = true;
			}
		});				
</script>
						
					
<!-- END: main -->

<div id="detail">
	<h1>{DATA.title}</h1>
	<ul class="list-info list-inline text-muted">
		<li><label>{LANG.addtime}:</label> {DATA.addtime}</li>
		<li><label>{LANG.viewcount}:</label> {DATA.hitstotal}</li>
	</ul>
	<hr />
	<!-- BEGIN: image -->
	<!-- You can move inline styles to css file or css block. -->
	<div id="slider2_container"
		style="position: relative; top: 0px; left: 0px; width: 600px; height: 300px; overflow: hidden;">

		<!-- Loading Screen -->
		<div u="loading" style="position: absolute; top: 0px; left: 0px;">
			<div
				style="filter: alpha(opacity = 70); opacity: 0.7; position: absolute; display: block; background-color: #000000; top: 0px; left: 0px; width: 100%; height: 100%;">
			</div>
			<div class="loading">&nbsp;</div>
		</div>

		<!-- Slides Container -->
		<div u="slides"
			style="cursor: move; position: absolute; left: 0px; top: 0px; width: 600px; height: 300px; overflow: hidden;">
			<!-- BEGIN: loop -->
			<div>
				<img u="image" src="{IMAGE}" /> <img u="thumb" src="{IMAGE}" />
			</div>
			<!-- END: loop -->
		</div>

		<!-- Arrow Left -->
		<span u="arrowleft" class="jssora02l"
			style="width: 55px; height: 55px; top: 123px; left: 8px;"> </span>
		<!-- Arrow Right -->
		<span u="arrowright" class="jssora02r"
			style="width: 55px; height: 55px; top: 123px; right: 8px"> </span>
		<!-- Arrow Navigator Skin End -->

		<!-- ThumbnailNavigator Skin Begin -->
		<div u="thumbnavigator" class="jssort03"
			style="position: absolute; width: 600px; height: 60px; left: 0px; bottom: 0px;">
			<div
				style="background-color: #000; filter: alpha(opacity = 30); opacity: .3; width: 100%; height: 100%;"></div>
			<div u="slides" style="cursor: move;">
				<div u="prototype" class="p"
					style="POSITION: absolute; WIDTH: 62px; HEIGHT: 32px; TOP: 0; LEFT: 0;">
					<div class=w>
						<ThumbnailTemplate
							style=" WIDTH: 100%; HEIGHT: 100%; border: none;position:absolute; TOP: 0; LEFT: 0;"></ThumbnailTemplate>
					</div>
					<div class=c
						style="POSITION: absolute; BACKGROUND-COLOR: #000; TOP: 0; LEFT: 0">
					</div>
				</div>
			</div>
			<!-- Thumbnail Item Skin End -->
		</div>
		<!-- ThumbnailNavigator Skin End -->
	</div>
	<!-- END: image -->

	<!-- BEGIN: adminlink -->
	<div class="text-center" style="margin-top: 15px">
		<em class="fa fa-edit">&nbsp;</em><a href="{EDIT_URL}"
			title="{GLANG.edit}">{GLANG.edit}</a> - <em class="fa fa-trash-o">&nbsp;</em><a
			href="{EDIT_URL}" title="{GLANG.delete}">{GLANG.delete}</a>
	</div>
	<!-- END: adminlink -->

	<div class="detail_bar">
		<span><strong>{LANG.detail_info}</strong></span>
	</div>

	<!-- BEGIN: code -->
	<p>
		<strong>{LANG.code}:</strong> {DATA.code}
	</p>
	<!-- END: code -->

	<p>
		<strong>{LANG.category}:</strong><a href="{DATA.cat_link}"
			title="{DATA.cat_title}"> {DATA.cat_title}</a>
	</p>

	<!-- BEGIN: address -->
	<p>
		<strong>{LANG.address}:</strong> {ADDRESS}
	</p>
	<!-- END: address -->

	<!-- BEGIN: area -->
	<p>
		<strong>{LANG.area}:</strong> {DATA.area} m<sup>2</sup>
	</p>
	<!-- END: area -->
	
	<!-- BEGIN: size -->
	<p>
		<strong>{LANG.size}:</strong> {DATA.size_h} x {DATA.size_v} {LANG.met}
	</p>
	<!-- END: size -->

	<!-- BEGIN: room -->
	<p>
		<strong>{LANG.room_num}: </strong>
		<!-- BEGIN: loop -->
		{ROOM.title} <span class="label label-danger">{ROOM.num}</span>
		<!-- END: loop -->
	</p>
	<!-- END: room -->

	<!-- BEGIN: project -->
	<p>
		<strong>{LANG.project}:</strong> {DATA.project}
	</p>
	<!-- END: project -->
	<!-- BEGIN: way -->
	<p>
		<strong>{LANG.way}:</strong> {DATA.way}
	</p>
	<!-- END: way -->
	<!-- BEGIN: legal -->
	<p>
		<strong>{LANG.legal}:</strong> {DATA.legal}
	</p>
	<!-- END: legal -->
	
	<!-- BEGIN: front -->
	<p>
		<strong>{LANG.front}:</strong> {DATA.front} {LANG.met}
	</p>
	<!-- END: front -->
	
	<!-- BEGIN: road -->
	<p>
		<strong>{LANG.road}:</strong> {DATA.road} {LANG.met}
	</p>
	<!-- END: road -->
	
	<!-- BEGIN: structure -->
	<p>
		<strong>{LANG.structure}:</strong> {DATA.structure}
	</p>
	<!-- END: structure -->
	
	<!-- BEGIN: type -->
	<p>
		<strong>{LANG.type}:</strong> {DATA.type}
	</p>
	<!-- END: type -->
	<div style="margin-bottom: 20px;
    display: inline-block;
    width: 100%;">
	<p>
		<strong>{LANG.noi_that}:</strong>
	</p>
	<!-- BEGIN: noi_that -->
						<div class="noi_that col-md-8">
							<input readonly type="checkbox" {checked}> {noi_that.title}
						</div>
	<!-- END: noi_that -->
	</div>
	<div style="clear:both;margin-bottom: 20px" class="tien_ich_detail">
	<p>
		<strong>{LANG.tien_ich}:</strong>
	</p>
	<!-- BEGIN: tien_ich -->
						<div class="tien_ich col-md-8">
							<input readonly type="checkbox" {checked}> {tien_ich.title}
						</div>
	<!-- END: tien_ich -->
	</div>
	<p style="clear:both" >
		<strong>{LANG.price}:</strong> <span class="price"><!-- BEGIN: price -->{DATA.price} {DATA.price_time}<!-- END: price --><!-- BEGIN: contact -->{LANG.contact}<!-- END: contact --></span>
	</p>

	<div class="panel panel-default socialbutton">
		<div class="panel-body">
			<ul class="pull-left" style="padding: 0" class="list-inline">
				<li class="pull-left"><div class="fb-like" data-href="{SELFURL}" data-layout="button_count" data-action="like" data-show-faces="false" data-share="true">&nbsp;</div></li>
				<li class="pull-left"><div class="g-plusone" data-size="medium"></div></li>
				<li class="pull-left"><a href="http://twitter.com/share" class="twitter-share-button">Tweet</a></li>
			</ul>
			<!-- BEGIN: save -->
			<div class="pull-right" id="btn-save">
				<label id="save"{DATA.style_save}><em class="fa fa-floppy-o fa-lg text-success">&nbsp;</em><a href="javascript:void(0)" onclick="nv_save_rows({DATA.id}, 'add', {DATA.is_user}); return !1;" title="{LANG.save}">{LANG.item_save}</a></label> <label id="saved"{DATA.style_saved}><em class="fa fa-minus-circle fa-lg text-danger">&nbsp;</em><a href="javascript:void(0)" onclick="nv_save_rows({DATA.id}, 'remove', {DATA.is_user}); return !1;" title="{LANG.save_remove}">{LANG.item_save_remove}</a></label>
			</div>
			<!-- END: save -->
		</div>
	</div>

	<ul class="nav nav-tabs" role="tablist">
		<li role="presentation" class="active"><a href="#bodytext" aria-controls="bodytext" role="tab" data-toggle="tab">{LANG.detail}</a></li>
		<!-- BEGIN: google_maps_title -->
		<li role="presentation"><a href="#maps" aria-controls="maps" role="tab" data-toggle="tab">{LANG.maps}</a></li>
		<!-- END: google_maps_title -->
	</ul>
	
	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active" id="bodytext">{DATA.bodytext}</div>
		<!-- BEGIN: google_maps_div -->
		<div role="tabpanel" class="tab-pane" id="maps">
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
		<!-- END: google_maps_div -->
	</div>
	<!-- BEGIN: contact_info -->
	<div class="panel panel-default">
		<div class="panel-heading">{LANG.contact_info}</div>
		<div class="panel-body">
			<ul class="list-contact-info">
				<li><label><em class="fa fa-user">&nbsp;</em>{LANG.contact_fullname}:</label> {DATA.contact_fullname}</li>
				<li><label><em class="fa fa-envelope-o">&nbsp;</em>Email:</label> <a href="mailto:{DATA.contact_email}">{DATA.contact_email}</a></li>
				<li><label><em class="fa fa-phone">&nbsp;</em>{LANG.contact_phone}:</label> {DATA.contact_phone}</li>
				<li><label><em class="fa fa-map-pin">&nbsp;</em>{LANG.contact_address}:</label> {DATA.contact_address}</li>
			</ul>
		</div>
	</div>
	<!-- END: contact_info -->
	
	<!-- BEGIN: keywords -->
	<div class="well">
		<em class="fa fa-tags">&nbsp;</em><strong>{LANG.keywords}: </strong>
		<!-- BEGIN: loop -->
		<a title="{KEYWORD}" href="{LINK_KEYWORDS}"><em
			class="label label-primary">{KEYWORD}</em></a>
		<!-- END: loop -->
	</div>
	<!-- END: keywords -->

	<!-- BEGIN: comment -->
	{COMMENT}
	<!-- END: comment -->

	<!-- BEGIN: other -->
	<div class="detail_bar">
		<span><strong>{LANG.other}</strong></span>
	</div>
	{OTHER}
	<!-- END: other -->



<script type="text/javascript">
var LANG = [];
LANG.error_save_login = '{LANG.error_save_login}';

$(document).ready(function(e) {
	$('#rent_info').hide();

    $("#form-rent").submit(function() {
    	var form_data = $("#form-rent").serialize();
    	$('#waiting').html( '<p class="text-center"><em class="fa fa-spinner fa-spin fa-4x">&nbsp;</em><br />{LANG.waiting}</p>' );
    	$('#rent_info').hide();
    	$.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=rent&nocache=' + new Date().getTime(), form_data, function(res) {
    		var r_split = res.split('_');
    		if( r_split[0] == 'OK' )
    		{
    			$('#waiting').html('');
    			$('#rent_info').show();
    			$('#rent_info').html( '<div class="alert alert-info text-center">{LANG.rent_success}</div>' );
    		}
    		else
    		{
    			alert( r_split[1] );
    			$('#rent_info').show();
    			$('#waiting').html('');
    			nv_change_captcha('vimg','fcode_iavim');
    		}
    	});
        return false;
    });

    $('#rent_button').click(function() {
        $('#rent_info').slideDown();
        $('#rent_button').hide();
        $('html, body').animate({
            scrollTop: $('#rent_info').offset().top + 'px'
        }, {
            duration: 500,
            easing: 'swing'
        });
        return false;
    });

    $('.btn-close').click(function() {
        $('#rent_button').show();
        $('#rent_info').slideUp();
    });
});
 </script>

<!-- BEGIN: config -->
<tr>
	<td>{LANG.catid}</td>
	<td>
		<div style="height: 150px; overflow: scroll; border: solid 1px #ddd; padding: 10px">
			<!-- BEGIN: cat -->
			<label class="show"><input type="checkbox" name="config_catid[]" value="{CAT.id}" {CAT.checked} >{CAT.title}</label>
			<!-- END: cat -->
		</div>
	</td>
</tr>
<tr>
	<td>{LANG.price_begin}</td>
	<td><input type="number" name="config_price_begin" value="{DATA.price_begin}" class="form-control" /></td>
</tr>

<tr>
	<td>{LANG.price_end}</td>
	<td><input type="number" name="config_price_end" value="{DATA.price_end}" class="form-control" /></td>
</tr>

<tr>
	<td>{LANG.price_step}</td>
	<td><input type="number" name="config_price_step" value="{DATA.price_step}" class="form-control" /></td>
</tr>
<!-- END: config -->
