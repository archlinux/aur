# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=spotifyrecorder
pkgver=0.1.1
pkgrel=2
pkgdesc="A recorder script for the Spotify desktop client"
arch=('x86_64')
url="https://github.com/Bleuzen/spotifyrecorder"
license=('mit')
depends=('python' 'python-dbus' 'ffmpeg')
optdepends=('spotify'
            'audacity'
            'kid3')
source=("https://github.com/Bleuzen/spotifyrecorder/releases/download/${pkgver}/spotifyrecorder.cpython-36.opt-1.pyc"
        "spotifyrecorder")
sha1sums=('7ed1cec357ad0b04d23853f402542d541b02c940'
          'ba07da8c0c077ec6e74390ee29d0f358e184b227')

package() {
  mkdir -p "$pkgdir"/opt/spotifyrecorder/
  mkdir -p "$pkgdir"/usr/bin/

  install -D spotifyrecorder.cpython-36.opt-1.pyc "$pkgdir"/opt/spotifyrecorder/
  install -D spotifyrecorder "$pkgdir"/usr/bin/
}
