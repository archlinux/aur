pkgname=cefdetector-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Check how many CEFs are on your Linux."
arch=('x86_64')
url="https://github.com/Tobiichi-Origuchi/CefDetectorLinux"
license=('MIT')
depends=('fontconfig' 'libglvnd' 'xdg-utils')
provides=("cefdetector=${pkgver}")
conflicts=('cefdetector')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Tobiichi-Origuchi/CefDetectorLinux/releases/download/v0.4.1/cefdetector-0.4.1-linux-x86_64-ignore.tar.gz")
sha256sums=('04f282af75c8861048953a26c1e8be3e2bd8f4005309a107749a7486295bd9e2')
noextract=("${pkgname}-${pkgver}.tar.gz")

package() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/"
}
