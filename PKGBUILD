# Maintainer:
# Contributor: James Morris - jwm-art - james@jwm-art.net

_fontname="djb-zora-prints"
_pkgname="ttf-$_fontname"
pkgname="$_pkgname"
pkgver=1.0
pkgrel=1
pkgdesc="TrueType Font: DJB Zora Prints"
url="https://darcybaldwin.com/djb-zora-prints-font/"
license=('custom:Free for personal use')
arch=('any')

source=(
  "$_fontname-$pkgver.zip"::"http://dl.dafont.com/dl/?f=djb_zora_prints"
  "License-20210901.txt" # https://darcybaldwin.com/commercial-use/
)
sha256sums=(
  'd10800711177f62eb9fd2cff4bf58d42bbdfb2bd77bd58ab8e8d655076030bfa'
  '491d697fa5a9344e3290ac4ba7cb6e70a3c58abb8238e0ffbfbec59341e5f953'
)

package() {
  install -Dm644 *.ttf -t "${pkgdir:?}/usr/share/fonts/TTF/"
  install -Dm644 'License-20210901.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
