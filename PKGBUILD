# Maintainer: Robin Drach <aur@drakenson.de>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=humanity-icon-theme
pkgver=0.6.16
pkgrel=1
pkgdesc="Humanity icons from Ubuntu without modification"
arch=(any)
url=https://launchpad.net/humanity
license=(GPL2)
conflicts=(humanity-icons)
options=(!emptydirs)
source=(https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_$pkgver.tar.xz)
sha256sums=('0321e5e33332144dbfe42ba2dd8fd2075c8452ec9a7c37726c53eb69fa382a2d')
sha512sums=('a2a5dd4b03a3f81ae1f42aaaba76e1982978ec9a936fb61b38a53e20dfe5298bd47bac29b6ea4fbeb73fa878d48fe68b414d4179615526c81a8fbc7a5535d017')

package() {
    install -d "$pkgdir"/usr/share/icons/
    cp -r $pkgname-$pkgver/Humanity{,-Dark} "$pkgdir"/usr/share/icons/
}
