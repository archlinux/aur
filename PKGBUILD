pkgname=crude
pkgver=0.1.5
pkgrel=0
pkgdesc="Migration toolkit for databases"
arch=('x86_64' 'i686')
url="https://github.com/termapps/crude"
license=("MIT")
provides=("crude")
conflicts=()
source_x86_64=($pkgname-$pkgver.zip::https://github.com/termapps/crude/releases/download/v$pkgver/crude-v$pkgver-x86_64-unknown-linux-gnu.zip)
sha256sums_x86_64=("511c96331f4ce02d2963e5ed4ffd782bef31f37ddafaec67c3a5df4b88469555")
source_i686=($pkgname-$pkgver.zip::https://github.com/termapps/crude/releases/download/v$pkgver/crude-v$pkgver-i686-unknown-linux-gnu.zip)
sha256sums_i686=("f674445e296c4d1f658e86f365aeea72f08ae8e0d67d9dc7c4691059c28c9578")

package() {
    cd "$srcdir"
    install -Dm755 "crude" "$pkgdir/usr/bin/crude"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/crude/LICENSE"
}
