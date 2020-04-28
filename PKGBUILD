# Maintainer: Ilya Zlobintsev <ilya.zlve@gmail.com>
pkgname=qbittorrent-cli-bin
pkgver=1.5.19350.1
pkgrel=3
pkgdesc="Command line interface for remote qBittorrent instances"
arch=("any")
url="https://github.com/fedarovich/qbittorrent-cli"
license=('MIT')
groups=()
depends=("dotnet-runtime>=2.1.0" "dotnet-runtime<3.0.0")
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
source=("https://github.com/fedarovich/qbittorrent-cli/releases/download/v${pkgver}/qbt-netcore21-${pkgver}.tar.gz")
sha512sums=('39e084cca149f8a15c46389cf5c6b211f52a2fd6872ee7c20e7eb06c054375185147540f49a440c6af38323978324fd09002d7e73f45745e8823c564485daf60')

package() {
	mkdir -p "$pkgdir/usr/lib/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	cp -r $srcdir/* "$pkgdir/usr/lib/$pkgname/"
	ln -s "/usr/lib/$pkgname/qbt" "$pkgdir/usr/bin/qbt"
}
