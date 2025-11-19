# Maintainer: Lee Yingtong Li <archlinux@yingtongli.me>
pkgname=diff2html-cli
pkgver=5.2.15
pkgrel=1
pkgdesc="Diff to Html generates pretty HTML diffs from unified and git diff output in your terminal"
arch=("any")
url="https://github.com/rtfpessoa/diff2html-cli"
license=("MIT")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=("SKIP")

package() {
	npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
}
