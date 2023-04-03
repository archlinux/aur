# Maintainer: Ilya Zlobintsev <ilya.zlve@gmail.com>
pkgname=qbittorrent-cli-bin
pkgver=1.7.23016.1
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
sha256sums_x86_64=('26a345a380657ea5be19e19c09e71571b4e11fd5c512e380f992b1665ec76637')
sha256sums_arm=('245dd819a01825c3e063e534987e21a15325319c4c2ba663e1c8c0a8a9f09104')
sha256sums_aarch64=('5bd6284e8b91b39758e0c54a97b130f71a3882f1b57bd3987be38f62bd997b2c')

package() {
	mkdir -p "$pkgdir/usr/lib/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	cp -r $srcdir/* "$pkgdir/usr/lib/$pkgname/"
	ln -s "/usr/lib/$pkgname/qbt" "$pkgdir/usr/bin/qbt"
}

