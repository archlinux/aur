# Maintainer: Pavle Portic <archlinux@theedgeofrage.com>

_pkgname=logfmt
pkgname=${_pkgname}-bin
pkgver=0.2.3
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
sha256sums_x86_64=("c3dd7a5249205c877f87b3400bfd17bd99da4c26e8d44bcf6a008a09fc88c72a")
sha256sums_arm64=("18de6a6451c2ca6a2a3e9167b4dd65f2a0831d69bc5eff32aae00eb295a4aaae")

package() {
	install -m 0755 -D "logfmt" "$pkgdir/usr/bin/logfmt"
}
