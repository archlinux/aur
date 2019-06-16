pkgname=ttf-babelstone-han
pkgver=12.1.4
pkgrel=1
pkgdesc="A Unicode Han font in Song/Ming style with glyphs used in Mainland China."
arch=('any')
url="http://www.babelstone.co.uk/Fonts/Han.html"
license=('custom:"arphic"')
depends=('fontconfig' 'xorg-font-utils')
source=('http://www.babelstone.co.uk/Fonts/Download/BabelStoneHan.zip'
        'http://ftp.gnu.org/non-gnu/chinese-fonts-truetype/LICENSE')
sha256sums=('216265947c72cdf8d42267fc830669f7c95d154754c5d4b5855774257304afb1'
            'ba74a961aaa5fa7e73dc67276df2781ba405da2cb30c52c9d9eee9c200d4d11e')

package()
{
  install -Dm644 BabelStoneHan.ttf $pkgdir/usr/share/fonts/TTF/BabelStoneHan.ttf
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
