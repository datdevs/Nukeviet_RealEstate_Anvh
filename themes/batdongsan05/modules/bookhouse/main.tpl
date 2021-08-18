<!-- BEGIN: main -->
<!-- lay bo loc Ajax tin ra -->
<section class="bg_white pt-4 pb-4">
	<div class="container">	
		<h1 class="elementor-heading-title mt-2">NHÀ ĐẤT</h1>
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
<div class="container pt-5 pb-5">	
		<!-- BEGIN: viewall -->
				{DATA}
			<!-- BEGIN: page -->
				{PAGE}
			<!-- END: page -->
		<!-- END: viewall -->
		
		<!-- BEGIN: viewcat -->			
				<!-- BEGIN: loop -->
					<div class="panel panel-default">
						<div class="panel-heading">{CAT.title}</div>
						<div class="panel-body">{DATA}</div>
					</div>
				<!-- END: loop -->
		<!-- END: viewcat -->
</div>	
<!-- END: main -->

		
		
		