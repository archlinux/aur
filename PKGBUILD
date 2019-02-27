# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=spotrec
pkgver=0.11.2
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
sha256sums=('582b94bf5201aed60c993831280d729ab7be5d3c16a8c71e63d5116e87f4d431')

package() {
  mkdir -p "$pkgdir"/usr/bin/
  install -D ${pkgname} "$pkgdir"/usr/bin/
}
