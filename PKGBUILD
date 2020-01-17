# Maintainer: Shakib <hello@shakib.tech>
pkgname=local-by-flywheel-bin
pkgver=5.0.6
pkgrel=1
pkgdesc="A program to create a local WordPress development environment."
arch=('x86_64')
url="https://localbyflywheel.com/"
license=('freemium')
makedepends=('rpmextract')
options=('emptydirs')
source=("https://local-by-flywheel-flywheel.netdna-ssl.com/releases/5-0-6/local-5-0-6-linux.rpm")
sha1sums=('82771e5b946e558eb7cd26108ac5b6629078a0d0')

package() {
rpmextract.sh ../local-5-0-6-linux.rpm
mv $srcdir/usr $pkgdir/ # /usr & /opt are top-level dirs in the package
mv $srcdir/opt $pkgdir/ 
cd $pkgdir/
}
