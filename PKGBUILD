# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=spotrec
pkgver=0.10.0
pkgrel=1
pkgdesc="Spotify desktop client recorder for PulseAudio"
arch=('any')
url="https://github.com/Bleuzen/SpotRec"
license=('mit')
depends=('python' 'python-dbus' 'ffmpeg' 'gawk' 'bash')
optdepends=('spotify'
            'audacity'
            'kid3')
source=("${url}/releases/download/${pkgver}/${pkgname}.cpython-37.opt-2.pyc"
        "${pkgname}")
sha256sums=('a6efb80f7368e36700fc262756fbc2900c0e0c08535fab9a42f5ce98bb6fd7f8'
          'c16ff3015985fd3877124d4c8b960d8a1b72499d757e72ea37fc4bf38fdca68b')

package() {
  mkdir -p "$pkgdir"/opt/${pkgname}/
  mkdir -p "$pkgdir"/usr/bin/

  install -D ${pkgname}.cpython-37.opt-2.pyc "$pkgdir"/opt/${pkgname}/
  install -D ${pkgname} "$pkgdir"/usr/bin/
}
