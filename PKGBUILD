# Use http://www.rot13.com/ to decipher address.
# Maintainer: Daniele Bartolini <qonegbyvav.nn [4G] tznvy [Q0G] pbz>

pkgname=pepper
pkgver=0.0.16
pkgrel=1
pkgdesc="The Flexible Game Engine"
arch=(x86_64)
url="https://github.com/taylor001/crown"
license=('MIT' 'GPL')
depends=('libx11' 'libxrandr' 'libpulse' 'gtk3' 'glib2')
source=("http://52.27.219.161/~ubuntu/$pkgname-$pkgver.tar.gz"
        "pepper.sh"
        )
md5sums=('9cbe742d2ea85a79a15cfa686199d38a'
         'ce9c45eea75415c16cd552d219e0bde4')

package() {
    mkdir $pkgdir/opt
    mkdir $pkgdir/opt/pepper
    cp -r $pkgname $pkgdir/opt/
    install -D -m755 pepper.sh "${pkgdir}/usr/bin/pepper"
    install -D -m644 $pkgname/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
