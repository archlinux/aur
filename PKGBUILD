pkgname=crude
pkgver=0.1.0
pkgrel=0
pkgdesc="Migration toolkit for databases"
arch=('x86_64' 'i686')
url="https://github.com/termapps/crude"
license=("MIT")
provides=("crude")
conflicts=()
source_x86_64=($pkgname-$pkgver.zip::https://github.com/termapps/crude/releases/download/v$pkgver/crude-v$pkgver-x86_64-unknown-linux-gnu.zip)
sha256sums_x86_64=("39c3b500da83383cd49062bd03a8e5aeab671791cab0735c0c81ea5952954fcd")
source_i686=($pkgname-$pkgver.zip::https://github.com/termapps/crude/releases/download/v$pkgver/crude-v$pkgver-i686-unknown-linux-gnu.zip)
sha256sums_i686=("9cc1f0d143417d82341a2d0f76706e873382f938e811840b05b17428405cf88e")

package() {
    cd "$srcdir"
    install -Dm755 "crude" "$pkgdir/usr/bin/crude"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/crude/LICENSE"
}
