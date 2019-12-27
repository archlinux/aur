# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Tarkan Al-Kazily <tarkucar at mac dot com>
pkgname=sf-transrobotics
pkgver=1.0
pkgrel=1
pkgdesc="SF Transrobotic font package"
arch=(any)
source=("https://github.com/TarkanAl-Kazily/sf-transrobotics/raw/master/sf-transrobotics-fonts-ttf.tar.bz2")
sha256sums=('ecc9b9017125ab07f09a4d8962d46e0811b1aaa41aaa14541632cf5f4eb9b9b9')
url="https://www.shyfoundry.com/"
license=(custom)

package() {
    install -dm 755 "$pkgdir/usr/share/fonts/${pkgname}"
    install -t "$pkgdir/usr/share/fonts/${pkgname}" -m644 *.ttf
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
