# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=spotrec
pkgver=0.11.1
pkgrel=1
pkgdesc="Spotify desktop client recorder for PulseAudio"
arch=('any')
url="https://github.com/Bleuzen/SpotRec"
license=('mit')
depends=('python' 'python-dbus' 'ffmpeg' 'gawk' 'bash')
optdepends=('spotify'
            'audacity'
            'kid3')
source=("${url}/releases/download/v${pkgver}/${pkgname}.bin"
        "${pkgname}")
sha256sums=('3b6a5feb9f1a4556d54bee77c134fb1fd3b21f7df6c7e0eb3d0733e38b197b92'
            'd948a4e77b34eb8bcb8b0f4d3279eaf233cb91082eaf3b389b0a7094fc339b82')

package() {
  mkdir -p "$pkgdir"/opt/${pkgname}/
  mkdir -p "$pkgdir"/usr/bin/

  install -D ${pkgname}.bin "$pkgdir"/opt/${pkgname}/
  install -D ${pkgname} "$pkgdir"/usr/bin/
}
