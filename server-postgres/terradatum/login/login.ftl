<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
    ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">
    ${msg("loginTitleHtml",(realm.displayNameHtml!''))}
    <#elseif section = "form">
        <#if realm.password>
        <form id="kc-form-login" name="kc-form-login" class="${properties.kcFormClass!}" action="${url.loginAction}"
              method="post">
            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcInputWrapperClass!}">
                    <#if usernameEditDisabled??>
                        <input id="username" class="${properties.kcInputClass!}" name="username"
                               value="${(login.username!'')?html}" type="text" disabled/>
                    <#else>
                        <input id="username" class="${properties.kcInputClass!}" name="username"
                               value="${(login.username!'')?html}" type="text" placeholder="Email *"
                               autocomplete="off"/>
                    </#if>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcInputWrapperClass!}">
                    <input id="password" class="${properties.kcInputClass!}" name="password" type="password"
                           placeholder="Password *" autocomplete="off"/>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <#if realm.resetPasswordAllowed>
                            <a href="${url.loginResetCredentialsUrl}"
                               class="ripple"><span>${msg("doForgotPassword")}</span></a>
                        </#if>
                    </div>
                    <#if realm.rememberMe && !usernameEditDisabled??>
                        <div class="checkbox">
                            <#if login.rememberMe??>
                                <input id="rememberMe" name="rememberMe" type="checkbox" tabindex="3"
                                       checked>
                            <#else>
                                <input id="rememberMe" name="rememberMe" type="checkbox"
                                       tabindex="3">
                            </#if>
                            <label for="rememberMe">${msg("rememberMe")}</label>
                        </div>
                    </#if>
                </div>
            </div>
            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <div class="${properties.kcFormButtonsWrapperClass!}">
                        <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!} ripple"
                               name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                    </div>
                </div>
            </div>
        </form>
        </#if>
    <#elseif section = "info" >
        <#if realm.password && social.providers??>
        <div id="kc-social-providers">
            <ul>
                <#list social.providers as p>
                    <li><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span
                            class="text">${p.displayName}</span></a></li>
                </#list>
            </ul>
        </div>
        </#if>
        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
        <div id="kc-registration">
            <span><a href="${url.registrationUrl}" class="ripple">${msg("doRegister")}</a></span>
        </div>
        </#if>
    </#if>
</@layout.registrationLayout>