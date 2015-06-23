# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: philomath <philomath868 AT gmail DOT com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=xjobs
pkgver=20140125
pkgrel=1
pkgdesc="A utility like xargs, but with enhanced support for multiprocessor machines"
arch=('i686' 'x86_64')
url="http://www.maier-komor.de/xjobs.html"
license=('GPLv2')
depends=('glibc')
source=("http://www.maier-komor.de/xjobs/$pkgname-$pkgver.tgz")
md5sums=('05d8ea4d83e7cb3694a43c6bb27e0a56')
sha1sums=('6c577d7d73e0ae1d0953bbece30d465e1348f694')
sha256sums=('cbe582b1109c380bd80a02eb21b721dcfc5ef701446bfc9606b99246a84e737a')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

