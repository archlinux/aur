# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: rich_o <rich_o@lavabit.com>

pkgname=subdl
pkgver=1.0.3
pkgrel=1
pkgdesc="A command-line tool for downloading subtitles from opensubtitles.org"
arch=('any')
url="http://code.google.com/p/$pkgname/"
license=('GPL3')
depends=('python2')
source=(http://subdl.googlecode.com/files/$pkgname-$pkgver.zip)
md5sums=('883b28c5defdf654f9532cef7d33697c')

package() {
  cd ${srcdir}

  sed -i 's|usr/bin/python$|\02|' $pkgname

  install -D -m755 $pkgname ${pkgdir}/usr/bin/$pkgname
}
