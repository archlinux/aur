# Maintainer: Ilya Zlobintsev <ilya.zlve@gmail.com>
pkgname=qbittorrent-cli-bin
pkgver=1.6.20334.1
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

sha512sums_x86_64=("05438a2f1674d9cae598165d0516d9c7eea7303640123bdc7af14dc7bfed66353252fa789196a3fdadaca4b92d6af81f3cc279ae6cda61f470be24765162b3d4")
sha512sums_arm=("60d599ce930e1df1ad8076b22fd12c892fd0cd561d439c3bd52e4f04f4420ec8ecc24967a4b2ef485832117aa20a80de10e1d42e2582b6928eefaf6af7155136")
sha512sums_aarch64=("6be75e8d28bf91adb28acee6a03762bc439aff3c5f831bb869947ce759e63a4157661ade98f3b8fc204c590bad260b6bf8e0997e55bd948d70f131d1b9389019")

package() {
	mkdir -p "$pkgdir/usr/lib/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	cp -r $srcdir/* "$pkgdir/usr/lib/$pkgname/"
	ln -s "/usr/lib/$pkgname/qbt" "$pkgdir/usr/bin/qbt"
}



