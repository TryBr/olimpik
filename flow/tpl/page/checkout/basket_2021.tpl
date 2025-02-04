[{assign var="oConfig" value=$oViewConf->getConfig()}]

[{capture assign="basketJS"}]
$( function ()
    {
        basketUrl = '[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket"}]';

        $(".quantity-btn-decrease").click(function(){
            thisItem = $(this).closest(".basket-item");
            itemDataId = $(this).closest(".basket-item").find(".basket-item-id").val();
            currentAmountValue = thisItem.find(".quantity-field-wrapper .value").val();
            currentAmountValue--;
            thisItem.find(".quantity-field-wrapper .value").val(currentAmountValue);
            $.ajax({
                type: "GET",
                url: "/?cl=basket&fnc=okAjax&mode=change_amount&aid=" + itemDataId + "&am=" + currentAmountValue,
                dataType: 'json',
                success: function(data) {
                    [{* console.log(data); *}]
                    newAmount = data[0].newAmount;
                    newBasketSum = data[0].newBasketSum;
                    newProductSum = data[0].newProductSum;
                    status = data[0].status;
                    if (status == "changed") {
                        thisItem.find(".totalPrice").html( newProductSum );
                        $(".basket-content-wrapper").find(".basket-total-sum").html( newBasketSum );
                    }
                }
            });
        });

        $(".quantity-btn-increase").click(function(){
            thisItem = $(this).closest(".basket-item");
            itemDataId = $(this).closest(".basket-item").find(".basket-item-id").val();
            currentAmountValue = thisItem.find(".quantity-field-wrapper .value").val();
            currentAmountValue++;
            thisItem.find(".quantity-field-wrapper .value").val(currentAmountValue);
            $.ajax({
                type: "GET",
                url: "/?cl=basket&fnc=okAjax&mode=change_amount&aid=" + itemDataId + "&am=" + currentAmountValue,
                dataType: 'json',
                success: function(data) {
                    [{* console.log(data); *}]
                    newAmount = data[0].newAmount;
                    newBasketSum = data[0].newBasketSum;
                    newProductSum = data[0].newProductSum;
                    maxAmount = data[0].maxAmount;
                    status = data[0].status;
                    if (status == "changed") {
                        thisItem.find(".totalPrice").html( newProductSum );
                        $(".basket-content-wrapper").find(".basket-total-sum").html( newBasketSum );

                        if (currentAmountValue > maxAmount) {
                            thisItem.find(".amount-value .value").text(maxAmount);
                            currentAmountValue = maxAmount;
                        }
                    }
                }
            });
        });

        $(".delete-btn").click(function(){
            thisItem = $(this).closest(".basket-item");
            itemDataId = $(this).closest(".basket-item").find(".basket-item-id").val();

            $.ajax({
                type: "GET",
                url: "/?cl=basket&fnc=okAjax&mode=delete&aid=" + itemDataId,
                dataType: 'json',
                success: function(data) {
                    [{* console.log(data); *}]

                    newBasketSum = data[0].newBasketSum;
                    newProductCount = data[0].newProductCount;
                    status = data[0].status;
                    if (status == "deleted") {
                        thisItem.remove();

                        $(".basket-content-wrapper").find(".basket-total-sum").html( newBasketSum );
                   }
                    //window.location.href = basketUrl;
                    window.location.reload();
                }
            });
        });
    }
);
[{/capture}]
[{oxscript add=$basketJS}]

[{capture append="oxidBlock_content"}]

    [{* ordering steps *}]
    [{include file="page/checkout/basket2021/steps.tpl" active=1}]

    [{block name="checkout_basket_main"}]
        [{assign var="currency" value=$oView->getActCurrency()}]

        [{if $oView->isLowOrderPrice()}]
            [{block name="checkout_basket_loworderprice_top"}]
                <div class="alert alert-danger">Внимание! [{oxmultilang ident="MIN_ORDER_PRICE"}] [{$oView->getMinOrderPrice()}] [{$currency->sign}]</div>
                <div class="spacer"></div>
            [{/block}]
        [{/if}]

        [{if !$oxcmp_basket->getProductsCount()}]
            [{block name="checkout_basket_emptyshippingcart"}]
                <div class="spacer"></div>
                <div class="alert alert-danger" id="empty-basket-warning">
                    <a href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]" class="btn btn-default"><i class="fa fa-caret-left"></i> [{oxmultilang ident="DD_BASKET_BACK_TO_SHOP"}]</a>
                    [{oxmultilang ident="BASKET_EMPTY"}]
                </div>
            [{/block}]
        [{else}]
            [{block name="checkout_basket_next_step_top"}]
                [{if false}]
                <!-- выключил -->
                <div class="well well-sm clear cart-buttons">
                    [{block name="checkout_basket_backtoshop_top"}]
                        [{if $oView->showBackToShop()}]
                            <form action="[{$oViewConf->getSslSelfLink()}]" method="post" class="pull-left">
                                <div class="hidden">
                                    [{$oViewConf->getHiddenSid()}]
                                    <input type="hidden" name="cl" value="basket">
                                    <input type="hidden" name="fnc" value="backtoshop">
                                </div>
                                <button type="submit" class="btn btn-default submitButton largeButton pull-left">
                                    <i class="fa fa-caret-left"></i> [{oxmultilang ident="CONTINUE_SHOPPING"}]
                                </button>
                            </form>
                        [{else}]
                            <a href="[{$oViewConf->getHomeLink()}]" class="btn btn-default submitButton largeButton pull-left">
                                <i class="fa fa-caret-left"></i> [{oxmultilang ident="CONTINUE_SHOPPING"}]
                            </a>
                        [{/if}]
                    [{/block}]

                    [{if !$oView->isLowOrderPrice()}]
                        [{block name="basket_btn_next_top"}]
                            <form action="[{$oViewConf->getSslSelfLink()}]" method="post" class="pull-right">
                                <div class="hidden">
                                    [{$oViewConf->getHiddenSid()}]
                                    <input type="hidden" name="cl" value="ok_fastorder">
                                </div>
                                <button type="submit" class="btn btn-primary submitButton largeButton nextStep pull-right">
                                    [{oxmultilang ident="CONTINUE_TO_NEXT_STEP"}] <i class="fa fa-caret-right"></i>
                                </button>
                            </form>
                        [{/block}]
                    [{/if}]
                    <div class="clearfix"></div>
                </div>
                <!-- выключил -->
                [{/if}]
            [{/block}]

            <div class="lineBox basketlineBox">

                [{include file="page/checkout/basket2021/basketcontents.tpl" editable=true}]


                <div class="basket-final-button">
                    [{if !$oView->isLowOrderPrice()}]
                    <button class="oneClickOrder btn-one-click">
                        Купить в 1 клик
                    </button>
		    [{/if}]

		    [{*
                    <button class="btn-order">Оформить заказ</button>
                    *}]


                    <form action="[{$oViewConf->getSslSelfLink()}]" method="get">
                        <div class="hidden">
                            [{$oViewConf->getHiddenSid()}]
                            <input type="hidden" name="cl" value="ok_fastorder">
                        </div>
                        <button type="submit" class="btn-order">
                            Оформить заказ
                        </button>
                    </form>

                </div>

            [{if $oView->isLowOrderPrice()}]
			<h4 class="alert alert-danger">Внимание! Минимальный заказ [{$oView->getMinOrderPrice()}] [{$currency->sign}], дополните корзину!</h4>
		    [{/if}]

            </div>

            [{block name="checkout_basket_next_step_bottom"}]
                [{if false}]
                <!-- выключил -->
                <div class="well well-sm clear cart-buttons">
                    [{block name="checkout_basket_loworderprice_bottom"}][{/block}]

                    [{block name="checkout_basket_backtoshop_bottom"}]
                        [{if $oView->showBackToShop()}]
                            <form action="[{$oViewConf->getSslSelfLink()}]" method="post" class="pull-left">
                                <div class="backtoshop">
                                    [{$oViewConf->getHiddenSid()}]
                                    <input type="hidden" name="cl" value="basket">
                                    <input type="hidden" name="fnc" value="backtoshop">
                                    <button type="submit" class="btn btn-default submitButton largeButton pull-left">
                                        <i class="fa fa-caret-left"></i> [{oxmultilang ident="CONTINUE_SHOPPING"}]
                                    </button>
                                </div>
                            </form>
                        [{else}]
                            <a href="[{$oViewConf->getHomeLink()}]" class="btn btn-default submitButton largeButton pull-left">
                                <i class="fa fa-caret-left"></i> [{oxmultilang ident="CONTINUE_SHOPPING"}]
                            </a>
                        [{/if}]
                    [{/block}]

                    [{if !$oView->isLowOrderPrice()}]
                        [{block name="basket_btn_next_bottom"}]
                            <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
                                <div class="hidden">
                                    [{$oViewConf->getHiddenSid()}]
                                    <input type="hidden" name="cl" value="ok_fastorder">
                                </div>
                                <button type="submit" class="btn btn-primary submitButton largeButton nextStep pull-right">
                                    [{oxmultilang ident="CONTINUE_TO_NEXT_STEP"}] <i class="fa fa-caret-right"></i>
                                </button>
                            </form>
                        [{/block}]
                    [{/if}]
                    <div class="clearfix"></div>
                </div>
                <!-- выключил -->
                [{/if}]
            [{/block}]
        [{/if}]
        [{if $oView->isWrapping()}]
           [{include file="page/checkout/inc/wrapping.tpl"}]
        [{/if}]
    [{/block}]
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{oxscript add="window.onload = function(){ yaCounter40321170.reachGoal('checkout_step1'); }" priority=10}]

[{include file="layout/page.tpl"}]
