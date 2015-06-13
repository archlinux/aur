# Maintainer: Viacheslav Chimishuk <vchimishuk@yandex.ru>
pkgname=stardict-computer-ru
pkgver=2.4.2
pkgrel=3
pkgdesc="English-Russian dictionary of computer terms for StarDict"
arch=('i686' 'x86_64')
url="http://stardict.sourceforge.net"
license=('GPL')
depends=('stardict')
source=(http://downloads.sourceforge.net/xdxf/stardict-comn_sdict05_eng_rus_comp-$pkgver.tar.bz2)
md5sums=('96e6beeaee403c6946218d9b4c631eca')

package() {
  cd "$srcdir/stardict-eng_rus_comp-$pkgver"
  mkdir -p $pkgdir/usr/share/stardict/dic/
  install -m 644 * $pkgdir/usr/share/stardict/dic/
}

# vim:set ts=2 sw=2 et:
