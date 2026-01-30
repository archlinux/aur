# Maintainer: Steve Linn <adevsteve at proton dot me>

pkgname=brother-mfcl5705dw-lpr
pkgver=3.5.1
pkgrel=1
pkgdesc="LPR driver: Brother MFC-L5705DW"
arch=('armv7l' 'i686' 'x86_64')
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=mfcl5705dw_us"
license=("unknown")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf105273/mfcl5705dwlpr-3.5.1-1.i386.deb")
sha256sums=('a6121385482f138f8021d72c07972a33f09496b9b9d8ba5a28e9f118b21c865b')

package() {
  tar -xf data.tar.gz -C "${pkgdir}"
}
