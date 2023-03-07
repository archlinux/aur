pkgname=crude
pkgver=0.0.1
pkgrel=0
pkgdesc="Migration toolkit for databases"
arch=('x86_64' 'i686')
url="https://github.com/termapps/crude"
license=("MIT")
provides=("crude")
source_x86_64=(crude-0.0.1.zip::https://github.com/termapps/crude/releases/download/v0.0.1/crude-v0.0.1-x86_64-unknown-linux-gnu.zip)
source_i686=(crude-0.0.1.zip::https://github.com/termapps/crude/releases/download/v0.0.1/crude-v0.0.1-i686-unknown-linux-gnu.zip)
sha256sums_x86_64=("0dd73fe08f34fe0a5607b84c4afd15803268d083aa8465592f82771846de16e0")
sha256sums_i686=("1872cc8ac8bf407743f395c21240ae689d32b259dd09a0533088dc77c96b63d0")

package() {
    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
