# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=ssl-cert-check
pkgver=4.11
pkgrel=1
pkgdesc="Checks if digital certificates in X.509 format have expired."
arch=('any')
url="http://prefetch.net/articles/checkcertificate.html"
license=('GPL')
depends=('openssl')
source=("https://raw.githubusercontent.com/Matty9191/$pkgname/master/$pkgname")
noextract=("$pkgname")
sha256sums=('46141be06bb740219382204a52482772e3f3a8c3d259a9cbc8cfa3c44ca73556')

package() {
  mkdir -p ${pkgdir}/usr/bin
  install -m755 "$pkgname" "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 noet:
