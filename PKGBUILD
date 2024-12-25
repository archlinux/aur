# Maintainer: Ilya Zlobintsev <ilya.zlve@gmail.com>
pkgname=qbittorrent-cli-bin
pkgver=1.8.24285.1
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
options=()
install=
changelog=
source_x86_64=("https://github.com/fedarovich/qbittorrent-cli/releases/download/v${pkgver}/qbt-linux-x64-net6-${pkgver}.tar.gz")
source_arm=("https://github.com/fedarovich/qbittorrent-cli/releases/download/v${pkgver}/qbt-linux-arm-net6-${pkgver}.tar.gz")
source_aarch64=("https://github.com/fedarovich/qbittorrent-cli/releases/download/v${pkgver}/qbt-linux-arm64-net6-${pkgver}.tar.gz")
sha256sums_x86_64=('c261e875bb1fc566e54c5427d06761f4d61ea483e5917d60840aa44a33ee1c92')
sha256sums_arm=('d724753bd4b8cc599f1ff20f8ca98988e72d7a83d99aba82faaca60b5416c039')
sha256sums_aarch64=('3cb7c236bdc62b476c6a1256eeeba3a402da44195c4cd23c91ead6c3e0ecb72f')

package() {
	mkdir -p "$pkgdir/usr/lib/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	cp -r $srcdir/* "$pkgdir/usr/lib/$pkgname/"
	ln -s "/usr/lib/$pkgname/qbt" "$pkgdir/usr/bin/qbt"
}

