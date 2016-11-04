<<<<<<< HEAD
pkgname=libevdevc-git
=======
# Maintained by Joseph Riches

pkgname=libevdevc
>>>>>>> 18d5502329cdf2ab75d81e9ad9e4210ed6be2e50
pkgdesc="Chromium OS libevdev"
pkgver=2.0
pkgrel=1
arch=(i686 x86_64)
<<<<<<< HEAD
url="https://github.com/galliumos/libevdevc"
license=('custom:chromiumos')
_gitname='libevdevc'
depends=('glibc')
makedepends=('git' 'python2' 'check' 'valgrind' 'doxygen')
conflicts=('libevdevc')

source=("$_gitname::git+https://github.com/galliumos/libevdevc.git")

md5sums=('SKIP')

build() {
    cd "$srcdir/$_gitname"
    make
}

check() {
    cd "$srcdir/$_gitname"
    make check || /bin/true
}

package() {
    make -C "$srcdir/$_gitname" DESTDIR="${pkgdir}" install
=======
url="https://github.com/hugegreenbug/libevdevc"
license=('custom:chromiumos')
depends=('glibc')
options=('!emptydirs' '!strip')

source=('ChromiumOS_Licence.txt')
source_x86_64=("${pkgname}_${pkgver}-ubuntu4_amd64.deb::https://launchpad.net/~hugegreenbug/+archive/ubuntu/cmt2/+files/${pkgname}_${pkgver}-ubuntu4_amd64.deb")
source_i686=("${pkgname}_${pkgver}-ubuntu4_i386.deb::https://launchpad.net/~hugegreenbug/+archive/ubuntu/cmt2/+files/${pkgname}_${pkgver}-ubuntu4_i386.deb")

md5sums=('af314be4bf04a749665a07203b120f54')
md5sums_x86_64=('f76beab95337525666e03789bd250c24')
md5sums_i686=('287715207a88d3f213a80d15332133a6')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  install -Dm644 ChromiumOS_Licence.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENCE
>>>>>>> 18d5502329cdf2ab75d81e9ad9e4210ed6be2e50
}
