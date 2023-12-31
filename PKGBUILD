# Contributor: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Small and embeddable JavaScript engine'
pkgname=quickjs-bin
pkgver=2021.03.27
pkgrel=1
url=https://bellard.org/quickjs
depends=(glibc)
arch=(x86_64 i686)
license=(MIT)
source=(https://raw.githubusercontent.com/bellard/quickjs/b5e62895c619d4ffc75c9d822c8d85f1ece77e5b/LICENSE)
source_x86_64=("https://bellard.org/quickjs/binary_releases/quickjs-linux-x86_64-${pkgver//./-}.zip")
source_i686=("https://bellard.org/quickjs/binary_releases/quickjs-linux-i686-${pkgver//./-}.zip")
sha512sums=('672a4dba83f155c854f9699937a9d3fb48a83435fb58b949dc65b1753ef6ed8f2bea4a1cd96f379f86d364c8c6c51fa13967034e0cdcdc851e8de3284ec9b75a')
sha512sums_x86_64=('eede492ddac12847d9c14f286e4d59c841f8ee46d45ebe775a5b909382213f40425eb691a2e4e2c44cedd02b6984fd9857f7e54bdd557ad3045862a30f564544')
sha512sums_i686=('6e8c25e562278e779276cf632a36ae66210fb2bf006c7a4ba9a7e616467a0e4fe82115f7c3982d175898b0bded1c0ff2fda13d5371bcec5a1e0e81bc84b42587')

package() {
	install -vDm755 qjs -t $pkgdir/usr/bin
	install -vDm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
