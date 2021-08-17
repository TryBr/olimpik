[{capture assign="sSliderJS"}]
[{strip}]
[{/strip}]

document.addEventListener("DOMContentLoaded", function(event) {

    var swiper5 = new Swiper(".why-us-slider", {
        slidesPerView: 1,
        spaceBetween: 0,
        loop: true,
        allowTouchMove: true,
        pagination: {
            el: '.swiper-pagination-wus',
            type: 'bullets',
        },
        // Responsive breakpoints
        breakpoints: {
            // when window width is >= 320px
            320: {
                slidesPerView: 1,
                spaceBetween: 0
            },
            768: {
                slidesPerView: 2,
                spaceBetween: 0
            },
            1024: {
                slidesPerView: 3,
                spaceBetween: 0
            },
            1300: {
                slidesPerView: 4,
                spaceBetween: 0
            }
        }
    });


});

[{/capture}]

[{oxscript add=$sSliderJS  priority=12}]

<section class="why-us why-us-mobile">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="why-us__title">
                    Почему Олимп и К?
                </div>
            </div>
        </div>
    </div>
    <div class="why-us-puzzles">
        <div class="container">
            <div class="row">
                <div class="col col-lg-12">
                    <div class="swiper-container why-us-slider">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="why-us-puzzles-item item-1">
                                    <div class="item-container">
                                        <div class="item__icon icon-1"></div>
                                        <div class="item__title">
                                            Большой выбор
                                        </div>
                                        <p class="item__text">
                                            Более 10 000 товаров на складе
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="why-us-puzzles-item item-2">
                                    <div class="item-container">
                                        <div class="item__icon icon-2"></div>
                                        <div class="item__title">
                                            Профессионалы
                                        </div>
                                        <p class="item__text">
                                            Мы знаем товар на экспертном уровне
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="why-us-puzzles-item item-3">
                                    <div class="item-container">
                                        <div class="item__icon icon-3"></div>
                                        <div class="item__title">
                                            Работаем с 1994 г.
                                        </div>
                                        <p class="item__text">
                                            27 лет безупречной деловой репутации
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="why-us-puzzles-item item-4">
                                    <div class="item-container">
                                        <div class="item__icon icon-4"></div>
                                        <div class="item__title">
                                            Скидки и акции
                                        </div>
                                        <p class="item__text">
                                            Лучшие цены для наших клиентов
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="why-us-puzzles-item item-5">
                                    <div class="item-container">
                                        <div class="item__icon icon-5"></div>
                                        <div class="item__title">
                                            Оперативность
                                        </div>
                                        <p class="item__text">
                                            Доставляем заказы в любую точку России
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-pagination swiper-pagination-wus"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
