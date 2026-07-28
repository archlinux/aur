pkgname=cefdetector-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Check how many CEFs are on your Linux."
arch=('x86_64')
url="https://github.com/Tobiichi-Origuchi/CefDetectorLinux"
license=('MIT')
depends=('fontconfig' 'libglvnd' 'xdg-utils')
provides=("cefdetector=${pkgver}")
conflicts=('cefdetector')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Tobiichi-Origuchi/CefDetectorLinux/releases/download/v0.4.0/cefdetector_0.4.0_x86_64.tar.gz")
sha256sums=('f059bc70965850d65029eac3333fc74351361daa9d918500f1bc6e9d7fc7ca56')
noextract=("${pkgname}-${pkgver}.tar.gz")

package() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/"
}
