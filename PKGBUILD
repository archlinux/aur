# Maintainer: Michael Del Rosario <m@delrosariomichael.com>
pkgname='kubecolor'
pkgver=0.0.20
pkgrel=2
pkgdesc='Colorize your kubectl output'
url='https://github.com/dty1er/kubecolor'
arch=('x86_64')
license=('MIT')
depends=('kubectl')
source=("https://github.com/dty1er/kubecolor/releases/download/v${pkgver}/kubecolor_${pkgver}_Linux_${arch}.tar.gz")
md5sums=('93b056079ea07ca6bdae9267f628a6e7')
package() {
	install -Dm755 "$srcdir/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"	
}
