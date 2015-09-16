# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=humanity-icon-theme
pkgver=0.6.8
pkgrel=1
pkgdesc="Latest Humanity icons from Ubuntu without modification"
arch=(any)
url=https://launchpad.net/humanity
license=(GPL2)
conflicts=(humanity-icons)
options=(!emptydirs)
source=(https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_$pkgver.tar.gz)
sha256sums=('9187da55d24fffa311175140c525ce48e8fd0a80370b48b30f34dccfb28538aa')
sha512sums=('23d0f3c1d57fcac56e343f209ee3965bb3ee9c39c1e2c73d80b906380afb2878562c82b6d6fc5ccf40324403572a97505841b03934f45a56c53ea59c5b48dec0')

package() {
    install -d "$pkgdir"/usr/share/icons/
    cp -r $pkgname-$pkgver/Humanity{,-Dark} "$pkgdir"/usr/share/icons/
}
