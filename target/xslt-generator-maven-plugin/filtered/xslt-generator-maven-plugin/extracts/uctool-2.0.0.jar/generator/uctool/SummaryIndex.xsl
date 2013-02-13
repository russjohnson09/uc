<?xml version="1.0" encoding="UTF-8"?>
<stylesheet xmlns="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:uct="http://uctool.sf.net/"
	version="2.0">
<import href="functions/UctTemplates.xsl" />
<output method="text" />

<param name="ucs-name" />
<variable name="merged-file" select="/" />
<variable name="link-type" select="'multi'" />

<template match="/">
<value-of select="uct:page-start('Overview pages list',$ucs-name,'../','summary',true())" />
<call-template name="summary-index-template" />
<value-of select="uct:page-end('../')" />
</template>

<template name="summary-index-template">

&lt;h2>Overview pages list&lt;/h2><text />
&lt;ul class="nav nav-tabs nav-stacked">
&lt;li>&lt;a href="entry-point-list.html">Entry point list&lt;/a>&lt;/li>
&lt;li>&lt;a href="actor-goal-list.html">Actor-goal list&lt;/a>&lt;/li>
&lt;li>&lt;a href="unused-data-list.html">Unused data structure list&lt;/a>&lt;/li>
&lt;/ul>
</template>

</stylesheet>
