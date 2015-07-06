# Maintainer: aksr <aksr at t-com dot me>
pkgname=ttf-antinoou
_pkgname=AntinoouFont
pkgver=1.0.6
pkgrel=1
pkgdesc="A standard font for Coptic."
arch=('any')
url="http://www.evertype.com/fonts/coptic/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=("http://www.evertype.com/fonts/coptic/$_pkgname.zip")
md5sums=('30f9ec32a81b3ae3aa7c9a72fa613e39')
sha1sums=('5b7da0df69c5c8c5831fcb58e9706d36e4b11462')
sha256sums=('d7f961ff2ab5b6c707e4f0a24e8302c7a61c2e2ab2e9880c94a8deb6f5aeff69')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  mkdir -p $pkgdir/usr/share/fonts/TTF
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/
  install -Dm644 antinoou-licence.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
}

