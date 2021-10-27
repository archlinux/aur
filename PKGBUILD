# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=ssl-cert-check
pkgver=4.14
pkgrel=2
pkgdesc="Checks if digital certificates in X.509 format have expired."
arch=('any')
url="http://prefetch.net/articles/checkcertificate.html"
license=('GPL')
depends=('openssl')
source=("https://raw.githubusercontent.com/Matty9191/$pkgname/master/$pkgname")
noextract=("$pkgname")
sha256sums=('e6342e1b41710551f719c13a837294ea051182058943b918ae7a03a5c3b6f3fe')

package() {
  mkdir -p ${pkgdir}/usr/bin
  install -m755 "$pkgname" "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 noet:
