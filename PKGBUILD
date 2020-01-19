# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=ssl-cert-check
pkgver=4.12
pkgrel=1
pkgdesc="Checks if digital certificates in X.509 format have expired."
arch=('any')
url="http://prefetch.net/articles/checkcertificate.html"
license=('GPL')
depends=('openssl')
source=("https://raw.githubusercontent.com/Matty9191/$pkgname/master/$pkgname")
noextract=("$pkgname")
sha256sums=('7d759bd47158bf74eae999b6622d81b099bb0e5f20dfa9603539fec9619d7c39')

package() {
  mkdir -p ${pkgdir}/usr/bin
  install -m755 "$pkgname" "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 noet:
