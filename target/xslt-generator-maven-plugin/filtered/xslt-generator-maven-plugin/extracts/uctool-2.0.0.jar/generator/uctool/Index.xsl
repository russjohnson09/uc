<?xml version="1.0" encoding="UTF-8"?>
<stylesheet xmlns="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:uct="http://uctool.sf.net/"
	version="2.0">
<import href="functions/UctTemplates.xsl" />
<output method="text" />

<param name="ucs-name" />
<param name="ucs-version" />
<param name="ucs-description" />

<variable name="merged-file" select="/" />
<variable name="link-type" select="'multi'" />

<template match="/">
<value-of select="uct:page-start('Analytical Documentation',$ucs-name,'','home',false())" />
&lt;h1>Analytical Documentation&lt;/h1>
&lt;p class="lead">Name: <value-of select="$ucs-name" />&lt;br/>
Version: <value-of select="$ucs-version" />&lt;/p>
&lt;p class="lead"><value-of select="$ucs-description" />&lt;/p>
&lt;p>Welcome to the analytical documentation site. Please follow the links below. Start exploring the site by clicking on the following link.&lt;/p>
&lt;div>&lt;a class="btn btn-primary" href="summary/entry-point-list.html">Entry point list
 &amp;nbsp; &lt;i class="icon-chevron-right">&lt;/i>&lt;/a>&lt;/div>
&lt;h3>Sections&lt;/h3>
&lt;ul class="nav nav-tabs nav-stacked">
&lt;li>&lt;a href="summary/index.html">&lt;i class="icon-sitemap">&lt;/i> Overview pages&lt;/a>&lt;/li>
&lt;li>&lt;a href="actor/index.html">&lt;i class="icon-user">&lt;/i> Actors&lt;/a>&lt;/li>
&lt;li>&lt;a href="uc/index.html">&lt;i class="icon-file">&lt;/i> Use cases&lt;/a>&lt;/li>
&lt;li>&lt;a href="data/index.html">&lt;i class="icon-table">&lt;/i> Data structures&lt;/a>&lt;/li><text/>
<if test="//uct:requirement">
&lt;li>&lt;a href="req/index.html">&lt;i class="icon-list">&lt;/i> Requirements&lt;/a>&lt;/li><text/>
</if>
<if test="//uct:attachment-group">
&lt;li>&lt;a href="attachment/index.html">&lt;i class="icon-picture">&lt;/i> Attachments&lt;/a>&lt;/li><text/>
</if>
&lt;/ul>
&lt;div>&lt;a class="btn" href="single/index.html">&lt;i class="icon-print">&lt;/i> Whole documentation on single page (print format)&lt;/a>&lt;/div>
&lt;hr/>
&lt;a href="../index.html">&lt;i class="icon-chevron-left">&lt;/i> Back to project documentation&lt;/a><text/>
<value-of select="uct:page-end('')" />
</template>

</stylesheet>
