pkgname=cefdetector-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Check how many CEFs are on your Linux."
arch=('x86_64')
url="https://github.com/Tobiichi-Origuchi/CefDetectorLinux"
license=('MIT')
provides=('cefdetector')
conflicts=('cefdetector')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Tobiichi-Origuchi/CefDetectorLinux/releases/download/v0.2.2/cefdetector_0.2.2_x86_64.tar.gz")
sha256sums=('5fc8ccbf00fe93d8cab1432402391c1ab64dfdef9cca2d1d1ac8590c0b7a5637')
noextract=("${pkgname}-${pkgver}.tar.gz")

package() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "$pkgdir/"
}
