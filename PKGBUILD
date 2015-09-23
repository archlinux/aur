# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=humanity-icon-theme
pkgver=0.6.9
pkgrel=1
pkgdesc="Latest Humanity icons from Ubuntu without modification"
arch=(any)
url=https://launchpad.net/humanity
license=(GPL2)
conflicts=(humanity-icons)
options=(!emptydirs)
source=(https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_$pkgver.tar.gz)
sha256sums=('9a18dbb48cbfecb9129b05ffcc3a72991007904ebebcacaf40d26432e4b1ed3c')
sha512sums=('3fdef3877e75a97aa239b5913900e810da0dd7a01424bbb7e9682f3bfa3b7c4f16ef2db54c998209e9b48e80628f3658c733c29648756f6b9787199a6df2ae07')

package() {
    install -d "$pkgdir"/usr/share/icons/
    cp -r $pkgname-$pkgver/Humanity{,-Dark} "$pkgdir"/usr/share/icons/
}
