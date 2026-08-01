pkgname=cefdetector-plocate-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Check how many CEFs are on your Linux using the plocate index."
arch=('x86_64')
url="https://github.com/Tobiichi-Origuchi/CefDetector"
license=('MIT')
depends=('fontconfig' 'libglvnd' 'xdg-utils' 'plocate')
provides=("cefdetector=${pkgver}")
conflicts=('cefdetector')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Tobiichi-Origuchi/CefDetector/releases/download/v0.4.2/cefdetector-0.4.2-linux-x86_64-plocate.tar.gz")
sha256sums=('b6c335f181c0e3d07c6daa7d77e71bfa9d7817e8f41d281cc312a66eaa2dc045')
noextract=("${pkgname}-${pkgver}.tar.gz")

package() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/"
}
