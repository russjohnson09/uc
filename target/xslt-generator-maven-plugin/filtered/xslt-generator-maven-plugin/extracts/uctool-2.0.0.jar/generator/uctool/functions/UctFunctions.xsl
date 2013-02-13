<?xml version="1.0" encoding="UTF-8"?>
<stylesheet
	xmlns="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:uct="http://uctool.sf.net/"
	version="2.0">

	<template match="@*|node()|text()" mode="copy">
	<!-- Copy template -->
		<copy>
			<apply-templates select="@*|node()|text()" mode="copy" />
		</copy>
	</template>

	<function name="uct:page-start" as="xs:string">
		<param name="page-title" as="xs:string" />
		<param name="ucs-name" as="xs:string" />
		<param name="offset" as="xs:string" />
		<param name="selected" as="xs:string" />
		<param name="section" as="xs:boolean" />
		<variable name="result">
<text/>&lt;!DOCTYPE HTML>
&lt;html>
&lt;head>
&lt;title><value-of select="$page-title"/>&lt;/title>
&lt;meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
&lt;link rel="stylesheet" type="text/css" href="<value-of select="$offset"/>resources/css/styles.css"/>
&lt;link rel="shortcut icon" href="<value-of select="$offset"/>resources/favicon.ico" />
&lt;meta name="viewport" content="width=device-width, initial-scale=1.0" />
&lt;/head>
&lt;body>
&lt;div class="navbar navbar-fixed-top">
	&lt;div class="navbar-inner">
		&lt;div class="container">
			&lt;a class="btn btn-navbar" data-toggle="collapse"
				data-target=".nav-collapse">
				&lt;span class="icon-bar">&lt;/span>
				&lt;span class="icon-bar">&lt;/span>
				&lt;span class="icon-bar">&lt;/span>
			&lt;/a>
			&lt;a class="brand" href="<value-of select="$offset"/>index.html"><value-of select="$ucs-name" />&lt;/a>
			&lt;div class="nav-collapse collapse">
				&lt;ul class="nav">
					&lt;li<if test="$selected='home'"> class="active"</if>>&lt;a href="<value-of select="$offset"/>index.html">&lt;i class="icon-home">&lt;/i> Home&lt;/a>&lt;/li>
					&lt;li<if test="$section"> class="active"</if>>&lt;a href="index.html">&lt;i class="icon-chevron-left">&lt;/i> Section&lt;/a>&lt;/li>
					&lt;li<if test="$selected='entry'"> class="active"</if>>&lt;a href="<value-of select="$offset"/>summary/entry-point-list.html">Entry point list &lt;i class="icon-chevron-right">&lt;/i>&lt;/a>&lt;/li>
					&lt;li class="dropdown">
						&lt;a href="#" class="dropdown-toggle" data-toggle="dropdown">Sections &lt;b class="caret">&lt;/b> &lt;/a>
						&lt;ul class="dropdown-menu">
							&lt;li<if test="$selected='summary'"> class="active"</if>>&lt;a href="<value-of select="$offset"/>summary/index.html">&lt;i class="icon-sitemap">&lt;/i> Overview pages&lt;/a>&lt;/li>
							&lt;li<if test="$selected='actor'"> class="active"</if>>&lt;a href="<value-of select="$offset"/>actor/index.html">&lt;i class="icon-user">&lt;/i> Actors&lt;/a>&lt;/li>
							&lt;li<if test="$selected='uc'"> class="active"</if>>&lt;a href="<value-of select="$offset"/>uc/index.html">&lt;i class="icon-file">&lt;/i> Use cases&lt;/a>&lt;/li>
							&lt;li<if test="$selected='data'"> class="active"</if>>&lt;a href="<value-of select="$offset"/>data/index.html">&lt;i class="icon-table">&lt;/i> Data structures&lt;/a>&lt;/li>
							&lt;li<if test="$selected='req'"> class="active"</if>>&lt;a href="<value-of select="$offset"/>req/index.html">&lt;i class="icon-list">&lt;/i> Requirements&lt;/a>&lt;/li>
							&lt;li<if test="$selected='attachment'"> class="active"</if>>&lt;a href="<value-of select="$offset"/>attachment/index.html">&lt;i class="icon-picture">&lt;/i> Attachments&lt;/a>&lt;/li>
						&lt;/ul>
					&lt;/li>
					&lt;li>&lt;a href="<value-of select="$offset"/>single/index.html">&lt;i class="icon-print">&lt;/i> Single page&lt;/a>&lt;/li>
				&lt;/ul>
			&lt;/div>
		&lt;/div>
	&lt;/div>
&lt;/div>
&lt;div class="container"><text />
		</variable>
		<value-of select="$result" />
	</function>

	<function name="uct:page-end" as="xs:string">
		<param name="offset" as="xs:string" />
		<variable name="result">
&lt;hr/><text />
	<value-of select="uct:uctool-link()" />
&lt;/div>
&lt;script src="<value-of select="$offset"/>resources/js/scripts.js" type="text/javascript">&lt;/script>
&lt;/body>
&lt;/html>
<text />
		</variable>
		<value-of select="$result" />
	</function>

	<function name="uct:uctool-link" as="xs:string">
		<variable name="result">
&lt;small>Created in &lt;a <text />
	<text />href="http://uctool.sf.net">uctool.sf.net&lt;/a>.&lt;/small><text />
		</variable>
		<value-of select="$result" />
	</function>

	<function name="uct:cell" as="xs:string">
		<param name="value" as="xs:string*" />
		<choose>
			<when test="$value">
				<value-of select="$value" />
			</when>
			<otherwise>&amp;nbsp;</otherwise>
		</choose>
	</function>

	<function name="uct:indent" as="xs:string">
		<value-of select="'&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;'" />
	</function>

	<function name="uct:step-ref" as="xs:string*">
		<param name="this" as="node()" />
		<param name="handle" as="xs:string*" />
		<choose>
			<when test="$this/ancestor::uct:use-case/uct:success/*[@handle=$handle]">
				<value-of select="count($this/ancestor::uct:use-case/
					uct:success/*[@handle=$handle]/preceding-sibling::*)+1" />
			</when>
		</choose>
	</function>

	<function name="uct:actor-ref" as="xs:string">
		<param name="code" as="xs:string" />
		<param name="merged-file" as="node()" />
		<param name="link-type" as="xs:string*" />
		<variable name="name" select="uct:actor-name-ref($code,$merged-file)" />
		<value-of select="uct:ref-base(
			'actor',$code,$name,$name,$link-type,'multi')" />
	</function>

	<function name="uct:actor-name-ref" as="xs:string">
		<param name="code" as="xs:string" />
		<param name="merged-file" as="node()" />
		<call-template name="verify-count-1-template">
			<with-param name="name" select="'actor'" />
			<with-param name="code" select="$code" />
			<with-param name="items" select="$merged-file//uct:actor[@code=$code]" />
		</call-template>
		<value-of select="$merged-file//uct:actor[@code=$code]/@name" />
	</function>

	<function name="uct:attachment-ref" as="xs:string">
		<param name="code" as="xs:string" />
		<param name="text" as="xs:string" />
		<param name="merged-file" as="node()" />
		<param name="link-type" as="xs:string*" />
		<call-template name="verify-count-1-template">
			<with-param name="name" select="'attachment'" />
			<with-param name="code" select="$code" />
			<with-param name="items" select="$merged-file//uct:attachment[@code=$code]" />
		</call-template>
		<variable name="attachment" select="$merged-file//uct:attachment[@code=$code]" />
		<variable name="directory" select="$attachment/ancestor::uct:attachment-group/@directory" />
		<variable name="ref" select="concat($directory,'/',$attachment/@file-name)" />
		<variable name="name" select="concat($attachment/@name,' - ',$ref)" />
		<value-of select="uct:ref-base('attachment',$ref,$name,$text,'file',$link-type)" />
	</function>

	<function name="uct:uc-ref-base" as="xs:string">
		<param name="code" as="xs:string" />
		<param name="goal" as="xs:string" />
		<param name="text" as="xs:string" />
		<param name="link-type" as="xs:string*" />
		<param name="label-type" as="xs:string*" />
		<variable name="name" select="concat($code,' - ',$goal)" />
		<value-of select="uct:ref-base('uc',$code,$name,$text,$link-type,$label-type)" />
	</function>

	<function name="uct:uc-ref" as="xs:string">
		<param name="code" as="xs:string" />
		<param name="text" as="xs:string" />
		<param name="merged-file" as="node()" />
		<param name="link-type" as="xs:string*" />
		<param name="label-type" as="xs:string*" />
		<call-template name="verify-count-1-template">
			<with-param name="name" select="'use case'" />
			<with-param name="code" select="$code" />
			<with-param name="items" select="$merged-file//uct:use-case[@code=$code]" />
		</call-template>
		<variable name="goal" select="$merged-file//uct:use-case[@code=$code]/@goal" />
		<value-of select="uct:uc-ref-base($code,$goal,$text,$link-type,$label-type)" />
	</function>

	<function name="uct:goal-ref" as="xs:string">
		<param name="use-case" as="node()" />
		<param name="uc-ref-type" as="xs:string*" />
		<variable name="code" select="$use-case/@code" />
		<variable name="goal" select="$use-case/@goal" />
		<choose>
		<when test="$code">
			<value-of select="uct:uc-ref-base($code,$goal,'',$uc-ref-type,'multi')"/>
		</when>
		<otherwise>
			<value-of select="$goal" />
		</otherwise>
		</choose>
	</function>

	<function name="uct:visibility" as="xs:string*">
		<param name="code" as="xs:string*" />
		<choose>
			<when test="$code='black'">Black-box</when>
			<when test="$code='white'">White-box</when>
		</choose>
	</function>

	<function name="uct:level" as="xs:string*">
		<param name="code" as="xs:string*" />
		<choose>
			<when test="$code='sea'">User goal</when>
			<when test="$code='kite'">Summary</when>
			<when test="$code='cloud'">High summary</when>
			<when test="$code='fish'">Subfunction</when>
			<when test="$code='clam'">Subfunction</when>
		</choose>
	</function>

	<function name="uct:uc-type" as="xs:string*">
		<param name="type" as="xs:string*" />
		<choose>
			<when test="$type='system'">System</when>
			<when test="$type='organization'">Organization</when>
		</choose>
	</function>

	<function name="uct:uc-references" as="xs:string">
		<param name="merged" as="node()*" />
		<param name="uc-code" as="xs:string*" />
		<param name="link-type" as="xs:string*" />
		<variable name="result">
			<if test="$merged//uct:uc-group//uct:uc-ref[@code=$uc-code]">
				<text>
&lt;tr>&lt;td>&lt;strong>References:&lt;/strong></text>
				<value-of select="uct:list-uc-references(distinct-values(
					$merged//uct:uc-group//uct:uc-ref[@code=$uc-code]/
					ancestor::uct:use-case/@code),$merged,$link-type)" />
				<text>
&lt;/td>&lt;/tr></text>
			</if>
		</variable>
		<value-of select="$result"/>
	</function>

	<function name="uct:data-references-uc" as="xs:string">
		<param name="merged" as="node()*" />
		<param name="data-code" as="xs:string*" />
		<param name="link-type" as="xs:string*" />
		<variable name="result">
			<if test="$merged//uct:uc-group//uct:data-ref[@code=$data-code]">
				<text>
&lt;div>&lt;strong>References in use cases:&lt;/strong></text>
				<value-of select="uct:list-uc-references(distinct-values(
					$merged//uct:uc-group//uct:data-ref[@code=$data-code]/
					ancestor::uct:use-case/@code),$merged,$link-type)" />
				<text>
&lt;/div></text>
			</if>
		</variable>
		<value-of select="$result"/>
	</function>

	<function name="uct:list-uc-references" as="xs:string">
		<param name="codes" as="xs:string*" />
		<param name="merged" as="node()*" />
		<param name="link-type" as="xs:string*" />
		<variable name="result">
			<for-each select="$codes">
				<variable name="refed-code" select="." />
				<variable name="refed-uc" select="$merged//uct:use-case[@code=$refed-code]"/>
				<text>
</text>
				<value-of select="uct:uc-ref($refed-code,'',$merged,$link-type,'multi')"/>
				<if test="not(position()=last())">
					<text>,</text>
				</if>
			</for-each>
		</variable>
		<value-of select="$result"/>
	</function>

	<function name="uct:list-actor-references" as="xs:string">
		<param name="codes" as="xs:string*" />
		<param name="merged" as="node()*" />
		<param name="link-type" as="xs:string*" />
		<variable name="result">
			<for-each select="$codes">
				<variable name="refed-code" select="." />
				<text>
</text>
				<value-of select="uct:actor-ref($refed-code,$merged,$link-type)"/>
				<if test="not(position()=last())">
					<text>,</text>
				</if>
			</for-each>
		</variable>
		<value-of select="$result"/>
	</function>

	<function name="uct:list-data-references" as="xs:string">
		<param name="codes" as="xs:string*" />
		<param name="merged" as="node()*" />
		<param name="link-type" as="xs:string*" />
		<variable name="result">
			<for-each select="$codes">
				<variable name="refed-code" select="." />
				<text>
</text>
				<value-of select="uct:data-ref($refed-code,'',$merged,$link-type)"/>
				<if test="not(position()=last())">
					<text>,</text>
				</if>
			</for-each>
		</variable>
		<value-of select="$result"/>
	</function>

	<function name="uct:list-req-references" as="xs:string">
		<param name="codes" as="xs:string*" />
		<param name="merged" as="node()*" />
		<param name="link-type" as="xs:string*" />
		<variable name="result">
			<for-each select="$codes">
				<variable name="refed-code" select="." />
				<text>
</text>
				<value-of select="uct:req-ref($refed-code,'',$merged,$link-type)"/>
				<if test="not(position()=last())">
					<text>,</text>
				</if>
			</for-each>
		</variable>
		<value-of select="$result"/>
	</function>

	<function name="uct:data-references-data" as="xs:string">
		<param name="merged" as="node()*" />
		<param name="data-code" as="xs:string*" />
		<param name="link-type" as="xs:string*" />
		<variable name="ref-codes" 
			select="uct:data-references-data-codes($data-code,$merged)" />
		<variable name="result">
			<if test="not(empty($ref-codes))">
				<text>
&lt;div>&lt;strong>References in data structures:&lt;/strong></text>
				<value-of select="uct:list-data-references($ref-codes,$merged,$link-type)" />
				<text>
&lt;/div></text>
			</if>
		</variable>
		<value-of select="$result"/>
	</function>

	<function name="uct:data-references-data-codes" as="xs:string*">
		<param name="data-code" as="xs:string*" />
		<param name="merged" as="node()*" />
		<variable name="atts-with-type" select="$merged//uct:data-structure
			[uct:attribute/@type=$data-code]/@code" />
		<variable name="data-refs" select="$merged//uct:data-structure
			[.//uct:data-ref/@code=$data-code]/@code" />
		<variable name="expanded-att-types" 
			select="uct:structure-codes-with-expanded-att-type($data-code,$merged)" />
		<variable name="direct-att-refs" select="$merged//uct:data-structure/
			uct:attribute-ref[substring-before(@type,'.')=$data-code]
			/ancestor::uct:data-structure/@code" />
		<variable name="att-refs-referring-to-att-with-type" 
			select="$merged//uct:data-structure/
				uct:attribute-ref[uct:data-att-ref(@type,$merged)/@type=$data-code]
				/ancestor::uct:data-structure/@code" />
		<variable name="expanded-att-types-referring-to-att-with-type" 
			select="for $code in($att-refs-referring-to-att-with-type) return
				uct:structure-codes-with-expanded-att-type($code,$merged)" />
		<copy-of select="distinct-values((
			$atts-with-type,$data-refs,$expanded-att-types,$direct-att-refs,
			$att-refs-referring-to-att-with-type,
			$expanded-att-types-referring-to-att-with-type))" />
	</function>

	<function name="uct:structure-codes-with-expanded-att-type" as="xs:string*">
		<param name="att-type" as="xs:string" />
		<param name="merged" as="node()*" />
		<variable name="structures-with-att-type" 
			select="$merged//uct:data-structure[uct:attribute/@type=$att-type]/@code" />
		<variable name="recursives" select="for $code in($structures-with-att-type) 
			return uct:structure-codes-with-expanded-att-type($code,$merged)" />
		<copy-of select="distinct-values(($structures-with-att-type,$recursives))" />
	</function>

	<function name="uct:status" as="xs:string*">
		<param name="status" as="xs:string*" />
		<choose>
			<when test="$status='display-only'">D/O</when>
			<when test="$status='optional'">O</when>
			<when test="$status='mandatory'">M</when>
			<when test="$status='unique'">U</when>
			<when test="$status='natural-key'">NK</when>
			<when test="$status='primary-key'">PK</when>
		</choose>
	</function>

	<function name="uct:status-hint" as="xs:string*">
		<param name="status" as="xs:string*" />
		<choose>
			<when test="$status='display-only'"> title="Display only"</when>
			<when test="$status='optional'"> title="Optional"</when>
			<when test="$status='mandatory'"> title="Mandatory"</when>
			<when test="$status='unique'"> title="Unique"</when>
			<when test="$status='natural-key'"> title="Natural key"</when>
			<when test="$status='primary-key'"> title="Primary key"</when>
		</choose>
	</function>

	<function name="uct:data-type" as="xs:string*">
		<param name="type" as="xs:string*" />
		<param name="length" as="xs:string*" />
		<param name="collection" as="xs:string*" />
		<param name="merged-file" as="node()" />
		<param name="link-type" as="xs:string*" />
		<variable name="result">
			<if test="$collection='true'">Collection [</if>
			<choose>
			<when test="$type='integer'">Integer</when>
			<when test="$type='float'">Float</when>
			<when test="$type='decimal'">Decimal</when>
			<when test="$type='boolean'">Boolean</when>
			<when test="$type='date'">Date</when>
			<when test="$type='time'">Time</when>
			<when test="$type='date-time'">Date-time</when>
			<when test="$type='timestamp'">Timestamp</when>
			<when test="$type='string'">String</when>
			<when test="$type='binary'">Binary</when>
			<when test="not(empty($type))">
				<value-of select="uct:data-ref($type,'',$merged-file,$link-type)" />
			</when>
			</choose>
			<if test="$collection='true'">]</if>
			<if test="not(empty($length)) or $type='string' or $type='binary'">
				<if test="not(empty($type))"><text> </text></if>
				<value-of select="concat('[',$length,']')"/>
			</if>
		</variable>
		<value-of select="$result" />
	</function>

	<function name="uct:inherited-actor-codes" as="xs:string*">
		<param name="actor-code" as="xs:string" />
		<param name="merged-file" as="node()" />
		<variable name="extended-actor-codes" 
			select="$merged-file//uct:actor[$actor-code=@code]/uct:extends-actor/@code" />
		<variable name="inherited-actor-codes" 
			select="uct:inherited-actor-codes-internal($extended-actor-codes,$merged-file)" />
		<copy-of select="$inherited-actor-codes" />
	</function>

	<function name="uct:inherited-actor-codes-internal" as="xs:string*">
		<param name="actor-codes" as="xs:string*" />
		<param name="merged-file" as="node()" />
		<variable name="extended-actor-codes" 
			select="$merged-file//uct:actor[not(empty(index-of($actor-codes,@code)))]
					/uct:extends-actor/@code" />
		<copy-of select="($actor-codes,$extended-actor-codes)" />
	</function>

	<function name="uct:data-ref" as="xs:string">
		<param name="code" as="xs:string" />
		<param name="text" as="xs:string" />
		<param name="merged-file" as="node()" />
		<param name="link-type" as="xs:string*" />
		<call-template name="verify-count-1-template">
			<with-param name="name" select="'data structure'" />
			<with-param name="code" select="$code" />
			<with-param name="items" select="$merged-file//uct:data-structure[@code=$code]" />
		</call-template>
		<variable name="name" select="$merged-file//uct:data-structure[@code=$code]/@name" />
		<value-of select="uct:ref-base('data',$code,$name,$text,$link-type,$link-type)" />
	</function>

	<function name="uct:ref-base" as="xs:string">
		<param name="type" as="xs:string" />
		<param name="code" as="xs:string" />
		<param name="name" as="xs:string" />
		<param name="text" as="xs:string" />
		<param name="link-type" as="xs:string*" />
		<param name="label-type" as="xs:string*" />
		<variable name="result">
			<text>&lt;a href="</text>
			<choose>
				<when test="$link-type='single'">
					<text />#<value-of select="$type" />_<value-of select="$code" />
				</when>
				<when test="$link-type='file'">
					<text />../<value-of select="$type" />/<text />
					<value-of select="$code" />
				</when>
				<otherwise>
					<text />../<value-of select="$type" />/<text />
					<value-of select="$code" />.html<text />
				</otherwise>
			</choose>
			<text>" title="</text>
			<value-of select="$name" />
			<text>"></text>
			<choose>
			<when test="$text=''"><value-of select="$name" /></when>
			<otherwise><value-of select="$text" /></otherwise>
			</choose>
			<if test="$label-type='single' and $text!='' and $text!=$name">
				<text /> (<value-of select="$name" />)<text />
			</if>
			<text>&lt;/a></text>
		</variable>
		<value-of select="$result" />
	</function>

	<template name="verify-count-1-template">
		<param name="name" />
		<param name="code" />
		<param name="items" />
		<if test="count($items)!=1">
			<message>
				<text />Error processing <value-of select="$name" />
				<text /> with code <value-of select="$code" />
			</message>
			<message terminate="yes">
				<text />Exactly 1 <value-of select="$name" />
				<text /> with the code expected, but found <value-of select="count($items)" />
			</message>
		</if>
	</template>

	<function name="uct:img" as="xs:string">
		<param name="name" as="xs:string" />
		<param name="alt" as="xs:string" />
		<variable name="result">
			<text/>&lt;img src="../resources/<text/>
			<value-of select="$name"/>.gif" alt="<text/>
			<value-of select="$alt"/>" title="<text/>
			<value-of select="$alt"/>"/><text/>
		</variable>
		<value-of select="$result" />
	</function>

    <function name="uct:req-type" as="xs:string*">
		<param name="code" as="xs:string*" />
		<choose>
			<when test="$code='functional'">Functional</when>
			<when test="$code='nonfunctional'">Nonfunctional</when>
			<when test="$code='constraint'">Constraint</when>
		</choose>
	</function>

    <function name="uct:req-status" as="xs:string*">
		<param name="code" as="xs:string*" />
		<choose>
			<when test="$code='pending'">Pending</when>
			<when test="$code='accepted'">Accepted</when>
			<when test="$code='canceled'">Canceled</when>
			<when test="$code='postponed'">Postponed</when>			
		</choose>
	</function>

    <function name="uct:req-priority" as="xs:string*">
		<param name="code" as="xs:string*" />
		<choose>
			<when test="$code='high'">High</when>
			<when test="$code='normal'">Normal</when>
			<when test="$code='low'">Low</when>
		</choose>
	</function>

	<function name="uct:req-level" as="xs:string*">
		<param name="code" as="xs:string*" />
		<choose>
			<when test="$code='sea'">Middle</when>
			<when test="$code='kite'">Summary</when>
			<when test="$code='cloud'">Solution target</when>
			<when test="$code='fish'">Detailed</when>
			<when test="$code='clam'">Very detailed</when>
		</choose>
	</function>

	<function name="uct:req-references-uc" as="xs:string">
		<param name="merged" as="node()*" />
		<param name="req-code" as="xs:string*" />
		<param name="link-type" as="xs:string*" />
		<variable name="result">
			<if test="$merged//uct:uc-group//uct:req-ref[@code=$req-code]">
				<text>
&lt;tr>&lt;td>&lt;strong>References in use cases:&lt;/strong></text>
				<value-of select="uct:list-uc-references(distinct-values(
					$merged//uct:uc-group//uct:req-ref[@code=$req-code]/
					ancestor::uct:use-case/@code),$merged,$link-type)" />
				<text>
&lt;/td>&lt;/tr></text>
			</if>
		</variable>
		<value-of select="$result"/>
	</function>

	<function name="uct:req-references-actor" as="xs:string">
		<param name="merged" as="node()*" />
		<param name="req-code" as="xs:string*" />
		<param name="link-type" as="xs:string*" />
		<variable name="result">
			<if test="$merged//uct:actor//uct:req-ref[@code=$req-code]">
				<text>
&lt;tr>&lt;td>&lt;strong>References in actors:&lt;/strong></text>
				<value-of select="uct:list-actor-references(distinct-values(
					$merged//uct:actor//uct:req-ref[@code=$req-code]/
					ancestor::uct:actor/@code),$merged,$link-type)" />
				<text>
&lt;/td>&lt;/tr></text>
			</if>
		</variable>
		<value-of select="$result"/>
	</function>

	<function name="uct:req-references-data" as="xs:string">
		<param name="merged" as="node()*" />
		<param name="req-code" as="xs:string*" />
		<param name="link-type" as="xs:string*" />
		<variable name="result">
			<if test="$merged//uct:data-structure//uct:req-ref[@code=$req-code]">
				<text>
&lt;tr>&lt;td>&lt;strong>References in data structures:&lt;/strong></text>
				<value-of select="uct:list-data-references(distinct-values(
					$merged//uct:data-structure//uct:req-ref[@code=$req-code]/
					ancestor::uct:data-structure/@code),$merged,$link-type)" />
				<text>
&lt;/td>&lt;/tr></text>
			</if>
		</variable>
		<value-of select="$result"/>
	</function>

	<function name="uct:req-references-req" as="xs:string">
		<param name="merged" as="node()*" />
		<param name="req-code" as="xs:string*" />
		<param name="link-type" as="xs:string*" />
		<variable name="result">
			<if test="$merged//uct:requirement//uct:req-ref[@code=$req-code]">
				<text>
&lt;tr>&lt;td>&lt;strong>References in requirements:&lt;/strong></text>
				<value-of select="uct:list-req-references(distinct-values(
					$merged//uct:requirement//uct:req-ref[@code=$req-code]/
					ancestor::uct:requirement/@code),$merged,$link-type)" />
				<text>
&lt;/td>&lt;/tr></text>
			</if>
		</variable>
		<value-of select="$result"/>
	</function>

	<function name="uct:req-ref" as="xs:string">
		<param name="code" as="xs:string" />
		<param name="text" as="xs:string" />
		<param name="merged-file" as="node()" />
		<param name="link-type" as="xs:string*" />
		<variable name="req" select="$merged-file//uct:requirement[@code=$code]" />
		<call-template name="verify-count-1-template">
			<with-param name="name" select="'requirement'" />
			<with-param name="code" select="$code" />
			<with-param name="items" select="$req" />
		</call-template>
		<variable name="name" select="concat($req/@code,' - ',$req/@name)" />
		<value-of select="uct:ref-base('req',$code,$name,$text,$link-type,$link-type)" />
	</function>

	<function name="uct:value-with-default" as="xs:string*">
		<param name="value" as="xs:string*" />
		<param name="default" as="xs:string*" />
		<choose>
			<when test="not(empty($value))"><copy-of select="$value" /></when>
			<otherwise><copy-of select="$default" /></otherwise>
		</choose>
	</function>

	<function name="uct:data-att-ref-structure" as="node()">
		<param name="type" as="xs:string" />
		<param name="merged-file" as="node()" />
		<variable name="ref-structure-code" select="substring-before($type,'.')" />
		<copy-of select="$merged-file//uct:data-structure[@code=$ref-structure-code]" />
	</function>

	<function name="uct:data-att-ref" as="node()">
		<param name="type" as="xs:string" />
		<param name="merged-file" as="node()" />
		<variable name="ref-att-code" select="substring-after($type,'.')" />
		<variable name="structure" select="uct:data-att-ref-structure($type,$merged-file)" />
		<copy-of select="$structure/uct:attribute[@code=$ref-att-code]" />
	</function>

	<function name="uct:data-att-ref-type" as="xs:string">
		<param name="structure" as="node()" />
		<param name="att-type" as="xs:string" />
		<param name="merged-file" as="node()" />
		<param name="link-type" as="xs:string*" />
		<variable name="ref-att-code" select="substring-after($att-type,'.')" />
		<value-of select="concat(
			uct:data-ref($structure/@code,$structure/@code,$merged-file,$link-type),
			'.',$ref-att-code)"/>
	</function>

</stylesheet>
