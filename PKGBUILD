# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=humanity-icon-theme
pkgver=0.6.13
pkgrel=1
pkgdesc="Humanity icons from Ubuntu without modification"
arch=(any)
url=https://launchpad.net/humanity
license=(GPL2)
conflicts=(humanity-icons)
options=(!emptydirs)
source=(https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_$pkgver.tar.xz)
sha256sums=('fbc20e8b347b82404f78c56d9f3e1baf01de8e1c9bf6cc72f5fe78157e6a9acf')
sha512sums=('26798291df0067760efd54d847bdbd4d34b3017327c181215306f53a6477c23deeb8409266882994678319e49937f8b1a693fbc389c1dd1c9af908abcb905df7')

package() {
    install -d "$pkgdir"/usr/share/icons/
    cp -r $pkgname-$pkgver/Humanity{,-Dark} "$pkgdir"/usr/share/icons/
}
