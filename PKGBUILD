# Maintainer Per Osbäck <per@osbeck.com>

_pkgname=globalping
pkgname=$_pkgname-bin
pkgver=1.6.1 # renovate: datasource=github-releases depName=jsdelivr/globalping-cli
pkgrel=1
pkgdesc="Better understand your network routing, fix anycast issues, monitor your CDN and DNS performance, do uptime monitoring and build your own network tools for personal or public use."
url="https://github.com/jsdelivr/globalping-cli"
license=('MPL-2.0')
source=(
  "$_pkgname-$pkgver.pkg.tar.zst::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_linux_amd64.pkg.tar.zst"
)
arch=('x86_64')
sha512sums=('4004861c70cc04e5b9e3457fa6267741b5cfba50c30566b5201784a074cb65ee2ef2ecb3515c4d24ad4ce97ccb0e691ece092792e3ee90129201a281c1dd5b56')
conflicts=("$_pkgname" "${_pkgname}-cli")

package() {
  install -D -m 0755 "$srcdir/usr/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

#vim: syntax=sh
