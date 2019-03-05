# Maintainer: liberodark

pkgname=cudatext
pkgver=1.76.2.0
pkgrel=1
pkgdesc="Cross-platform text editor"
arch=('x86_64')
url="https://github.com/Alexey-T/CudaText"
license=('MPL')
depends=('python')
source=("https://github.com/liberodark/CudaText/releases/download/${pkgver}/cudatext_${pkgver}-1_gtk2_amd64.deb")
sha512sums=('70644b8b5b5c2c3fcdf828545e0571825521334d5a255ac02c857d90599e64ebd15123775e92fc409cfb076c54a5543a84409ea6ad1c7499cd069763f8b03e7c')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr $pkgdir
}
