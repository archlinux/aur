# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=humanity-icon-theme
pkgver=0.6.11
pkgrel=1
pkgdesc="Humanity icons from Ubuntu without modification"
arch=(any)
url=https://launchpad.net/humanity
license=(GPL2)
conflicts=(humanity-icons)
options=(!emptydirs)
source=(https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_$pkgver.tar.xz)
sha256sums=('5dd3540c2d7ec9022e1e296c8b2af2be4cc177dd23b27347c8cdd259f0a4e5ff')
sha512sums=('28b018f972e02167a2da8859b0c7fb41d1f4abaa18e6d56fb4ed4f21db8b12c4ec32190e74b14343bcd3f6ffae6facc06abe3ce4f1effd805d65d0debabfcab5')

package() {
    install -d "$pkgdir"/usr/share/icons/
    cp -r $pkgname-$pkgver/Humanity{,-Dark} "$pkgdir"/usr/share/icons/
}
