pkgname="brother-mfc-l8600cdw"
pkgver="1.1.3"
pkgrel="2"
pkgdesc="LPR and CPUS driver for the Brother MFC-L8600CDW"
url="http://www.brother.com"
license=('GPL')
arch=('i686' 'x86_64')
depends_x86_64=('lib32-glibc')
source=("http://download.brother.com/welcome/dlf101087/mfcl8600cdwcupswrapper-1.1.3-1.i386.rpm"
        "http://download.brother.com/welcome/dlf101086/mfcl8600cdwlpr-1.1.2-1.i386.rpm")
md5sums=('288bdce351549d883423eec2494c96f2'
         'c7f04d3e70e6ce9c9688ff6e7ed0d4b6')

package() {
  cp -R "$srcdir/usr/" "$pkgdir/" || return 1
  cp -R "$srcdir/opt/" "$pkgdir/" || return 1
}
