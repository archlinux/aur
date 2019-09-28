# Maintainer: Mauricio López <mauricio.pronet@gmail.com>
pkgname=local-by-flywheel
pkgver=5.0.5
pkgrel=1
pkgdesc="A program to create a local WordPress development environment."
arch=('x86_64')
url="https://localbyflywheel.com/"
license=('freemium')
depends=('')
makedepends=('rpmextract')
options=('emptydirs')
source=("https://local-by-flywheel-flywheel.netdna-ssl.com/releases/5-0-5/local-5-0-5-linux.rpm")
md5sums=('72d65076cf89ba3d65e3a75a69e8fe65')

package() {
rpmextract.sh ../local-5-0-5-linux.rpm
mv $srcdir/usr $pkgdir/ # /usr & /opt are top-level dirs in the package
mv $srcdir/opt $pkgdir/ 
cd $pkgdir/
}
