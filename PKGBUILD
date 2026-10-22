# Maintainer: Fynth <https://github.com/Fynth>
pkgname=vela-music-bin
pkgver=0.12.9
pkgrel=1
pkgdesc='Private Vela music library and native player'
arch=('x86_64')
url='https://github.com/Fynth/vela'
license=('AGPL-3.0-or-later')
depends=('glibc>=2.39' 'gtk3' 'webkit2gtk-4.1' 'alsa-lib' 'libx11' 'libxtst' 'libxinerama' 'systemd-libs')
optdepends=('libsecret: remember a session through Secret Service')
options=('!strip' '!debug')
source=('https://github.com/Fynth/vela/releases/download/v0.12.9/vela-music-bin-0.12.9-x86_64.tar.gz')
sha256sums=('f661155c2708a6ba2b981aacb4e39c1edb925b32def0e92280616ea1f81cbf1f')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
