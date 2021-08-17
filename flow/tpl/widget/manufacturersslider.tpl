[{capture assign="sSliderJS"}]
[{strip}]
[{/strip}]
document.addEventListener("DOMContentLoaded", function(event) {

var swiper4 = new Swiper(".brandsSlider", {
    slidesPerView: 6,
    spaceBetween: 24,
    loop: false,
    navigation: {
        nextEl: '.swiper-button-next-bs',
        prevEl: '.swiper-button-prev-bs',
    },

    autoplay: {
        delay: 3000,
    },

    // Responsive breakpoints
    breakpoints: {
        // when window width is >= 320px
        320: {
            slidesPerView: 1.5,
            spaceBetween: 30,
            centeredSlides: false,
            initialSlide: 0
        },
        375: {
            slidesPerView: 2,
            spaceBetween: 0,
            centeredSlides: false,
            initialSlide: 0
        },
        640: {
            slidesPerView: 2,
            spaceBetween: 0,
            centeredSlides: false,
            initialSlide: 0
        },
        850: {
            slidesPerView: 3,
            spaceBetween: 0,
            centeredSlides: false,
            initialSlide: 0
        },
        1024: {
            slidesPerView: 4,
            spaceBetween: 30,
            centeredSlides: false,
            initialSlide: 0
        },
        1300: {
            slidesPerView: 5,
            spaceBetween: 30,
            centeredSlides: false,
            initialSlide: 0
        }
    }
});

});

[{/capture}]
[{oxscript add=$sSliderJS  priority=12}]


<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="brands-items">
                <!-- Slider main container -->
                <div class="swiper-container brandsSlider">
                    <!-- Additional required wrapper -->
                    <div class="swiper-wrapper">
                        <!-- Slides -->

                        [{foreach from=$oView->getManufacturerForSlider() item=oManufacturer}]
                            [{if $oManufacturer->oxmanufacturers__oxicon->value}]
                                <div class="swiper-slide">
                                    <div class="brands-item">
                                        <a href="[{$oManufacturer->getLink()}]" class="brands-item-logo" title="[{oxmultilang ident="VIEW_ALL_PRODUCTS"}]">
                                            <img src="[{$oManufacturer->getIconUrl()}]" alt="[{$oManufacturer->oxmanufacturers__oxtitle->value}]" class="brands-item-logo__img">
                                        </a>
                                    </div>
                                </div>
                            [{/if}]
                        [{/foreach}]

                    </div>
                    <!-- If we need navigation buttons -->
                    <div class="swiper-button-prev swiper-button-prev-bs"></div>
                    <div class="swiper-button-next swiper-button-next-bs"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <a href="/proizvoditeli/" class="brands__more">
                Все бренды
            </a>
        </div>
    </div>
</div>


[{* oxscript include="js/libs/jquery.flexslider.min.js" priority=2}]
[{oxstyle include="css/libs/jquery.flexslider.min.css"}]

<div class="row">
    <div id="manufacturerSlider" class="boxwrapper">
        <div class="page-header">
            <h3>[{oxmultilang ident="OUR_BRANDS"}]</h3>
            <span class="subhead">[{oxmultilang ident="MANUFACTURERSLIDER_SUBHEAD"}]</span>
        </div>

        <div class="flexslider">
            <ul class="slides">
                [{foreach from=$oView->getManufacturerForSlider() item=oManufacturer}]
                    [{if $oManufacturer->oxmanufacturers__oxicon->value}]
                        <li>
                            <a href="[{$oManufacturer->getLink()}]" title="[{oxmultilang ident="VIEW_ALL_PRODUCTS"}]">
                                <img src="[{$oViewConf->getImageUrl('spinner.gif')}]" data-src="[{$oManufacturer->getIconUrl()}]" alt="[{$oManufacturer->oxmanufacturers__oxtitle->value}]">
                            </a>
                        </li>
                    [{/if}]
                [{/foreach}]
            </ul>
        </div>
    </div>
</div> *}]
