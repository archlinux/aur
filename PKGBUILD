# Maintainer: aksr <aksr at t-com dot me>
_pkgname=essays1743
pkgname=otf-essays-1743
pkgver=2.001
pkgrel=1
pkgdesc="A font by John Stracke, based on the typeface used in a 1743 English translation of Montaigne's Essays."
arch=('any')
license=('SIL' 'LGPL')
url="http://www.thibault.org/fonts/essays/"
install=otf.install
source=("http://www.thibault.org/fonts/essays/${_pkgname}-${pkgver}-1-otf.tar.gz")
md5sums=('3f37a671704d961db58113651b1305bb')
sha1sums=('c4ea836d6f568eec8851e027751df154d790efa7')
sha256sums=('b948fc8db898d7af2783571bbe3d9e18fd20ff91a5e5bee8cac2cdeffbe157b5')

package() {
  cd "$srcdir/$_pkgname"
  for i in *.otf; do
    install -Dm644 $i $pkgdir/usr/share/fonts/OTF/$i
  done
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname}/README
  install -Dm644 OFL.txt $pkgdir/usr/share/licenses/${pkgname}/OFL.txt
  install -m644 COPYING $pkgdir/usr/share/licenses/${pkgname}/COPYING
}

