document.addEventListener("DOMContentLoaded", function(event) {

    var swiper = new Swiper(".productsSlider", {
        slidesPerView: 5,
        spaceBetween: 40,
        loop: false,
        allowTouchMove: true,
        navigation: {
            nextEl: '.swiper-button-next-ps1',
            prevEl: '.swiper-button-prev-ps1',
        },
        // Responsive breakpoints
        breakpoints: {
            // when window width is >= 320px
            320: {
                slidesPerView: 1,
                spaceBetween: 0,
                centeredSlides: false,
                initialSlide: 0
            },
            374: {
                slidesPerView: 1,
                spaceBetween: 0,
                centeredSlides: false,
                initialSlide: 0
            },
            375: {
                slidesPerView: 1.5,
                spaceBetween: 0,
                centeredSlides: false,
                initialSlide: 0
            },
            640: {
                slidesPerView: 1.5,
                spaceBetween: 0,
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
                slidesPerView: 1,
                spaceBetween: 0,
                centeredSlides: false,
                initialSlide: 0
            },
            374: {
                slidesPerView: 1,
                spaceBetween: 0,
                centeredSlides: false,
                initialSlide: 0
            },
            375: {
                slidesPerView: 1.5,
                spaceBetween: 0,
                centeredSlides: false,
                initialSlide: 0
            },
            640: {
                slidesPerView: 1.5,
                spaceBetween: 0,
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
                slidesPerView: 1,
                spaceBetween: 0,
                centeredSlides: false,
                initialSlide: 0
            },
            374: {
                slidesPerView: 1,
                spaceBetween: 0,
                centeredSlides: false,
                initialSlide: 0
            },
            375: {
                slidesPerView: 1.5,
                spaceBetween: 0,
                centeredSlides: false,
                initialSlide: 0
            },
            640: {
                slidesPerView: 1.5,
                spaceBetween: 0,
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


    var swiper4 = new Swiper(".brandsSlider", {
        slidesPerView: 6,
        spaceBetween: 24,
        loop: false,
        navigation: {
            nextEl: '.swiper-button-next-bs',
            prevEl: '.swiper-button-prev-bs',
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
            374: {
                slidesPerView: 1.5,
                spaceBetween: 0,
                centeredSlides: false,
                initialSlide: 0
            },
            375: {
                slidesPerView: 1.5,
                spaceBetween: 0,
                centeredSlides: false,
                initialSlide: 0
            },
            640: {
                slidesPerView: 1.5,
                spaceBetween: 0,
                centeredSlides: false,
                initialSlide: 0
            },
            850: {
                slidesPerView: 2.5,
                spaceBetween: 0,
                centeredSlides: false,
                initialSlide: 0
            },
            1024: {
                slidesPerView: 3.5,
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

    var swiper5 = new Swiper(".why-us-slider", {
        slidesPerView: 1,
        spaceBetween: 0,
        loop: true,
        allowTouchMove: true,
        pagination: {
            el: '.swiper-pagination-wus',
            type: 'bullets',
        },
    }); 

    $(window).on('scroll', function() {
        scrollPosition = $(this).scrollTop();
        if (scrollPosition > 300) {
            $(".banner").addClass("sticky-header");
            $(".header").addClass("sticky");
            $(".header-catalog-menu").addClass("fixed");
            // $(".header-catalog-menu").removeClass("active");
        } else {
            $(".banner").removeClass("sticky-header");
            $(".header").removeClass("sticky");
            $(".header-catalog-menu").removeClass("fixed");
        }
    });

    // params
    $(".item-params-param").click(function() { 
	    let itemParam = $(this),
            itemDataPrice = $(this).data("price"),
            itemParent = $(this).closest(".slider-item");

        if (itemDataPrice == '1') {
            itemParent.find(".item-params-param").removeClass("active");
            itemParam.addClass("active");
            itemParent.find(".item-price").removeClass("active hidden");
            itemParent.find(".item-price-2").addClass("hidden");
            itemParent.find(".item-price-1").addClass("active");
        } else {
            itemParent.find(".item-params-param").removeClass("active");
            itemParam.addClass("active");
            itemParent.find(".item-price").removeClass("active hidden");
            itemParent.find(".item-price-1").addClass("hidden");
            itemParent.find(".item-price-2").addClass("active");
        }
    });

    var banner = new Swiper(".banner-swiper", {
        loop: true,
        navigation: {
          nextEl: ".swiper-button-next-bn",
          prevEl: ".swiper-button-prev-bn",
        },
    });


    // catalog menu open
    $('.header-catalog-btn').click(function(e) { 
        e.preventDefault();

	    const headerCatalogMenu = $(".header-catalog-menu");

        let scrollPosition = $(window).scrollTop();
        if (scrollPosition > 300) {
            $(".header-catalog-menu").addClass("fixed");
        } else {
            $(".header-catalog-menu").removeClass("fixed");
        }

        if (headerCatalogMenu.hasClass("active")) {
            headerCatalogMenu.removeClass("active");
        } else {
            headerCatalogMenu.addClass("active");
        }
    });

    // catalog menu
    $(".catalog-menu-item__link").click(function(e) { 

        let item = $(this),
            itemCatalogId = item.data("catalog-id");

        if(itemCatalogId) {
            e.preventDefault();
            $(".catalog-menu-item__link").removeClass("active");
            item.addClass("active");
    
            $('.catalog-menu-container').removeClass("active");
            $(`#${itemCatalogId}-menu`).addClass("active");
        }


    });

});
