pkgname=laravel-bin
pkgver=5.31.1
pkgrel=1
pkgdesc="Laravel installation based on the official herd lite installer. Only includes the laravel executable."
arch=('x86_64')
depends=('php' 'composer')
url="https://laravel.com/"
license=('MIT')
source=("https://download.herdphp.com/resources/laravel")
b2sums=('e51386d0ea0bd5a3120ae12125c4fd461ceeb16d151b652997a23659d5f546f81e38690050912388853d9af554c4524259a43a0c9874c643f20f4b7b0ac95ca5')

package() {
    install -d "$pkgdir/usr/bin"

    # Install the downloaded binary
    install -m755 "$srcdir/laravel" "$pkgdir/usr/bin/laravel"
}
