document.addEventListener("DOMContentLoaded", function(event) {

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

    // basket params
    $(".item-params-param-bs").click(function() { 
	    let itemParam = $(this),
            companyType = $(this).data("company")

        $(".item-params-param-bs").removeClass("active");
        itemParam.addClass("active");
        $('#urPay').prop('checked', true);

        if (companyType == "ur") {
            $(".company-block-wrapper").addClass("show");
            $(".pay-for-ur").addClass("show");
            $(".pay-for-fiz").removeClass("show");
            $('#urPay').prop('checked', true);
        } else {
            $(".company-block-wrapper").removeClass("show");
            $(".pay-for-ur").removeClass("show");
            $(".pay-for-fiz").addClass("show");
            $('#fizPay').prop('checked', true);
        }


    });

    // catalog menu open
    $('.header-catalog-btn').click(function(e) { 
        const headerCatalogBtn = $(this);
        headerCatalogBtn.addClass("active");
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
            headerCatalogBtn.removeClass("active");
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


    // decrease
    $(".item-order-value__decrease").click(function(e) { 
        let item = $(this),
            itemParent = item.closest(".item-order-value"),
            counter,
            itemInput;

        if(itemParent) {
            itemInput = itemParent.find(".item-order-value__number");
            counter = itemInput.val();
            counter--;
            if (counter > 0) {
                itemInput.val(counter);
            }
        }
    });

    // increase
    $(".item-order-value__increase").click(function(e) { 
        let item = $(this),
            itemParent = item.closest(".item-order-value"),
            counter,
            itemInput;

        if(itemParent) {
            itemInput = itemParent.find(".item-order-value__number");
            counter = itemInput.val();
            counter++;
            itemInput.val(counter);
        }
    });


    var catalogCats = new Swiper(".productsCategory", {
        slidesPerView: 5,
        spaceBetween: 40,
        loop: false,
        allowTouchMove: true,
        navigation: {
            nextEl: '.swiper-button-next-pc',
            prevEl: '.swiper-button-prev-pc',
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

    let size_li = $(".categories-list li").length;
    let x=7;
    $('.categories-list li:lt('+x+')').show();

    if(size_li <= 7) {
        $('#loadMore').hide();
        $('#showLess').hide();
    }

    $('#loadMore').click(function () {
        $('.categories-list li:lt('+size_li+')').show();
        $('#loadMore').hide();
        $('#showLess').show();
    });
    $('#showLess').click(function () {
        $('.categories-list li').not(':lt('+x+')').hide();
        $('#loadMore').show();
        $('#showLess').hide();
    });


    $('.slider-item .item__title').matchHeight();
    $('.slider-item .item__text').matchHeight();


    // to top
    $(window).scroll(function () {
        if ($(this).scrollTop() > 2000) {
            $('#jumptotop').fadeIn();
        } else {
            $('#jumptotop').fadeOut();
        }
    });

    // scroll body to 0px on click
    $('#jumptotop').click(function () {
        $('body,html').animate({
            scrollTop: 0
        }, 400);
        return false;
    });


    // filter
    $('#filterButton').click(function () {
        $('#filter').toggleClass('show');
    });

    // price slider
	const slider = document.getElementById('rangeSlider');
	if (slider) {
		noUiSlider.create(slider, {
			start: [300, 3500],
            connect: true,
            step: 1,
            range: {
                'min': [0],
                'max': [5000]
            }
		});
		
		let sliderValue = slider.noUiSlider.get(),
        sliderValueFirst, sliderValueSecond;

		slider.noUiSlider.on('update', function () {
			sliderValue = slider.noUiSlider.get();
			sliderValueFirst = sliderValue[0];
            sliderValueSecond = sliderValue[1];

            $(".range-slider-from").val(Math.round(sliderValueFirst));
            $(".range-slider-to").val(Math.round(sliderValueSecond));
		});

        $(".range-slider-from").on("input", function() {
            slider.noUiSlider.set([$(this).val(), null]);
        });

        $(".range-slider-to").on("input", function() {
            slider.noUiSlider.set([null, $(this).val()]);
        });
	}

    // compare
    $(".compare-show-diff").click(function() { 
	    $("tr.sameparam").hide();
    });

    $(".compare-show-all").click(function() { 
	    $("tr.sameparam").show();
    });

    // variants
    $(".item-variants").click(function() { 
	    let itemParam = $(this),
            variantType = $(this).data("variant-type");

        if (variantType == "cutt") {
            $("#cuttable").addClass("show");
            $("#roll").removeClass("show");
        } else {
            $("#roll").addClass("show");
            $("#cuttable").removeClass("show");
        }
    });

    $(".item-variant-value").click(function() { 
	    let itemParam = $(this),
            variantPrice = $(this).data("variant-price"),
            variantToCart = $(this).data("variant-tocart"),
            variantStock = $(this).data("variant-stock");

        $("#productPrice .price").text(variantPrice);
        $("#amountToBasket").val(variantToCart);
        $(".stockFlag__value").text(variantStock);
    });

    // decrease
    $(".quantity-btn-decrease-card").click(function(e) { 
        let item = $(this),
            itemParent = item.closest(".quantity-field-wrapper"),
            counter,
            itemInput;

        if(itemParent) {
            itemInput = itemParent.find(".textbox");
            counter = itemInput.val();
            counter--;
            if (counter > 0) {
                itemInput.val(counter);
            }
        }
    });

    // increase
    $(".quantity-btn-increase-card").click(function(e) { 
        let item = $(this),
            itemParent = item.closest(".quantity-field-wrapper"),
            itemMax,
            counter,
            itemInput;

        if(itemParent) {
            itemInput = itemParent.find(".textbox");
            itemMax = itemInput.attr("max");
            counter = itemInput.val();
            if (parseInt(counter) < parseInt(itemMax)) {
                counter++;
                itemInput.val(counter);
                console.log("itemMax " + itemMax);
                console.log("counter " + counter);
            } else {
                $(".product-card-total-info__error").text(`на складе всего ${itemMax} шт.`);
                $(".product-card-total-info__error").show(300).delay(5000).hide(300);
            }
        }
    });

    // tabs
    $(".attr-table__view__all").click(function(e) { 
        $("#itemTabs li a").removeClass("active");
        $("#itemTabs li").each(function (index, value) { 
            const href = $(this).find("a");
            let hrefAttr = href.attr("href");
            if (hrefAttr == "#attributes") {
                href.addClass("active");
            }
        });
    });
});
