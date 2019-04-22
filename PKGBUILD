# Maintainer: Jonathon Fernyhough <jonathon_at manjaro ddoott org>
# Contributor: Felix Berkenkamp <felix1012 at gmx dot de>
# Contributor: Simon Génier <sgenier at gmain dot com>
# Contributor: Max Pray a.k.a. Synthead <synthead at gmail dot com>
# Contributor: Ray Kohler <ataraxia937 at gmail dot com>
# Category: lib

pkgname=lib32-libxp
pkgver=1.0.3
pkgrel=1
pkgdesc="X11 X Print Library (32-bit)"
arch=(x86_64)
url=https://xorg.freedesktop.org/
license=(GPL)
depends=(lib32-libxext)

_pkgrel32=2.2
source=(http://pool.mirror.archlinux32.org/i686/extra/${pkgname/lib32-/}-$pkgver-$_pkgrel32-i686.pkg.tar.xz{,.sig})
sha256sums=('dd1656f29e0ace91dc1846d51d3f47b83aeeb08ba94335929a14e3e71fdb8b37'
            'SKIP')
validpgpkeys=(16194A82231E9EF823562181C8E8F5A0AF9BA7E7) # 'Andreas Bauman'

package() {
	install -d ${pkgdir}/usr/lib32
	cp -rPf ${srcdir}/usr/lib/* ${pkgdir}/usr/lib32
}
