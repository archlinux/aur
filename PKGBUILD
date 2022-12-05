# Maintainer: rj1 <rj1@riseup.net>

pkgbase="rofimpd"
pkgname="rofimpd"
pkgver="0.1"
pkgrel=1
pkgdesc="barebones mpd client (rofi + mpc)"
arch=("any")
url="https://rj1.localghost.org/repos/rofimpd/"
license=("MIT")
depends=("mpc"
         "mpd"
         "rofi")
provides=("rofimpd")
source=("https://github.com/rj1/${pkgname}/releases/download/v${pkgver}/${pkgname}.tar.gz")
sha256sums=('8ab3a827034b7c53deffdcf9caa05d56c83546961636258cd8ef14ed6c0b6554')

package() {
  cd "$pkgname" || exit 1
  install -Dm755 "rofimpd" "$pkgdir/usr/bin/${pkgname}"
}

