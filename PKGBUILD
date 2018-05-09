# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: M0Rf30

pkgname=r-studio
pkgver=4.3.2961
pkgrel=1
pkgdesc='Undelete and data recovery software'
arch=(i686 x86_64)
url='https://www.r-studio.com/data_recovery_linux/'
license=(custom)
depends=(sudo xdg-utils)
source_i686=(http://www.r-tt.com/downloads/RStudio4_i386.deb)
source_x86_64=(http://www.r-tt.com/downloads/RStudio4_x64.deb)
sha512sums_i686=(9e78376c956c916ca0540545dd65cae152f21cf955e75912495a5b2f1c6ccf87bfdfa0249cebdd7f5d8cf171e730f1504a43c1eeee186929ce9b88c03dc84041)
sha512sums_x86_64=(88ad54220770e523322c1645d7d89b885636d0b29d60d6aa3b67863d50383f752b0a6c286e04f3ec3b5ad58509ea70d7ccc67cb8abe8be708bad2f640d24f8e3)
        
package() {
  cd $srcdir

  tar xvf data.tar.gz
  cp -r usr $pkgdir

  install -Dm 644 $pkgdir/usr/local/R-Studio/share/logo_48.png $pkgdir/usr/share/pixmaps/rtt-rstudio.png
  install -Dm 644 $pkgdir/usr/local/R-Studio/share/rtt-rstudio.desktop $pkgdir/usr/share/applications/rtt-rstudio.desktop
}
