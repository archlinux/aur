# Maintainer: Viacheslav Chimishuk <vchimishuk@yandex.ru>
pkgname=stardict-slang-eng-rus
pkgver=2.4.2
pkgrel=1
pkgdesc="English-Russian slang dictionary"
arch=('i686' 'x86_64')
url="http://stardict.sourceforge.net"
license=('GPL')
depends=('stardict')
source=(http://downloads.sourceforge.net/xdxf/stardict-comn_sdict_axm05_eng_rus_slang-$pkgver.tar.bz2)
md5sums=('dd7464f82387e4b22f3553f1998debcd')

package() {
  cd "$srcdir/stardict-eng_rus_slang-$pkgver"
  mkdir -p $pkgdir/usr/share/stardict/dic/
  install -m 644 * $pkgdir/usr/share/stardict/dic/
}

# vim:set ts=2 sw=2 et:
