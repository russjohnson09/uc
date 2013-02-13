<?xml version="1.0" encoding="UTF-8"?>
<stylesheet
	xmlns="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:uct="http://uctool.sf.net/"
	version="2.0">
<import href="functions/UctTemplates.xsl" />	
<import href="Text.xsl" />
<output method="text" />

<param name="ucs-name" />
<param name="merged-file-name" />
<variable name="merged-file" select="document($merged-file-name)" />
<variable name="link-type" select="'multi'" />

<template match="//uct:requirement">
	<variable name="file-name" select="@code" />
	<variable name="page-title" select="concat('Requirement ',@code,' - ',@name)" />
<result-document href="{$file-name}.html">

<value-of select="uct:page-start($page-title,$ucs-name,'../','req',false())" />
<call-template name="requirement-template" />
<value-of select="uct:page-end('../')" />

</result-document>
</template>

<template name="requirement-template">
	<variable name="code" select="@code" />
&lt;a id="req_<value-of select="@code"/>">&lt;/a>
&lt;h3>&lt;i class="icon-list">&lt;/i> &lt;span class="muted">Requirement&lt;/span> <text />
	<value-of select="@code"/> - <value-of select="@name"/>
	<if test="@level">
		<text/>&amp;nbsp;<text/>
		<value-of select="uct:img(@level,uct:req-level(@level))" />
	</if>
	<text/>&lt;/h3>
&lt;table><text />
<if test="@status">
	&lt;tr>&lt;td>&lt;strong>Status:&lt;/strong> <text />
		<value-of select="uct:req-status(@status)"/>&lt;/td>&lt;/tr><text />
</if>
<if test="@priority">
	&lt;tr>&lt;td>&lt;strong>Priority:&lt;/strong> <text />
		<value-of select="uct:req-priority(@priority)"/>&lt;/td>&lt;/tr><text />
</if>
<if test="@area">
	&lt;tr>&lt;td>&lt;strong>Area:&lt;/strong> <text />
		<value-of select="@area"/>&lt;/td>&lt;/tr><text />
</if>
<if test="@type">
	&lt;tr>&lt;td>&lt;strong>Type:&lt;/strong> <text />
		<value-of select="uct:req-type(@type)"/>&lt;/td>&lt;/tr><text />
</if>
<if test="@level">
	&lt;tr>&lt;td>&lt;strong>Level:&lt;/strong> <text />
		<value-of select="uct:req-level(@level)"/>&lt;/td>&lt;/tr><text />
</if>
<if test="@origin">
	&lt;tr>&lt;td>&lt;strong>Origin:&lt;/strong> <text />
		<value-of select="@origin"/>&lt;/td>&lt;/tr><text />
</if>
<if test="uct:description">
	&lt;tr>&lt;td><text />
	<for-each select="uct:description">
		<call-template name="text-template" />
	</for-each>     
	&lt;/td>&lt;/tr><text />
</if>  
<value-of select="uct:req-references-uc($merged-file,$code,$link-type)"/>
<value-of select="uct:req-references-actor($merged-file,$code,$link-type)"/>
<value-of select="uct:req-references-data($merged-file,$code,$link-type)"/>
<value-of select="uct:req-references-req($merged-file,$code,$link-type)"/>
&lt;/table><text />
</template>

</stylesheet>
