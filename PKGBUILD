# Maintainer: Pavle Portic <archlinux@theedgeofrage.com>

_pkgname=logfmt
pkgname=${_pkgname}-bin
pkgver=0.3.0
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
sha256sums_x86_64=("c2db04b66146160d08d44ef4263fcc1433d74dbf0525206df31fe8391d91e30d")
sha256sums_arm64=("4c5eb00d928b1e2f4f3d151a9db13a28c39f4860c1da0162bedde137f3f45974")

package() {
	install -m 0755 -D "logfmt" "$pkgdir/usr/bin/logfmt"
}
