<?xml version = "1.0" encoding = "UTF-8"?>

<xsl:stylesheet version = "1.0"
xmlns:xsl = "http://www.w3.org/1999/XSL/Transform"
xmlns     = "http://maven.apache.org/POM/4.0.0"
xmlns:m   = "http://maven.apache.org/POM/4.0.0"
exclude-result-prefixes="m">

	<!--
	Sets a Maven pom.xml's project version to a specific value if it is
	"Snapshot"

	Apply to a pom.xml file like this, but replace every = with -
	xsltproc ==nonet ==stringparam project-version "the.version" this.xslt pom.xml > new-pom.xml

	I would like to thank these people for making this XSLT possible:

	Romain Pelisse for this article at developers.redhat.com:
	https://developers.redhat.com/blog/2013/12/05/xml-editing-bash-script
	(xsltproc usage, passing in parameters)

	User "michael.hor257k" for this answer at stackoverflow.com:
	https://stackoverflow.com/questions/61872525/updating-pom-xml-elements-using-xslt/61874979#61874979
	(XML namespaces magic)

	Apologies go to my brain for subjecting it to the topic of XML
	processing
	-->

	<!-- Retain the "encoding" attribute in the emitted XML -->
	<xsl:output encoding="UTF-8" />

	<!-- Parameter value is passed in with the xsltproc invocation -->
	<xsl:param name="project-version"/>

	<!-- Copy all nodes and their attributes (identity transform) -->
	<xsl:template match="@*|node()" name="identity">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>

	<!--
	Replace upstream /project/version node value "Snapshot" with the
	actual version number
	-->
	<xsl:template match="m:version/text()[.='Snapshot']" name="set-project-version">
		<xsl:value-of select="$project-version" />
	</xsl:template>

</xsl:stylesheet>
