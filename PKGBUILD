pkgname=1c_enterprise_meta
pkgver=8.3
pkgrel=3
pkgdesc="1C 8.3 metapackage for Linux"
license=('GPL')
arch=('any')
depends=('freetype2' 'gtk3' 'libgsf' 'glib2' 'unixodbc' 'krb5' 'enchant' 'harfbuzz-icu' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'libsecret'
	'libsoup' 'sqlite' 'libxrender' 'libxfixes' 'libxslt' 'geoclue' 'appmenu-gtk-module' 'gcc-libs' 'glib-networking' 'nuspell' 'hspell' 'libvoikko' 'aspell' 'aspell-en' 'aspell-ru')
optdepends=('ttf-ms-fonts: Core TTF Fonts from Microsoft'
	    'aksusbd-bin: Sentinel AKSUSB daemon ')

package() {
	install -dm755 ${pkgdir}/usr/lib
	ln -s /usr/lib/libenchant-2.so ${pkgdir}/usr/lib/libenchant.so.1
}
