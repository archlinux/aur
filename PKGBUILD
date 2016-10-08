# Maintainer: aksr <aksr at t-com dot me>
_pkgname=Isabella
pkgname=otf-isabella
pkgver=1.202
pkgrel=1
pkgdesc="A font based on the calligraphic hand used in the Isabella Breviary, made around 1497, in Holland."
arch=('any')
license=('SIL' 'LGPL')
url="http://www.thibault.org/fonts/isabella/"
install=otf.install
source=("http://www.thibault.org/fonts/isabella/${_pkgname}-${pkgver}-src.tar.gz")
md5sums=('f5c22b69e2673581587ce11d69f74556')
sha1sums=('5cf6d74bee0baf789237782e4ffc83dc5e6b23e3')
sha256sums=('af388b94605fa719cb58d64b8b967afc17ca500b85858f60bd3b5c6d11040a31')

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 Isabella.otf $pkgdir/usr/share/fonts/OTF/Isabella.otf
  install -Dm644 README.txt $pkgdir/usr/share/doc/${pkgname}/README.txt
  install -Dm644 OFL.txt $pkgdir/usr/share/licenses/${pkgname}/OFL.txt
  install -m644 COPYING.LIB $pkgdir/usr/share/licenses/${pkgname}/COPYING.LIB
}

