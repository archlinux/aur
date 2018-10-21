# Contributor: Alex Suykov <axs@ukr.net>

pkgname=ttf-code2002
pkgver=2005.04.05
pkgrel=1
pkgdesc="beta test font for Plane Two"
arch=('any')
url="https://web.archive.org/web/20101122141939/http://code2000.net/"
license=('custom')
depends=(
    'fontconfig'
    'xorg-fonts-encodings'
    'xorg-mkfontscale'
    'xorg-mkfontdir'
)
source=('https://web.archive.org/web/20101122142710/http://code2000.net/CODE2002.ZIP')
md5sums=('37526f6ad67a0ae0b589094988dab045')
sha256sums=('0dbc65536c8f875a9aafe52a070a8103ea97f480ade03487c9fc10db6fa5ae87')
sha512sums=('ebea82012f6d733a2f72b65910898e2f5efca8f6fb30d2b48a878914d0930df007bb17345ced2bd2af93331be2e814686cc28181f208aad0dd46501833f65c12')

package() {
  install -D -m644 CODE2002.TTF "$pkgdir/usr/share/fonts/TTF/Code2002.ttf"
}
