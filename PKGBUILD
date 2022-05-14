# Maintainer: Ilya Zlobintsev <ilya.zlve@gmail.com>
pkgname=qbittorrent-cli-bin
pkgver=1.7.22127.1
pkgrel=1
pkgdesc="Command line interface for remote qBittorrent instances"
arch=("any")
url="https://github.com/fedarovich/qbittorrent-cli"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(staticlibs)
install=
changelog=
source_x86_64=("https://github.com/fedarovich/qbittorrent-cli/releases/download/v${pkgver}/qbt-linux-x64-${pkgver}.tar.gz")
source_arm=("https://github.com/fedarovich/qbittorrent-cli/releases/download/v${pkgver}/qbt-linux-arm-${pkgver}.tar.gz")
source_aarch64=("https://github.com/fedarovich/qbittorrent-cli/releases/download/v${pkgver}/qbt-linux-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=("a69813291f913ee09f0228c12c851959fba624e69e327bae281d7246574b0b06")
sha256sums_arm=("5af88a7575b4b2b452c9ba1b778ad59e6c18668048da457775e1ab139cdd6c0a")
sha256sums_aarch64=("28fe7cffb3d6cf0c342536e076d2e373d1630ae867247db83ef04ce92fb35937")


package() {
	mkdir -p "$pkgdir/usr/lib/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	cp -r $srcdir/* "$pkgdir/usr/lib/$pkgname/"
	ln -s "/usr/lib/$pkgname/qbt" "$pkgdir/usr/bin/qbt"
}



