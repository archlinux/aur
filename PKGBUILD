# Maintainer: E5ten <e5ten.arch@gmail.com>

pkgname=yq-bin
pkgver=2.2.1
pkgrel=1
pkgdesc='a portable command-line YAML processor'
arch=('x86_64')
url='https://github.com/mikefarah/yq'
license=('MIT')
provides=('yq')
conflicts=('yq')
source=("https://github.com/mikefarah/yq/releases/download/${pkgver}/yq_linux_amd64")
sha512sums=('2be7f80d3e022067000966f78dfac7601504e14b7500aa7b56833b84bd11a9907d699e2a74f7934c6ccc1f82646abbb4f1c29fe4bc0d31a086afd862afb65520')

package() {
	install -Dm755 $srcdir/yq_linux_amd64 $pkgdir/usr/bin/yq
}

