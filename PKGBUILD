# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=humanity-icon-theme
pkgver=0.6.15
pkgrel=1
pkgdesc="Humanity icons from Ubuntu without modification"
arch=(any)
url=https://launchpad.net/humanity
license=(GPL2)
conflicts=(humanity-icons)
options=(!emptydirs)
source=(https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_$pkgver.tar.xz)
sha256sums=('9dbcb425c2ee2a58c70da1eda4c2c88e32e7ede4094fb59772726864c8214aa6')
sha512sums=('dbdd94b03ebe132d193024d1c791b6fa0dd333f3d476954f8628dba8ef8e4cee8ca21e5d769de3f72b0b0d1054e1d4a610532e9d113da5323a14bb6752be9a66')

package() {
    install -d "$pkgdir"/usr/share/icons/
    cp -r $pkgname-$pkgver/Humanity{,-Dark} "$pkgdir"/usr/share/icons/
}
