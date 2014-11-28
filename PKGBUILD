# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Michal Minar <mr.mini@centrum.cz>

pkgname=stardict-cz
pkgver=20140101
pkgrel=1
pkgdesc="Czech dictionary of foreign words for stardict"
arch=('any')
url="http://slovnik-cizich-slov.abz.cz/"
license=('GPL')
depends=('stardict')
source=(http://dl.cihar.com/slovnik/stardict-czech-$pkgver.tar.gz)
sha256sums=('6b6044475ed113020994774ba5dfa87c94dd361fac7921787c2bc78d0781329a')

package() {
  cd "${srcdir}"/stardict-czech-$pkgver

  install -d "${pkgdir}"/usr/share/stardict/dic/
  install -m644 czech* "${pkgdir}"/usr/share/stardict/dic/
}
