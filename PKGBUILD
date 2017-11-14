# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: M0Rf30

pkgname=r-studio
pkgver=4.2.2901
pkgrel=1
pkgdesc="Undelete and data recovery software"
arch=('i686' 'x86_64')
url="http://www.r-tt.com/data_recovery_linux/"
license=('custom')
depends=('xdg-utils')
source_i686=("http://www.r-tt.com/downloads/RStudio4_i386.deb")
source_x86_64=("http://www.r-tt.com/downloads/RStudio4_x64.deb")
sha512sums_i686=('bbc54ba1d1716241e5174461133d32cac7fd820a8c9c03e9d190d47d3b46c696db76d01d223b9f391b284873b40253c77d9f2ec246ea70648f8e02023689e598')
sha512sums_x86_64=('352fa0225e05d648b83b01b7efcfa9888c7630013b5e6b05441a1f31298a913ede0da5f59307cfa6137a1ab5e5481f0640a69fbce93bbcc1a7b943b3a2d94c9f')
        
package() {
  cd $srcdir

  tar xvf data.tar.gz
  cp -r usr $pkgdir

  install -Dm 644 $pkgdir/usr/local/R-Studio/share/logo_48.png $pkgdir/usr/share/applications/rtt-rstudio.png
  install -Dm 644 $pkgdir/usr/local/R-Studio/share/rtt-rstudio.desktop $pkgdir/usr/share/applications/
}
