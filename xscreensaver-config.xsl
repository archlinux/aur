<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
<xsl:output method="text" indent="no" />
<xsl:strip-space elements="*"/>

<xsl:template match="screensaver">
[Desktop Entry]
Encoding=UTF-8
Name=<xsl:value-of select="@_label" />
Comment=<xsl:value-of select="normalize-space(_description)" />
<xsl:if test="count(command/@name) != 0">
<xsl:variable name="executable" select="concat('/usr/lib/xscreensaver/', normalize-space(command/@name))" />
TryExec=<xsl:value-of select="$executable" />
Exec=<xsl:value-of select="concat($executable, ' ', normalize-space(command/@arg))" />
</xsl:if>
<xsl:if test="count(command/@name) = 0">
<xsl:variable name="executable" select="concat('/usr/lib/xscreensaver/', normalize-space(@name))" />
TryExec=<xsl:value-of select="$executable" />
Exec=<xsl:value-of select="concat($executable, ' ', normalize-space(command/@arg))" />
</xsl:if>
StartupNotify=false
Terminal=false
Type=Application
Categories=Screensaver;
OnlyShowIn=MATE;GNOME;XFCE;
Hidden=true
</xsl:template>

</xsl:stylesheet>
