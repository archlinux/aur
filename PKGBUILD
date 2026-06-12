# Maintainer: kusanaginoturugi <kusanaginoturugi(at)gmail.com>
pkgname=ttf-zen-kakugothic-new
pkgver=1.000
pkgrel=1
pkgdesc="Japanese square sans-serif font with a clean and modern design"
arch=('any')
url="https://fonts.google.com/specimen/Zen+Kaku+Gothic+New"
license=('OFL-1.1')
_commit=2705757e17e42954f3acbdf921ac0ae24d1270cd
source=(
  "https://raw.githubusercontent.com/googlefonts/zen-kakugothic/${_commit}/fonts/ttf/ZenKakuGothicNew-Bold.ttf"
  "https://raw.githubusercontent.com/googlefonts/zen-kakugothic/${_commit}/fonts/ttf/ZenKakuGothicNew-Light.ttf"
  "https://raw.githubusercontent.com/googlefonts/zen-kakugothic/${_commit}/fonts/ttf/ZenKakuGothicNew-Medium.ttf"
  "https://raw.githubusercontent.com/googlefonts/zen-kakugothic/${_commit}/fonts/ttf/ZenKakuGothicNew-Regular.ttf"
  "https://raw.githubusercontent.com/googlefonts/zen-kakugothic/${_commit}/fonts/ttf/ZenKakuGothicNew-Black.ttf"
  "https://raw.githubusercontent.com/googlefonts/zen-kakugothic/${_commit}/OFL.txt"
)
sha256sums=('0081cedabc4921982fcd061f845a005664ac7fb642af2dd34b4007bc63ccd235'
            'ad4e9733f96397ed0c99c295d9b3b56e39a0e0bc02b0ac56ce3ade7793a1eef1'
            '651a3f7280b7f36262601ee76d8388a8dc4372dcc67aff025a608939a562b525'
            'b840cd07a67d89cacca44249ae49aa99ee7640eb5ce623be8d8983d6aabac801'
            '795819a979184981842994d8f4eb9e14ce443d687bd5e731d6ca67ded8f92261'
            '0fac78a235c98d640cb06332eb5362c211d86fa03c011df438c35005d22ad2c7')

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
