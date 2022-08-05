# Maintainer: Alireza Ahmand <ahmand@vk.com>
pkgname=surfshark-wireguard
pkgver=2.8
pkgrel=1
pkgdesc="SurfShark Wireguard Extractor"
arch=('x86_64')
url="https://github.com/Incognito-Coder/Wiregen.git"
license=('unknown')
depends=('python3' 'wireguard-tools')
provides=('wiregen')
source=("git+$url")
md5sums=('SKIP')
package() {
	cd "Wiregen"
	sudo install -Dm755 wiregen.py "/usr/bin/wiregen"
}
