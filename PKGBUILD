# Maintainer: Clayton Craft <clayton@craftyguy.net>
pkgname=fmo
pkgver=2.0
pkgrel=1
pkgdesc="A tool for locating installed AUR orphans."
arch=('i686' 'x86_64')
url="https://github.com/craftyguy/fmo"
license=('GPL3')
depends=('auracle-git' 'python3')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/craftyguy/fmo/archive/${pkgver}.tar.gz")
sha512sums=('52d3e2587b6f376ffe2986bacb794bea47b8c6771b7d207bf2ad268adbc64c6c77443ad550f7c00be7c4528c991641381f932180e28488ec715fe8b5217c3759')

package() {
	install -m755 -D "${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}



