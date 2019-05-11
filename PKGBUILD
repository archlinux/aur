# Maintainer: ZJLIN <zjin841126@gmail.com>
pkgname=trimmomatic
pkgver=0.39
pkgrel=1
pkgdesc='Trimmomatic: A flexible read trimming tool for Illumina NGS data'
arch=('any')
url="http://www.usadellab.org/cms/?page=trimmomatic"
license=('GPL3')
depends=('java-environment>=6')
source=("http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-$pkgver.zip"
        "trimmomatic"
        )
md5sums=('271ed9dca91132eee0c960e0ae487bcd'
         'f48f380f206cb5f85bc25b8cf2c35d99')

package() {
    mkdir $pkgdir/opt/
    mv $srcdir/Trimmomatic-$pkgver $srcdir/Trimmomatic
    cp -r $srcdir/Trimmomatic/ $pkgdir/opt/

    mkdir -p "${pkgdir}/usr/bin/"
    install $srcdir/trimmomatic $pkgdir/usr/bin
}
