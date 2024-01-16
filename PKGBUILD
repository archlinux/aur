# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Alexis Janon <kardyne -at- gmail -dot- com>

pkgname=ttf-tabler-icons
pkgver=2.46.0
pkgrel=1
pkgdesc="A set of over 4800 free high-quality icons"
arch=('any')
url="https://tabler.io/icons"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tabler/tabler-icons/archive/v${pkgver}.tar.gz")
sha256sums=('86ae39ed3fbb2a22bbfa532a3cc4bd90dd29d06e86aafce241286d48ffb50242')

package() {
  cd "tabler-icons-${pkgver}"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" packages/icons-webfont/fonts/tabler-icons.ttf
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
