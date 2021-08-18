<!-- BEGIN: main -->
{FILE "header_only.tpl"}
{FILE "header_extended-con.tpl"}

<div id="content" class="site-content" tabindex="-1">

<section class="banner-slideshow1">
		[HEADER]
</section>	
	
	
<nav class="third-nav">
	<div class="bg">
		<div class="container">                  
			<!-- BEGIN: breadcrumbs -->
				 <div class="breadcrumbs-wrap">
											<div class="display">
												<a class="show-subs-breadcrumbs hidden" href="#" onclick="showSubBreadcrumbs(this, event);"><em class="fa fa-lg fa-angle-right"></em></a>
												<ul class="breadcrumbs list-none"></ul>
											</div>
											<ul class="subs-breadcrumbs"></ul>
											<ul class="temp-breadcrumbs hidden" itemscope itemtype="https://schema.org/BreadcrumbList">
												<li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem"><a href="{THEME_SITE_HREF}" itemprop="item" title="{LANG.Home}"><span itemprop="name">{LANG.Home}</span></a><i class="hidden" itemprop="position" content="1"></i></li>
												<!-- BEGIN: loop --><li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem"><a href="{BREADCRUMBS.link}" itemprop="item" title="{BREADCRUMBS.title}"><span class="txt" itemprop="name">{BREADCRUMBS.title}</span></a><i class="hidden" itemprop="position" content="{BREADCRUMBS.position}"></i></li><!-- END: loop -->
											</ul>
										</div>
			<!-- END: breadcrumbs --> 
		 </div>
     </div>
</nav>

	
<div class="container">	
	<div class="bl-bg">	
		{MODULE_CONTENT}
	</div>
</div>
<section class="bg_white text-center pt-5 pb-5">
		<div class="container">
			 [TIN_TUC_1]
		</div>
</section>
<section class="bg_cam pt-5 pb-5">
		<div class="container">
			[TIN_TUC_2]
		</div>
</section>
</div>	
{FILE "footer_extended.tpl"}
{FILE "footer_only.tpl"}
<!-- END: main -->