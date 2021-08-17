[{if $listId}]
    [{assign var="sliderId" value=$listId}]
[{else}]
    [{assign var="sliderId" value="productsSlider"}]
[{/if}]

[{capture assign="sSliderJS"}]
[{strip}]
[{/strip}]
document.addEventListener("DOMContentLoaded", function(event) {

    var swiper = new Swiper(".[{$sliderId}]", {
        slidesPerView: 5,
        spaceBetween: 40,
        loop: false,
        allowTouchMove: true,
        navigation: {
            nextEl: '.sb-[{$sliderId}]-next-ps1',
            prevEl: '.sb-[{$sliderId}]-prev-ps1',
        },
        // Responsive breakpoints
        breakpoints: {
            // when window width is >= 320px
            320: {
                slidesPerView: 2,
                spaceBetween: 10,
                centeredSlides: false,
                initialSlide: 0
            },
            425: {
                slidesPerView: 2,
                spaceBetween: 10,
                centeredSlides: false,
                initialSlide: 0
            },
            640: {
                slidesPerView: 2,
                spaceBetween: 10,
                centeredSlides: false,
                initialSlide: 0
            },
            767: {
                slidesPerView: 2,
                spaceBetween: 30,
                centeredSlides: false,
                initialSlide: 0
            },
            850: {
                slidesPerView: 2,
                spaceBetween: 0,
                centeredSlides: false,
                initialSlide: 0
            },
            1024: {
                slidesPerView: 3,
                spaceBetween: 30,
                centeredSlides: false,
                initialSlide: 0
            },
            1300: {
                slidesPerView: 4,
                spaceBetween: 30,
                centeredSlides: false,
                initialSlide: 0
            }
        }
    });

    var swiper2 = new Swiper(".productsSlider2", {
        slidesPerView: 5,
        spaceBetween: 40,
        loop: false,
        navigation: {
            nextEl: '.swiper-button-next-ps2',
            prevEl: '.swiper-button-prev-ps2',
        },
        // Responsive breakpoints
        breakpoints: {
            // when window width is >= 320px
            320: {
                slidesPerView: 2,
                spaceBetween: 10,
                centeredSlides: false,
                initialSlide: 0
            },
            425: {
                slidesPerView: 2,
                spaceBetween: 10,
                centeredSlides: false,
                initialSlide: 0
            },
            640: {
                slidesPerView: 2,
                spaceBetween: 10,
                centeredSlides: false,
                initialSlide: 0
            },
            767: {
                slidesPerView: 2,
                spaceBetween: 30,
                centeredSlides: false,
                initialSlide: 0
            },
            850: {
                slidesPerView: 2,
                spaceBetween: 0,
                centeredSlides: false,
                initialSlide: 0
            },
            1024: {
                slidesPerView: 3,
                spaceBetween: 30,
                centeredSlides: false,
                initialSlide: 0
            },
            1300: {
                slidesPerView: 4,
                spaceBetween: 30,
                centeredSlides: false,
                initialSlide: 0
            }
        }
    });

    var swiper3 = new Swiper(".productsSlider3", {
        slidesPerView: 5,
        spaceBetween: 40,
        loop: false,
        navigation: {
            nextEl: '.swiper-button-next-ps3',
            prevEl: '.swiper-button-prev-ps3',
        },
        // Responsive breakpoints
        breakpoints: {
            // when window width is >= 320px
            320: {
                slidesPerView: 2,
                spaceBetween: 10,
                centeredSlides: false,
                initialSlide: 0
            },
            425: {
                slidesPerView: 2,
                spaceBetween: 10,
                centeredSlides: false,
                initialSlide: 0
            },
            640: {
                slidesPerView: 2,
                spaceBetween: 10,
                centeredSlides: false,
                initialSlide: 0
            },
            767: {
                slidesPerView: 2,
                spaceBetween: 30,
                centeredSlides: false,
                initialSlide: 0
            },
            850: {
                slidesPerView: 2,
                spaceBetween: 0,
                centeredSlides: false,
                initialSlide: 0
            },
            1024: {
                slidesPerView: 3,
                spaceBetween: 30,
                centeredSlides: false,
                initialSlide: 0
            },
            1300: {
                slidesPerView: 4,
                spaceBetween: 30,
                centeredSlides: false,
                initialSlide: 0
            }
        }
    });

});


[{/capture}]

[{oxscript add=$sSliderJS  priority=12}]

<section class="products-slider">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="slider-top-panel">
                    <div class="slider__title">
                        [{$head}]
                    </div>
                    [{if $moreLink}]
                    <a href="[{$moreLink}]" class="slider__more">
                        Смотреть все предложения
                    </a>
                    [{/if}]
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="slider-items">
                    <!-- Slider main container -->
                    <div class="swiper-container [{$sliderId}]">
                        <div class="swiper-wrapper">

                            [{assign var="type" value="grid"}]
                            [{foreach from=$products item="_product" name="productlist"}]
                                [{counter print=false assign="productlistCounter"}]
                                [{assign var="testid" value=$listId|cat:"_"|cat:$smarty.foreach.productlist.iteration}]

                                    [{oxid_include_widget cl="oxwArticleBox" _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() iLinkType=$_product->getLinkType() _object=$_product anid=$_product->getId() sWidgetType=product sListType=listitem_$type iIndex=$testid blDisableToCart=$blDisableToCart isVatIncluded=$oView->isVatIncluded() showMainLink=$showMainLink recommid=$recommid owishid=$owishid toBasketFunction=$toBasketFunction removeFunction=$removeFunction altproduct=$altproduct inlist=$_product->isInList() skipESIforUser=1 testid=$testid}]


                            [{/foreach}]

                        </div>
                    </div>
                    <!-- If we need navigation buttons -->
                    <div class="swiper-button-prev sb-[{$sliderId}]-prev-ps1"></div>
                    <div class="swiper-button-next sb-[{$sliderId}]-next-ps1"></div>
                </div>
            </div>
        </div>

[{if $products2}]
        <div class="row">
            <div class="col-lg-12">
                <div class="slider-items">
                    <!-- Slider main container -->
                    <div class="swiper-container productsSlider2">
                        <div class="swiper-wrapper">
                            [{assign var="type" value="grid"}]
                            [{foreach from=$products2 item="_product" name="productlist"}]
                                [{counter print=false assign="productlistCounter"}]
                                [{assign var="testid" value=$listId|cat:"_"|cat:$smarty.foreach.productlist.iteration}]

                                    [{oxid_include_widget cl="oxwArticleBox" _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() iLinkType=$_product->getLinkType() _object=$_product anid=$_product->getId() sWidgetType=product sListType=listitem_$type iIndex=$testid blDisableToCart=$blDisableToCart isVatIncluded=$oView->isVatIncluded() showMainLink=$showMainLink recommid=$recommid owishid=$owishid toBasketFunction=$toBasketFunction removeFunction=$removeFunction altproduct=$altproduct inlist=$_product->isInList() skipESIforUser=1 testid=$testid}]


                            [{/foreach}]
                        </div>

                    </div>

                    <!-- If we need navigation buttons -->
                    <div class="swiper-button-prev swiper-button-prev-ps2"></div>
                    <div class="swiper-button-next swiper-button-next-ps2"></div>
                </div>
            </div>
        </div>
[{/if}]

    </div>
</section>
