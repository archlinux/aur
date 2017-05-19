# Maintainer: K. Foutzopoulos <mail@konfou.xyz>

_base=vpnoverdns
pkgname=${_base}-client
pkgver=1
pkgrel=1
pkgdesc="VPN-over-DNS perl client"
arch=('any')
url="https://www.vpnoverdns.com/perl.html"
license=('BSD')
depends=('perl-net-dns')
#makedepends=('')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://www.vpnoverdns.com/${_base}.pl")
sha256sums=('2f8c329cc200127dfefcc6fdf13bbb21e63a7f2e851ed1fe3219e76ab32fd909')

package() {
  install -Dm755 "${_base}.pl" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
