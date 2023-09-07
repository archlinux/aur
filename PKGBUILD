pkgname=ttf-babelstone-han
pkgver=15.1.1
pkgrel=1
pkgdesc="A Unicode Han font in Song/Ming style with glyphs used in Mainland China."
arch=('any')
url="http://www.babelstone.co.uk/Fonts/Han.html"
license=('custom:"arphic"')
depends=('fontconfig')
source=("http://www.babelstone.co.uk/Fonts/Download/BabelStoneHan-${pkgver}.zip"
        "http://ftp.gnu.org/non-gnu/chinese-fonts-truetype/LICENSE")
sha256sums=('034638eba7bf923981339c718f69b23e564df543539da068b4672f1cba349d32'
            'ba74a961aaa5fa7e73dc67276df2781ba405da2cb30c52c9d9eee9c200d4d11e')

package()
{
  install -Dm644 BabelStoneHan.ttf $pkgdir/usr/share/fonts/TTF/BabelStoneHan.ttf
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
