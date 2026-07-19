# Maintainer: RefractMC <refractmc at users dot noreply dot github dot com>

pkgname=refract-launcher-bin
pkgver=1.3.1
pkgrel=1
pkgdesc='Fast, open-source Minecraft launcher built with Tauri and React'
arch=('x86_64')
url='https://github.com/RefractMC/Refract_MC'
license=('GPL-3.0-only')
depends=('glibc' 'gtk3' 'webkit2gtk-4.1')
provides=('refract-launcher')
conflicts=('refract-launcher')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}.rpm::https://github.com/RefractMC/Refract_MC/releases/download/v${pkgver}/Refract-Linux-x86_64.rpm")
sha256sums_x86_64=('2219f6c812f3e7f3b0ee211f2413db5deab830c06540e339db085850d87b670d')

package() {
  cp -a "${srcdir}/usr" "${pkgdir}/"
}
