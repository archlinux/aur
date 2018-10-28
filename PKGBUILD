# Maintainer: E5ten <e5ten.arch@gmail.com>

pkgname=yq-bin
pkgver=2.1.2
pkgrel=1
pkgdesc='yq is a portable command-line YAML processor'
arch=('x86_64')
url='https://github.com/mikefarah/yq'
license=('MIT')
provides=('yq')
conflicts=('yq')
source=('https://github.com/mikefarah/yq/releases/download/2.1.2/yq_linux_amd64')
sha512sums=('d43a5469b4df7734b5f943cf3d88a23d94f83d72cbff64694564c4bb56a52cf78c3a2e8a4e976f3572a5a9de84c4b060f77964d932a018b0ab2cf4a8a34e8e10')

package() {
	install -Dm755 $srcdir/yq_linux_amd64 $pkgdir/usr/bin/yq
}

