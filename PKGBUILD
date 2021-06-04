# Maintainer: Joost Bremmer <contact@madeofmagicandwires.online>
pkgname=lowpoly-editor
pkgver=1.4
pkgrel=4
pkgdesc="an image editor that allows for easy low polygon vectors"
arch=('any')
url="https://raincomplex.net/lowpolyeditor/"
license=('custom')
groups=()
depends=('python2' 'python2-pygame')
source=('https://www.raincomplex.net/lowpolyeditor/lowpoly-1.4.tar.gz')
sha256sums=('570fb94ee0275540d2e66ee84fe8cd436f4210887027f81e7dc6d6fc5e9da43b')

package() {
   cd ${srcdir}
   install -Dvm755 'lowpoly.py' "${pkgdir}/usr/bin/lowpoly"
   install -Dvm644 'README.txt' "${pkgdir}/usr/share/doc/${pkgname}/README"
}
