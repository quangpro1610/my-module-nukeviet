<!-- BEGIN: tree -->
<li>
    <!-- BEGIN: icon -->
    <img src="{MENUTREE.icon}" />&nbsp;
    <!-- END: icon -->
    <a title="{MENUTREE.note}" href="{MENUTREE.link}" {MENUTREE.target}>{MENUTREE.title_trim}</a>
    <!-- BEGIN: tree_content -->
    <ul>
        {TREE_CONTENT}
    </ul>
    <!-- END: tree_content -->
</li>
<!-- END: tree -->
<!-- BEGIN: main -->
<link rel="stylesheet" type="text/css" media="screen" href="{NV_BASE_SITEURL}themes/{BLOCK_THEME}/css/custom_menu_all.css" />
<div class="custom_menu_all">
    <button type="button" class="bton-toggle">
        <span class="icon-bar">&nbsp;</span> 
        <span class="icon-bar">&nbsp;</span> 
        <span class="icon-bar">&nbsp;</span>
    </button>
    <ul class="show_menu">
        <li<!-- BEGIN: home --> class="current"<!-- END: home -->>
            <a title="{LANG.Home}" href="{THEME_SITE_HREF}"><em class="fa fa-lg fa-home"></em></a>
        </li>
        <!-- BEGIN: loopcat1 -->
        <li {CAT1.class}>
            <!-- BEGIN: icon -->
            <img src="{CAT1.icon}" />&nbsp;
            <!-- END: icon -->
            <div class="clearfix">
                <a title="{CAT1.note}" href="{CAT1.link}" {CAT1.target} class="pull-left">{CAT1.title_trim}</a>
                <!-- BEGIN: expand -->
                <span class="fa fa-caret-down pull-right show_sub"></span>
                <!-- END: expand -->
            </div>
            <!-- BEGIN: cat2 -->
                <ul class="sub_menu">
                    {HTML_CONTENT}
                </ul>
            <!-- END: cat2 -->
        </li>
        <!-- END: loopcat1 -->
    </ul>
</div>
<script type="text/javascript" src="{NV_BASE_SITEURL}themes/{BLOCK_THEME}/js/custom_menu_all.js"></script>
<!-- END: main -->
