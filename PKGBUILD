# Maintainer: Michael Wang < aur_username at icloud.com >
pkgname=gtfs-to-html
pkgver=2.6.7
pkgrel=1
pkgdesc="Build human readable transit timetables as HTML or PDF from GTFS."
arch=('any')
url="https://gtfstohtml.com/"
license=('MIT')
groups=()
depends=()
makedepends=('npm')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('ef1902b057d7568a71046387be0b2ff2ebe5b540db57c38f0b906245404030c9')

# build() {}

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
}
