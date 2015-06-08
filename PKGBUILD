pkgname=eclipse-htmleditor
pkgver=2.1.0
pkgrel=2
arch=('any')
pkgdesc="Eclipse plugin for HTML/JSP/XML Editing"
license=('APACHE')
url="http://amateras.sourceforge.jp"
depends=('eclipse')
source=("http://globalbase.dl.sourceforge.jp/amateras/51002/tk.eclipse.plugin.htmleditor_${pkgver}.jar")
md5sums=('062a351ec9d5f95e6e5e331b244becf3')
noextract=("tk.eclipse.plugin.htmleditor_${pkgver}.jar")

package() {
	mkdir -p "${pkgdir}/usr/share/eclipse/plugins" || return 1
	cp "${srcdir}"/*.jar "${pkgdir}/usr/share/eclipse/plugins/" || return 1
}
