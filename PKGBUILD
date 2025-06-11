# Maintainer: oech3

pkgname=intel-ucode-shrink-hook
pkgver=2.3.1
pkgrel=1
pkgdesc='Improve boot performance by shrinking intel-ucode.img'
arch=('any')
url='https://gitlab.com/iucode-tool/iucode-tool/wikis/home'
license=('GPL')
source=('80-shrink-intel-ucode.hook')
depends=('intel-ucode' 'iucode-tool')
sha256sums=('79212ff73d826baf5e1b181376c2901618fc5c5c185ad7767a69a0505286ccf4')

package() {
  install -Dm644 80-shrink-intel-ucode.hook "${pkgdir}"/usr/share/libalpm/hooks/80-shrink-intel-ucode.hook
}
