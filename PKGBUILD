# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=spotrec
pkgver=0.12.0
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
sha256sums=('ed98c6a2df2a5367dfebf454b098ce7075b46f898c0735df33100d75ee8d1aff')

package() {
  mkdir -p "$pkgdir"/usr/bin/
  install -D ${pkgname} "$pkgdir"/usr/bin/
}
