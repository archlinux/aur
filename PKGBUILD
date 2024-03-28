# Maintainer: LightDot <lightdot -a-t- g m a i l>
# Contributor: Martin Florén <martin.floren@gmail.com>

pkgname=otf-junction
pkgver=1
pkgrel=4
pkgdesc="A humanist sans-serif typeface"
arch=('any')
url="https://www.theleagueofmoveabletype.com/junction/"
license=('OFL')
source=('https://github.com/theleagueof/junction/archive/master.zip')
md5sums=('e35636a6a9075db4f1bc09df69b8d0d3')

package() {
    install -Dm 644 "junction-master/Junction-regular.otf" $pkgdir/usr/share/fonts/OTF/junction.otf
    install -Dm 644 "junction-master/Junction-bold.otf" $pkgdir/usr/share/fonts/OTF/junction_bold.otf
    install -Dm 644 "junction-master/Junction-light.otf" $pkgdir/usr/share/fonts/OTF/junction_light.otf
    install -Dm 644 "junction-master/Open Font License.markdown" $pkgdir/usr/share/licenses/$pkgname/"Open Font License.markdown"
    install -Dm 644 "junction-master/readme.markdown" $pkgdir/usr/share/doc/$pkgname/readme.markdown
}
