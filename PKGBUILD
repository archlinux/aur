pkgname=cefdetector-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Check how many CEFs are on your Linux."
arch=('x86_64')
url="https://github.com/Tobiichi-Origuchi/CefDetectorLinux"
license=('MIT')
provides=('cefdetector')
conflicts=('cefdetector')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Tobiichi-Origuchi/CefDetectorLinux/releases/download/v0.2.0/cefdetector_0.2.0_x86_64.tar.gz")
sha256sums=('4e7053380c44ea80ec82201773c559e278c6094e3e083fff3310d95481262fa5')
noextract=("${pkgname}-${pkgver}.tar.gz")

package() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "$pkgdir/"
}
