pkgname=cefdetector-bin
pkgver=0.2.5
pkgrel=1
pkgdesc="Check how many CEFs are on your Linux."
arch=('x86_64')
url="https://github.com/Tobiichi-Origuchi/CefDetectorLinux"
license=('MIT')
provides=('cefdetector')
conflicts=('cefdetector')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Tobiichi-Origuchi/CefDetectorLinux/releases/download/v0.2.5/cefdetector_0.2.5_x86_64.tar.gz")
sha256sums=('f3db2909388881d6a80db2af8b55d363ca4e234bacce59211133cf6b7cc1b884')
noextract=("${pkgname}-${pkgver}.tar.gz")

package() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "$pkgdir/"
}
