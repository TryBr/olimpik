[{if $oxcmp_categories}]

<style>
    @media (max-width: 768px) {
        #header {
            display: none;
        }

        #footer {
            margin-bottom: 40px;
        }

        #wrapper {
            padding-top: 57px;
        }

        .boxwrapper .list-container .gridView .productBox .picture {
            height: auto;
        }

        h1, .h1, h2, .h2, h3, .h3 {
            margin-top: 0;
            margin-bottom: 0;
        }

        .page-header {
            margin: 0;
        }

        .mobile-menu .list-menu-mobile li a {
            padding-top: 10px;
            padding-bottom: 10px;
        }
        .modal-dialog {
            margin-top: 90px;
        }

        .menu-cat-btn {
            width: 52px;
        }
    }


    .wrap_194 {
        display: none !important;
        bottom: 70px !important;
    }

    #jumptotop {
        bottom: 80px;
        right: 25px;
    }

    .mobile-menu .list-menu-mobile li a svg {
        width: 14px;
        height: 14px;
    }

</style>

<!-- header mobile -->
<div class="header-mobile">
    <div class="header-container">
        <div class="menu-cat-btn"></div>
        <a href="/" class="logo"></a>
        <a href="tel:+7 812 7779090 " class="callback"></a>
    </div>

    <!-- mobile menu -->
    <div class="mobile-menu-container">
        <div class="mobile-menu">
            <ul class="list-menu-mobile nav navbar">
                <li>
                    <a href="#" class="dropdown-toggle dropdown-without-id">
                        Каталог
                    </a>
                    <ul class="submenu dropdown-menu">
                        [{foreach from=$oxcmp_categories item="ocat" key="catkey" name="root"}]
                            [{if $ocat->getIsVisible()}]
                                <li [{if $ocat->getSubCats(1)}] data-id="[{$ocat->getId()}] [{/if}]">
                                    <a href="[{$ocat->getLink()}]"[{if $ocat->getSubCats(1)}] class="dropdown-toggle" [{/if}]>

                                    [{if $ocat->oxcategories__oxtitle->value == 'Линолеум'}]
                                        <span class="menu-icon icon_1"></span>
                                    [{/if}]
                                    [{if $ocat->oxcategories__oxtitle->value == 'Ламинат'}]
                                        <span class="menu-icon icon_2"></span>
                                    [{/if}]
                                    [{if $ocat->oxcategories__oxtitle->value == 'Ковры'}]
                                        <span class="menu-icon icon_3"></span>
                                    [{/if}]
                                    [{if $ocat->oxcategories__oxtitle->value == 'Ковролин'}]
                                        <span class="menu-icon icon_4"></span>
                                    [{/if}]
                                    [{if $ocat->oxcategories__oxtitle->value == 'Ковровые дорожки'}]
                                        <span class="menu-icon icon_5"></span>
                                    [{/if}]
                                    [{if $ocat->oxcategories__oxtitle->value == 'Грязезащита и прочее'}]
                                        <span class="menu-icon icon_6"></span>
                                    [{/if}]
                                    [{if $ocat->oxcategories__oxtitle->value == 'Паркетная доска'}]
                                        <span class="menu-icon icon_7"></span>
                                    [{/if}]
                                    [{if $ocat->oxcategories__oxtitle->value == 'Виниловая плитка'}]
                                        <span class="menu-icon icon_8"></span>
                                    [{/if}]
                                    [{if $ocat->oxcategories__oxtitle->value == 'Керамическая плитка'}]
                                        <span class="menu-icon icon_9"></span>
                                    [{/if}]
                                    [{if $ocat->oxcategories__oxtitle->value == 'Обои и текстиль'}]
                                        <span class="menu-icon icon_10"></span>
                                    [{/if}]

                                    [{if $ocat->oxcategories__oxtitle->value == 'АКЦИИ'}]

                                        <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                            viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
                                        <path style="fill:#f01a1a;" d="M97.103,353.103C97.103,440.86,168.244,512,256,512l0,0c87.756,0,158.897-71.14,158.897-158.897
                                            c0-88.276-44.138-158.897-14.524-220.69c0,0-47.27,8.828-73.752,79.448c0,0-88.276-88.276-51.394-211.862
                                            c0,0-89.847,35.31-80.451,150.069c8.058,98.406-9.396,114.759-9.396,114.759c0-79.448-62.115-114.759-62.115-114.759
                                            C141.241,247.172,97.103,273.655,97.103,353.103z"/>
                                        <path style="fill:#FFDC64;" d="M370.696,390.734c0,66.093-51.033,122.516-117.114,121.241
                                            c-62.188-1.198-108.457-48.514-103.512-110.321c2.207-27.586,23.172-72.276,57.379-117.517l22.805,13.793
                                            C229.517,242.023,256,167.724,256,167.724C273.396,246.007,370.696,266.298,370.696,390.734z"/>
                                        <path style="fill:#FFFFFF;" d="M211.862,335.448c-8.828,52.966-26.483,72.249-26.483,105.931C185.379,476.69,216.998,512,256,512
                                            l0,0c39.284,0,70.729-32.097,70.62-71.381c-0.295-105.508-61.792-158.136-61.792-158.136c8.828,52.966-17.655,79.448-17.655,79.448
                                            C236.141,345.385,211.862,335.448,211.862,335.448z"/><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>

                                    [{/if}]

                                        [{$ocat->oxcategories__oxtitle->value}][{if $ocat->getSubCats()}]
                                        [{elseif $ocat->oxcategories__oxtitle->value == 'Распродажа'}]<i class="fa fa-exclamation"></i>[{/if}]
                                    </a>
                                </li>
                            [{/if}]
                        [{/foreach}]
                    </ul>
                </li>
                <li>
                    <a href="#" class="dropdown-toggle dropdown-without-id">
                        Покупателям
                    </a>
                    <ul class="submenu dropdown-menu">
                        [{oxifcontent ident="oxdeliveryinfo" object="oCont"}]
                        <li>
                            <a href="[{$oCont->getLink()}]">
                                Доставка <i class="fa fa-truck"></i>
                            </a>
                        </li>
                        [{/oxifcontent}]
                        [{oxifcontent ident="oxorderinfo" object="oCont"}]
                        <li>
                            <a href="[{$oCont->getLink()}]">
                                Оплата <i class="fa fa-money"></i>
                            </a>
                        </li>
                        [{/oxifcontent}]

                    </ul>
                </li>
                <li>
                    <a href="#" class="dropdown-toggle dropdown-without-id">
                        О компании
                    </a>
                    <ul class="submenu dropdown-menu">
                        <li>
                            <a href="#">
                                История
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                Миссия
                            </a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="#" class="dropdown-toggle dropdown-without-id">
                        Оптовым клиентам
                    </a>
                    <ul class="submenu dropdown-menu">
                        <li>
                            <a href="#">
                                Вход для оптовиков
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                Условия сотрудничества
                            </a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="#" class="dropdown-toggle dropdown-without-id">
                        Магазины
                    </a>
                    <ul class="submenu dropdown-menu">
                        <li>
                            <a href="#">
                                СПб, переулок Челиева, 7
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                СПб, Гражданский проспект, 4
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                Мск, Тверская 12
                            </a>
                        </li>

                    </ul>
                </li>

                <li>
                    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=contact"}]">
                        [{oxmultilang ident="CONTACT"}] <i class="fa fa-map-marker"></i>
                    </a>
                </li>
            </ul>

            <!-- для плашки -->
            <a class="mobile-menu-phone" href="tel:+78127779090">
                <i class="fa fa-phone"></i> +7 812 7779090
            </a>
            <!-- для плашки -->

        </div>
    </div>
    <!-- mobile menu -->

    <div class="mobile-search">
        <div class="box-form">
            <div class="small_search">
                    <form class="form search" role="form" action="[{$oViewConf->getSelfActionLink()}]" method="get">
                        [{$oViewConf->getHiddenSid()}]
                        <input type="hidden" name="cl" value="search">

                    <div class="btn-element">
                        <input type="submit" name="s" value="Поиск">
                    </div>
                    <div class="input-element">
                        <input id="title-search-input" type="text" name="searchparam" value="[{$oView->getSearchParamForHtml()}]" size="40" autocomplete="off" placeholder="Введите название товара">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- header mobile -->

<!-- footer bar mobile -->
<div class="footer-bar-mobile">
    <a href="/" class="footer-bar-item">
        <span class="footer-bar-item__icon icon_home"></span>
        <span class="footer-bar-item__title">Главная</span>
    </a>
    <a href="javascript:void(0);" class="footer-bar-item footer-bar-search">
        <span class="footer-bar-item__icon icon_search"></span>
        <span class="footer-bar-item__title">Поиск</span>
    </a>
    <a href="/[{*akcii/*}]" class="footer-bar-item">
        <span class="footer-bar-item__icon icon_sale"></span>
        <span class="footer-bar-item__title">Акции</span>
    </a>
    <a href="/[{*?cl=account*}]" class="footer-bar-item">
        <span class="footer-bar-item__icon icon_fav"></span>
        <span class="footer-bar-item__title">Избранное</span>
        <span class="footer-bar-item__count">
            0
        </span>
    </a>
    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket"}]" class="footer-bar-item">
        <span class="footer-bar-item__icon icon_basket"></span>
        <span class="footer-bar-item__title">Корзина</span>
        <span class="footer-bar-item__count[{if $oxcmp_basket->getItemsCount()}] count_basket[{/if}]">
            [{if $oxcmp_basket->getItemsCount()}][{$oxcmp_basket->getItemsCount()}]
            [{else}]0[{/if}]
        </span>
    </a>
</div>
<!-- footer bar mobile -->

[{* <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> *}]

[{capture assign="sAddJS"}]

    $(".list-menu-mobile li a").click(function(e){


        let menuElement = $(this).parent("li"),
            submenuId = menuElement.attr("data-id");


        if (submenuId) {
            e.preventDefault();

            menuElement.toggleClass("open-submenu");

            // получаем данные для суб меню
            $.ajax({
                type: "GET",
                url: "/?cl=mmenu&fnc=getsubmenu&id=" + submenuId,
                success: function(data){
                    // добавляем суб меню
                    if (!menuElement.find(".submenu").length) {
                        menuElement.append("<ul class='submenu dropdown-menu'>" + data + "</ul>");
                    }
                }
            });
        } else if($(this).hasClass("dropdown-without-id")) {
            menuElement.toggleClass("open-submenu");
        }

    });

    function dropdownMenu(item) {
        let menuElement = $(item).parent("li");
        menuElement.toggleClass("open-submenu");
    };


    // кнопка меню
    $(".menu-cat-btn").click(function() {
        if ($(this).hasClass("active")) {
            $(this).find(".fa-times").hide();
            $(this).find(".fa-bars").show();
            $(this).removeClass("active");
            $(".mobile-menu").removeClass("active");

            // для body
            $("body").removeClass("mobile-menu-open");
        } else {
            $(this).find(".fa-times").show();
            $(this).find(".fa-bars").hide();
            $(this).addClass("active");
            $(".mobile-menu").addClass("active");

            // для body
            $("body").addClass("mobile-menu-open");
        }
    });

    $(".footer-bar-search").click(function() {
        $(".mobile-search").slideToggle();
    });


/*    $( "#title-search-input" ).autocomplete({
          source: "/autocomplete.php",
          minLength: 2,
          delay: 300,
          select: function( event, ui ) {
    		document.location.href = ui.item.link;
          }
    }); */

[{/capture}]
[{oxscript add=$sAddJS priority=12}]

[{/if}]
