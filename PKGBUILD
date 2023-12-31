# Contributor: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Small and embeddable JavaScript engine'
pkgname=quickjs-bin
pkgver=2023.12.09
pkgrel=1
url=https://bellard.org/quickjs
depends=(glibc)
arch=(x86_64 i686)
license=(MIT)
source=(https://raw.githubusercontent.com/bellard/quickjs/b5e62895c619d4ffc75c9d822c8d85f1ece77e5b/LICENSE)
source_x86_64=("https://bellard.org/quickjs/binary_releases/quickjs-linux-x86_64-${pkgver//./-}.zip")
source_i686=("https://bellard.org/quickjs/binary_releases/quickjs-linux-i686-${pkgver//./-}.zip")
sha512sums=('672a4dba83f155c854f9699937a9d3fb48a83435fb58b949dc65b1753ef6ed8f2bea4a1cd96f379f86d364c8c6c51fa13967034e0cdcdc851e8de3284ec9b75a')
sha512sums_x86_64=('2c1ecaafa619dd2e3f20896a0a6a266f135c3cdbe2051b56f563d66602ad4f23628c88edec1c6b13dcbe49d47c9cb2cd3eb165ff827b2673985c1b348e46119e')
sha512sums_i686=('381de9e4de582a58ca3b395952ca41e1e87ed484f95721ac8767b6510a94b9a56be6bfd3525eebed802f547fd3bda0d593a2d77ae398b1482fc4c760ba6f05c8')

package() {
	install -vDm755 qjs -t $pkgdir/usr/bin
	install -vDm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
