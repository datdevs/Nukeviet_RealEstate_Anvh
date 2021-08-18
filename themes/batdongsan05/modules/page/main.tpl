<!-- BEGIN: main -->

<!-- BEGIN: warning -->
<div class="alert alert-danger">{LANG.warning}</div>
<!-- END: warning -->

<h1 class="elementor-heading-title text-center">{CONTENT.title}</h1>
    	
        <!-- BEGIN: imageleft -->
        <figure class="article left noncaption pointer" style="width:100px" onclick="modalShow('', '<img src={CONTENT.image} />');">
                <img alt="{CONTENT.title}" src="{CONTENT.image}" width="{CONTENT.imageWidth}" class="img-thumbnail" />
                <!-- BEGIN: alt --><figcaption>{CONTENT.imagealt}</figcaption><!-- END: alt -->
        </figure>
        <!-- END: imageleft -->

        <!-- BEGIN: description -->
        <div class="hometext margin-bottom-lg">{CONTENT.description}</div>
        <!-- END: description -->

    	<!-- BEGIN: imagecenter -->
        <figure class="article center pointer" onclick="modalShowByObj(this);">
    			<p class="text-center"><img alt="{CONTENT.title}" src="{CONTENT.image}" width="{CONTENT.imageWidth}" class="img-thumbnail" /></p>
    			<!-- BEGIN: alt --><figcaption>{CONTENT.imagealt}</figcaption><!-- END: alt -->
   		</figure>
    	<!-- END: imagecenter -->

    	<div class="clear"></div>

    	<div id="page-bodyhtml" class="bodytext margin-bottom-lg">
    		{CONTENT.bodytext}
    	</div>
    </div>
</div>
<!-- BEGIN: adminlink -->
<p class="text-center margin-bottom-lg">
    <a class="btn btn-primary" href="{ADMIN_EDIT}"><em class="fa fa-edit fa-lg">&nbsp;</em>{GLANG.edit}</a>
    <a class="btn btn-danger" href="javascript:void(0);" onclick="nv_del_content({CONTENT.id}, '{ADMIN_CHECKSS}','{NV_BASE_ADMINURL}')"><em class="fa fa-trash-o fa-lg">&nbsp;</em>{GLANG.delete}</a>
</p>
<!-- END: adminlink -->
<!-- BEGIN: comment -->
<div class="page panel panel-default">
    <div class="panel-body">
    {CONTENT_COMMENT}
    </div>
</div>
<!-- END: comment -->
<!-- BEGIN: other -->
<div class="page panel panel-default">
    <div class="panel-body">
        <ul class="nv-list-item">
    		<!-- BEGIN: loop -->
    		<li><em class="fa fa-angle-double-right">&nbsp;</em><h3><a title="{OTHER.title}" href="{OTHER.link}">{OTHER.title}</a></h3></li>
    		<!-- END: loop -->
	   </ul>
    </div>
</div>
<!-- END: other -->
<!-- END: main -->