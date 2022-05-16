# Maintainer: Ilya Zlobintsev <ilya.zlve@gmail.com>
pkgname=qbittorrent-cli-bin
pkgver=1.7.22127.1
pkgrel=2
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
options=()
install=
changelog=
source_x86_64=("https://github.com/fedarovich/qbittorrent-cli/releases/download/v${pkgver}/qbt-linux-x64-net6-${pkgver}.tar.gz")
source_arm=("https://github.com/fedarovich/qbittorrent-cli/releases/download/v${pkgver}/qbt-linux-arm-net6-${pkgver}.tar.gz")
source_aarch64=("https://github.com/fedarovich/qbittorrent-cli/releases/download/v${pkgver}/qbt-linux-arm64-net6-${pkgver}.tar.gz")
sha256sums_x86_64=('0684b97d70fc1ae0758afcafa7e567442ebf0f4dc17b7b879d188571b3b38863')
sha256sums_arm=('488c20a494d6f7a7eeb5f9143a69590a2adbc25ab38cd814983f583aad4137b6')
sha256sums_aarch64=('932ce2cf46a6470bf1d49b913786492e67953df28ea70b1e91f5ee7c5babf8b3')

package() {
	mkdir -p "$pkgdir/usr/lib/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	cp -r $srcdir/* "$pkgdir/usr/lib/$pkgname/"
	ln -s "/usr/lib/$pkgname/qbt" "$pkgdir/usr/bin/qbt"
}

