# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vvctre-bin
pkgver=31.3.1
pkgrel=1
pkgdesc='A Nintendo 3DS emulator based on Citra'
arch=('x86_64')
url='https://gbatemp.net/threads/vvctre-nintendo-3ds-emulator-based-on-citra.560052'
license=('GPL2')
provides=('vvctre')
depends=('sdl2' 'libpng')
source=("${pkgname}-${pkgver}.7z::https://github.com/vvanelslande/vvctre/releases/download/${pkgver}/vvctre-${pkgver}-Linux.7z")
sha256sums=('776f2e9a0f5a6227c068be770efafc4fb4a66a493d680872fb7552da6bb8aec8')

package() {
  install -Dm755 "${srcdir}/vvctre" -t "${pkgdir}/usr/bin/"
}
# vim:set ts=2 sw=2 et: