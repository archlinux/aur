# Maintainer:  Felix Berkenkamp <felix1012 at gmx dot de>
# Contributor: Simon Génier <sgenier at gmain dot com>
# Contributor: Max Pray a.k.a. Synthead <synthead at gmail dot com>
# Contributor: Ray Kohler <ataraxia937 at gmail dot com>
# Category: lib

pkgname=lib32-libxp
pkgname32=${pkgname/lib32-/}
pkgver=1.0.3
pkgrel=1
pkgrel32=1
pkgdesc="X11 X Print Library"
arch=('x86_64')
url="http://xorg.freedesktop.org/"
license=('GPL')
depends=('lib32-libxext')
source=(http://mirror.yandex.ru/archlinux/extra/os/i686/${pkgname32}-${pkgver}-${pkgrel32}-i686.pkg.tar.xz)
md5sums=('6e81313cbb597707c861514d0367c5f6')

package() {
mkdir -p ${pkgdir}/usr/lib32
cp -rPf ${srcdir}/usr/lib/* ${pkgdir}/usr/lib32
}
