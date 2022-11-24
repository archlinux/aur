# Maintainer: Gustavo Parreira <gustavotcparreira at gmail dot com>
pkgname=sway-screenshot
pkgver=1.0.0
pkgrel=1
url="https://github.com/Gustash/sway-screenshot"
pkgdesc="A utility to easily take screenshots in swaywm using your mouse"
arch=('any')
license=('GPL')
depends=('jq' 'grim' 'slurp' 'wl-clipboard' 'libnotify' 'imagemagick')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Gustash/sway-screenshot/archive/$pkgver.tar.gz")
sha512sums=('baab7be811b6175116a1d5d918a72b1f9301de3166ab4c66d2ddf5d078024c767b36c0e782c22751578a551c4cb1701cfa0cdecfc609719bfaf7aa68bf04fe1f')

package() {
    cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"

    cp sway-screenshot "$pkgdir/usr/bin/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
