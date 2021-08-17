[{block name="dd_widget_header_categorylist"}]
    [{if $oxcmp_categories}]

        [{assign var="homeSelected" value="false"}]
        [{if $oViewConf->getTopActionClassName() == 'start'}]
            [{assign var="homeSelected" value="true"}]
        [{/if}]
        [{assign var="oxcmp_categories" value=$oxcmp_categories}]
        [{assign var="blFullwidth" value=$oViewConf->getViewThemeParam('blFullwidthLayout')}]

        <nav class="header-navigation">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <ul class="nav">
                            <li class="nav-item nav-item-sale">
                              <a class="nav-link" href="#">Акции</a>
                            </li>


                            [{assign var="3linecategories" value=$oxcmp_categories->get3LineList()}]
                            [{foreach from=$3linecategories item="_cat"}]
                                <li class="nav-item">
                                    <a class="nav-link" href="[{$_cat->getLink()}]">[{$_cat->oxcategories__ox3menutitle->value}]</a>
                                </li>
                            [{/foreach}]


                            [{*<li class="nav-item">
                                <a class="nav-link" href="#">Линолеум</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Ламинат</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Кварцвинил</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Паркет</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Ковролин</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Ковры</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Шторы</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Обои</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Текстиль</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Керамогранит</a>
                            </li> *}]
                            <li class="nav-item nav-item-new">
                                <a class="nav-link" href="#">Новинки</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>

<div class="header-catalog-menu">
    <div class="container">
        <div class="col-lg-12">
            <div class="catalog-menu-wrapper">

                <div class="catalog-menu-left">
                    <ul class="catalog-menu-main">

                        [{foreach from=$oxcmp_categories item="ocat" key="catkey" name="lItem"}]
                            [{if $ocat->getIsVisible()}]
                                [{assign var="iMCnt" value=$iMCnt+1}]

                                <li class="catalog-menu-item">
                                    <a href="[{$ocat->getLink()}]" data-catalog-id="catalog-[{$smarty.foreach.lItem.iteration}]" class="catalog-menu-item__link [{if $iMCnt == 1 || ( $homeSelected == 'false' && $ocat->expanded )}]active[{/if}]">
                                        <span class="link__icon icon_[{$iMCnt}]"></span>
                                        <span class="link__title">
                                            [{$ocat->oxcategories__oxtitle->value}]
                                        </span>
                                    </a>
                                </li>

                            [{/if}]
                        [{/foreach}]

[{*                        <li class="catalog-menu-item">
                            <a href="" class="catalog-menu-item__link">
                                <span class="link__icon icon_lam"></span>
                                <span class="link__title">
                                    Ламинат
                                </span>
                            </a>
                        </li>
                        <li class="catalog-menu-item">
                            <a href="" class="catalog-menu-item__link">
                                <span class="link__icon icon_kovri"></span>
                                <span class="link__title">
                                    Ковры
                                </span>
                            </a>
                        </li>
                        <li class="catalog-menu-item">
                            <a href="" class="catalog-menu-item__link">
                                <span class="link__icon icon_kovrol"></span>
                                <span class="link__title">
                                    Ковролин
                                </span>
                            </a>
                        </li>
                        <li class="catalog-menu-item">
                            <a href="" class="catalog-menu-item__link">
                                <span class="link__icon icon_kovrd"></span>
                                <span class="link__title">
                                    Ковровые дорожки
                                </span>
                            </a>
                        </li>
                        <li class="catalog-menu-item">
                            <a href="" class="catalog-menu-item__link">
                                <span class="link__icon icon_parkd"></span>
                                <span class="link__title">
                                    Паркетная доска
                                </span>
                            </a>
                        </li>
                        <li class="catalog-menu-item">
                            <a href="" class="catalog-menu-item__link">
                                <span class="link__icon icon_parket"></span>
                                <span class="link__title">
                                    Паркет
                                </span>
                            </a>
                        </li>
                        <li class="catalog-menu-item">
                            <a href="" class="catalog-menu-item__link">
                                <span class="link__icon icon_kvarc"></span>
                                <span class="link__title">
                                    Кварцвинил
                                </span>
                            </a>
                        </li>
                        <li class="catalog-menu-item">
                            <a href="" class="catalog-menu-item__link">
                                <span class="link__icon icon_keram"></span>
                                <span class="link__title">
                                    Керамическая плитка
                                </span>
                            </a>
                        </li>
                        <li class="catalog-menu-item">
                            <a href="" class="catalog-menu-item__link">
                                <span class="link__icon icon_sht"></span>
                                <span class="link__title">
                                    Шторы
                                </span>
                            </a>
                        </li>
                        <li class="catalog-menu-item">
                            <a href="" class="catalog-menu-item__link">
                                <span class="link__icon icon_textil"></span>
                                <span class="link__title">
                                    Текстиль
                                </span>
                            </a>
                        </li>
                        <li class="catalog-menu-item">
                            <a href="" class="catalog-menu-item__link">
                                <span class="link__icon icon_oboi"></span>
                                <span class="link__title">
                                    Обои
                                </span>
                            </a>
                        </li>
                        <li class="catalog-menu-item">
                            <a href="" class="catalog-menu-item__link">
                                <span class="link__icon icon_dveri"></span>
                                <span class="link__title">
                                    Двери
                                </span>
                            </a>
                        </li> *}]

                    </ul>
                </div>
                <div class="catalog-menu-right">

                    [{foreach from=$oxcmp_categories item="ocat" key="catkey" name="rItem"}]
                        [{if $ocat->getIsVisible()}]
                        [{if $ocat->getSubCats()}]

                        [{assign var="iRCnt" value=$iRCnt+1}]

                        <div id="catalog-[{$smarty.foreach.rItem.iteration}]-menu" class="catalog-menu-container [{if $iRCnt == 1}]active[{/if}]">

                            [{assign var="b2ColRdy" value=false}]
                            [{assign var="b3ColRdy" value=false}]
                            <div class="catalog-menu-wrapper">
                                <div class="catalog-menu-column">
                                    <ul class="catalog-menu">
                                [{foreach from=$ocat->getSubCats() item="osubcat" key="subcatkey" name="SubCat"}]
                                    [{if $osubcat->getIsVisible()}]

                                        [{if $osubcat->oxcategories__oxsort->value > 50 && !$b2ColRdy }]
                                            [{assign var="b2ColRdy" value=true}]
                                            </ul></div><div class="catalog-menu-column"><ul class="catalog-menu">
                                        [{/if}]
                                        [{if $osubcat->oxcategories__oxsort->value > 100 && !$b3ColRdy }]
                                            [{assign var="b3ColRdy" value=true}]
                                            </ul></div><div class="catalog-menu-column"><ul class="catalog-menu">
                                        [{/if}]

                                        [{* foreach from=$osubcat->getContentCats() item=ocont name=MoreCms}]
                                            <li>
                                                <a href="[{$ocont->getLink()}]">[{$ocont->oxcontents__oxtitle->value}]</a>
                                            </li>
                                        [{/foreach *}]

                                        [{if $osubcat->getIsVisible()}]


                                                [{if $osubcat->oxcategories__oxmenuhead->value}]
                                                    </ul>
                                                    <ul class="catalog-menu">
                                                        <li class="catalog-menu-item item-title">
                                                            [{$osubcat->oxcategories__oxmenuhead->value}]
                                                        </li>
                                                [{/if}]

                                            <li class="catalog-menu-item[{if $homeSelected == 'false' && $osubcat->expanded}] active[{/if}][{* if $ocat->getSubCats()}] dropdown-submenu[{/if *}][{if $osubcat->oxcategories__oxmenuspace->value}] space[{/if}]">
                                                <a class="catalog-menu-item__link[{if $homeSelected == 'false' && $osubcat->expanded}] current[{/if}]" href="[{$osubcat->getLink()}]" >
                                                    [{if mb_stristr($osubcat->oxcategories__oxtitle->value, 'Распродажа') !== false
                                                        && mb_stristr($ocat->oxcategories__oxtitle->value, 'АКЦИ') === false }]<i class="fa fa-star"></i>[{/if}]
                                                             [{$osubcat->oxcategories__oxtitle->value}]</a>

                                            </li>
                                        [{/if}]
                                    [{/if}]


                                [{/foreach}]
                                </ul>
                            </div>
                            </div>

                            <ul class="catalog-brands-menu">
                                <li class="catalog-brands-menu-item">
                                    <a href="#" class="catalog-brands-menu-item__link">
                                        <img src="/out/flow/src/img/brand-logo.png" alt="" class="catalog-brands-menu-item__link__img">
                                    </a>
                                </li>
                                <li class="catalog-brands-menu-item">
                                    <a href="#" class="catalog-brands-menu-item__link">
                                        <img src="/out/flow/src/img/brand-logo.png" alt="" class="catalog-brands-menu-item__link__img">
                                    </a>
                                </li>
                                <li class="catalog-brands-menu-item">
                                    <a href="#" class="catalog-brands-menu-item__link">
                                        <img src="/out/flow/src/img/brand-logo.png" alt="" class="catalog-brands-menu-item__link__img">
                                    </a>
                                </li>
                            </ul>

                            </div>
                        [{/if}]



                         [{/if}]
                    [{/foreach}]


[{* capture assign="sMenuJS"}]

$(".catalog-menu-column").each(function() {
  if ($(this).find(".catalog-menu").html().trim() === "") {
    $(this).remove()
  }
})

[{/capture}]
[{oxscript add=$sMenuJS  priority=12 *}]

                    [{*
                    <div class="catalog-menu-wrapper">
                        <div class="catalog-menu-column">
                            <ul class="catalog-menu">
                                <li class="catalog-menu-item item-title item-title_fav">
                                    Распродажа
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        Нарезка
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        Рулонами
                                    </a>
                                </li>
                            </ul>
                            <ul class="catalog-menu">
                                <li class="catalog-menu-item item-title">
                                    По назначению
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        Бытовой
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        Полукоммерческий
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        Спортивный
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        Антистатический
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        Противопожарный
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        Износостойкий
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        Токопроводящий
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="catalog-menu-column">
                            <ul class="catalog-menu">
                                <li class="catalog-menu-item item-title">
                                    Для дома
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        Для кухни
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        В комнату
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        На балкон
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        Бытовой усиленный
                                    </a>
                                </li>
                            </ul>
                            <ul class="catalog-menu">
                                <li class="catalog-menu-item item-title">
                                    По ширине рулона
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        1,5 метра
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        2,0 метра
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        2,5 метра
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        3 метра
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        3,1 метра
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        3,5 метра
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        4,0 метра
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="catalog-menu-column">
                            <ul class="catalog-menu">
                                <li class="catalog-menu-item item-title">
                                    По толщине
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        толщина 2 мм
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        толщина 3 мм
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        толщина 4-5 мм
                                    </a>
                                </li>
                            </ul>
                            <ul class="catalog-menu">
                                <li class="catalog-menu-item item-title">
                                    По цветам
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        Плитка
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        Дерево, Дуб
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        Зеленый
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        Светлый
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        Серый
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        Синий
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        Черный
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        Зеленый
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="catalog-menu-column">
                            <ul class="catalog-menu">
                                <li class="catalog-menu-item item-title">
                                    Прочее
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        Гомогенный
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        Гетерогенный
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        Искусственный войлок
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        Вспененная основа
                                    </a>
                                </li>
                            </ul>
                            <ul class="catalog-menu">
                                <li class="catalog-menu-item item-title">
                                    Сопутствующие товары
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        Клей для напольных покрытий
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        Сварочные ленты и скотчи
                                    </a>
                                </li>
                                <li class="catalog-menu-item">
                                    <a href="" class="catalog-menu-item__link">
                                        Плинтуса
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    *}]


                </div>
            </div>
        </div>
    </div>
</div>


[{if false}]
        <nav id="mainnav" class="navbar navbar-default" role="navigation">
            <div class="[{if $blFullwidth}]container[{else}]container-fluid[{/if}]">

                [{block name="dd_widget_header_categorylist_navbar_list"}]
                    <div class="navbar-header">
                        [{block name="dd_widget_header_categorylist_navbar_header"}]
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button><span class="visible-xs-inline">[{oxmultilang ident="DD_ROLES_BEMAIN_UIROOTHEADER"}]</span>
                        [{/block}]
                    </div>
                    <div class="collapse navbar-collapse navbar-ex1-collapse">
                        <ul id="navigation" class="nav navbar-nav">
                            [{block name="dd_widget_header_categorylist_navbar_list"}]
                                <li [{if $homeSelected == 'true'}]class="active"[{/if}]>
                                    <a href="[{$oViewConf->getHomeLink()}]">[{oxmultilang ident="HOME"}]</a>
                                </li>

                                [{foreach from=$oxcmp_categories item="ocat" key="catkey" name="root"}]
                                    [{if $ocat->getIsVisible()}]
                                        [{foreach from=$ocat->getContentCats() item="oTopCont" name="MoreTopCms"}]
                                            <li>
                                                <a href="[{$oTopCont->getLink()}]">[{$oTopCont->oxcontents__oxtitle->value}]</a>
                                            </li>
                                        [{/foreach}]

                                        <li class="[{if $homeSelected == 'false' && $ocat->expanded}]active[{/if}][{if $ocat->getSubCats()}] dropdown[{/if}]">
                                            <a href="[{$ocat->getLink()}]"[{if $ocat->getSubCats()}] class="dropdown-toggle" data-toggle="dropdown"[{/if}]>
                                                [{$ocat->oxcategories__oxtitle->value}][{if $ocat->getSubCats()}] <i class="fa fa-angle-down"></i>[{/if}]
                                            </a>

                                            [{if $ocat->getSubCats()}]
                                                <ul class="dropdown-menu">
                                                    [{foreach from=$ocat->getSubCats() item="osubcat" key="subcatkey" name="SubCat"}]
                                                        [{if $osubcat->getIsVisible()}]
                                                            [{foreach from=$osubcat->getContentCats() item=ocont name=MoreCms}]
                                                                <li>
                                                                    <a href="[{$ocont->getLink()}]">[{$ocont->oxcontents__oxtitle->value}]</a>
                                                                </li>
                                                            [{/foreach}]

                                                            [{if $osubcat->getIsVisible()}]
                                                                <li [{if $homeSelected == 'false' && $osubcat->expanded}]class="active"[{/if}]>
                                                                    <a [{if $homeSelected == 'false' && $osubcat->expanded}]class="current"[{/if}] href="[{$osubcat->getLink()}]">[{$osubcat->oxcategories__oxtitle->value}]</a>
                                                                </li>
                                                            [{/if}]
                                                        [{/if}]
                                                    [{/foreach}]
                                                </ul>
                                            [{/if}]
                                        </li>
                                    [{/if}]
                                [{/foreach}]
                            [{/block}]
                        </ul>

                        <ul class="nav navbar-nav navbar-right fixed-header-actions">

                            <li>
                                <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket"}]" rel="nofollow">
                                    <svg class="shopping-bag-mini[{if $oxcmp_basket->getItemsCount()}] filled[{/if}]" viewBox="0 0 64 64">
                                        <use xlink:href="#shoppingBagMini" /> [{* svg icon included in base.tpl *}]
                                    </svg>
                                </a>
                            </li>

                            <li>
                                <a href="javascript:void(null)" class="search-toggle" rel="nofollow">
                                    <i class="fa fa-search"></i>
                                </a>
                            </li>

                        </ul>

                        [{if $oView->isDemoShop()}]
                            <a href="[{$oViewConf->getBaseDir()}]admin/" class="btn btn-sm btn-danger navbar-btn navbar-right visible-lg">
                                [{oxmultilang ident="DD_DEMO_ADMIN_TOOL"}]
                                <i class="fa fa-external-link" style="font-size: 80%;"></i>
                            </a>
                        [{/if}]

                    </div>
                [{/block}]
            </div>
        </nav>
[{/if}]

    [{/if}]
[{/block}]
