<?xml version="1.0" encoding="UTF-8"?>

<!--
  ~ Copyright (c) 2017 Ignite Realtime Foundation. All rights reserved.
  ~
  ~ Licensed under the Apache License, Version 2.0 (the "License");
  ~ you may not use this file except in compliance with the License.
  ~ You may obtain a copy of the License at
  ~
  ~      http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~ Unless required by applicable law or agreed to in writing, software
  ~ distributed under the License is distributed on an "AS IS" BASIS,
  ~ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  ~ See the License for the specific language governing permissions and
  ~ limitations under the License.
  -->

<%@ page import="org.jivesoftware.util.*,
		org.jivesoftware.openfire.plugin.ofswitch.OfSwitchPlugin,
                java.net.URLEncoder"
    errorPage="error.jsp"
%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<jsp:useBean id="webManager" class="org.jivesoftware.util.WebManager" />
<% webManager.init(request, response, session, application, out ); %>

<% 
	try {	
		String callId = ParamUtils.getParameter(request,"callid");
		
		if (OfSwitchPlugin.self != null)
		{		
			OfSwitchPlugin.self.sendFWCommand("uuid_kill " + callId);
        		response.sendRedirect("freeswitch-calls.jsp?deletesuccess=true");		
        	} else {
        		response.sendRedirect("freeswitch-calls.jsp?deletesuccess=false");        	
        	}
        	
	} catch (Exception e) {
        	response.sendRedirect("freeswitch-calls.jsp?deletesuccess=false");	
	}

        return;
%>