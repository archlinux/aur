# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Berkus <berkus@madfire.net>

pkgname=synce-mcfs
pkgver=0.1.1
pkgrel=9
pkgdesc="Midnight Commander VFS for SynCE"
arch=(any)
url="http://synce.sourceforge.net/"
license=("GPL")
depends=('synce-core' 'perl')
#source=(http://downloads.sourceforge.net/sourceforge/synce/$pkgname.tar.gz)
source=(synce)
md5sums=('4837a8a0093713509bc6769089c1c402')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir"/usr/lib/mc/extfs.d || true
  cp "$srcdir"/synce "$pkgdir"/usr/lib/mc/extfs.d
}
