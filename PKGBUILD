# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vvctre-bin
pkgver=39.0.1
pkgrel=1
pkgdesc='A Nintendo 3DS emulator based on Citra'
arch=('x86_64')
url='https://gbatemp.net/threads/vvctre-nintendo-3ds-emulator-based-on-citra.560052'
license=('GPL2')
provides=('vvctre')
depends=('sdl2' 'libpng')
source=("${pkgname}-${pkgver}.7z::https://github.com/vvanelslande/vvctre/releases/download/${pkgver}/vvctre-${pkgver}-Linux.7z")
sha256sums=('e5086c747d735efc0c1ea2166bf5853bb41c9cdb789df0efd1c1bc13166c0dd4')

package() {
  install -Dm755 "${srcdir}/vvctre" -t "${pkgdir}/usr/bin/"
}
# vim:set ts=2 sw=2 et:
