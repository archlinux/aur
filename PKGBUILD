# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
# Contributor: Ma Jiehong <email at majiehong.com>

pkgname=ttf-tw
epoch=2
pkgver=5.0
pkgrel=2
pkgdesc="Set of KAI and SONG fonts from the Ministry of Education of Taiwan. These fonts follow all the official recommendations and their shapes are calligraphically correct. (TTF/UTF-8)"
arch=('any')
url="http://www.moe.gov.tw/"
license=('CC-BY-ND 3.0')
# backup source: git+https://github.com/Jiehong/TW-fonts.git
# makedepends=(git)
source=(https://language.moe.gov.tw/001/Upload/Files/site_content/M0001/edukai-5.0.zip
        https://language.moe.gov.tw/001/Upload/Files/site_content/M0001/eduSong_Unicode.zip
        https://language.moe.gov.tw/001/Upload/Files/site_content/M0001/edukai.pdf
        https://language.moe.gov.tw/001/Upload/Files/site_content/M0001/edusun.pdf)
sha256sums=('57411e9ca399f372bda62fadd521a875d2062d34a0c654ace4a4c61539f3e10b'
            '759845f43141011a1cfdaf0f5cb4e929d1b867c6a6702a837f7ffb9ebdc559d4'
            '40926d906d806f8c27f6da4c4770c957aa30588fff8a8fe413797bbcf9bc9de8'
            'bd2c6ddf6c18acd1d671f8768cb192bbda410882afee679a3c9b0a93ff393037')

package() {
  cd "$srcdir"
  install -Dm644 edukai-5.0.ttf "${pkgdir}/usr/share/fonts/TTF/edukai-5.0.ttf"
  install -Dm644 eduSong_Unicode.ttf "${pkgdir}/usr/share/fonts/TTF/eduSong_Unicode.ttf"
  install -Dm644 edukai.pdf "${pkgdir}/usr/share/licenses/${pkgname}/edukai.pdf"
  install -Dm644 edusun.pdf "${pkgdir}/usr/share/licenses/${pkgname}/edukai.edusun.pdf"
}
