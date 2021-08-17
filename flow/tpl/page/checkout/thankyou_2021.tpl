[{capture append="oxidBlock_content"}]

    [{* ordering steps *}]

    [{assign var="order" value=$oView->getOrder()}]

[{if $order->oxorder__oxordernr->value > 0 && !$oView->isFast}]
    [{include file="page/checkout/inc/new-basket/steps.tpl" active=3}]
[{/if}]

    [{block name="checkout_thankyou_main"}]

        <div id="thankyouPage" class="thank-you-page">
            [{*oxmultilang ident="THANK_YOU"*}]
            <h3 class="blockHead page-title">
                    Спасибо за заказ! [{* <br>
                    Вся информация о заказе отправлена по эл.почте. *}]
            </h3>
            <p class="page-text">
                Заказ №[{$order->oxorder__oxordernr->value}][{*от 15.06.2019*}] успешно оформлен. <br>
[{if !$oView->isFast}]
                На ваш email отправлено письмо с подтверждением заказа. <br>
                Если письма нет — пожалуйста, проверьте папку «Спам». <br>
[{else}]
                Оператор свяжется с вами в ближайшее рабочее время.
[{/if}]
            </p>
            [{if false}]
            [{block name="checkout_thankyou_info"}]
                [{oxmultilang ident="THANK_YOU_FOR_ORDER"}] [{$oxcmp_shop->oxshops__oxname->value}]. <br>
                [{oxmultilang ident="REGISTERED_YOUR_ORDER" args=$order->oxorder__oxordernr->value}] <br>
                [{* if !$oView->getMailError()}]
                    [{oxmultilang ident="MESSAGE_YOU_RECEIVED_ORDER_CONFIRM"}]<br>
                [{else}]<br>
                    [{oxmultilang ident="MESSAGE_CONFIRMATION_NOT_SUCCEED"}]<br>
                [{/if *}]
                <br>
                [{oxmultilang ident="MESSAGE_WE_WILL_INFORM_YOU"}]<br><br>
            [{/block}]

            [{block name="checkout_thankyou_proceed"}]
                [{oxmultilang ident="YOU_CAN_GO"}]
                <a id="backToShop" rel="nofollow" href="[{oxgetseourl ident=$oViewConf->getHomeLink()}]" class="link">[{oxmultilang ident="BACK_TO_START_PAGE"}]</a>
                [{if $oxcmp_user->oxuser__oxpassword->value}]
                    [{oxmultilang ident="OR"}]
                    <a id="orderHistory" rel="nofollow" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_order"}]" class="link">[{oxmultilang ident="CHECK_YOUR_ORDER_HISTORY"}]</a>.
                [{/if}]
            [{/block}]
            [{/if}]

            [{block name="checkout_thankyou_ts"}]
                [{if $oViewConf->showTs("THANKYOU") && $oViewConf->getTsId()}]
                    [{assign var="sTSRatingImg" value="https://www.trustedshops.com/bewertung/widget/img/bewerten_"|cat:$oView->getActiveLangAbbr()|cat:".gif"}]
                    <h3 class="blockHead">[{oxmultilang ident="TRUSTED_SHOPS_CUSTOMER_RATINGS"}]</h3>
                    [{oxmultilang ident="RATE_OUR_SHOP"}]
                    <div class="etrustTsRatingButton">
                        <a href="[{$oViewConf->getTsRatingUrl()}]" target="_blank" title="[{oxmultilang ident="TRUSTED_SHOPS_RATINGS"}]">
                            <img src="[{$sTSRatingImg}]" border="0" alt="[{oxmultilang ident="WRITE_REVIEW_2"}]" align="middle">
                        </a>
                    </div>
                [{/if}]
            [{/block}]

            <table class="products-table">
                [{foreach from=$order->getOrderArticles(true) item=orderitem name=testOrderItem}]
                    [{assign var=sArticleId value=$orderitem->oxorderarticles__oxartid->value}]
                    [{assign var=oArticle value=$orderitem->getArticle()}]
                    <tr id="accOrderAmount_[{$order->oxorder__oxordernr->value}]_[{$smarty.foreach.testOrderItem.iteration}]">

                        <td class="product-title">
                        [{if $oArticle->oxarticles__oxid->value && $oArticle->isVisible()}]
                            <a id="accOrderLink_[{$order->oxorder__oxordernr->value}]_[{$smarty.foreach.testOrderItem.iteration}]" href="[{$oArticle->getLink()}]">
                        [{/if}]
                        [{$orderitem->oxorderarticles__oxtitle->value}] [{$orderitem->oxorderarticles__oxselvariant->value}] <span class="amount"></span>
                        [{if $oArticle->oxarticles__oxid->value && $oArticle->isVisible()}]
                            </a>
                        [{/if}]
                        [{foreach key=sVar from=$orderitem->getPersParams() item=aParam}]
                            [{if $aParam}]
                                <br />[{oxmultilang ident="DETAILS"}]: [{$aParam}]
                            [{/if}]
                        [{/foreach}]
                        </td>

                        <td class="product-quantity">[{$orderitem->oxorderarticles__oxamount->value}] шт.</td>
                        <td class="product-price">[{$orderitem->oxorderarticles__oxprice->value|round}] руб.</td>
                    </tr>
                [{/foreach}]
                [{if !$oView->isFast}]
                <tr class="total-row">
                    <td class="product-title">
                        ИТОГО:
                    </td>
                    <td class="product-sale">[{* Скидка 10% *}]</td>
                    <td class="product-price">[{$order->getFormattedTotalOrderSum()}] руб.</td>
                </tr>
                [{/if}]
            </table>

[{if false}]
            [{block name="checkout_thankyou_partners"}]
                [{if ( $oView->getTrustedShopId())}]
                    <h3 class="blockHead">[{oxmultilang ident="TRUSTED_SHOP_BUYER_PROTECTION"}]</h3>
                    [{if $oView->getTrustedShopId()}]
                        <div class="etrustlogocol">
                            <a href="https://www.trustedshops.com/shop/certificate.php?shop_id=[{$oView->getTrustedShopId()}]" target="_blank">
                                <img src="[{$oViewConf->getImageUrl('trustedshops_m.gif')}]" title="[{oxmultilang ident="TRUSTED_SHOPS_IMGTITLE"}]">
                            </a>
                        </div>
                        <form id="formTsShops" name="formTShops" method="post" action="https://www.trustedshops.com/shop/protection.php" target="_blank">
                            <div>
                                <input type="hidden" name="_charset_">
                                <input name="shop_id" type=hidden value="[{$oView->getTrustedShopId()}]">
                                <input name="email" type="hidden" value="[{$oxcmp_user->oxuser__oxusername->value}]">
                                <input name="amount" type=hidden value="[{$order->getTotalOrderSum()}]">
                                <input name="curr" type=hidden value="[{$order->oxorder__oxcurrency->value}]">
                                <input name="payment" type=hidden value="">
                                <input name="KDNR" type="hidden" value="[{$oxcmp_user->oxuser__oxcustnr->value}]">
                                <input name="ORDERNR" type="hidden" value="[{$order->oxorder__oxordernr->value}]">
                                [{oxmultilang ident="TRUSTED_SHOP_REGISTRATION_MESSAGE"}]<br><br>
                                <span><input type="submit" id="btnProtect" name="btnProtect" value="[{oxmultilang ident="TRUSTED_SHOP_REGISTRATION"}]"></span>
                            </div>
                        </form>
                        <div class="clear"></div>
                    [{/if}]
                [{/if}]
            [{/block}]
[{/if}]

            [{if $oView->getAlsoBoughtTheseProducts()}]
                <br><br>
                <h1 class="page-header">[{oxmultilang ident="WHO_BOUGHT_ALSO_BOUGHT"}]</h1>
                [{include file="widget/product/list.tpl" type=$oView->getListDisplayType() listId="alsoBoughtThankyou" products=$oView->getAlsoBoughtTheseProducts() blDisableToCart=true}]
            [{/if}]
        </div>

        <a href="/" class="thank-you-back-btn">Вернуться к покупкам</a>
    [{/block}]
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{oxscript add="window.onload = function(){ yaCounter40321170.reachGoal('checkout_step5'); }" priority=10}]

[{capture assign="sDataLayerJS"}]
window.dataLayer = window.dataLayer || [];
window.dataLayer.push({
    "ecommerce": {
        "purchase": {
            "actionField": {

                "id" : "[{$order->oxorder__oxordernr->value}]"

            },
            "products": [
		[{foreach from=$order->getOrderArticles() item="listitem" name="arts"}]
                {
                    "id": "[{ $listitem->oxorderarticles__oxartnum->value }]",
                    "name": "[{ $listitem->oxorderarticles__oxtitle->value }]",
                    "price": [{ $listitem->oxorderarticles__oxprice->value }],
                    "brand": "",
                    "category": "",
                    "variant": ""
                }[{if !$smarty.foreach.arts.last}],[{/if}][{/foreach}]
            ]
        }
    }
});
[{/capture}]
[{oxscript add=$sDataLayerJS priority=10}]

[{include file="layout/page.tpl"}]
