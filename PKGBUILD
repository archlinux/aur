# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Robert Kieffer <rek2w @ A L U M N I DOT V I R G I N I A DOT E D U>

pkgname=lib32-mpg123
pkgname32=${pkgname/lib32-/}
license=('LGPL' 'GPL2')
pkgver=1.12.3
pkgrel=1
pkgrel32=1
pkgdesc="A console based real time MPEG Audio Player for Layer 1, 2 and 3"
arch=(x86_64)
groups='lib32'
url="http://sourceforge.net/projects/mpg123"
depends=('lib32-glibc' 'lib32-alsa-lib' 'lib32-libtool>=2.2')
source=(ftp://ftp.archlinux.org/extra/os/i686/${pkgname32}-${pkgver}-${pkgrel32}-i686.pkg.tar.xz)
md5sums=('60521fe9183c3bd09df5b85e97910cd9')

build() {
  install -dm755 ${pkgdir}/opt/lib32/usr/ || return 1
  cp -Rpf ${srcdir}/usr/lib ${pkgdir}/opt/lib32/usr/|| return 1
}

# vim: sw=2:ts=2
