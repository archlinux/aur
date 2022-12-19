# Maintainer: Ilya "Nolo001" Burdin <56518932+Nolo001-Aha@users.noreply.github.com>
pkgname=fetchfetch-git
pkgver=a4c9f16
pkgrel=1
pkgdesc="A neofetch-like tool to get all the neofetch-like tools installed on your computer, written in python."
arch=('any')
url="https://github.com/Blobadoodle/fetchfetch"
license=('MIT')
depends=('python3')
md5sums=('SKIP')
source=("git+$url")

package() {
	cd fetchfetch
	chmod +x fetchfetch
	mkdir -p "${pkgdir}/usr/bin"
	cp fetchfetch ${pkgdir}/usr/bin
}
