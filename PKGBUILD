# Maintainer: dadav <33197631+dadav@users.noreply.github.com>
pkgname=jsonnet-bundler-ng-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Jsonnet package manager."
arch=('x86_64')
url="https://github.com/dadav/jsonnet-bundler-ng"
license=('Apache')
source=("https://github.com/dadav/jsonnet-bundler-ng/releases/download/${pkgver}/jsonnet-bundler-ng_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('955c3bb97be38c1a9d87bac23c709ff707724071c19d8da6713131bdefe79f96')

package() {
	install -D -m755 "$srcdir"/jb-ng "$pkgdir/usr/bin/jb-ng"
}
