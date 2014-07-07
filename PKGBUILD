# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: rich_o <rich_o@lavabit.com>

pkgname=subdl
pkgver=1.0.3
pkgrel=3
pkgdesc="A command-line tool for downloading subtitles from opensubtitles.org"
arch=('any')
url="http://code.google.com/p/$pkgname/"
license=('GPL3')
depends=('python2')
source=(http://subdl.googlecode.com/files/$pkgname-$pkgver.zip)
sha256sums=('883b28c5defdf654f9532cef7d33697c')

package() {
  cd ${srcdir}

  sed -i 's|usr/bin/python$|\02|' $pkgname

  install -D -m755 $pkgname ${pkgdir}/usr/bin/$pkgname
}
sha256sums=('ba56d0f65ccce575295a65d1374f164d4f1cc69c874ae8593f5daa688562c154')
