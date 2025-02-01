# Maintainer: CrossScar <crossscar@proton.me>
pkgname=ssfn-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Scalable Screen Font 2.0 renderer and file format specification."
arch=('x86_64')
url="https://gitlab.com/bztsrc/scalable-font2"
license=('MIT')
source=('https://gitlab.com/bztsrc/scalable-font2/-/raw/76658c2064d985e5d4cde400d4975dcf96a533cc/ssfn_2.0.0-amd64.deb')
sha256sums=('SKIP')

prepare() {
  tar -zvxf data.tar.gz
  ls -a
}

package() {
  cp -r usr/ "$pkgdir"/usr
}
