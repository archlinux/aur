# Maintainer: liberodark

pkgname=cudatext
pkgver=1.68.0.0
pkgrel=1
pkgdesc="Cross-platform text editor"
arch=('x86_64')
url="https://github.com/Alexey-T/CudaText"
license=('MPL')
depends=('python')
source=("https://netix.dl.sourceforge.net/project/cudatext/release/Linux/cudatext_${pkgver}-1_gtk2_amd64.deb")
sha512sums=('4473acf7930817b2dcbd886d65dd47674332dbcbec5babd38cdaf8601b5da9864a5b6d5812b5e87cdec0d92ebdd70d31865d14f451167d758605f01d242ee40b')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr $pkgdir
}
