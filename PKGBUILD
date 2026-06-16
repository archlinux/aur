pkgname=cefdetector-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Check how many CEFs are on your Linux."
arch=('x86_64')
url="https://github.com/Tobiichi-Origuchi/CefDetectorLinux"
license=('MIT')
provides=('cefdetector')
conflicts=('cefdetector')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Tobiichi-Origuchi/CefDetectorLinux/releases/download/v0.2.3/cefdetector_0.2.3_x86_64.tar.gz")
sha256sums=('d34f0d8ed4c47de58eda97c99d1512f3e0c928971f583245bab6bb43a38c3f9c')
noextract=("${pkgname}-${pkgver}.tar.gz")

package() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "$pkgdir/"
}
