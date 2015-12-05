pkgname=ttf-babelstone-han
pkgver=8.0.2
pkgrel=1
pkgdesc="A Unicode Han font in Song/Ming style with glyphs used in Mainland China."
arch=('any')
url="http://www.babelstone.co.uk/Fonts/Han.html"
license=('custom:"arphic"')
depends=('fontconfig' 'xorg-font-utils')
source=('http://babelstone.co.uk/Fonts/BabelStoneHan.zip'
        'http://ftp.gnu.org/non-gnu/chinese-fonts-truetype/LICENSE')
sha256sums=('beb1c35777d6cce0f2c31d431324fb27645f92c1848efeb38b84ac8ef4ac2363'
            'ba74a961aaa5fa7e73dc67276df2781ba405da2cb30c52c9d9eee9c200d4d11e')
install=install

package()
{
  install -Dm644 BabelStoneHan.ttf $pkgdir/usr/share/fonts/TTF/BabelStoneHan.ttf
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

