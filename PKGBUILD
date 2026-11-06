# Maintainer: sTiKyt <stikyt@proton.me>

pkgname=ttf-nanum
pkgver=20200507
pkgrel=1
pkgdesc="Naver Nanum fonts (TrueType)"
arch=('any')
url="https://hangeul.naver.com/font"
license=('OFL-1.1')
provides=('ttf-font')
conflicts=(
  'ttf-nanum-meta'
  'ttf-nanumgothic'
  'ttf-nanummyeongjo'
  'ttf-nanummyeongjo-yethangul'
  'ttf-nanumbarungothic'
  'ttf-nanumbarungothic-yethangul'
  'ttf-nanumbarunpen'
  'ttf-nanumbrush'
  'ttf-nanumpen'
  'ttf-nanumsquare'
  'ttf-nanumsquareround'
  'ttf-nanumgothic_coding'
  'ttf-nanum-yethangul'
)

_filename=NanumFontSetup_TTF_ALL.zip
source=(
  "http://appdown.naver.com/naver/font/NanumFont/setup/${_filename}"
  "OFL.txt"
)
sha256sums=(
  'c7584eb9ee521f106cfbf8c893fc6400ca43c66385ab39c3ab6abc89586ee7fb'
  '65c23f0be72b06e4e77f273a399c24cb57a310fbe273cf4bd6dc10d4dff9c2ba'
)

package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" "$srcdir"/*.ttf
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
