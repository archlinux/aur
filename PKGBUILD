# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=spotrec
pkgver=0.13.0
pkgrel=1
pkgdesc="Spotify desktop client recorder for PulseAudio"
arch=('any')
url="https://github.com/Bleuzen/SpotRec"
license=('mit')
depends=('python' 'python-dbus' 'ffmpeg' 'gawk' 'bash')
optdepends=('spotify'
            'audacity'
            'kid3')
source=("spotrec::${url}/releases/download/v${pkgver}/${pkgname}.py")
md5sums=('ef9f6f30245bdcd9f2f499643aeb9554')

package() {
  mkdir -p "$pkgdir"/usr/bin/
  install -D ${pkgname} "$pkgdir"/usr/bin/
}
