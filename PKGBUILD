# Maintainer: Christoph J. Thompson <thompsonc at protonmail dot ch>

pkgname=ttf-fixedsys-excelsior-linux
pkgver=3.02.9
pkgrel=1
pkgdesc="fixedsys font for linux, use only at 12pt"
arch=('any')
url="https://github.com/kika/fixedsys"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
license=('custom')
install="ttf-fixedsys-excelsior-linux.install"
source=("${url}/releases/download/v${pkgver}/FSEX302.ttf"
        "${url}/releases/download/v${pkgver}/FSEX302-alt.ttf")
sha256sums=('b3f8e1da97b722a42477ee9a72f953eb2bc7c2195df5e2b6b7d4781dd3f8b2cc'
            'e4abb547b387d4676892f2db7c4a19d5cda0a91680ccc52331b2b49456e307da')

package() {
  install -dm755 "${pkgdir}/usr/share/fonts/TTF"
  install -m644 FSEX*.ttf "${pkgdir}/usr/share/fonts/TTF"
}
