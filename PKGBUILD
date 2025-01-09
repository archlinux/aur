# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
# Contributor: Ma Jiehong <email at majiehong.com>

pkgname=ttf-tw
epoch=2
pkgver=5.0
pkgrel=3
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
            '5bbfe5452eda52901ebef79aa8aa669231e763311786bfc21a530ec9fcf92b59'
            '40926d906d806f8c27f6da4c4770c957aa30588fff8a8fe413797bbcf9bc9de8'
            '334b0f8dd465928703a3ad2e4791f83e4a33ea78bf658b64ceecbc558264d4a1')

package() {
  cd "$srcdir"
  install -Dm644 edukai-5.0.ttf "${pkgdir}/usr/share/fonts/TTF/edukai-5.0.ttf"
  install -Dm644 eduSong_Unicode*.ttf "${pkgdir}/usr/share/fonts/TTF/eduSong_Unicode.ttf"
  install -Dm644 edukai.pdf "${pkgdir}/usr/share/licenses/${pkgname}/edukai.pdf"
  install -Dm644 edusun.pdf "${pkgdir}/usr/share/licenses/${pkgname}/edukai.edusun.pdf"
}
