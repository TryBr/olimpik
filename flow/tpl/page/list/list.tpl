[{oxscript include="js/widgets/oxequalizer.min.js" priority=10}]
[{oxscript add="$(window).load(function(){ if( !isMobileDevice() ) { oxEqualizer.equalHeight( $( '.productData .slider-item .item__title' ) ); } });"}]
[{oxscript add="$(window).load(function(){ if( !isMobileDevice() ) { oxEqualizer.equalHeight( $( '.productData .slider-item .item__text' ) ); } });"}]

[{assign var="actCategory" value=$oView->getActiveCategory()}]

[{capture append="oxidBlock_sidebar"}]
    [{assign var="listType" value=$oView->getListType()}]
    [{if $listType=='manufacturer' || $listType=='vendor'}]
        [{if $actCategory && $actCategory->getIconUrl()}]
        <div class="box">
            <h3>
                [{if $listType=='manufacturer'}]
                    [{oxmultilang ident="BRAND"}]
                [{elseif $listType=='vendor'}]
                    [{oxmultilang ident="VENDOR"}]
                [{/if}]
            </h3>
            <div class="featured icon">
                <img src="[{$oViewConf->getImageUrl('spinner.gif')}]" data-src="[{$actCategory->getIconUrl()}]" alt="[{$actCategory->getTitle()}]">
            </div>
        </div>
        [{/if}]
    [{/if}]
[{/capture}]

[{capture append="oxidBlock_content"}]
    [{block name="page_list_listhead"}]
        [{* if $actCategory->oxcategories__oxthumb->value && $actCategory->getThumbUrl()}]
            <img src="[{$oViewConf->getImageUrl('spinner.gif')}]" data-src="[{$actCategory->getThumbUrl()}]" alt="[{$actCategory->oxcategories__oxtitle->value}]" class="categoryPicture img-responsive img-thumbnail">
        [{/if *}]

        <div class="page-header">
            [{assign var='rsslinks' value=$oView->getRssLinks()}]
            <h1>
                [{$oView->getTitle()}]
                [{if $rsslinks.activeCategory}]
                    <a class="rss" id="rssActiveCategory" href="[{$rsslinks.activeCategory.link}]" title="[{$rsslinks.activeCategory.title}]" target="_blank">
                        <i class="fa fa-rss"></i>
                    </a>
                [{/if}]
            </h1>
        </div>

        [{assign var="oPageNavigation" value=$oView->getPageNavigation()}]
        [{if $actCategory && $actCategory->getShortDescription() && $oPageNavigation->actPage == 1}]
            <p id="catDescLocator" class="categoryDescription">
                <em>[{$actCategory->oxcategories__oxdesc->rawValue}]</em>
            </p>
        [{/if}]

[{if $oView->hasVisibleSubCats()}]

        <section class="catalog-categories">
            <ul class="categories-list">

[{assign var="hasIconsSubCats" value=false}]

[{if $oView->hasVisibleSubCats()}]
    [{foreach from=$oView->getSubCatList() item=category name=MoreSubCat}]
        [{assign var="iconUrl" value=$category->getIconUrl()}]
        [{if $iconUrl}]
            [{assign var="hasIconsSubCats" value=true}]
        [{else}]

            <li class="categories-list-item">
                <a href="[{$category->getLink()}]" class="categories-list-item__link">
                    <span class="categories-list-item__title">
                        [{$category->oxcategories__oxtitle->value}]
                    </span>
                    <span class="categories-list-item__value">
                        [{if $oView->showCategoryArticlesCount() && ($category->getNrOfArticles() > 0)}][{$category->getNrOfArticles()}][{/if}]
                    </span>
                </a>
            </li>

        [{/if}]
    [{/foreach}]
    <li class="categories-list-item categories-list-item_more" id="loadMore">Ещё</li>
    <li class="categories-list-item categories-list-item_hide" id="showLess">Скрыть</li>
[{/if}]

[{*                <li class="categories-list-item">
                    <a href="#" class="categories-list-item__link">
                        <span class="categories-list-item__title">
                            Бытовой усиленный
                        </span>
                        <span class="categories-list-item__value">
                            145
                        </span>
                    </a>
                </li>
                <li class="categories-list-item">
                    <a href="#" class="categories-list-item__link">
                        <span class="categories-list-item__title">
                            В комнату
                        </span>
                        <span class="categories-list-item__value">
                            126
                        </span>
                    </a>
                </li>
                <li class="categories-list-item">
                    <a href="#" class="categories-list-item__link">
                        <span class="categories-list-item__title">
                            Для детской
                        </span>
                        <span class="categories-list-item__value">
                            57
                        </span>
                    </a>
                </li>
                <li class="categories-list-item">
                    <a href="#" class="categories-list-item__link">
                        <span class="categories-list-item__title">
                            Для кухни
                        </span>
                        <span class="categories-list-item__value">
                            45
                        </span>
                    </a>
                </li>
                <li class="categories-list-item">
                    <a href="#" class="categories-list-item__link">
                        <span class="categories-list-item__title">
                            Для ванной комнаты
                        </span>
                        <span class="categories-list-item__value">
                            29
                        </span>
                    </a>
                </li>
                <li class="categories-list-item">
                    <a href="#" class="categories-list-item__link">
                        <span class="categories-list-item__title">
                            На балкон или лоджию
                        </span>
                        <span class="categories-list-item__value">
                            16
                        </span>
                    </a>
                </li>
                <li class="categories-list-item">
                    <a href="#" class="categories-list-item__link">
                        <span class="categories-list-item__title">
                            Спортивный
                        </span>
                        <span class="categories-list-item__value">
                            16
                        </span>
                    </a>
                </li> *}]
            </ul>
            [{if $hasIconsSubCats}]
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="slider-items">
                            <div class="swiper-container productsCategory">
                                <div class="swiper-wrapper">

                                    [{if $oView->hasVisibleSubCats()}]
                                        [{foreach from=$oView->getSubCatList() item=category name=MoreSubCat}]
                                            [{assign var="iconUrl" value=$category->getIconUrl()}]
                                            [{if $iconUrl}]

                                            <div class="swiper-slide">
                                                <div class="slider-item">
                                                    <div class="item-photo">
                                                        <a href="[{$category->getLink()}]" class="item-photo__link">
                                                            <img src="[{* $oViewConf->getImageUrl('spinner.gif')}]" data-src="*}][{$category->getIconUrl()}]" alt="[{$category->oxcategories__oxtitle->value}]" alt="" class="item-photo__img">
                                                        </a>
                                                    </div>
                                                    <div class="item__title">
                                                        <a href="[{$category->getLink()}]" class="item__title__link">
                                                            [{$category->oxcategories__oxtitle->value}] [{if $oView->showCategoryArticlesCount() && ($category->getNrOfArticles() > 0)}]&nbsp;([{$category->getNrOfArticles()}])[{/if}]
                                                        </a>
                                                    </div>
                                                    <p class="item__text">
                                                        Геометрический дизайн
                                                    </p>
                                                </div>
                                            </div>

                                            [{else}]

                                            [{/if}]
                                        [{/foreach}]
                                    [{/if}]


[{*                                    <div class="swiper-slide">
                                        <div class="slider-item">
                                            <div class="item-photo">
                                                <a href="" class="item-photo__link">
                                                    <img src="img/product.jpg" alt="" class="item-photo__img">
                                                </a>
                                            </div>
                                            <div class="item__title">
                                                <a href="" class="item__title__link">
                                                    Плитка
                                                </a>
                                            </div>
                                            <p class="item__text">
                                                Геометрический дизайн
                                            </p>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="slider-item">
                                            <div class="item-photo">
                                                <a href="" class="item-photo__link">
                                                    <img src="img/product.jpg" alt="" class="item-photo__img">
                                                </a>
                                            </div>
                                            <div class="item__title">
                                                <a href="" class="item__title__link">
                                                    Плитка
                                                </a>
                                            </div>
                                            <p class="item__text">
                                                Геометрический дизайн
                                            </p>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="slider-item">
                                            <div class="item-photo">
                                                <a href="" class="item-photo__link">
                                                    <img src="img/product.jpg" alt="" class="item-photo__img">
                                                </a>
                                            </div>
                                            <div class="item__title">
                                                <a href="" class="item__title__link">
                                                    Плитка
                                                </a>
                                            </div>
                                            <p class="item__text">
                                                Геометрический дизайн
                                            </p>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="slider-item">
                                            <div class="item-photo">
                                                <a href="" class="item-photo__link">
                                                    <img src="img/product.jpg" alt="" class="item-photo__img">
                                                </a>
                                            </div>
                                            <div class="item__title">
                                                <a href="" class="item__title__link">
                                                    Плитка
                                                </a>
                                            </div>
                                            <p class="item__text">
                                                Геометрический дизайн
                                            </p>
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="slider-item">
                                            <div class="item-photo">
                                                <a href="" class="item-photo__link">
                                                    <img src="img/product.jpg" alt="" class="item-photo__img">
                                                </a>
                                            </div>
                                            <div class="item__title">
                                                <a href="" class="item__title__link">
                                                    Плитка
                                                </a>
                                            </div>
                                            <p class="item__text">
                                                Геометрический дизайн
                                            </p>
                                        </div>
                                    </div> *}]
                                </div>
                            </div>
                            <div class="swiper-button-prev swiper-button-prev-pc"></div>
                            <div class="swiper-button-next swiper-button-next-pc"></div>
                        </div>
                    </div>
                </div>
            </div>
            [{/if}]
        </section>
[{/if}]


        [{if false && $oView->hasVisibleSubCats()}]
            [{assign var="iSubCategoriesCount" value=0}]
            <div class="subcatList">
                <div class="row">
                    [{foreach from=$oView->getSubCatList() item=category name=MoreSubCat}]
                        [{if $category->getContentCats()}]
                            [{foreach from=$category->getContentCats() item=ocont name=MoreCms}]
                                [{assign var="iSubCategoriesCount" value=$iSubCategoriesCount+1}]
                                <div class="box">
                                    <h3>
                                        <a id="moreSubCms_[{$smarty.foreach.MoreSubCat.iteration}]_[{$smarty.foreach.MoreCms.iteration}]" href="[{$ocont->getLink()}]">[{$ocont->oxcontents__oxtitle->value}]</a>
                                    </h3>
                                    <ul class="content"></ul>
                                </div>
                            [{/foreach}]
                        [{/if}]
                        [{if $iSubCategoriesCount%4 == 0}]
                            </div><div class="row">
                        [{/if}]
                        [{if $category->getIsVisible()}]
                            [{assign var="iSubCategoriesCount" value=$iSubCategoriesCount+1}]
                            [{assign var="iconUrl" value=$category->getIconUrl()}]
                            <div class="col-xs-12 col-sm-3">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <a id="moreSubCat_[{$smarty.foreach.MoreSubCat.iteration}]" href="[{$category->getLink()}]">[{$category->oxcategories__oxtitle->value}]</a>[{if $oView->showCategoryArticlesCount() && ($category->getNrOfArticles() > 0)}] ([{$category->getNrOfArticles()}])[{/if}]
                                    </div>
                                    <div class="panel-body">
                                        [{if $iconUrl}]
                                            <a href="[{$category->getLink()}]">
                                                <img src="[{$oViewConf->getImageUrl('spinner.gif')}]" data-src="[{$category->getIconUrl()}]" alt="[{$category->oxcategories__oxtitle->value}]" class="img-responsive subcat-icon">
                                            </a>
                                        [{else}]
                                            <a href="[{$category->getLink()}]" class="btn btn-block btn-info">[{oxmultilang ident="DD_LIST_SHOW_MORE"}]</a>
                                        [{/if}]

                                        [{if $category->getHasVisibleSubCats()}]
                                            <hr/>
                                            <ul class="list-unstyled">
                                                [{foreach from=$category->getSubCats() item=subcategory}]
                                                    [{if $subcategory->getIsVisible()}]
                                                        [{foreach from=$subcategory->getContentCats() item=ocont name=MoreCms}]
                                                            <li>
                                                                <a href="[{$ocont->getLink()}]"><strong>[{$ocont->oxcontents__oxtitle->value}]</strong></a>
                                                            </li>
                                                        [{/foreach}]
                                                        <li>
                                                            <a href="[{$subcategory->getLink()}]">[{$subcategory->oxcategories__oxtitle->value}]</a>[{if $oView->showCategoryArticlesCount() && ($subcategory->getNrOfArticles() > 0)}]&nbsp;([{$subcategory->getNrOfArticles()}])[{/if}]
                                                        </li>
                                                    [{/if}]
                                                [{/foreach}]
                                            </ul>
                                        [{/if}]
                                    </div>
                                </div>
                            </div>
                        [{/if}]
                        [{if $iSubCategoriesCount%4 == 0}]
                            </div>
                            <div class="row">
                        [{/if}]
                    [{/foreach}]
                </div>
            </div>
            <hr/>
        [{/if}]
    [{/block}]

    [{block name="page_list_listbody"}]
        [{if $oView->getArticleList()|@count > 0}]

            <div class="listRefine">

                [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigationLimitedTop() attributes=$oView->getAttributes() listDisplayType=true itemsPerPage=true sort=true}]

            </div>

            [{* List types: grid|line|infogrid *}]

	    [{include file="widget/locator/attributes.tpl" attributes=$oView->getAttributes()}]

            [{include file="widget/product/list.tpl" type=$oView->getListDisplayType() listId="productList" products=$oView->getArticleList()}]

            [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigationLimitedBottom() place="bottom"}]


            [{if $actCategory->oxcategories__oxlongdesc->value && $oPageNavigation->actPage == 1}]
                <hr/>
                <div id="catLongDescLocator" class="categoryDescription">[{oxeval var=$actCategory->oxcategories__oxlongdesc}]</div>
            [{/if}]

        [{/if}]
    [{/block}]
    [{insert name="oxid_tracker"}]
[{/capture}]
[{include file="layout/page.tpl" tree_path=$oView->getTreePath()}]
