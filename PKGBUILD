# Maintainer: Sedeer el-Showk <s.elshowk@netherrealm.net>

pkgname=fastqc
pkgver=0.11.9
pkgrel=1
pkgdesc='A quality control tool for high throughput sequence data.'
arch=('any')
url="http://www.bioinformatics.babraham.ac.uk/projects/fastqc"
license=('GPL3')
depends=('perl' 'java-environment>=6' 'ttf-dejavu')
source=("http://www.bioinformatics.babraham.ac.uk/projects/$pkgname/${pkgname}_v$pkgver.zip")
md5sums=('ee7901b681bb2762d75d5a56c7ec6958')

package() {
  mkdir $pkgdir/opt/
  cp -r $srcdir/FastQC/ $pkgdir/opt/

  mkdir -p "${pkgdir}/usr/bin/"
  chmod 755 $pkgdir/opt/FastQC/fastqc
  ln -s "/opt/FastQC/fastqc" "${pkgdir}/usr/bin/"
}
