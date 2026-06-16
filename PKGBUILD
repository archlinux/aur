pkgname=cefdetector-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="Check how many CEFs are on your Linux."
arch=('x86_64')
url="https://github.com/Tobiichi-Origuchi/CefDetectorLinux"
license=('MIT')
provides=('cefdetector')
conflicts=('cefdetector')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Tobiichi-Origuchi/CefDetectorLinux/releases/download/v0.2.4/cefdetector_0.2.4_x86_64.tar.gz")
sha256sums=('3752a594add313847ee270d09554e3da18add9f786a4e482a98181a5ae10b127')
noextract=("${pkgname}-${pkgver}.tar.gz")

package() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "$pkgdir/"
}
