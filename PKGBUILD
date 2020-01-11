# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: hobi82 <hobi82@gmx.net>
# Contributor: Marius Nestor <marius softpedia com>

pkgname=musictube
pkgver=1.10
pkgrel=1
pkgdesc="YouTube music player"
arch=('x86_64')
url="https://flavio.tordini.org/musictube"
license=('custom:Proprietary')
depends=('qt5-declarative' 'phonon-qt5' 'hicolor-icon-theme')
source=("${pkgname}-${pkgver}.deb::https://flavio.tordini.org/files/musictube/musictube.deb")
sha256sums=('59ccae998e2435ef0fcabbadda50b2c6a710d470bbd886c4ad106b1f722d49b1')


package() {
  bsdtar -xvf data.tar.xz -C "$pkgdir"
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s /usr/share/doc/musictube/copyright "$pkgdir"/usr/share/licenses/$pkgname/copyright
}
