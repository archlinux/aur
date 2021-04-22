# Maintainer: Ilya Zlobintsev <ilya.zlve@gmail.com>
pkgname=qbittorrent-cli-bin
pkgver=1.6.21112.5
pkgrel=3
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
sha512sums_x86_64=("891c22c6a3389dcfa2f61d1d65c77900f50882b550094f1a5670e8652987f252cede2674536cc0a346522ac22672ce86ad12e2e841c7dd37be487f7ce4a4c9ce")
sha512sums_arm=("e57fb0007c86f8e01a2e97a4d68fad00a1c43dc1a152dfebbd23ba9aa885772f47caabb7185f2ed60e7cca6366ed444564b27900ead47660b3961e56cdb8a6af")
sha512sums_aarch64=("d0f5f9124fa913cdb906c40e763533192fc0cf75191ef100391a09f52d80c052cee44a0f374b21ce32c5524bc1a8d8b65e6bf8cf27653d04fc44c7dc07441017")


package() {
	mkdir -p "$pkgdir/usr/lib/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	cp -r $srcdir/* "$pkgdir/usr/lib/$pkgname/"
	ln -s "/usr/lib/$pkgname/qbt" "$pkgdir/usr/bin/qbt"
}



