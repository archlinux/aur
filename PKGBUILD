# Maintainer: Antonio Tauro <eye at eyenx.ch>
pkgname=helm-docs
pkgver=0.13.0
pkgrel=1
pkgdesc="A tool for automatically generating markdown documentation for helm charts"
arch=('x86_64')
url="https://github.com/norwoodj/helm-docs"
license=('GNU General Public License v3.0')
provides=('helm-docs')
depends=('helm')
conflicts=('helm-docs')
source=("https://github.com/norwoodj/helm-docs/releases/download/v${pkgver}/helm-docs_${pkgver}_Linux_x86_64.tar.gz")
md5sums=('0ea6dd6d01b58ede866a00240842493e')
sha256sums=('09a7abbd19da971e4ca2f54c3ca7456a5e825418c5ffd67e5ff4dfdb011521a9')

package() {
  install -D -m755 "$srcdir"/helm-docs "$pkgdir/usr/bin/helm-docs"
}
