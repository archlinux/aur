# Maintainer: Andy Russell <arussell123@gmail.com>
# Contributor: Xavier Benderitter <phenomenologeek at gmail.com>
pkgname=gbdk
pkgver=2.96a
pkgrel=2
pkgdesc="GAMEBOY Developers Kit"
arch=(x86_64 i686)
url="http://gbdk.sourceforge.net/"
license=('GPL')
depends=('lib32-glibc')
conflicts=('lcc')
install=gbdk.install
_arch=i586
source=(http://downloads.sourceforge.net/project/gbdk/gbdk/2.96/gbdk-$pkgver-$_arch-pc-linux2.2.tar.gz)
md5sums=('1d10b9192974c442abc3ddceb8145a13')

package() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/opt

  mv $pkgname ${pkgdir}/opt
  ln -sf /opt/gbdk/bin/lcc ${pkgdir}/usr/bin/lcc
}
