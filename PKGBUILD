# Maintainer: Kyle Keen <keenerd@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: dale <dale@archlinux.org>
# Contributor: bender02 at gmx dot com

pkgname=fortune-mod-discworld
pkgver=0
pkgrel=3
pkgdesc='Fortune cookies from the "Discworld" novels by Terry Pratchett.'
url="http://www.splitbrain.org/projects/fortunes/discworld"
arch=('any')
license=('copyright')
depends=('fortune-mod')
source=(http://www.splitbrain.org/_media/projects/fortunes/fortune-discworld.tgz)
md5sums=('4e00763163ae6ca76f7f23e435edbe08')

package() {
  cd fortune-discworld
  install -Dm644 discworld "$pkgdir/usr/share/fortune/discworld"
  install -Dm644 discworld.dat "$pkgdir/usr/share/fortune/discworld.dat"
  install -Dm644 README "$pkgdir/usr/share/licenses/$pkgname/README"
}
