# Maintainer: liberodark

pkgname=cudatext
pkgver=1.67.0.0
pkgrel=1
pkgdesc="Cross-platform text editor"
arch=('x86_64')
url="https://github.com/Alexey-T/CudaText"
license=('MPL')
depends=('python')
source=("https://netix.dl.sourceforge.net/project/cudatext/release/Linux/cudatext_${pkgver}-1_gtk2_amd64.deb")
sha512sums=('d193d9ef2abfcb39bffd1646c32015265dc4f447a9bc32eabb79eb6eeb3891dd9561975e688fb94acb3a5b9a72779e846c8681047027329a6e95989dce5fe9d5')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr $pkgdir
}
