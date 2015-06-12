# Maintainer: Mitsu <archlinux AT suumitsu DOT eu>
pkgname=fadecut
pkgver=0.1.4
pkgrel=2
pkgdesc="Toolset to rip audiostreams, cut, fade in/out and tag the resulting audiofiles"
arch=("i686" "x86_64")
url="http://github.com/micressor/fadecut"
license=('GPL3')
depends=("id3v2" "sox" "streamripper" "vorbis-tools")
optdepends=("lame")
provides=("fadecut")
conflicts=("fadecut")
source=("https://github.com/micressor/$pkgname/archive/$pkgver.tar.gz")

package() {
  cd "$srcdir/fadecut-$pkgver"
  install -Dm755 fadecut "${pkgdir}/usr/bin/fadecut"
  install -Dm755 fcstats "${pkgdir}/usr/bin/fcstats"
  install -D fadecut.1 "${pkgdir}/usr/share/man/man1/fadecut.1"
}

sha512sums=('b6e5169ad497a0d834df273f54551ea5d016e0458d259829b2d38c123ecb6de402666898e3966f4a195a1db3bd3553d64d6b4e4966e537fdcb68dbc4f88ab0c6')

# vim:set ts=2 sw=2 et:
