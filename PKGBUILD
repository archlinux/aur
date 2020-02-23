# Maintainer: Shakib <hello@shakib.tech>
pkgname=local-by-flywheel-bin
pkgver=5.2.5
pkgrel=1
pkgdesc="A program to create a local WordPress development environment."
arch=('x86_64')
url="https://localbyflywheel.com/"
license=('freemium')
makedepends=('rpmextract')
options=('emptydirs')
source=("https://local-by-flywheel-flywheel.netdna-ssl.com/releases/5-2-5/local-5-2-5-linux.rpm")
sha1sums=('8cfb9c25623a38e8409093e3cca7e7034171e301')

package() {
rpmextract.sh ../local-5-2-5-linux.rpm
mv $srcdir/usr $pkgdir/ # /usr & /opt are top-level dirs in the package
mv $srcdir/opt $pkgdir/ 
cd $pkgdir/
}
