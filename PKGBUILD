pkgname=ttf-babelstone-han
pkgver=11.0.3
pkgrel=1
pkgdesc="A Unicode Han font in Song/Ming style with glyphs used in Mainland China."
arch=('any')
url="http://www.babelstone.co.uk/Fonts/Han.html"
license=('custom:"arphic"')
depends=('fontconfig' 'xorg-font-utils')
source=("$(curl http://www.babelstone.co.uk/Fonts/Han.html | grep -Eo 'http://.+BabelStoneHan\.zip')"
        'http://ftp.gnu.org/non-gnu/chinese-fonts-truetype/LICENSE')
sha256sums=('e02d889a6d58bfa81b86b9850c2dd6751e449553ae72011be8d29b2c18ed9f54'
            'ba74a961aaa5fa7e73dc67276df2781ba405da2cb30c52c9d9eee9c200d4d11e')

package()
{
  install -Dm644 BabelStoneHan.ttf $pkgdir/usr/share/fonts/TTF/BabelStoneHan.ttf
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
