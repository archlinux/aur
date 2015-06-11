# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
# Contributor: Luca Cesari <mirshann@freakmind.org>

pkgname=eclipse-anyedittools
pkgver=2.4.11.201409071702
pkgrel=1
pkgdesc="Adds several new tools to the context menu of text-based Eclipse editors, to output consoles, to Eclipse main menu and editor toolbar."
arch=('i686' 'x86_64')
url="http://andrei.gmxhome.de/anyedit/"
license=('GPL')
depends=("eclipse>=3.5")
source=(http://dl.bintray.com/iloveeclipse/plugins/de.loskutov.anyedit.AnyEditTools_${pkgver}.jar)
noextract=(de.loskutov.anyedit.AnyEditTools_$pkgver.jar)
md5sums=('4c108caa5ef4caaaaca08f5ed5ac165f')

package() {
    _plugin=de.loskutov.anyedit.AnyEditTools_${pkgver}.jar
    install -Dm644 "${srcdir}/${_plugin}" "${pkgdir}/usr/share/eclipse/dropins/eclipse/plugins/${_plugin}"
}

