# Contributor: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Asuka Minato <i at asukaminato dot eu dot org>
pkgdesc='Small and embeddable JavaScript engine'
pkgname=quickjs-bin
pkgver=2024.01.13
pkgrel=1
url=https://bellard.org/quickjs
depends=(glibc)
arch=(x86_64 i686)
license=(MIT)
source=(https://raw.githubusercontent.com/bellard/quickjs/b5e62895c619d4ffc75c9d822c8d85f1ece77e5b/LICENSE)
source_x86_64=("https://bellard.org/quickjs/binary_releases/quickjs-linux-x86_64-${pkgver//./-}.zip")
source_i686=("https://bellard.org/quickjs/binary_releases/quickjs-linux-i686-${pkgver//./-}.zip")
sha512sums=('672a4dba83f155c854f9699937a9d3fb48a83435fb58b949dc65b1753ef6ed8f2bea4a1cd96f379f86d364c8c6c51fa13967034e0cdcdc851e8de3284ec9b75a')
sha512sums_x86_64=('512eff4f3ac5baa4f7b1be45e3bdb494466b6bdb474328cfb8a4e3d2e04afcc918a31f8035f20056c96622c63aed38f058d66505ed1b46cfe0ee5804817a4fcf')
sha512sums_i686=('fe668289928f905ee8aefb0c783c140b35aaf5b2ca520cb98bb98749cba6ead86c15cd9a1713897b41ec3f0db17f1c742acd05eadb4addcecb1643769de6df97')

package() {
	install -vDm755 qjs -t $pkgdir/usr/bin
	install -vDm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
