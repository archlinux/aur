# Maintainer: Fynth <https://github.com/Fynth>
pkgname=vela-music-bin
pkgver=0.12.10
pkgrel=1
pkgdesc='Private Vela music library and native player'
arch=('x86_64')
url='https://github.com/Fynth/vela'
license=('AGPL-3.0-or-later')
depends=('glibc>=2.39' 'gtk3' 'webkit2gtk-4.1' 'alsa-lib' 'libx11' 'libxtst' 'libxinerama' 'systemd-libs')
optdepends=('libsecret: remember a session through Secret Service')
options=('!strip' '!debug')
source=('https://github.com/Fynth/vela/releases/download/v0.12.10/vela-music-bin-0.12.10-x86_64.tar.gz')
sha256sums=('1e5a3e7f4605360acc3457c1742d963bc55042aadc21d7d766028dc2f5b7684d')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
