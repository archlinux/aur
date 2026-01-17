pkgname=crude
pkgver=0.1.4
pkgrel=0
pkgdesc="Migration toolkit for databases"
arch=('x86_64' 'i686')
url="https://github.com/termapps/crude"
license=("MIT")
provides=("crude")
conflicts=()
source_x86_64=($pkgname-$pkgver.zip::https://github.com/termapps/crude/releases/download/v$pkgver/crude-v$pkgver-x86_64-unknown-linux-gnu.zip)
sha256sums_x86_64=("7cd2747855e68b84fb5278f1ed702326456424afbbca49715a671f477c54e074")
source_i686=($pkgname-$pkgver.zip::https://github.com/termapps/crude/releases/download/v$pkgver/crude-v$pkgver-i686-unknown-linux-gnu.zip)
sha256sums_i686=("91d33a00acfeb9c543242739824b7d96273fd8bfbc119470bc60fd5afb1108c9")

package() {
    cd "$srcdir"
    install -Dm755 "crude" "$pkgdir/usr/bin/crude"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/crude/LICENSE"
}
