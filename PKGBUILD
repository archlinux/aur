# Maintainer: Magnus Anderson <magnus@iastate.edu>
# Previous Maintainer: Baudouin Roullier <DISGUISE baudouin dot roullier at gmail dot com DISGUISE>
# Originally by Mykal Anderson
pkgname=shitpost
pkgver=4
pkgrel=1
pkgdesc="A tool to create memes using CLI"
arch=('i686' 'x86_64')
license=('custom:DWTFYW')
url="https://redd.it/5ezk1f"
source=('https://raw.githubusercontent.com/magnus-ISU/aur-scripts/master/shitpost')
depends=('imagemagick')
optdepends=('ttf-ms-fonts')
md5sums=('SKIP')

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    install -D -m755 "$srcdir/shitpost" "$pkgdir/usr/bin/"
}
