# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=spotrec
pkgver=0.11.0
pkgrel=1
pkgdesc="Spotify desktop client recorder for PulseAudio"
arch=('any')
url="https://github.com/Bleuzen/SpotRec"
license=('mit')
depends=('python' 'python-dbus' 'ffmpeg' 'gawk' 'bash')
optdepends=('spotify'
            'audacity'
            'kid3')
source=("${url}/releases/download/${pkgver}/${pkgname}.bin"
        "${pkgname}")
sha256sums=('97c4e7fe4086e4a9ee184e2e5ffc477cc1b2e570eb42d84090f7215fb42b2a6a'
            'd948a4e77b34eb8bcb8b0f4d3279eaf233cb91082eaf3b389b0a7094fc339b82')

package() {
  mkdir -p "$pkgdir"/opt/${pkgname}/
  mkdir -p "$pkgdir"/usr/bin/

  install -D ${pkgname}.bin "$pkgdir"/opt/${pkgname}/
  install -D ${pkgname} "$pkgdir"/usr/bin/
}
