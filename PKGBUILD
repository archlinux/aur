pkgname=cefdetector-plocate-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Check how many CEFs are on your Linux using the plocate index."
arch=('x86_64')
url="https://github.com/Tobiichi-Origuchi/CefDetectorLinux"
license=('MIT')
depends=('fontconfig' 'libglvnd' 'xdg-utils' 'plocate')
provides=("cefdetector=${pkgver}")
conflicts=('cefdetector')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Tobiichi-Origuchi/CefDetectorLinux/releases/download/v0.4.1/cefdetector-0.4.1-linux-x86_64-plocate.tar.gz")
sha256sums=('a72f1d0422cd377f650d3efe7e578f99ee41f67fd498cbf29278a0071a0b68f0')
noextract=("${pkgname}-${pkgver}.tar.gz")

package() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/"
}
