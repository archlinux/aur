# Maintainer Per Osbäck <per@osbeck.com>

_pkgname=globalping
pkgname=$_pkgname-bin
pkgver=1.4.0 # renovate: datasource=github-releases depName=jsdelivr/globalping-cli
pkgrel=1
pkgdesc="Better understand your network routing, fix anycast issues, monitor your CDN and DNS performance, do uptime monitoring and build your own network tools for personal or public use."
url="https://github.com/jsdelivr/globalping-cli"
license=('MPL-2.0')
source=(
  "$_pkgname-$pkgver.pkg.tar.zst::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.pkg.tar.zst"
)
arch=('x86_64')
sha512sums=('eeb324d7a0bc766a5c53296e935deb8fc43884088bdf771e2cd3935fdf396e3d225693d6c876b8bd092e1638e7bc461dd1691bec0eefa1e4979950d5898cfb81')
conflicts=("$_pkgname" "${_pkgname}-cli")

package() {
  install -D -m 0755 "$srcdir/usr/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
