document.addEventListener("DOMContentLoaded", function(event) {

    var swiper = new Swiper(".productsSlider", {
        slidesPerView: 5,
        spaceBetween: 40,
        loop: false,
        allowTouchMove: false,
        navigation: {
            nextEl: '.swiper-button-next-ps1',
            prevEl: '.swiper-button-prev-ps1',
        },
    }); 
    
    var swiper2 = new Swiper(".productsSlider2", {
        slidesPerView: 5,
        spaceBetween: 40,
        loop: false,
        navigation: {
            nextEl: '.swiper-button-next-ps2',
            prevEl: '.swiper-button-prev-ps2',
        },
    }); 

    var swiper3 = new Swiper(".productsSlider3", {
        slidesPerView: 5,
        spaceBetween: 40,
        loop: false,
        navigation: {
            nextEl: '.swiper-button-next-ps3',
            prevEl: '.swiper-button-prev-ps3',
        },
    }); 


    var swiper4 = new Swiper(".brandsSlider", {
        slidesPerView: 6,
        spaceBetween: 24,
        loop: false,
        navigation: {
            nextEl: '.swiper-button-next-bs',
            prevEl: '.swiper-button-prev-bs',
        },
    }); 

    $(window).on('scroll', function() {
        scrollPosition = $(this).scrollTop();
        if (scrollPosition > 300) {
            $(".header").addClass("sticky");
        } else {
            $(".header").removeClass("sticky");
        }
    });

    // параметры
	$('.item-params-param__radio').change(function(){
        if (this.checked && this.value == '1') {
            $(this).closest(".slider-item").find(".item-price-2").addClass("hidden");
            $(this).closest(".slider-item").find(".item-price-2").removeClass("active");

            $(this).closest(".slider-item").find(".item-price-1").addClass("active");
            $(this).closest(".slider-item").find(".item-price-1").removeClass("hidden");
		} else {
            $(this).closest(".slider-item").find(".item-price-1").addClass("hidden");
            $(this).closest(".slider-item").find(".item-price-1").removeClass("active");

            $(this).closest(".slider-item").find(".item-price-2").addClass("active");
            $(this).closest(".slider-item").find(".item-price-2").removeClass("hidden");
		}
	});
    
});
