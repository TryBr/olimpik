
<header class="header">
    <div class="header-top-panel">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="top-panel-navigation">
                        <ul class="nav">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">О компании</a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">История</a>
                                    <a class="dropdown-item" href="#">Миссия</a>
                                    <a class="dropdown-item" href="#">Юридическая информация</a>

                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Покупателям</a>
                                <div class="dropdown-menu">
                                    [{oxifcontent ident="oxdeliveryinfo" object="oCont"}]<a class="dropdown-item" href="[{$oCont->getLink()}]">Доставка</a>[{/oxifcontent}]
                                    [{oxifcontent ident="oxorderinfo" object="oCont"}]<a class="dropdown-item" href="[{$oCont->getLink()}]">Оплата</a>[{/oxifcontent}]
                                    <a class="dropdown-item" href="#">Покупателям</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link nav-link-bordered" href="#">Покупайте как юрлицо</a>
                            </li>
                            [{oxifcontent ident="magaz" object="oCont"}]
                            <li class="nav-item">
                                <a class="nav-link" href="[{$oCont->getLink()}]">Адреса магазинов</a>
                            </li>
                            [{/oxifcontent}]
                            [{oxifcontent ident="oxdeliveryinfo" object="oCont"}]
                            <li class="nav-item">
                                <a class="nav-link" href="[{$oCont->getLink()}]">Доставка</a>
                            </li>
                            [{/oxifcontent}]
                            <li class="nav-item">
                                <a class="nav-link nav-link-bold" href="#">Корпоративным клиентам</a>
                            </li>
                        </ul>
                        <ul class="nav">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle dropdown-city" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                    <span class="nav-link__title">
                                        Санкт-Петербург
                                    </span>
                                </a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Хабаровск</a>
                                    <a class="dropdown-item" href="#">Сыктывкар</a>
                                </div>
                            </li>
                            <li class="nav-item nav-item-login">
                                <div class="nav-item__icon"></div>
                                <a class="nav-link" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account"}]">Войти</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="header-bottom-panel">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="header-bottom-panel-container">
                        <div class="header-logo">
                            <a href="/" class="logo__link"></a>
                        </div>
                        <div class="header-search">
                            <a href="" class="header-catalog-btn">
                                Каталог
                            </a>
                            <form action="" class="header-search-form">
                                <div class="search-form-wrapper">
                                    <button class="button-search-form-btn"></button>
                                    <input type="text" class="search-form-input" placeholder="Например, ковер IBIZA">
                                </div>
                            </form>
                        </div>
                        <div class="header-phone">
                            <a href="tel:+78127779090" class="header-phone__link">
                                +7 812 777-90-90
                            </a>
                        </div>
                        <div class="header-buttons">

                            [{oxid_include_widget cl="oxwServiceMenu" _parent=$oView->getClassName() force_sid=$force_sid nocookie=$blAnon _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]

                            <div class="header-buttons-item">
                                <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket"}]" class="header-buttons-item__link">
                                    [{if $oxcmp_basket->getItemsCount()}]
                                        <div class="header-buttons-item__value value-basket">[{$oxcmp_basket->getItemsCount()}]</div>
                                    [{else}]
                                        <div class="header-buttons-item__value">0</div>
                                    [{/if}]
                                    <div class="header-buttons-item__icon icon-basket"></div>
                                    <div class="header-buttons-item__title title-basket">
                                        Корзина
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

[{block name="layout_header_bottom"}]
        [{oxid_include_widget cl="oxwCategoryTree" cnid=$oView->getCategoryId() sWidgetType="header" _parent=$oView->getClassName() nocookie=1}]
[{/block}]


</header>





[{if false}]
[{if $oViewConf->getTopActionClassName() != 'clearcookies' && $oViewConf->getTopActionClassName() != 'mallstart'}]
    [{oxid_include_widget cl="oxwCookieNote" _parent=$oView->getClassName() nocookie=1}]
[{/if}]
[{block name="header_main"}]
    [{assign var="blFullwidth" value=$oViewConf->getViewThemeParam('blFullwidthLayout')}]

    <header id="header">

        <div class="[{if $blFullwidth}]container[{else}]container-fluid[{/if}]">

            <div class="header-box">

                <div class="row">
                    <div class="col-xs-5 col-sm-6 col-md-4 logo-col">
                        [{block name="layout_header_logo"}]
                            [{assign var="slogoImg" value=$oViewConf->getViewThemeParam('sLogoFile')}]
                            [{assign var="sLogoWidth" value=$oViewConf->getViewThemeParam('sLogoWidth')}]
                            [{assign var="sLogoHeight" value=$oViewConf->getViewThemeParam('sLogoHeight')}]
                            <a href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]">
                                <img src="[{$oViewConf->getImageUrl($slogoImg)}]" alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]" style="[{if $sLogoWidth}]width:auto;max-width:[{$sLogoWidth}]px;[{/if}][{if $sLogoHeight}]height:auto;max-height:[{$sLogoHeight}]px;[{/if}]">
                            </a>
                        [{/block}]
                    </div>
                    <div class="col-xs-7 col-sm-6 col-md-4 col-md-push-4 menus-col">
                        [{block name="layout_header_top"}]
                            <div class="menu-dropdowns pull-right">
                                [{block name="dd_layout_page_header_icon_menu_languages"}]
                                    [{* Language Dropdown*}]
                                    [{oxid_include_widget cl="oxwLanguageList" lang=$oViewConf->getActLanguageId() _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
                                [{/block}]
                                [{block name="dd_layout_page_header_icon_menu_currencies"}]
                                    [{* Currency Dropdown*}]
                                    [{oxid_include_widget cl="oxwCurrencyList" cur=$oViewConf->getActCurrency() _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
                                [{/block}]

                                [{block name="dd_layout_page_header_icon_menu_account"}]
                                    [{if $oxcmp_user || $oView->getCompareItemCount() || $Errors.loginBoxErrors}]
                                        [{assign var="blAnon" value=0}]
                                        [{assign var="force_sid" value=$oViewConf->getSessionId()}]
                                    [{else}]
                                        [{assign var="blAnon" value=1}]
                                    [{/if}]
                                    [{* Account Dropdown *}]
                                    [{oxid_include_widget cl="oxwServiceMenu" _parent=$oView->getClassName() force_sid=$force_sid nocookie=$blAnon _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
                                [{/block}]

                                [{block name="dd_layout_page_header_icon_menu_minibasket"}]
                                    [{* Minibasket Dropdown *}]
                                    [{if $oxcmp_basket->getProductsCount()}]
                                        [{assign var="blAnon" value=0}]
                                        [{assign var="force_sid" value=$oViewConf->getSessionId()}]
                                    [{else}]
                                        [{assign var="blAnon" value=1}]
                                    [{/if}]
                                    [{oxid_include_widget cl="oxwMiniBasket" nocookie=$blAnon force_sid=$force_sid}]
                                [{/block}]
                            </div>
                        [{/block}]
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-4 col-md-pull-4 search-col">
                        [{include file="widget/header/search.tpl"}]
                    </div>
                </div>

            </div>
        </div>

        [{block name="layout_header_bottom"}]
            [{oxid_include_widget cl="oxwCategoryTree" cnid=$oView->getCategoryId() sWidgetType="header" _parent=$oView->getClassName() nocookie=1}]
        [{/block}]

    </header>

[{/block}]
[{/if}]

    [{include file="layout/mobile_header.tpl"}]

[{insert name="oxid_newbasketitem" tpl="widget/minibasket/newbasketitemmsg.tpl" type="message"}]
[{oxid_include_dynamic file="widget/minibasket/minibasketmodal.tpl"}]
