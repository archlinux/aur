pkgname=laravel-bin
pkgver=5.32.0
pkgrel=1
pkgdesc="Laravel installation based on the official herd lite installer. Only includes the laravel executable."
arch=('x86_64')
depends=('php' 'composer')
url="https://laravel.com/"
license=('MIT')
source=("https://download.herdphp.com/resources/laravel")
b2sums=('f7f4e58ce38c40321c59828e85e2e0f018c6d2f2b27b53fb4cb7ee7057c36a4d1e9d2a23cd648c4d67a2e6f34907300e090ba05329cfc66a5a0f7b40e363a13a')

package() {
    install -d "$pkgdir/usr/bin"

    # Install the downloaded binary
    install -m755 "$srcdir/laravel" "$pkgdir/usr/bin/laravel"
}
