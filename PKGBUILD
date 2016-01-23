# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=ssl-cert-check
pkgver=3.29
pkgrel=2
pkgdesc="Checks if digital certificates in X.509 format have expired."
arch=('any')
url="http://prefetch.net/articles/checkcertificate.html"
license=('GPL')
depends=('openssl')
source=("http://prefetch.net/code/$pkgname")
noextract=("$pkgname")
md5sums=('fd41353bd9ee79d574f9f166b69b786e')
sha256sums=('61d32aa3b3b530ad012ba576e5e0d3824af544c011ad807ebcfd3fdd97b0df9c')

package() {
  mkdir -p ${pkgdir}/usr/bin
  install -m755 "$pkgname" "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 noet:
