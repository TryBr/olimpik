
[{capture assign="basketJS"}]
$( function ()
    {
        $(".calendar-btn").click(function(){
            $("#dDate").focus();
        });

        $(".regButton").click(function(){
            $([document.documentElement, document.body]).animate({
                scrollTop: $(".first-fields").offset().top
            }, 500);
        });

	// TODO REMOVE LATER
	$('input[name="invadr[oxuser__oxcity]"]').on('change', function() { onSpb($(this)); });
	onSpb($('input[name="invadr[oxuser__oxcity]"]'));
	function onSpb(elem) {
        	if (elem.val() != 'Санкт-Петербург') {
                	$('#dDate').removeAttr('required');
        		$('.on-spb').hide();
       	 	} else {
               	 	$('#dDate').attr('required', true);
              	  	$('.on-spb').show();
        	}
	}

    }
);
[{/capture}]
[{oxscript add=$basketJS}]

[{capture append="oxidBlock_content"}]

[{include file="page/checkout/inc/new-basket/steps.tpl" active=2}]

[{if $oView->isLowOrderPrice()}]

<div class="alert alert-danger">

<h2>Внимание! Минимальный заказ [{$oView->getMinOrderPrice()}][{$currency->sign}], <a href="/index.php?cl=basket">дополните корзину!</a></h2>

</div>
                <div class="spacer"></div>

[{else}]

[{if !$oxcmp_user}]
<form class="js-oxValidate" name="login" action="[{$oViewConf->getSslSelfLink()}]" method="post" role="form">
    <div class="hidden">
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="fnc" value="login_noredirect">
        <input type="hidden" name="cl" value="ok_fastorder[{* $oViewConf->getActiveClassName()*}]">
    </div>
    <div class="panel panel-default basket-step-register" id="optionLogin">
        <div class="panel-body">
            [{block name="checkout_options_login_text"}]
            <p>Войдите, если вы зарегистрированы</p>
            [{/block}]
            [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
            <div class="form-group col-md-3[{if $aErrors}] oxInValid[{/if}]">
                <input type="text" name="lgn_usr" class="form-control textbox js-oxValidate js-oxValidate_notEmpty"
                    placeholder="[{oxmultilang ident=" EMAIL_ADDRESS"}]" required="required">
            </div>
            <div class="form-group col-md-3 [{if $aErrors}] oxInValid[{/if}]">
                <input type="password" name="lgn_pwd"
                    class="form-control textbox js-oxValidate js-oxValidate_notEmpty textbox stepsPasswordbox"
                    placeholder="[{oxmultilang ident=" PASSWORD"}]" required="required">

            </div>
            <div class="form-group col-md-6 [{if $aErrors}] oxInValid[{/if}]">
                <button type="submit" class="btn btn-primary submitButton logInButton">[{oxmultilang
                    ident="LOGIN"}]</button>

                [{if !$oxcmp_user->oxuser__oxpassword->value}]
                или
                <button type="button" class="btn btn-primary regButton">Зарегистрироваться</button>
                [{oxscript add="$('#password-block').hide(); $('.regButton').click(function(){
                $('#password-block').toggle(); });"}]
                [{/if}]
            </div>
        </div>
    </div>
</form>
[{/if}]

<form class="form-horizontal js-oxValidate" action="[{$oViewConf->getSslSelfLink()}]" name="order" method="post"
    role="form">
<div class="basket-user-info-wrapper">

        <div class="hidden">
            [{$oViewConf->getHiddenSid()}]
            [{$oViewConf->getNavFormParams()}]
            <input type="hidden" name="cl" value="ok_fastorder">
            <input type="hidden" name="fnc" value="finaliseOrder">
        </div>

        <p class="info-title">Заказчик</p>

        <div class="block-fields-wrapper first-fields">
            <div class="col-lg-8 form-input-wrapper">
                <div class="form-group[{if $aErrors.oxuser__oxfname}] text-danger[{/if}]">
                    <div><label class="control-label req">Имя *</label></div>
                    <div>
                        <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxfname]"
                            value="[{if isset( $invadr.oxuser__oxfname )}][{$invadr.oxuser__oxfname}][{else}][{$oxcmp_user->oxuser__oxfname->value}][{/if}]"
                            [{if $oView->isFieldRequired(oxuser__oxfname)}] required=""[{/if}] placeholder="Как к вам обращаться?">
                            <div class="help-block">[{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxfname}]</div>
                    </div>
                </div>
            </div>
        </div>



        <div class="block-fields-wrapper">
            [{capture assign="sPhoneFormat"}]
            [{strip}]
            jQuery(function($){
            [{if isset( $invadr.oxuser__oxfon )}]
            $("#uphone").mask( "+9 (999) 999-99-99" );
            [{elseif strlen(trim($oxcmp_user->oxuser__oxfon->value))}]
            $("#uphone").mask( "+9 (999) 999-99-99" );
            [{else}]
            $("#uphone").mask( "+9 (999) 999-99-99" );
            [{/if}]
            });
            [{/strip}]
            [{/capture}]
            [{oxscript add=$sPhoneFormat}]

            <div class="col-lg-4 form-input-wrapper">
                <div class="form-group [{if $aErrors.oxuser__oxusername}] oxInValid[{/if}]">
                    [{block name="user_noaccount_email"}]
                    <div><label class="control-label req">Email *</label></div>
                    <div>
                        <input id="userLoginName"
                            class="form-control js-oxValidate js-oxValidate_notEmpty js-oxValidate_email" type="email"
                            name="lgn_usr" value="[{$oView->getActiveUsername()}]" placeholder="Куда выслать информацию по заказу?">
                        <div class="help-block">
                            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxusername}]
                        </div>
                    </div>
                    [{/block}]
                </div>
            </div>

            <div class="col-lg-4 form-input-wrapper">
                <div class="form-group[{if $aErrors.oxuser__oxfon}] text-danger" [{/if}]"> <div><label
                        class="control-label [{if $oView->isFieldRequired(oxuser__oxfon)}] req[{/if}]">Телефон *</label>
                </div>
                <div>
                    <input id="uphone" class="form-control" type="text" maxlength="128" name="invadr[oxuser__oxfon]"
                        value="[{if isset( $invadr.oxuser__oxfon )}][{$invadr.oxuser__oxfon}][{elseif strlen(trim($oxcmp_user->oxuser__oxfon->value))}][{$oxcmp_user->oxuser__oxfon->value}][{else}][{/if}]"
                        [{if $oView->isFieldRequired(oxuser__oxfon)}] required=""[{/if}]  />
                        <div class="help-block">[{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxfon}]</div>
                </div>
            </div>
        </div>

        <div class="form-group">
            [{block name="user_noaccount_newsletter"}]
            <div class="col-lg-9 subscribe-col">
                <input type="hidden" name="blnewssubscribed" value="0">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="blnewssubscribed" value="1" checked [{* if
                            $cmp_user->getNewsSubscription()->getOptInStatus()}]checked[{/if *}]> Подписаться на
                        рассылку новостей. Можно отменить в любое время.
                    </label>
                </div>
            </div>
            [{/block}]
        </div>
</div>



<div class="password-block-wrapper">
    [{if !$oxcmp_user->oxuser__oxpassword->value}]
    [{*это показать по кнопке зарегатся*}]
    <div id="password-block" class="password-block">
        <div class="form-group col-md-4[{if $aErrors.oxuser__oxpassword}] oxInValid[{/if}]">
            [{block name="user_account_password"}]
            <div><label class="control-label col-lg-12 req" for="userPassword">[{oxmultilang ident="PASSWORD"}]</label></div>
            <input type="hidden" id="passwordLength" value="[{$oViewConf->getPasswordLength()}]">
            <div>
                <input id="userPassword"
                    class="form-control textbox js-oxValidate js-oxValidate_notEmpty js-oxValidate_length js-oxValidate_match"
                    type="password" name="lgn_pwd" value="[{$lgn_pwd}]">
                <div class="help-block"></div>
            </div>
            [{/block}]
        </div>
        <div class="form-group col-md-4[{if $aErrors.oxuser__oxpassword}] oxInValid[{/if}]">
            [{block name="user_account_confirmpwd"}]
            <label class="control-label col-lg-12 req">[{oxmultilang ident="CONFIRM_PASSWORD"}]</label>
            <div>
                <input id="userPasswordConfirm"
                    class="form-control textbox js-oxValidate js-oxValidate_notEmpty js-oxValidate_length js-oxValidate_match"
                    type="password" name="lgn_pwd2" value="[{$lgn_pwd2}]">
                <div class="help-block"></div>
            </div>
            [{/block}]
        </div>
    </div>
    [{*/это показать по кнопке зарегатся*}]
    [{/if}]
</div>

<div class="block-fields-wrapper">
    <p class="info-title">Доставка</p>
    <div class="col-lg-8 form-input-wrapper">
        <div class="form-group[{if $aErrors.oxuser__oxcity}] text-danger[{/if}]">
            <div><label class="control-label [{if $oView->isFieldRequired(oxuser__oxcity)}] req[{/if}]">Город</label></div>
            <div>

                [{assign var="oConfig" value=$oViewConf->getConfig()}]
                [{assign var="oSession" value=$oConfig->getSession()}]

                [{if $oxcmp_user->oxuser__oxcity->value}]
                    [{assign var=sDefCity value=$oxcmp_user->oxuser__oxcity->value}]
                [{elseif $oSession->getVariable('ctown')}]
                    [{assign var=sDefCity value=$oSession->getVariable('ctown')}]
                [{elseif $invadr.oxuser__oxcity}]
                    [{assign var=sDefCity value=$invadr.oxuser__oxcity}]
                [{else}]
                    [{assign var=sDefCity value='Санкт-Петербург'}]
                [{/if}]


                <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxcity]"
                    value="[{$sDefCity}][{* if isset( $invadr.oxuser__oxstreet )}][{$invadr.oxuser__oxcity}][{elseif $oxcmp_user->oxuser__oxcity->value}][{$oxcmp_user->oxuser__oxcity->value}][{else}]Санкт-Петербург[{/if *}]"
                    [{if $oView->isFieldRequired(oxuser__oxcity)}] required=""[{/if}] placeholder="Город">
                    [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxstreet}]
                <div class="help-block"></div>
            </div>
        </div>
    </div>

    <div class="col-lg-8 form-input-wrapper">
        <div class="form-group[{if $aErrors.oxuser__oxstreet}] text-danger[{/if}]">
            <div><label class="control-label [{if $oView->isFieldRequired(oxuser__oxstreet)}] req[{/if}]">Адрес доставки</label></div>
            <div>
                <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxstreet]"
                    value="[{if isset( $invadr.oxuser__oxstreet )}][{$invadr.oxuser__oxstreet}][{else}][{$oxcmp_user->oxuser__oxstreet->value}][{/if}]"
                    [{if $oView->isFieldRequired(oxuser__oxstreet)}] required=""[{/if}] placeholder="Улица, дом, квартира">
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxstreet}]
                <div class="help-block"></div>
            </div>
        </div>
    </div>

</div>

<div class="block-fields-wrapper auto-order-wrapper on-spb">
    <div class="input-group">

        [{if false}]

            <div class="auto-order-info-wrapper">
                <label><input type="radio" name="oxorder__oxauto" value="1" > Да</label>
                <label><input type="radio" name="oxorder__oxauto" value="0" checked="checked"> Нет</label>

                <span class="auto-order-title">Подключить автозаказ</span>
                <span class="auto-order-about">Автозаказ &mdash; подписка на товары по вашему расписанию, со <span class="percent">скидкой до 15%</span></span>

                <div class="auto-order-info">
                    <div>
                        <label for="autoord" class="field-label">Как часто доставлять</label>
                    </div>
                    <select id="autoord" class="autoord" name="oxorder__oxautoperiod">
                        <option value="1">Раз в неделю</option>
                        <option value="2">Раз в 2 недели</option>
                        <option value="3">Раз в 3 недели</option>
                        <option value="4">Раз в 4 недели</option>
                        <option value="5">Раз в 5 недели</option>
                        <option value="6">Раз в 6 недели</option>
                    </select>
                </div>
            </div>

        [{/if}]

        <div class="order-info-delivery">
            <div class="col-md-3 delivery-col">
                <div class="input-group">
                    <div>
                        <label for="autoord" class="field-label">Дата <span class="auto-order-info">первой </span>доставки</label>
                    </div>
                    <div class="input-group">
                        <input id="dDate" name="oxorder__oxpaid" type="text" class="form-control datepicker" value="" style="width:200px;" required>
                        <span class="input-group-addon calendar-btn"><i class="fa fa-calendar"></i></span>
                    </div>
                </div>
            </div>
            <div class="col-md-6 delivery-col">
                <div class="delivery-time">
                    <div>
                        <label for="autoord" class="field-label">Время доставки</label>
                    </div>
                    <div class="delivery-variants">
                        <div class="col-lg-6 delivery-col">
                            <div class="delivery-item">
                                <label class="item-label">
                                    <input class="item-input" id="aDateD" type="radio" name="oxorder__oxtod" value="1">
                                    <div class="item-active-bg"></div>
                                    <span class="item-name">День ( 12-16 )</span>
                                </label>
                            </div>
                        </div>
                        <div class="col-lg-6 delivery-col">
                            <div class="delivery-item">
                                <label class="item-label">
                                    <input class="item-input" id="aDateE" type="radio" name="oxorder__oxtod" value="2" checked="checked">
                                    <div class="item-active-bg"></div>
                                    <span class="item-name">Вечер (18-23)</span>
                                </label>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <span style="margin-top: 5px; padding: 5px 15px;" class=""[{*class="bg-danger"*}] id="dinfo"></span>

        </div>

        [{oxscript add="$('.auto-order-info').hide(); $('input[name=oxorder__oxauto]').click(function(){ if ( $('input[name=oxorder__oxauto]:checked').val() == 1 ) $('.auto-order-info').show(); else $('.auto-order-info').hide(); });"}]

        </div>
    [{oxscript add="$('.auto-order-info').hide();"}]
</div>

<div class="block-fields-wrapper on-spb">

    <p class="info-title">Способ оплаты</p>

    <div class="pay-variants">
        <div class="col-lg-4 pay-col">
            <div class="pay-item">
                <label class="item-label">
                    <input type="radio" class="item-input" name="payment" value="1" checked>
                    <div class="item-active-bg"></div>
                    <span class="item-name">Наличные</span>
                    <img src="[{$oViewConf->getImageUrl('new-basket/pay-item-1.png')}]" alt="" class="item-image">
                </label>
            </div>
        </div>
        <div class="col-lg-4 pay-col">
            <div class="pay-item">
                <label class="item-label">
                    <input type="radio" class="item-input" name="payment" value="2">
                    <div class="item-active-bg"></div>
                    <span class="item-name">Картой курьеру</span>
                    <img src="[{$oViewConf->getImageUrl('new-basket/pay-item-2.png')}]" alt="" class="item-image">
                </label>
            </div>
        </div> [{if false}]
        <div class="col-lg-4 pay-col">
            <div class="pay-item">
                <label class="item-label">
                    <input type="radio" class="item-input" name="payment" value="3">
                    <div class="item-active-bg"></div>
                    <span class="item-name">Картой онлайн</span>
                </label>
            </div>
        </div> [{/if}]
    </div>
</div>

<div class="block-fields-wrapper comments-wrapper">
    <div class="form-group">
        <div class="">
            <label for="orderRemark" class="control-label info-title">[{oxmultilang ident="WHAT_I_WANTED_TO_SAY"}]</label>
        </div>
        <div class="col-lg-9 col-comments">
            <textarea id="orderRemark" rows="7" name="order_remark" class="form-control"
                placeholder="[{* oxmultilang ident="HERE_YOU_CAN_ENETER_MESSAGE" *}]">[{$oView->getOrderRemark()}]</textarea>
        </div>
    </div>
    <div class="form-group">
        [{block name="user_noaccount_newsletter"}]
        <div class="col-lg-9 agree-col">
            <input type="hidden" name="agb" value="0">
            <div class="checkbox">
                <label>
                    <input type="checkbox" name="agb" value="1" checked required>
                    С правилами обработки персональных данных ознакомлен и согласен.
                </label>
            </div>
        </div>
        [{/block}]
    </div>
</div>

</div>
<button type="submit" class="btn btn-primary orderButton order-btn-basket">ОТПРАВИТЬ ЗАКАЗ</button>
</form>


[{oxstyle include="css/bootstrap-datepicker.min.css"}]
[{oxscript include="js/bootstrap-datepicker.min.js" priority=11 }]
[{oxscript include="js/bootstrap-datepicker.ru.js" priority=12 }]

[{capture assign="datepicker"}]
$('.datepicker').datepicker ({
format: 'yyyy-mm-dd',
startDate: '+1d',
endDate: '+14d',
language: 'ru',
weekStart: 1,
daysOfWeekDisabled: [ 0,6 ],
daysOfWeekHighlighted: [ 0,6 ] });

$('input[name=oxorder__oxtod]').on( 'change', checkTOD );
$('input[name=oxorder__oxpaid]').on( 'change', checkTOD );

function checkTOD( ){
$('#dinfo').html( "" );
$('#dinfo').removeClass( );

var tod = $('input[name=oxorder__oxtod]:checked').val();

var current = new Date();
var chrs = current.getHours();
var cday = current.getDate();

var cdayofweek = current.getDay();

var seldate = new Date( $('input[name=oxorder__oxpaid]').val() + 'T10:00:00' );
var selday = seldate.getDate();
var seldayofweek = seldate.getDay();

if ( tod == 1 && ( chrs > 9 && ( cday + 1 ) == selday
	|| ( cdayofweek == 5 && chrs > 9 && seldayofweek == 1 && ( cday + 4 ) > selday )
	|| ( cdayofweek == 6 && seldayofweek == 1 && ( cday + 4 ) > selday ) ) ){

$('#dinfo').html( "Нельзя выбрать дневную доставку на следущий день, только через один!" );
$('#dinfo').addClass( "col-md-8 alert alert-danger" );
$('#aDateE').prop( "checked", true );

}
}

[{/capture}]
[{oxscript add=$datepicker priority=12}]

[{/if}]


    [{insert name="oxid_tracker" title=$template_title}]
    [{/capture}]


    [{oxscript add="window.onload = function(){ yaCounter40321170.reachGoal('checkout_step2'); }" priority=10}]

    [{include file="layout/page.tpl"}]
