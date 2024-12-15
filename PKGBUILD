# Contributor: Alireza Ahmand <ahmand@vk.com>

pkgname=surfshark-wireguard
pkgver=2.9
pkgrel=1
pkgdesc="SurfShark Wireguard Extractor"
arch=('any')
url="https://github.com/Incognito-Coder/Wiregen.git"
license=('unknown')
depends=('python' 'wireguard-tools')
makedepends=('git')
source=("git+$url#commit=8e93cc60c5eb7865eea27eb5f0d2fbe0f463db03")
sha256sums=('63e77c78fcb3f76e4f89bc9eaaac5cd73dd3194c43778fed25140638b053814b')

package() {
	cd "Wiregen"
	install -Dm755 wiregen.py "$pkgdir/usr/bin/wiregen"
}
