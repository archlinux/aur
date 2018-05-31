# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=spotrec
pkgver=0.7.2
pkgrel=1
pkgdesc="Spotify desktop client recorder for PulseAudio"
arch=('any')
conflicts=('spotifyrecorder')
provides=('spotifyrecorder')
url="https://github.com/Bleuzen/SpotRec"
license=('mit')
depends=('python' 'python-dbus' 'ffmpeg' 'gawk' 'bash')
optdepends=('spotify'
            'audacity'
            'kid3')
source=("${url}/releases/download/${pkgver}/${pkgname}.cpython-36.opt-2.pyc"
        "${pkgname}")
sha1sums=('aab78c95fbd90a505cd8351b54b754813700e561'
          'a50db4e83ae8776b5798e625a3dcca37b015910c')

package() {
  mkdir -p "$pkgdir"/opt/${pkgname}/
  mkdir -p "$pkgdir"/usr/bin/

  install -D ${pkgname}.cpython-36.opt-2.pyc "$pkgdir"/opt/${pkgname}/
  install -D ${pkgname} "$pkgdir"/usr/bin/
}
