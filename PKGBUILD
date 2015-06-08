# Contributor: $pooky Hunter <spookyh+arch@gmail.org>

pkgname=apt-mirror
pkgver=0.5.1
pkgrel=2
pkgdesc="APT sources mirroring tool"
arch=('i686' 'x86_64')
url="http://packages.debian.org/source/sid/apt-mirror"
license=('GPL')
depends=('perl')
makedepends=('')
source=(http://ftp.de.debian.org/debian/pool/main/a/apt-mirror/apt-mirror_$pkgver.orig.tar.xz)
md5sums=('b826e868ea439aa960433ceceb63e19d')
backup=('etc/apt/mirror.list' 'etc/apt/mirror_jessie.list')

build() {
    cd $srcdir/$pkgname-$pkgver
    install -d ${pkgdir}/etc/apt
    install -d ${pkgdir}/usr/bin
    install -d ${pkgdir}/var/spool/apt-mirror/{var,skel,mirror}
    install -m755 $srcdir/$pkgname-$pkgver/apt-mirror ${pkgdir}/usr/bin/
}
