# Maintainer: aksr <aksr at t-com dot me>
pkgname=ttf-ifao-n-copte
_pkgname=IfaoNCopte
pkgver=1.0.6
pkgrel=1
pkgdesc="A Coptic font"
arch=('any')
url="http://www.evertype.com/fonts/coptic/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=("http://www.ifao.egnet.net/uploads/polices/$_pkgname.zip")
md5sums=('9aab3b9b4aef693ad11c90319a1e0757')
sha1sums=('cc74809d77b03dac024e737967bae10a86ccfc01')
sha256sums=('891f2adefa23ec444831a33c34bf3a03ecd43d39230398cda8b687d14072b53b')

package() {
  cd "$srcdir/polices"
  mkdir -p $pkgdir/usr/share/{fonts/TTF,doc/$pkgname}
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/
  cd "$srcdir/manuels"
  install -m644 *.pdf $pkgdir/usr/share/doc/$pkgname/
}

