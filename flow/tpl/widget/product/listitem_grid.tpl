[{block name="widget_product_listitem_grid"}]
    [{assign var="product"         value=$oView->getProduct()}]
    [{assign var="blDisableToCart" value=$oView->getDisableToCart()}]
    [{assign var="iIndex"          value=$oView->getIndex()}]
    [{assign var="showMainLink"    value=$oView->getShowMainL}]

    [{assign var="currency" value=$oView->getActCurrency()}]
    [{if $showMainLink}]
        [{assign var='_productLink' value=$product->getMainLink()}]
    [{else}]
        [{assign var='_productLink' value=$product->getLink()}]
    [{/if}]
    [{assign var="aVariantSelections" value=$product->getVariantSelections(null,null,1)}]
    [{assign var="blShowToBasket" value=true}] [{* tobasket or more info ? *}]
    [{if $blDisableToCart || $product->isNotBuyable() || ($aVariantSelections&&$aVariantSelections.selections) || $product->hasMdVariants() || ($oViewConf->showSelectListsInList() && $product->getSelections(1)) || $product->getVariants()}]
        [{assign var="blShowToBasket" value=false}]
    [{/if}]

<div class="swiper-slide">
    <div class="slider-item">
        <div class="item-photo">
            <a href="[{$_productLink}]" class="item-photo__link">

                [{if $product->oxarticles__oxtprice->value > $product->oxarticles__oxprice->value}]
                        <div class="item-photo__label item-photo__label_sale">
                            <span class="label__title">Скидка</span>
                            <span class="label__value">[{math equation="round(( a - b )/( a / 100 ))" a=$product->oxarticles__oxtprice->value b=$product->oxarticles__oxprice->value}]%</span>
                        </div>
                [{elseif ( strtotime ($product->oxarticles__oxinsert->value) + ( 24 * 60 * 60 * 120 ) ) > time()}]
                        <div class="item-photo__label item-photo__label_new">
                            <span class="label__title">Новинка</span>
                            <span class="label__title_mobile">New</span>
                        </div>
                [{elseif $product->oxarticles__oxsoldamount->value > 300}]
                        <div class="item-photo__label item-photo__label_new">
                            <span class="label__title">Популярно!</span>
                            <span class="label__title_mobile">Top</span>
                        </div>
                [{/if}]

                [{if $product->isCuttable()}]
                        [{if $product->isCanCutt()}]
                            <div title="Рулонный товар, возможна нарезка" class="item-photo__label__type item-photo__label__type_slice">Нарезка</div>
                        [{else}]
                            <div title="Рулонный товар, продажа только рулонами" class="item-photo__label__type item-photo__label__type_roll">Рулон</div>
                        [{/if}]
                [{/if}]

                <img [{* src="[{$oViewConf->getImageUrl('spinner.gif')}]" data-*}] src="[{$product->getThumbnailUrl()}]" title="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]" class="item-photo__img">
                [{if $product->getManufacturer()}]
                    [{assign var="mnf" value=$product->getManufacturer()}]
                    <div class="item-photo__type">
                        [{$mnf->oxmanufacturers__oxtitle->value}]
                    </div>
                [{/if}]
            </a>
        </div>
        <div class="item__title">
            <a href="[{$_productLink}]" title="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]" class="item__title__link">
                [{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]
            </a>
        </div>
        <p class="item__text">
            [{$product->oxarticles__oxshortdesc->value}]
        </p>
        <div class="item-params-wrapper">
            <div class="item-params">
                [{if $product->oxarticles__oxunitname->value == '_UNIT_ITEM'}]
                <div class="item-params-param active" data-price="1">
                    За 1 шт.
                </div>
                [{elseif $product->oxarticles__oxunitname->value == '_UNIT_PIECE'}]
                <div class="item-params-param active" data-price="1">
                    За весь кусок
                </div>
                [{elseif $product->oxarticles__oxunitname->value == '_UNIT_M2'}]
                <div class="item-params-param active" data-price="1">
                    За м²
                </div> [{if $product->oxarticles__oxbunitname->value  == '_UNIT_PAC'}]
                <div class="item-params-param" data-price="2">
                    За упаковку
                </div> [{/if}]
                [{elseif $product->oxarticles__oxunitname->value == '_UNIT_PAC'}]
                <div class="item-params-param active" data-price="1">
                    За упаковку
                </div> [{if $product->oxarticles__oxbunitname->value  == '_UNIT_M2'}]
                <div class="item-params-param" data-price="2">
                    За м²
                </div> [{/if}]
                [{elseif $product->oxarticles__oxunitname->value == '_UNIT_ROLL'}]
                <div class="item-params-param active" data-price="1">
                    За рулон
                </div> [{if $product->oxarticles__oxbunitname->value  == '_UNIT_POGM'}]
                <div class="item-params-param" data-price="2">
                    За пог.м
                </div> [{/if}]
                [{else}]
                    [{$product->oxarticles__oxunitname->value}] [{$product->oxarticles__oxbunitname->value}]
                [{/if}]
            </div>
            <div class="item-add-btns">
                [{* if $oViewConf->getShowCompareList()}]

                        [{oxid_include_dynamic file="page/details/inc/compare_links.tpl" testid="" type="compare" aid=$oDetailsProduct->oxarticles__oxid->value anid=$oDetailsProduct->oxarticles__oxnid->value in_list=$oDetailsProduct->isOnComparisonList() page=$oView->getActPage() text_to_id="COMPARE" text_from_id="REMOVE_FROM_COMPARE_LIST"}]

                [{/if *}]
                <div class="item-add-btns__comp"></div>
                <div class="item-add-btns__fav"></div>
            </div>
        </div>
        <div class="item-price item-price-1">
            [{assign var="oUnitPrice" value=$product->getUnitPrice()}]
            [{assign var="tprice"     value=$product->getTPrice()}]
            [{assign var="price"      value=$product->getPrice()}]

            [{if $product->getFPrice()}]
            <div class="item-price__value">
                [{if $product->isRangePrice()}]
                    [{oxmultilang ident="PRICE_FROM"}]
                    [{if !$product->isParentNotBuyable()}]
                        [{$product->getFMinPrice()}]
                    [{else}]
                        [{$product->getFVarMinPrice()}]
                    [{/if}]
                [{else}]
                    [{if !$product->isParentNotBuyable()}]
                        [{$product->getFPrice()}]
                    [{else}]
                        [{$product->getFVarMinPrice()}]
                    [{/if}]
                [{/if}]
                ₽
                [{* if $oView->isVatIncluded()}]
                     [{if !($product->hasMdVariants() || ($oViewConf->showSelectListsInList() && $product->getSelections(1)) || $product->getVariants())}]*[{/if}]
                [{/if *}]
            </div>
            [{/if}]
            [{if $tprice && $tprice->getBruttoPrice() > $price->getBruttoPrice()}]
            <div class="item-price__sale">
                [{$product->getFTPrice()}] ₽
            </div>
            [{/if}]
        </div>
        <div class="item-price item-price-2">
            <div class="item-price__value">
                2000 ₽
            </div>
            <div class="item-price__sale">
                3500 ₽
            </div>
        </div>
        <form name="tobasket[{$testid}]" [{if $blShowToBasket}]action="[{$oViewConf->getSelfActionLink()}]" method="post"[{else}]action="[{$_productLink}]" method="get"[{/if}]>
            <div class="hidden">
                [{$oViewConf->getNavFormParams()}]
                [{$oViewConf->getHiddenSid()}]
                <input type="hidden" name="pgNr" value="[{$oView->getActPage()}]">
                [{if $recommid}]
                    <input type="hidden" name="recommid" value="[{$recommid}]">
                [{/if}]
                [{if $blShowToBasket}]
                [{oxhasrights ident="TOBASKET"}]
                    <input type="hidden" name="cl" value="[{$oViewConf->getTopActiveClassName()}]">
                    [{if $owishid}]
                        <input type="hidden" name="owishid" value="[{$owishid}]">
                    [{/if}]
                    [{if $toBasketFunction}]
                        <input type="hidden" name="fnc" value="[{$toBasketFunction}]">
                    [{else}]
                        <input type="hidden" name="fnc" value="tobasket">
                    [{/if}]
                    <input type="hidden" name="aid" value="[{$product->oxarticles__oxid->value}]">
                    [{if $altproduct}]
                        <input type="hidden" name="anid" value="[{$altproduct}]">
                    [{else}]
                        <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value}]">
                    [{/if}]
                    [{* <input type="hidden" name="am" value="1"> *}]
                [{/oxhasrights}]
                [{else}]
                    <input type="hidden" name="cl" value="details">
                    <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value}]">
                [{/if}]
            </div>
        [{if $blShowToBasket && !$product->isCuttable()}]
        <div class="item-order">
            <div class="item-order-value">
                <div class="item-order-value__decrease"></div>
                <input class="item-order-value__number" type="text" name="am" value="1" size="2">
                <div class="item-order-value__increase"></div>
            </div>
            <button type="submit" class="item-order-btn">
                <div class="item-order-btn__icon"></div>
                <div class="item-order-btn__separator"></div>
                <div class="item-order-btn__title">
                    В корзину
                </div>
            </button>
        </div>
        [{elseif $product->oxarticles__oxstock->value || $product->oxarticles__oxstockflag->value == 4}]
        <a href="[{$_productLink}]" class="item-order">
            <div class="item-choose-btn">
            <div class="item-order-btn__title">
                    Выбрать ширину
            </div>
            <div class="item-order-btn__separator"></div>
            [{if $product->isCuttable()}]
                [{if $product->isCanCutt()}]
                <div class="item-order-btn__icon" title="возможна нарезка"></div> [{* тут нужны ножницы *}]

                [{else}]

                <i class="fa fa-dot-circle-o" style="color: #FFF;" title="продажа только рулонами"></i>
                [{* тут нужен рулон из шильды *}]

                [{/if}]
            [{else}]
                <div class="item-order-btn__icon"></div> [{* тут нужна корзина *}]
            [{/if}]



            </div>
        </a>
        [{/if}]
            </form>
    </div>
</div>

[{/block}]

[{if false}]
        [{block name="widget_product_listitem_infogrid_gridpicture"}]
        <div class="picture text-center">
            <a href="[{$_productLink}]" title="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
                <img src="[{$oViewConf->getImageUrl('spinner.gif')}]" data-src="[{$product->getThumbnailUrl()}]" alt="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]" class="img-responsive">
            </a>
        </div>
        [{/block}]

        <div class="listDetails text-center">
            [{block name="widget_product_listitem_infogrid_titlebox"}]
                <div class="title">
                    <a id="[{$testid}]" href="[{$_productLink}]" class="title" title="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
                        <span>[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]</span>
                    </a>
                </div>
            [{/block}]

            <div class="price text-center">
                <div class="content">
                    [{block name="widget_product_listitem_grid_price"}]
                        [{oxhasrights ident="SHOWARTICLEPRICE"}]
                            [{assign var="oUnitPrice" value=$product->getUnitPrice()}]
                            [{assign var="tprice"     value=$product->getTPrice()}]
                            [{assign var="price"      value=$product->getPrice()}]

                            [{if $tprice && $tprice->getBruttoPrice() > $price->getBruttoPrice()}]
                                <span class="oldPrice text-muted">
                                    <del>[{$product->getFTPrice()}] [{$currency->sign}]</del>
                                </span>
                            [{/if}]

                            [{block name="widget_product_listitem_grid_price_value"}]
                                [{if $product->getFPrice()}]
                                    <span class="lead text-nowrap">
                                        [{if $product->isRangePrice()}]
                                            [{oxmultilang ident="PRICE_FROM"}]
                                            [{if !$product->isParentNotBuyable()}]
                                                [{$product->getFMinPrice()}]
                                            [{else}]
                                                [{$product->getFVarMinPrice()}]
                                            [{/if}]
                                        [{else}]
                                            [{if !$product->isParentNotBuyable()}]
                                                [{$product->getFPrice()}]
                                            [{else}]
                                                [{$product->getFVarMinPrice()}]
                                            [{/if}]
                                        [{/if}]
                                        [{$currency->sign}]
                                        [{if $oView->isVatIncluded()}]
                                             [{if !($product->hasMdVariants() || ($oViewConf->showSelectListsInList() && $product->getSelections(1)) || $product->getVariants())}]*[{/if}]
                                        [{/if}]
                                    </span>
                                [{/if}]
                            [{/block}]
                            [{if $oUnitPrice}]
                                <span id="productPricePerUnit_[{$testid}]" class="pricePerUnit">
                                    [{$product->oxarticles__oxunitquantity->value}] [{$product->getUnitName()}] | [{oxprice price=$oUnitPrice currency=$currency}]/[{$product->getUnitName()}]
                                </span>
                            [{elseif $product->oxarticles__oxweight->value }]
                                <span id="productPricePerUnit_[{$testid}]" class="pricePerUnit">
                                    <span title="weight">[{oxmultilang ident="WEIGHT"}]</span>
                                    <span class="value">[{$product->oxarticles__oxweight->value}] [{oxmultilang ident="KG"}]</span>
                                </span>
                            [{/if}]
                        [{/oxhasrights}]
                    [{/block}]
                </div>
            </div>
            [{block name="widget_product_listitem_grid_tobasket"}]
                <div class="actions text-center">
                    <div class="btn-group">
                        [{if $blShowToBasket}]
                            [{oxhasrights ident="TOBASKET"}]
                                <button type="submit" class="btn btn-default hasTooltip" data-placement="bottom" title="[{oxmultilang ident="TO_CART"}]">
                                    <i class="fa fa-shopping-cart"></i>
                                </button>
                            [{/oxhasrights}]
                            <a class="btn btn-primary" href="[{$_productLink}]" >[{oxmultilang ident="MORE_INFO"}]</a>
                        [{else}]
                            <a class="btn btn-primary" href="[{$_productLink}]" >[{oxmultilang ident="MORE_INFO"}]</a>
                        [{/if}]
                    </div>
                </div>
            [{/block}]
        </div>
[{/if}]
