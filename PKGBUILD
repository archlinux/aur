# Maintainer: Matthew Hague <matthewhague at zoho dot com>

pkgname=perl-extract-url-git
pkgver=1
pkgrel=1
pkgdesc='Alternative or preprocessor for urlview, primarily for use with mutt'
arch=(any)
url='http://www.memoryhole.net/~kyle/extract_url'
replaces=(extracturl-git)
conflicts=(extracturl-git)
license=('BSD-2-Clause (simplified)')
depends=('perl'
         'perl-mime-tools'
         'perl-html-parser')
optdepends=('perl-curses-ui: allows it to fully replace urlview')
source=(git://github.com/m3m0ryh0l3/extracturl.git)
sha256sums=('SKIP')

package() {
  cd $srcdir/extracturl
  make
  make  DESTDIR=$pkgdir install 
}
