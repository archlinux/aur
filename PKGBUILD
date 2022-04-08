# Maintainer: Taiki Sugawara <buzz.taiki@gmail.com>
pkgname=echo-sd

# git log --format='format:%at' --abbrev-commit -n 1 <commit-ish> -- echo-sd
pkgver=1566580862

pkgrel=1
pkgdesc='Echo "sudden death" message'
arch=('any')
url="https://www.osstech.co.jp/cgi-bin/echo-sd"
license=('GPL3')
optdepends=('openssl: if you use Twitter')

# because super_unko 1.0.5-2 has a echo_sd
conflicts=('super_unko=1.0.5-2')

source=('https://raw.githubusercontent.com/fumiyas/home-commands/990ca109504fa545a375d7c3228e550db670e85f/echo-sd')
sha256sums=('39a71169dfac7a6ebdef00680ab9337999aa63057eb1b1a24877ad789148e196')

package() {
  install -D -m755 "${srcdir}/echo-sd" "${pkgdir}/usr/bin/echo-sd"
}

# vim:set ts=2 sw=2 et:
