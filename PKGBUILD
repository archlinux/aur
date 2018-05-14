# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=spotifyrecorder
pkgver=0.1
pkgrel=1
pkgdesc="A Spotify recorder script"
arch=('x86_64')
url="https://github.com/Bleuzen/spotifyrecorder"
license=('mit')
depends=('python' 'python-dbus' 'ffmpeg')
optdepends=('spotify'
            'audacity'
            'kid3')
source=("https://github.com/Bleuzen/spotifyrecorder/releases/download/${pkgver}/spotifyrecorder.cpython-36.opt-1.pyc"
        "spotifyrecorder")
sha1sums=('0e6ddad09df7a28f82628d7732d6b177775ce9f9'
          'ba07da8c0c077ec6e74390ee29d0f358e184b227')

package() {
  mkdir -p "$pkgdir"/opt/spotifyrecorder/
  mkdir -p "$pkgdir"/usr/bin/

  install -D spotifyrecorder.cpython-36.opt-1.pyc "$pkgdir"/opt/spotifyrecorder/
  install -D spotifyrecorder "$pkgdir"/usr/bin/
}
