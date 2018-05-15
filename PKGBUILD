# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=spotifyrecorder
pkgver=0.2
pkgrel=1
pkgdesc="A recorder script for the Spotify desktop client with PulseAudio"
arch=('x86_64')
url="https://github.com/Bleuzen/spotifyrecorder"
license=('mit')
depends=('python' 'python-dbus' 'ffmpeg')
optdepends=('spotify'
            'audacity'
            'kid3')
source=("https://github.com/Bleuzen/spotifyrecorder/releases/download/${pkgver}/spotifyrecorder.cpython-36.opt-2.pyc"
        "spotifyrecorder")
sha1sums=('27b57d4759639e669b435c4b640b9a952890b637'
          '3a8bde845bd1139b1ad58d7bd1e3fb94dfd806ef')

package() {
  mkdir -p "$pkgdir"/opt/spotifyrecorder/
  mkdir -p "$pkgdir"/usr/bin/

  install -D spotifyrecorder.cpython-36.opt-2.pyc "$pkgdir"/opt/spotifyrecorder/
  install -D spotifyrecorder "$pkgdir"/usr/bin/
}
