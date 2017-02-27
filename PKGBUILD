pkgname=ttf-babelstone-han
pkgver=9.0.1
pkgrel=1
pkgdesc="A Unicode Han font in Song/Ming style with glyphs used in Mainland China."
arch=('any')
url="http://www.babelstone.co.uk/Fonts/Han.html"
license=('custom:"arphic"')
depends=('fontconfig' 'xorg-font-utils')
source=('http://babelstone.co.uk/Fonts/1082/BabelStoneHan.zip'
        'http://ftp.gnu.org/non-gnu/chinese-fonts-truetype/LICENSE')
sha256sums=('fbeeb846b6a0d355143d19708e7cf28feff28b0760389b025a5ff75d9949481c'
            'ba74a961aaa5fa7e73dc67276df2781ba405da2cb30c52c9d9eee9c200d4d11e')

package()
{
  install -Dm644 BabelStoneHan.ttf $pkgdir/usr/share/fonts/TTF/BabelStoneHan.ttf
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
