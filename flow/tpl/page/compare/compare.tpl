[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="COMPARE"|oxmultilangassign}]

    [{$oView->setNoPaging()}]

    [{assign var="articleList" value=$oView->getCompArtList()}]
    [{assign var="atributeList" value=$oView->getAttributeList()}]

    [{oxscript include="js/pages/compare.min.js"}]

    <h1 id="productComparisonHeader" class="page-header">[{$template_title}]</h1>
    [{if $oView->getCompareItemsCnt() >= 1}]
        <div id="comparePlayground">
            <div id="compareLandscape">
                <div class="table-responsive">
                    <table class="table-bordered">
                        <tbody>
                            <tr class="products">
                                [{foreach from=$articleList key=iProdNr item="product" name="compareArticles"}]
                                    [{if $smarty.foreach.compareArticles.first}]
                                        <th class="attrib-title no-border" scope="row">&nbsp;</th>
                                    [{/if}]

                                    <td class="item-wrapper text-center">
                                        <div class="move-controls btn-group">
                                            [{if !$product->hidePrev}]
                                                <a id="compareLeft_[{$product->oxarticles__oxid->value}]" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getActiveClassName() params="fnc=moveleft&amp;aid=`$product->oxarticles__oxnid->value`&amp;pgNr="|cat:$oView->getActPage()}]" class="btn btn-default movePrev">&laquo;</a>
                                            [{/if}]

                                            <a href="javascript:;" class="btn btn-default disabled">[{oxmultilang ident="MOVE"}]</a>

                                            [{if !$product->hideNext}]
                                                <a id="compareRight_[{$product->oxarticles__oxid->value}]" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getActiveClassName() params="fnc=moveright&amp;aid=`$product->oxarticles__oxnid->value`&amp;pgNr="|cat:$oView->getActPage()}]" class="btn btn-default moveNext">&raquo;</a>
                                            [{/if}]
                                        </div>
                                        [{* include file="page/compare/inc/compareitem.tpl" product=$product testid=$smarty.foreach.comparelist.iteration *}]


                                        <div class="productData col-xs-12[{if $type != 'line'}] col-sm-6 col-md-[{$iColIdent}][{/if}] productBox">
                                        [{oxid_include_widget cl="oxwArticleBox" _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() iLinkType=$product->getLinkType() _object=$product anid=$product->getId() sWidgetType=product sListType=listitem_grid iIndex=$testid blDisableToCart=$blDisableToCart isVatIncluded=$oView->isVatIncluded() showMainLink=$showMainLink recommid=$recommid owishid=$owishid toBasketFunction=$toBasketFunction removeFunction=$removeFunction altproduct=$altproduct inlist=$product->isInList() skipESIforUser=1 testid=$testid}]

                                        </div>


                                        <form action="[{$oViewConf->getSelfActionLink()}]" method="post">
                                            <div class="hidden">
                                                [{$oViewConf->getHiddenSid()}]
                                                [{$oViewConf->getNavFormParams()}]
                                                <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
                                                <input type="hidden" name="fnc" value="tocomparelist">
                                                <input type="hidden" name="aid" value="[{$product->oxarticles__oxid->value}]">
                                                <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value}]">
                                                <input type="hidden" name="pgNr" value="0">
                                                <input type="hidden" name="am" value="1">
                                                <input type="hidden" name="removecompare" value="1">
                                            </div>
                                            [{oxhasrights ident="TOBASKET"}]
                                                <button class="btn btn-danger btn-sm" id="remove_cmp_[{$product->oxarticles__oxid->value}]" type="submit" title="[{oxmultilang ident="REMOVE"}]" name="send">
                                                    <i class="fa fa-trash"></i> [{oxmultilang ident="REMOVE"}]
                                                </button>
                                            [{/oxhasrights}]
                                        </form>                                    


                                    </td>
                                [{/foreach}]
                            </tr>
                            [{foreach from=$atributeList key=iProdNr item="oAttrib" name="compareAttributes"}]
                                <tr>
                                    <th class="attrib-title" scope="row">[{$oAttrib->title}]:</th>

                                    [{foreach from=$articleList key="iProdNr" item="product" name="compareArticles"}]
                                        <td class="attrib-text">
                                            [{if $oAttrib->aProd.$iProdNr && $oAttrib->aProd.$iProdNr->value}]
                                                [{$oAttrib->aProd.$iProdNr->value}]
                                            [{else}]
                                                -
                                            [{/if}]
                                        </td>
                                    [{/foreach}]
                                </tr>
                            [{/foreach}]
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    [{else}]
        <p class="alert alert-danger">[{oxmultilang ident="MESSAGE_SELECT_AT_LEAST_ONE_PRODUCT"}]</p>
    [{/if}]
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{if !$oxcmp_user->oxuser__oxpassword->value}]
    [{include file="layout/page.tpl"}]
[{else}]
    [{capture append="oxidBlock_sidebar"}]
        [{include file="page/account/inc/account_menu.tpl" active_link="compare"}]
    [{/capture}]
    [{include file="layout/page.tpl" sidebar="Left"}]
[{/if}]
