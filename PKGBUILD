pkgname=cefdetector-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Check how many CEFs are on your Linux."
arch=('x86_64')
url="https://github.com/Tobiichi-Origuchi/CefDetector"
license=('MIT')
depends=('fontconfig' 'libglvnd' 'xdg-utils')
provides=("cefdetector=${pkgver}")
conflicts=('cefdetector')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Tobiichi-Origuchi/CefDetector/releases/download/v0.4.2/cefdetector-0.4.2-linux-x86_64-ignore.tar.gz")
sha256sums=('5e75f9bf356775ea34bdcac25b9bb8dbd106a995e61e37d81ec6eef2cd81db87')
noextract=("${pkgname}-${pkgver}.tar.gz")

package() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/"
}
