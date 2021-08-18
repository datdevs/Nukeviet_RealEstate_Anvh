<!-- BEGIN: main -->
<ul class="list-group list-group-flush m-0">
    <!-- BEGIN: loop -->
    <li class="list-group-item pl-0">
        <!-- BEGIN: img -->
        <a href="{ROW.link}" title="{ROW.title}" {ROW.target_blank} ><img src="{ROW.thumb}" alt="{ROW.title}" width="90px" class="rounded float-left mr-1"/></a>
        <!-- END: img -->
        <a {TITLE} class="show" href="{ROW.link}" {ROW.target_blank} data-content="{ROW.hometext_clean}" data-img="{ROW.thumb}" data-rel="block_tooltip">{ROW.title_clean}</a>
    </li>
    <!-- END: loop -->
</ul>
<!-- END: main -->
