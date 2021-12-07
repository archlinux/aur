# Maintainer: Bleuzen <supgesu at gmail dot com>

pkgname=spotrec
pkgver=0.15.1
pkgrel=1
pkgdesc="Spotify desktop client recorder for PulseAudio"
arch=('any')
url="https://github.com/Bleuzen/SpotRec"
license=('mit')
depends=('python' 'python-dbus' 'ffmpeg' 'gawk' 'bash')
optdepends=('spotify')
source=("spotrec::${url}/releases/download/v${pkgver}/${pkgname}.py"
        "https://raw.githubusercontent.com/Bleuzen/SpotRec/master/LICENSE")
md5sums=('3c1c157712fd1f9eecab411a32f743ec'
         'SKIP')

package() {
  mkdir -p "$pkgdir"/usr/bin/
  install -D ${pkgname} "$pkgdir"/usr/bin/
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
