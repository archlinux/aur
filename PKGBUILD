# Maintainer: Shivam Mistry <shivam@automaton.uk>
pkgname=osbuddy
pkgver=1.0.1
pkgrel=1
pkgdesc="Launcher for the OldSchool RuneScape toolkit"
arch=('any')
url="https://rsbuddy.com/osbuddy"
license=('custom')
depends=('java-runtime')
optdepends=()
options=()
install='osbuddy.install'
source=(http://cdn.rsbuddy.com/live/f/loader/OSBuddy.jar osbuddy osbuddy.desktop osbuddy.png osbuddy.install LICENSE)
noextract=("${source[@]%%::*}")
md5sums=('da02981df73693e96d17ecc0b977b041'
         'c4cfc33a6e67e67d5a618d309f04f679'
         '96ee5f2ec6e827516b9e557c08729cde'
         '5edc1b9aef7d753402180df474bb391f'
         '72577c1b6eca8aebfeee9ca14db7a8f6'
         'ef50529b59e1b789bae48bea7e0e7bf2')
package() {
	cd "$srcdir"
	install -D -m755 "${srcdir}/osbuddy"            "${pkgdir}/usr/bin/osbuddy"
        install -D -m644 "${srcdir}/OSBuddy.jar"        "${pkgdir}/usr/share/osbuddy/OSBuddy.jar"
        install -D -m644 "${srcdir}/osbuddy.desktop"    "${pkgdir}/usr/share/applications/osbuddy.desktop"
        install -D -m644 "${srcdir}/osbuddy.png"        "${pkgdir}/usr/share/pixmaps/osbuddy.png"
        install -D -m644 "${srcdir}/LICENSE"            "${pkgdir}/usr/share/licenses/osbuddy/LICENSE"   
}
