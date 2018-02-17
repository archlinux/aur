# Maintainer: Mitsu <archlinux AT suumitsu DOT eu>
pkgname=fadecut
pkgver=0.2.1
pkgrel=2
pkgdesc="Toolset to rip audiostreams, cut, fade in/out and tag the resulting audiofiles"
arch=("i686" "x86_64")
url="https://github.com/fadecut/fadecut"
license=('GPL3')
depends=("id3v2" "sox" "streamripper" "vorbis-tools" "opus-tools")
optdepends=("lame")
provides=("fadecut")
conflicts=("fadecut")
source=("https://github.com/fadecut/$pkgname/archive/$pkgver.tar.gz")

package() {
  cd "$srcdir/fadecut-$pkgver"
  install -Dm755 fadecut "${pkgdir}/usr/bin/fadecut"
  install -Dm755 fcstats "${pkgdir}/usr/bin/fcstats"
  install -D "man/fadecut.1.md" "${pkgdir}/usr/share/man/man1/fadecut.1"
}

sha512sums=('6eb0e557bf3720da9b9d9409ecfca8124c04f8ee860bf59fd685c29b994e1a73f45b82080a5ea1c9a2fbd6f7970e190bff4c0ba54959e501b17239cc6eca2e62')

# vim:set ts=2 sw=2 et:
