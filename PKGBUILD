pkgname=cefdetector-plocate-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Check how many CEFs are on your Linux using the plocate index."
arch=('x86_64')
url="https://github.com/Tobiichi-Origuchi/CefDetectorLinux"
license=('MIT')
depends=('fontconfig' 'libglvnd' 'xdg-utils' 'plocate')
provides=("cefdetector=${pkgver}")
conflicts=('cefdetector')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Tobiichi-Origuchi/CefDetectorLinux/releases/download/v0.4.0/cefdetector-plocate_0.4.0_x86_64.tar.gz")
sha256sums=('282a00ea6b6a5d48993efc2d1866d055b3237d9d985f68a07f691bb4a2a42ef6')
noextract=("${pkgname}-${pkgver}.tar.gz")

package() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}/"
}
