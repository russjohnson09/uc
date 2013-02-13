<?xml version="1.0" encoding="UTF-8"?>
<stylesheet
	xmlns="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:uct="http://uctool.sf.net/"
	version="2.0">
<import href="UctFunctions.xsl" />

<template name="actor-goals-template">
	<variable name="code" select="@code" />
	<variable name="ucs" select="$merged-file//uct:uc-group[@primary-actor=$code]/uct:use-case" />
<if test="$ucs">
&lt;div>&lt;strong>Goals:&lt;/strong>&lt;/div>&lt;ul><text />
	<for-each select="$ucs">
&lt;li><value-of select="uct:goal-ref(.,$link-type)" />&lt;/li><text />
	</for-each>
	<text>&lt;/ul></text>
</if>
</template>

<template name="use-case-index-start-template">
&lt;table class="table table-striped table-bordered table-hover table-condensed">
&lt;thead>
&lt;tr>
&lt;th>&lt;i class="icon-user">&lt;/i> Primary actor&lt;/th>
&lt;th>&lt;i class="icon-bolt">&lt;/i> Goal&lt;/th>
&lt;th>Level&lt;/th>
&lt;/tr>
&lt;/thead>&lt;tbody><text />
</template>

<template name="use-case-index-uc-template">
<variable name="actor-name">
	<for-each select="../@primary-actor">
		<value-of select="uct:actor-name-ref(.,$merged-file)" />
	</for-each>
</variable>
&lt;tr>
&lt;td><value-of select="uct:cell($actor-name)"/>&lt;/td>
&lt;td><value-of select="uct:cell(uct:goal-ref(.,$link-type))"/>&lt;/td>
&lt;td align="center">
<choose>
<when test="@level">
	<value-of select="uct:img(@level,uct:level(@level))" />
</when>
<otherwise>&amp;nbsp;</otherwise>
</choose>
&lt;/td>
&lt;/tr><text />
</template>

<template name="use-case-index-end-template">
&lt;/tbody>
&lt;/table><text />
</template>

<template name="data-index-start-template">
&lt;table class="table table-striped table-bordered table-hover table-condensed">
&lt;thead>
&lt;tr>
&lt;th>&lt;i class="icon-table">&lt;/i> Data structure&lt;/th>
&lt;th>Code&lt;/th>
&lt;/tr>
&lt;/thead>&lt;tbody><text />
</template>

<template name="data-index-data-template">
&lt;tr>
&lt;td><value-of select="uct:data-ref(@code,'',$merged-file,$link-type)" />&lt;/td>
&lt;td><value-of select="uct:cell(@code)"/>&lt;/td>
&lt;/tr><text />
</template>

<template name="data-index-end-template">
&lt;/tbody>
&lt;/table><text />
</template>

<template name="req-index-start-template">
&lt;table class="table table-striped table-bordered table-hover table-condensed">
&lt;thead>
&lt;tr>
&lt;th>&lt;i class="icon-list">&lt;/i> Requirement&lt;/th>
&lt;th>Status&lt;/th>
&lt;th>Priority&lt;/th>
&lt;th>Area&lt;/th>
&lt;th>Level&lt;/th>
&lt;/tr>
&lt;/thead>&lt;tbody><text />
</template>

<template name="req-index-body-template">
	<variable name="code" select="." />
	<variable name="req" select="$merged-file//uct:requirement[@code=$code]" />
	<call-template name="verify-count-1-template">
		<with-param name="name" select="'requirement'" />
		<with-param name="code" select="$code" />
		<with-param name="items" select="$req" />
	</call-template>
&lt;tr>
&lt;td><value-of select="uct:req-ref(.,'',$merged-file,$link-type)"/>&lt;/td>
&lt;td><value-of select="uct:cell(uct:req-status($req/@status))" />&lt;/td>
&lt;td><value-of select="uct:cell(uct:req-priority($req/@priority))" />&lt;/td>
&lt;td><value-of select="uct:cell($req/@area)" />&lt;/td>
&lt;td align="center">
<choose>
<when test="$req/@level">
	<value-of select="uct:img($req/@level,uct:req-level($req/@level))" />
</when>
<otherwise>&amp;nbsp;</otherwise>
</choose>
&lt;/td>
&lt;/tr><text />
</template>

<template name="req-index-end-template">
&lt;/table><text />
</template>

</stylesheet>
