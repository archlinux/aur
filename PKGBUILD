# Maintainer: Pavle Portic <archlinux@theedgeofrage.com>

_pkgname=logfmt
pkgname=${_pkgname}-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Simple CLI tool for colorizing, analyzing, filtering, and formatting logfmt structured logs"
url="https://github.com/TheEdgeOfRage/logfmt"
license=("MIT")
arch=("x86_64" "arm64")
provides=("logfmt")
conflicts=("logfmt")
makedepends=("go")
source_x86_64=("logfmt::https://github.com/TheEdgeOfRage/logfmt/releases/download/v${pkgver}/logfmt-linux-amd64-v${pkgver}")
source_arm64=("logfmt::https://github.com/TheEdgeOfRage/logfmt/releases/download/v${pkgver}/logfmt-linux-arm64-v${pkgver}")
noextract=("logfmt")
sha256sums_x86_64=("065cd2045f0e515342008f0a185717d027844beeac1a7590b3ef6aa4d3af80f8")
sha256sums_arm64=("e7567e03a7162b450d682e32f95957f81637c0ea1e2a033339277012a3645681")

package() {
	install -m 0755 -D "logfmt" "$pkgdir/usr/bin/logfmt"
}
