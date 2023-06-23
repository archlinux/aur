
# Maintainer: Your Name <youremail@domain.com>
# Contributor: Asuka Minato
pkgname=clashctl-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="CLI for interacting with clash"
arch=(x86_64)
url="https://github.com/George-Miao/clashctl"
license=('MIT')
depends=(gcc-libs glibc)
provides=(clashctl)
source=("https://github.com/George-Miao/clashctl/releases/download/0.3.3/clashctl-Linux"
"https://raw.githubusercontent.com/George-Miao/clashctl/0.3.3/LICENSE")
sha256sums=('628dbaa85d178967227c9af06de45c97f6be02caebb99b4d69a9a2edc5e635c6'
            '4a3a27267134942a753ba749a89027b628f73965c2f6e354bde7eff120c34319')

package() {
	install -Dm755 clashctl-Linux $pkgdir/usr/bin/clashctl
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}
