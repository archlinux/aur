# Maintainer: Antonio Tauro <eye at eyenx.ch>
pkgname=helm-docs
pkgver=1.13.1
pkgrel=1
pkgdesc="A tool for automatically generating markdown documentation for helm charts"
arch=('x86_64')
url="https://github.com/norwoodj/helm-docs"
license=('GPL-3.0-or-later')
depends=('helm')
source=("https://github.com/norwoodj/helm-docs/releases/download/v${pkgver}/helm-docs_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('df8d803506933ceb92bc2996d8a432059a35fc19a308ac37a141971ffdf7aa33')

package() {
	install -D -m755 "$srcdir"/helm-docs "$pkgdir/usr/bin/helm-docs"
}
