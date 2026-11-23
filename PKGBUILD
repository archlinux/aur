# Maintainer: Pavle Portic <archlinux@theedgeofrage.com>

_pkgname=logfmt
pkgname=${_pkgname}-bin
pkgver=0.2.4
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
sha256sums_x86_64=("b19031b3deec7a710baaebe8f16bc4f2df5710a369b52f44b096ed1036f1b0b7")
sha256sums_arm64=("c84b126e6122e54544b22378808afa67d23e81c2083e50de9facd8e85ea222a4")

package() {
	install -m 0755 -D "logfmt" "$pkgdir/usr/bin/logfmt"
}
