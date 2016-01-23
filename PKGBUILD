# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=ssl-cert-check
pkgver=3.29
pkgrel=1
pkgdesc="Checks if digital certificates in X.509 format have expired."
arch=('any')
url="http://prefetch.net/articles/checkcertificate.html"
license=('GPL')
depends=('openssl')
source=("http://prefetch.net/code/$pkgname")
noextract=("$pkgname")
md5sums=('1525bb3d45d150088770f2820b2bdd86')
sha256sums=('3d3649ab1053801a67cf3dff229e6e085353ff7129699bb8543e53deb051582a')

package() {
  mkdir -p ${pkgdir}/usr/bin
  install -m755 "$pkgname" "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 noet:
