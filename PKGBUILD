# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=spotifyrecorder
pkgver=0.5.1
pkgrel=1
pkgdesc="Spotify desktop client recorder for PulseAudio"
arch=('x86_64')
url="https://github.com/Bleuzen/spotifyrecorder"
license=('mit')
depends=('python' 'python-dbus' 'ffmpeg' 'gawk')
optdepends=('spotify'
            'audacity'
            'kid3')
source=("https://github.com/Bleuzen/spotifyrecorder/releases/download/${pkgver}/spotifyrecorder.cpython-36.opt-2.pyc"
        "spotifyrecorder")
sha1sums=('cdacc843f2ed7566e70ec36c1c2f48b7b8e9c893'
          '3a8bde845bd1139b1ad58d7bd1e3fb94dfd806ef')

package() {
  mkdir -p "$pkgdir"/opt/spotifyrecorder/
  mkdir -p "$pkgdir"/usr/bin/

  install -D spotifyrecorder.cpython-36.opt-2.pyc "$pkgdir"/opt/spotifyrecorder/
  install -D spotifyrecorder "$pkgdir"/usr/bin/
}
