<!-- BEGIN: main -->
<link rel="stylesheet" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2.min.css">
<link rel="stylesheet" href="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2-bootstrap.min.css">
<!-- BEGIN: error -->
<div class="alert alert-warning">{ERROR}</div>
<!-- END: error -->

<form class="form-inline m-bottom confirm-reload" action="{NV_BASE_ADMINURL}index.php?{NV_LANG_VARIABLE}={NV_LANG_DATA}&amp;{NV_NAME_VARIABLE}={MODULE_NAME}&amp;{NV_OP_VARIABLE}={OP}" method="post">

	<input type="hidden" name="id" value="{ROW.id}" />
	
<div class="row">
	<div class="col-sm-24 col-md-18">
		<div class="panel panel-default">
			<div class="panel-heading"><strong>{LANG.main_info}</strong></div>
			<div class="panel-body">
				<table class="table table-striped table-bordered">
					<colgroup><col class="w200">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<td><strong>{LANG.projects_name}</strong> <sup class="required">(∗)</sup></td>
							<td>
								<input class="form-control" type="text" name="title" value="{ROW.title}" required="required" oninvalid="setCustomValidity( nv_required )" oninput="setCustomValidity('')"  style="width:350px"/>
							</td>
						</tr>
						<tr>
							<td><strong>{LANG.alias}</strong></td>
							<td>
								<input class="form-control" type="text" name="alias" value="{ROW.alias}" id="id_alias" style="width:350px"/> &nbsp; 
								<em class="fa fa-refresh fa-lg" onclick="nv_get_alias('id_alias');">&nbsp;</em>
							</td>
						</tr>
						<tr>
							<td><strong>Loại Dự Án</strong> <sup class="required">(∗)</sup></td>
							<td>
								<select class="form-control" name="">
										<option value="0">Căn hộ</option>
										<option value="1">Biệt thự</option>
										<option value="2" selected="selected">Nhà phố</option>
										<option value="3" selected="selected">Đất nền</option>
										<option value="4" selected="selected">Kho xưởng</option>
										<option value="5" selected="selected">Văn phòng</option>
								</select>
							</td>
						</tr>
						<tr>
							<td><strong>Mã Đăng tin</strong> <sup class="required">(∗)</sup></td>
							<td>
								<input readonly class="form-control" type="text" name="id" value="TD{ROW.id}" />
							</td>
						</tr>
						<tr>
							<td><strong>Mã Bất Động Sản</strong> <sup class="required">(∗)</sup></td>
							<td>
								<input readonly class="form-control" type="text" name="id" value="T2/A03-01" />
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<strong>{LANG.description}</strong> 
								<i>(Hiển thị đối với mọi đối tượng kể cả khi không được phân quyền).</i>
								<textarea class="form-control" style="width: 100%" rows="5" name="description">{ROW.description}</textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<strong>{LANG.descriptionhtml}</strong> 
								{ROW.descriptionhtml}
							</td>
						</tr>							
					</tbody>
				</table>		
			</div>
		</div>
					
					
		<div class="panel panel-default">
			<div class="panel-heading"><strong>Thông mở rộng</strong></div>
			<div class="panel-body">
				<table class="table table-striped table-bordered">
					<colgroup><col class="w200">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<td><strong>Diện tích xây dựng</strong></td>
							<td>
								<input class="form-control" type="text" name="dientichxd" value="{ROW.dientichxd}"/>
							</td>
						</tr>
						<tr>
							<td><strong>Thời gian xây dựng</strong></td>
							<td>
								<input class="form-control" type="text" name="thoigianxd" value="{ROW.thoigianxd}"/>
							</td>
						</tr>
						<tr>
							<td><strong>Thời gian giao nhà</strong></td>
							<td>
								<input class="form-control" type="text" name="thoigiangn" value="{ROW.thoigiangn}"/>
							</td>
						</tr>
						<tr>
							<td><strong>Vốn đầu tư</strong></td>
							<td>
								<input class="form-control" type="text" name="vondautu" value="{ROW.vondautu}"/>
							</td>
						</tr>
						<tr>
							<td><strong>Chủ đầu tư</strong></td>
							<td>
								<input class="form-control" type="text" name="chudautu" value="{ROW.chudautu}"/>
							</td>
						</tr>
						<tr>
							<td><strong>Diện tích sử dụng</strong></td>
							<td>
								<input class="form-control" type="text" name="dientich" value="{ROW.dientich}"/>
							</td>
						</tr>
						<tr>
							<td><strong>Số phòng khách</strong></td>
							<td>
								<input class="form-control" type="text" name="sophong" value="{ROW.sophong}"/>
							</td>
						</tr>
						<tr>
							<td><strong>Số Block</strong></td>
							<td>
								<input class="form-control" type="text" name="soblock" value="{ROW.soblock}"/>
							</td>
						</tr>
						<tr>
							<td><strong>Số tầng</strong></td>
							<td>
								<input class="form-control" type="text" name="sotang" value="{ROW.sotang}"/>
							</td>
						</tr>
						<tr>
							<td><strong>Căn hộ</strong></td>
							<td>
								<input class="form-control" type="text" name="socanho" value="{ROW.socanho}"/>
							</td>
						</tr>
						<tr>
							<td><strong>Không gian xanh</strong></td>
							<td>
								<input class="form-control" type="text" name="khonggianxanh" value="{ROW.khonggianxanh}"/>
							</td>
						</tr>
						<tr>
							<td><strong>Mật độ xây dựng</strong></td>
							<td>
								<input class="form-control" type="text" name="matdo" value="{ROW.matdo}"/>
							</td>
						</tr>
						<tr>
							<td><strong>Phí quản lý</strong></td>
							<td>
								<input class="form-control" type="text" name="phiquanly" value="{ROW.phiquanly}"/>
							</td>
						</tr>
						<tr>
							<td><strong>Phí giữ ôtô</strong></td>
							<td>
								<input class="form-control" type="text" name="giuoto" value="{ROW.giuoto}"/>
							</td>
						</tr>
						<tr>
							<td><strong>Phí giữ xe máy</strong></td>
							<td>
								<input class="form-control" type="text" name="giuxemay" value="{ROW.giuxemay}"/>
							</td>
						</tr>
						<tr>
							<td><strong>Giá bán</strong></td>
							<td>
								<input class="form-control" type="text" name="giaban" value="{ROW.giaban}"/>
							</td>
						</tr>
						<tr>
							<td><strong>Giá thuê</strong></td>
							<td>
								<input class="form-control" type="text" name="giathue" value="{ROW.giathue}"/>
							</td>
						</tr>
						
						
						
					</tbody>
				</table>		
			</div>
		</div>	
				
		<div class="panel panel-default">	
			<div class="panel-heading"><strong>Vị tri dự án </strong></div>
			<div class="panel-body">
				<table class="table table-striped table-bordered">
					<colgroup><col class="w200">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<td><strong>{LANG.items_location}</strong></td>
							<td>
								{LOCATION}
							</td>
						</tr>
						<tr>
							<td><strong>Địa chỉ cụ thể</strong></td>
							<td>
								<input style="width:100%" type="text" class="form-control" name="address" value="{ROW.address}" placeholder="{LANG.items_address}" />
							</td>
						</tr>
						<tr>
							<td><strong>Định Vị Google Map</strong></td>
							<td>
								<!-- BEGIN: maps -->
									<input type="text" class="form-control" name="maps_address" id="maps_address" value="" placeholder="{LANG.items_maps_location}">
									
									<script type="text/javascript" src="{NV_BASE_SITEURL}themes/batdongsan05/js/bookhouse-google_maps.js"></script>
									
									<input type="hidden" id="maps_appid" value="{MAPS_APPID}" />
									
									<div id="maps_maparea">
										<div id="maps_mapcanvas" style="margin-top: 10px;" class="form-group"></div>
										<div class="row form-group">
											<div class="col-xs-6">
												<div class="input-group">
													<span class="input-group-addon">L</span> <input type="text" class="form-control" name="maps[maps_mapcenterlat]" id="maps_mapcenterlat" value="{DATA.maps.maps_mapcenterlat}" readonly="readonly">
												</div>
											</div>
											<div class="col-xs-6">
												<div class="input-group">
													<span class="input-group-addon">N</span> <input type="text" class="form-control" name="maps[maps_mapcenterlng]" id="maps_mapcenterlng" value="{DATA.maps.maps_mapcenterlng}" readonly="readonly">
												</div>
											</div>
											<div class="col-xs-6">
												<div class="input-group">
													<span class="input-group-addon">L</span> <input type="text" class="form-control" name="maps[maps_maplat]" id="maps_maplat" value="{DATA.maps.maps_maplat}" readonly="readonly">
												</div>
											</div>
											<div class="col-xs-6">
												<div class="input-group">
													<span class="input-group-addon">N</span> <input type="text" class="form-control" name="maps[maps_maplng]" id="maps_maplng" value="{DATA.maps.maps_maplng}" readonly="readonly">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xs-12">
												<div class="input-group">
													<span class="input-group-addon">Z</span> <input type="text" class="form-control" name="maps[maps_mapzoom]" id="maps_mapzoom" value="{DATA.maps.maps_mapzoom}" readonly="readonly">
												</div>
											</div>
										</div>
									</div>
								<!-- END: maps -->
								<!-- BEGIN: required_maps_appid -->
									<div class="alert alert-danger">{LANG.items_required_maps_appid}</div>
								<!-- END: required_maps_appid -->
							</td>
						</tr>	
					</tbody>
				</table>	
			</div>	
		</div>	
					
		<div class="panel panel-default">	
			<div class="panel-heading"><strong>Hình ảnh</strong></div>
			<div class="panel-body">
					<div class="form-group">
						<label class="col-sm-5 col-md-3 control-label"><strong>{LANG.image}</strong></label>
						<div class="col-sm-19 col-md-21">
							<div id="uploader" class="m-bottom">
								<p>{LANG.images_none_support}</p>
							</div>
							<div class="other-image row" id="image-other">
								<!-- BEGIN: data -->
								<div class="col-xs-4 col-sm-4 col-md-4 other-image-item text-center thumb_booth new-images-append" id="other-image-div-{DATA.number}">
									<input type="hidden" name="otherimage[{DATA.number}][id]" value="{DATA.number}"> <input type="hidden" name="otherimage[{DATA.number}][basename]" value="{DATA.basename}"> <input type="hidden" name="otherimage[{DATA.number}][homeimgfile]" value="{DATA.homeimgfile}"> <input type="hidden" name="otherimage[{DATA.number}][thumb]" value="{DATA.thumb}"> <input type="hidden" name="otherimage[{DATA.number}][name]" value="{DATA.title}"> <input type="hidden" name="otherimage[{DATA.number}][description]" value="{DATA.description}"> <a href="#" onclick="modalShow('{DATA.basename}', '<img src=\'{DATA.filepath}\' class=\'img-responsive\' />'); return false;"> <img style="height: 110px" class="img-thumbnail m-bottom responstyle {DATA.box_img}" src="{DATA.filepath}">
									</a> <em title="{LANG.title_btn_closeimg}" class="fa fa-times-circle fa-lg fa-pointer btn-close_img" onclick="nv_delete_other_images( {DATA.number} ); return false;">&nbsp;</em> <input type="radio" class="input_img hidden" name="homeimg" value="{DATA.number}"{DATA.checked}> <input type="button" class="btn btn-success btn-xs avatar" value="{LANG.choose_img}" onclick="click_btn_avatar({DATA.number})">
								</div>
								<!-- END: data -->
							</div>
						</div>
					</div>
			</div>	
		</div>	
	</div>	
	<div class="col-md-5">
		<div class="panel panel-default">
			<div class="panel-heading">Nhóm Dự Án</div>
				<div class="panel-body">
					<label class="show"><input type="checkbox" name="inhome" value="1" {ROW.inhome} />&nbsp;Nổi bật</label>
				</div>
		</div>
		<div class="panel panel-default">
				<div class="panel-heading">Nội thất</div>
				<div class="panel-body">
					<!-- BEGIN: noithat -->
						<div class="noithat">
							<input type="checkbox" name="noithat[]" {checked} value="{noithat.id}"> {noithat.title}
						</div>
						<!-- END: noithat -->
				</div>
		</div>
		<div class="panel panel-default">
				<div class="panel-heading">Tiện ích</div>
				<div class="panel-body">
					<!-- BEGIN: tienich -->
						<div class="tienich">
							<input type="checkbox" name="tienich[]" {checked} value="{tienich.id}"> {tienich.title}
						</div>
						<!-- END: tienich -->
				</div>
		</div>
	</div>	
</div>	
	<div class="form-group text-center">
		<input class="btn btn-primary" name="submit" type="submit" value="{LANG.save}" />
	</div>
</form>	
<link type="text/css" href="{NV_BASE_SITEURL}modules/{MODULE_FILE}/plupload/jquery.plupload.queue/css/jquery.plupload.queue.css" rel="stylesheet" />
<script type="text/javascript" src="{NV_BASE_SITEURL}modules/{MODULE_FILE}/plupload/plupload.full.min.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}modules/{MODULE_FILE}/plupload/jquery.plupload.queue/jquery.plupload.queue.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}modules/{MODULE_FILE}/plupload/i18n/{NV_LANG_INTERFACE}.js"></script>
<script type="text/javascript">

var initUploader = function () {
    $("#uploader").pluploadQueue({
        runtimes: 'html5,flash,silverlight,html4',
        url: '{UPLOAD_URL}',
//         resize: {
//             width: '{MAXIMAGESIZEULOAD.0}',
//             height: '{MAXIMAGESIZEULOAD.1}'
//         },
        chunk_size: '{MAXFILESIZEULOAD}',
        max_retries: 3,
        rename: false,
        dragdrop: true,
        filters: {
            max_file_size: '{MAXFILESIZEULOAD}',            
            mime_types: [{
                title: "Image files",
                extensions: "jpg,gif,png,jpeg"
            }, ]
        },
        flash_swf_url: '{NV_BASE_SITEURL}modules/{MODULE_FILE}/plupload/Moxie.swf',
        silverlight_xap_url: '{NV_BASE_SITEURL}modules/{MODULE_FILE}/plupload/Moxie.xap',
        multi_selection: true,
        prevent_duplicates: true,
        multiple_queues: false,
        init: {
            FilesAdded: function (up, files) {
                this.start();
                return false;
            },
            UploadComplete: function (up, files) {
                $(".plupload_buttons").css("display", "inline");
                $(".plupload_upload_status").css("display", "inline");
            }
        }
    });
    
    var uploader = $("#uploader").pluploadQueue();
    uploader.bind('BeforeUpload', function(up) {
         up.settings.multipart_params = {
                'folder': ''
         };
    });
    
    var j = '{COUNT_UPLOAD}';
    var i = '{COUNT}';
    uploader.bind('FileUploaded', function(up, file, response) {
        if($.parseJSON(response.response).error.length == 0){
            var content = $.parseJSON(response.response).data;
            var item='';
            item+='<div class="col-xs-4 col-sm-3 col-md-3 other-image-item text-center thumb_booth new-images-append" id="other-image-div-' + i + '">';
            item+='                 <input type="hidden" name="otherimage['+ i +'][id]" value="'+i+'">';
            item+='                 <input type="hidden" name="otherimage['+ i +'][basename]" value="'+ content['basename'] +'">';
            item+='                 <input type="hidden" name="otherimage['+ i +'][homeimgfile]" value="'+ content['homeimgfile'] +'">';
            item+='                 <input type="hidden" name="otherimage['+ i +'][thumb]" value="'+ content['thumb'] +'">';
            item+='                 <input type="hidden" name="otherimage['+ i +'][name]" value="' + content['basename'] + '" >';
            item+='                 <input type="hidden" name="otherimage['+ i +'][description]" value="' + content['description'] + '" >';
            item+='                 <a href="#" onclick="modalShow(\'' + content['basename'] + '\', \'<img src=' + content['image_url'] + ' class=img-responsive />\' ); return false;" >';
            item+='                     <img class="img-thumbnail m-bottom responstyle" src="'+ content['thumb'] +'">';
            item+='                 </a>';
            item+='                 <em title="{LANG.title_btn_closeimg}" class="fa fa-times-circle fa-lg fa-pointer btn-close_img" onclick="nv_delete_other_images_tmp(\'' + content['image_url'] + '\', \'' + content['thumb'] + '\', ' + i + '); return false;">&nbsp;</em>';
            item+='                 <input type="radio" class="radio_btn input_img hidden" name="homeimg" value="'+ i +'">';
            item+='                 <input type="button" class="btn btn-success btn-xs avatar" value="{LANG.choose_img}" onclick="click_btn_avatar(' + i + ')">';
            item+='</div>';
            item+='</div>';

            $('#image-other').append(item);
            ++i;    
        }else{
            alert($.parseJSON(response.response).error.message);
        }
    });
    
    {RADIO_JS}

    uploader.bind("UploadComplete", function (up, files) {
        initUploader();
    });

    uploader.bind('QueueChanged', function() {

    });

    uploader.bind('FilesAdded', function(up, files) {
        if( files.length > j )
        {
            alert( strip_tags( '{LANG.error_required_otherimage}' ) );
            $.each(files, function(i, file) {
                up.removeFile(file);
            });
        }
    });
};

$(document).ready(function(){
    initUploader();
});

$('.images-add').click(function(){
    $('#uploader').show();
    $('.images-add').hide();
});
</script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/select2.min.js"></script>
<script type="text/javascript" src="{NV_BASE_SITEURL}{NV_ASSETS_DIR}/js/select2/i18n/{NV_LANG_INTERFACE}.js"></script>
<script type="text/javascript">
    //<![CDATA[
    function click_btn_avatar(id){
        $("#other-image-div-"+id+" .input_img").prop("checked", true);
        $(".responstyle").removeClass('box_img');$
        $("#other-image-div-"+id+" .responstyle").addClass('box_img');$
    }    
    
    $('.select2').select2({
        theme : 'bootstrap',
        language : '{NV_LANG_INTERFACE}'
    });
    
    function nv_get_alias(id) {
        var title = strip_tags($("[name='title']").val());
        if (title != '') {
            $.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=projects-content&nocache=' + new Date().getTime(), 'get_alias_title=' + encodeURIComponent(title), function(res) {
                $("#" + id).val(strip_tags(res));
            });
        }
        return false;
    }
    //]]>
</script>
<!-- BEGIN: auto_get_alias -->
<script type="text/javascript">
    //<![CDATA[
    $("[name='title']").change(function() {
        nv_get_alias('id_alias');
    });
    //]]>
</script>
<!-- END: auto_get_alias -->
<!-- END: main -->