# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Dario Andres Rodriguez <darzephyr@gmail.com>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=xcursor-premium
pkgver=0.3
pkgrel=10
pkgdesc="Premium X Cursor Theme"
arch=('any')
url="https://store.kde.org/p/999861/"
license=('GPL')
#source=("https://pkgbuild.com/~kkeen/source/14485-Premium-$pkgver.tar.bz2")
source=("https://distro.ibiblio.org/fatdog/source/800/14485-Premium-$pkgver.tar.bz2")
sha256sums=('e4c74d06fd1de21038e57bfa4273ab58f786a91ff703844dd3ee23fcef739596')

package() {
  mkdir -p "$pkgdir"/usr/share/icons/{Premium,Premium-left}
  cp -R "$srcdir"/Premium-0.3/Premium/{cursors,index.theme} \
	"$pkgdir"/usr/share/icons/Premium
  cp -R "$srcdir"/Premium-0.3/Premium-left/{cursors,index.theme} \
	"$pkgdir"/usr/share/icons/Premium-left
}
