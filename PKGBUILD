# Maintainer: Sedeer el-Showk <s.elshowk@netherrealm.net>

pkgname=fastqc
pkgver=0.11.8
pkgrel=1
pkgdesc='A quality control tool for high throughput sequence data.'
arch=('any')
url="http://www.bioinformatics.babraham.ac.uk/projects/fastqc"
license=('GPL3')
depends=('perl' 'java-environment>=6' 'ttf-dejavu')
source=("http://www.bioinformatics.babraham.ac.uk/projects/$pkgname/${pkgname}_v$pkgver.zip")
md5sums=('bdaf3b9fe957681b3a12349fdfa1c6c0')

package() {
  mkdir $pkgdir/opt/
  cp -r $srcdir/FastQC/ $pkgdir/opt/

  mkdir -p "${pkgdir}/usr/bin/"
  chmod 755 $pkgdir/opt/FastQC/fastqc
  ln -s "/opt/FastQC/fastqc" "${pkgdir}/usr/bin/"
}
