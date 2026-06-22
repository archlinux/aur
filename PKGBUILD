# Maintainer Per Osbäck <per@osbeck.com>

_pkgname=globalping
pkgname=$_pkgname-bin
pkgver=1.5.2 # renovate: datasource=github-releases depName=jsdelivr/globalping-cli
pkgrel=1
pkgdesc="Better understand your network routing, fix anycast issues, monitor your CDN and DNS performance, do uptime monitoring and build your own network tools for personal or public use."
url="https://github.com/jsdelivr/globalping-cli"
license=('MPL-2.0')
source=(
  "$_pkgname-$pkgver.pkg.tar.zst::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.pkg.tar.zst"
)
arch=('x86_64')
sha512sums=('ccf50cefc6bbee44f49091badf1794d68f7407c9a14b1af7023a9d80eacaf6943f99aafd1d767143b8efb9b630e03cccb6e8cc0c48a95245b72949ac30cf1bf6')
conflicts=("$_pkgname" "${_pkgname}-cli")

package() {
  install -D -m 0755 "$srcdir/usr/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
