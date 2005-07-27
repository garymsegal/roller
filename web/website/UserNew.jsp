<%@ include file="/taglibs.jsp" %><%@ include file="/theme/header.jsp"%>
<%
String ctxPath = request.getContextPath();
boolean allowNewUsers = RollerRuntimeConfig.getBooleanProperty("users.registration.enabled");
if (!allowNewUsers && !request.isUserInRole("admin"))
{ %>
    <span style="warning"><fmt:message key="newuser.newUserCreationDisabled" /></span>
<% }
else
{ %>
<script>
    function previewImage(theme)
    {
        document.preview.src="<%= ctxPath %>/images/preview/sm-theme-" + theme + ".png";
    }
</script>

<br />
<h1><fmt:message key="newUser.addNewUser" /></h1>

<br />
<html:form action="/user" method="post" focus="userName">
    <html:hidden property="method" name="method" value="add"/></input>
    <html:hidden property="id" /></input>
    <html:hidden property="adminCreated" /></input>

    <div class="formrow">
       <label for="fullName" class="formrow" /><fmt:message key="userSettings.fullname" /></label>
       <html:text property="fullName" size="30" maxlength="30" />
    </div>

    <div class="formrow">
       <label for="userName" class="formrow" /><fmt:message key="userSettings.username" /></label>
       <html:text property="userName" size="30" maxlength="30" />
    </div>

    <div class="formrow">
       <label for="password" class="formrow" /><fmt:message key="userSettings.password" /></label>
       <html:password property="passwordText" size="20" maxlength="20" />
       <html:hidden property="password" />
    </div>
    
    <div class="formrow">
       <label for="passwordConfirm" class="formrow" /><fmt:message key="userSettings.passwordConfirm" /></label>
       <html:password property="passwordConfirm" size="20" maxlength="20" />
    </div>

    <div class="formrow">
       <label for="" class="formrow" /><fmt:message key="userSettings.email" /></label>
       <html:text property="emailAddress" size="40" maxlength="40" />
    </div>

    <div class="formrow">
       <label for="locale" class="formrow" /><fmt:message key="userSettings.locale" /></label>
       <html:select property="locale" size="1" >
          <html:options collection="locales" property="value" labelProperty="label"/>
       </html:select>
    </div>

    <div class="formrow">
       <label for="timeZone" class="formrow" /><fmt:message key="userSettings.timeZone" /></label>
       <html:select property="timeZone" size="1" >
           <html:options collection="timeZones" property="value" labelProperty="label"/>
       </html:select>
    </div>
    <br />
        
    <div class="control">
       <html:submit /></input>
    </div>
    
</html:form>

<%
} // end allowNewUsers check
%>

<%@ include file="/theme/footer.jsp"%>

