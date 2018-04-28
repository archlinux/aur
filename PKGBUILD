# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=mybackup
pkgver=v144
pkgrel=1
pkgdesc="The best Android backup tool with PC integration."
arch=('x86_64')
url="https://www.rerware.com/"
license=('custom')
makedepends=()
depends=('java-environment' 'bash')
source=('mybackuplinux.tar::https://www.rerware.com/MyBackupPC/DownloadFile.aspx?os=8&flv=3&v=144')
md5sums=('b37a1982902111f9cf615a88a67da820')


package() {
  cp -Rfp $srcdir/usr $srcdir/etc $pkgdir/
}
