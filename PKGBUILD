# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Michal Minar <mr.mini@centrum.cz>

pkgname=stardict-cz
pkgver=20171101
pkgrel=1
pkgdesc="Czech dictionary of foreign words for stardict"
arch=('any')
url="http://slovnik-cizich-slov.abz.cz/"
license=('GPL')
depends=('stardict')
source=(http://dl.cihar.com/slovnik/stable/stardict-czech-$pkgver.tar.gz)
sha256sums=('ff039e96413e5d9c0a644f8817151ff3d3a674cca7fb29b43ca70d5d19806c92')

package() {
  cd "${srcdir}"/stardict-czech-$pkgver

  install -d "${pkgdir}"/usr/share/stardict/dic/
  install -m644 czech* "${pkgdir}"/usr/share/stardict/dic/
}
