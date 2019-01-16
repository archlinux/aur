# Maintainer: liberodark

pkgname=cudatext
pkgver=1.71.0.5
pkgrel=1
pkgdesc="Cross-platform text editor"
arch=('x86_64')
url="https://github.com/Alexey-T/CudaText"
license=('MPL')
depends=('python')
source=("https://github.com/liberodark/CudaText/releases/download/${pkgver}/cudatext_${pkgver}-1_gtk2_amd64.deb")
sha512sums=('61b41624866d9a4f4d7dc7d49c334f95731890048964d02303639febb4754a42f7ebb0575d146cfcef401948892f63b8e2a2b9dbaffed7dc4e4acdc9773c858b')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr $pkgdir
}
