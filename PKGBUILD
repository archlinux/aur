# Maintainer: E5ten <e5ten.arch@gmail.com>

pkgname=yq-bin
pkgver=2.2.0
pkgrel=1
pkgdesc='a portable command-line YAML processor'
arch=('x86_64')
url='https://github.com/mikefarah/yq'
license=('MIT')
provides=('yq')
conflicts=('yq')
source=("https://github.com/mikefarah/yq/releases/download/${pkgver}/yq_linux_amd64")
sha512sums=('7f5162c73e7ba4620964fd7d33082780c2c0c01153694ab77e094d01a360047902343c1e7bfc3a2f43c3152dc82c4a5b1ad3bef4fca1d8200cbc4c560f310e8e')

package() {
	install -Dm755 $srcdir/yq_linux_amd64 $pkgdir/usr/bin/yq
}

