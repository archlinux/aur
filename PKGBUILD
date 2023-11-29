# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Alexis Janon <kardyne -at- gmail -dot- com>

pkgname=ttf-tabler-icons
pkgver=2.42.0
pkgrel=1
pkgdesc="A set of over 4800 free high-quality icons"
arch=('any')
url="https://tabler-icons.io/"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tabler/tabler-icons/archive/v${pkgver}.tar.gz")
sha256sums=('2b59f813e13973c50b89d4388961b5fe275b88581a7782b9a02e2cbbb0893f25')

package() {
  cd "tabler-icons-${pkgver}"
  install -Dm644 "packages/icons-webfont/fonts/tabler-icons.ttf" "${pkgdir}/usr/share/fonts/TTF/tabler-icons.ttf"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
