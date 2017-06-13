pkgname=ttf-babelstone-han
pkgver=10.0.0
pkgrel=1
pkgdesc="A Unicode Han font in Song/Ming style with glyphs used in Mainland China."
arch=('any')
url="http://www.babelstone.co.uk/Fonts/Han.html"
license=('custom:"arphic"')
depends=('fontconfig' 'xorg-font-utils')
source=('http://babelstone.co.uk/Fonts/9974/BabelStoneHan.zip'
        'http://ftp.gnu.org/non-gnu/chinese-fonts-truetype/LICENSE')
sha256sums=('6d7aa2bddf55e1a8ed0c716afa6f68d1e0e23f6c0c91590576653457a6bf8ced'
            'ba74a961aaa5fa7e73dc67276df2781ba405da2cb30c52c9d9eee9c200d4d11e')

package()
{
  install -Dm644 BabelStoneHan.ttf $pkgdir/usr/share/fonts/TTF/BabelStoneHan.ttf
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
