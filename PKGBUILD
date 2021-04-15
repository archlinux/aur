# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
# Contributor: Luca Cesari <mirshann@freakmind.org>

pkgname=eclipse-anyedittools
pkgver=2.7.2.201911221520
pkgrel=1
pkgdesc="Swiss knife for Eclipse."
arch=('x86_64')
url="https://github.com/iloveeclipse/anyedittools"
license=('EPL')
depends=("eclipse-platform")
source=(https://github.com/iloveeclipse/anyedittools/releases/download/2.7.2/de.loskutov.anyedit.AnyEditTools_${pkgver}.jar)
noextract=(de.loskutov.anyedit.AnyEditTools_$pkgver.jar)
md5sums=('90a640332a7f0b6fec6581932f873671')
package() {
    _plugin=de.loskutov.anyedit.AnyEditTools_${pkgver}.jar
    install -Dm644 "${srcdir}/${_plugin}" "${pkgdir}/usr/share/eclipse/dropins/eclipse/plugins/${_plugin}"
}

