# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=ssl-cert-check
pkgver=3.30
pkgrel=1
pkgdesc="Checks if digital certificates in X.509 format have expired."
arch=('any')
url="http://prefetch.net/articles/checkcertificate.html"
license=('GPL')
depends=('openssl')
source=("https://raw.githubusercontent.com/Matty9191/$pkgname/master/$pkgname")
noextract=("$pkgname")
md5sums=('9a725131928b731e38ab895e3cbc1395')
sha256sums=('3f9d859aed60bc6702f45fd98fd0a8421008af3f309f82dffd58c96ff942b4e4')

package() {
  mkdir -p ${pkgdir}/usr/bin
  install -m755 "$pkgname" "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 noet:
