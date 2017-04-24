pkgname=anki
pkgver=2.1.0a13
alpha=13
pkgrel=1
pkgdesc="Helps you remember facts (like words/phrases in a foreign language) efficiently"
url="https://ankisrs.net/"
license=('AGPL3')
arch=('x86_64')
options=(!strip)
source=(https://apps.ankiweb.net/downloads/alpha/alpha$alpha/$pkgname-$pkgver-amd64.tar.bz2 )
sha512sums=('934070691e9a33a8fe1ef922baa1516a0b54c06d7244bfcc6ed9944e595cc0bdd43c54dc2dd54c44920f6a74f1f58c860a24ac86fec201890fb2573b66ab1765')

package() {
  cd $srcdir/$pkgname-$pkgver-amd64
  mkdir -p ${pkgdir}/opt/anki
  mkdir -p ${pkgdir}/usr/bin
  cp -ra bin ${pkgdir}/opt/anki/
  ln -s /opt/anki/bin/anki -t ${pkgdir}/usr/bin/
}
