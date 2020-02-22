# Maintainer: Ilya Zlobintsev <ilya.zlve@gmail.com>
pkgname=qbittorrent-cli-bin
pkgver=1.5.19350.1
pkgrel=2
pkgdesc="Command line interface for remote qBittorrent instances"
arch=("x86_64")
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
source=("https://github.com/fedarovich/qbittorrent-cli/releases/download/v${pkgver}/qbt-linux-x64-${pkgver}.tar.gz")
sha512sums=('28d861f5825a321c4a8dfa13d436f561c252ddb17771619f9cd13083c26bd28441576d22e4d202d7e0f361d350b0bfb1d6c0a79201ee40a3cc849df5365026a6')

package() {
	mkdir -p "$pkgdir/usr/lib/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	cp $srcdir/* "$pkgdir/usr/lib/$pkgname/"
	ln -s "/usr/lib/$pkgname/qbt" "$pkgdir/usr/bin/qbt"
}
