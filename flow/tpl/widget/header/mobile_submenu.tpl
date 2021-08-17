[{foreach from=$oView->getSubCats() item="ocat" key="catkey" name="root"}]
    [{if $ocat->getIsVisible()}]

        <li class="[{if $homeSelected == 'false' && $ocat->expanded}]active[{/if}] topmenu[{$ocat->oxcategories__oxsort->value}] submenu-lvl3"
            [{* if $ocat->getSubCats()}] data-id="[{$ocat->getId()}]"[{/if *}]>
            [{if $ocat->getSubCats(1)}]
            <span [{if $ocat->getSubCats(1)}] class="dropdown-toggle dropdown-link"[{/if}] onclick="dropdownMenu(this)">
                [{$ocat->oxcategories__oxtitle->value}][{if $ocat->getSubCats(1)}] <i class="fa fa-angle-right"></i> [{/if}]
            </span>
            [{else}]
            <a href="[{$ocat->getLink()}]"[{if $ocat->getSubCats(1)}] class="dropdown-toggle dropdown-link"[{/if}]>
                [{$ocat->oxcategories__oxtitle->value}][{if $ocat->getSubCats(1)}] <i class="fa fa-angle-right"></i> [{/if}]
            </a>
            [{/if}]
            [{if $ocat->getSubCats()}]
            <ul class="submenu-lvl-3 dropdown-menu">
                [{foreach from=$ocat->getSubCats() item="osubcat" key="catkey" name="root"}]
                    [{if $ocat->getIsVisible()}]
                    <li>
                    <a href="[{$osubcat->getLink()}]">
                        [{$osubcat->oxcategories__oxtitle->value}]
                    </a>
                    </li>
                    [{/if}]
                [{/foreach}]
            </ul>
            [{/if}]
        </li>

    [{/if}]
[{/foreach}]
