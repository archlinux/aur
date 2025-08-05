# Maintainer: xotkot
pkgname=refold
pkgver=0.1.2
pkgrel=1
pkgdesc="A command-line utility for wrapping text"
arch=('x86_64')
url="https://github.com/wr7/refold"
license=('GPL-2.0-or-later')
conflicts=(refold-git)
source=("${pkgname}::$url/releases/download/v${pkgver}/${pkgname}-x86_64")
b2sums=('5928be31b87bf441b3c573cbdbf67f15e536f55c5f50c56f769f0a424c32c688da0c285b3e33c49ea3083c649584c420173a5495c4e779b86f265e505624b6c5')

package() {
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
