# Maintainer: brawler2011 <slavabirin1@yandex.ru>
pkgname=plymouth-theme-arch-logo-symbol-blue
pkgver=1.0.0
pkgrel=1
pkgdesc="A Plymouth boot splash theme for Arch Linux featuring a minimalist official Arch Linux logo and progress bar in classic blue"
arch=('any')
url="https://github.com/brawler2011/plymouth-theme-arch-logo-symbol-blue"
license=('MIT')
depends=('plymouth')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('bc79acfcc6a8ca0bcc41b410bcf2cd4b010f4e03f107736ace2ad3d4a1d68392')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
