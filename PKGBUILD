pkgname=cefdetector-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Check how many CEFs are on your Linux."
arch=('x86_64')
url="https://github.com/Tobiichi-Origuchi/CefDetectorLinux"
license=('MIT')
depends=('fontconfig' 'libglvnd' 'xdg-utils')
provides=('cefdetector')
conflicts=('cefdetector')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Tobiichi-Origuchi/CefDetectorLinux/releases/download/v0.3.0/cefdetector_0.3.0_x86_64.tar.gz")
sha256sums=('9e42948ba9490e98645b2b58ebf79429200c5b8fe3ccf1808a2aca2cab09817e')
noextract=("${pkgname}-${pkgver}.tar.gz")

package() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/"
}
