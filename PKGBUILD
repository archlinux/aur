# $Id: PKGBUILD 67819 2012-03-14 16:22:14Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: karnath <karnathtorjian@gmail.com>

pkgname=zathura-pdf-mupdf
pkgver=0.1.0
pkgrel=1
pkgdesc="Adds pdf support to zathura by using the poppler engine"
arch=('i686' 'x86_64')
url="https://pwmt.org/projects/zathura/plugins/zathura-pdf-poppler/"
license=('custom')
depends=('mupdf' 'zathura')
source=(https://pwmt.org/projects/zathura/plugins/download/zathura-pdf-mupdf-$pkgver.tar.gz)
md5sums=('20befdc4db4feec73890eb92ea3aeb5f')

build(){
  cd ${srcdir}/zathura-pdf-mupdf-$pkgver
  make
  make DESTDIR="$pkgdir" install
  install -Dm0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
