# Maintainer: Pavle Portic <archlinux@theedgeofrage.com>

_pkgname=logfmt
pkgname=${_pkgname}-bin
pkgver=0.2.2
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
sha256sums_x86_64=("0f8057f916c45412c34e9fc6f2cba6d5330bb7c3fa9d4caef69a13c2b2f553e2")
sha256sums_arm64=("b504954e6ea7e5553bba7f762888e4e38cba067e88469c640dc80baf94ee0e55")

package() {
	install -m 0755 -D "logfmt" "$pkgdir/usr/bin/logfmt"
}
