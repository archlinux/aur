# Maintainer: Fynth <https://github.com/Fynth>
pkgname=vela-music-bin
pkgver=0.12.8
pkgrel=1
pkgdesc='Private Vela music library and native player'
arch=('x86_64')
url='https://github.com/Fynth/vela'
license=('AGPL-3.0-or-later')
depends=('glibc>=2.39' 'gtk3' 'webkit2gtk-4.1' 'alsa-lib' 'libx11' 'libxtst' 'libxinerama' 'systemd-libs')
optdepends=('libsecret: remember a session through Secret Service')
options=('!strip' '!debug')
source=('https://github.com/Fynth/vela/releases/download/v0.12.8/vela-music-bin-0.12.8-x86_64.tar.gz')
sha256sums=('5d4662e34841a45b428eae66542cbe2c7f6c44c80e2e238416a18ecf92773777')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
