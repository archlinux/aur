# Maintainer: Will Price <will.price94+aur@gmail.com>
pkgname=platformio-git
pkgver=20140913
pkgrel=2
pkgdesc="A cross-platform code builder and library manager"
arch=('x86_64' 'i686')
url="http://platformio.ikravets.com/"
license=('GPL')
groups=()
depends=('python2' 'python2-click' 'python2-bottle')
makedepends=()
checkdepends=()
optdepends=('energia: For MSP430 based projects'
            'arduino: For Arduino based projects')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('git+https://github.com/ivankravets/platformio.git')
md5sums=('SKIP')
noextract=()
package() {
  cd "$srcdir/${pkgname%%-git}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
