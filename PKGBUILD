pkgname=crude
pkgver=0.1.2
pkgrel=0
pkgdesc="Migration toolkit for databases"
arch=('x86_64' 'i686')
url="https://github.com/termapps/crude"
license=("MIT")
provides=("crude")
conflicts=()
source_x86_64=($pkgname-$pkgver.zip::https://github.com/termapps/crude/releases/download/v$pkgver/crude-v$pkgver-x86_64-unknown-linux-gnu.zip)
sha256sums_x86_64=("3a743186b5e71fddbbec532037942c6c81d0d1bfd9351f0f1bc05c7c193ec5ea")
source_i686=($pkgname-$pkgver.zip::https://github.com/termapps/crude/releases/download/v$pkgver/crude-v$pkgver-i686-unknown-linux-gnu.zip)
sha256sums_i686=("ee90df6ddd7e4ee0cb79a57434b90b2f5b481cc99b25f95e32ec9fed8e292db7")

package() {
    cd "$srcdir"
    install -Dm755 "crude" "$pkgdir/usr/bin/crude"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/crude/LICENSE"
}
