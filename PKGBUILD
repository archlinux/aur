pkgname=crude
pkgver=0.1.1
pkgrel=0
pkgdesc="Migration toolkit for databases"
arch=('x86_64' 'i686')
url="https://github.com/termapps/crude"
license=("MIT")
provides=("crude")
conflicts=()
source_x86_64=($pkgname-$pkgver.zip::https://github.com/termapps/crude/releases/download/v$pkgver/crude-v$pkgver-x86_64-unknown-linux-gnu.zip)
sha256sums_x86_64=("b3238d3649b0692aff8a955a4752d5fe925c9d32d4ec43ee0e9a86917a84748b")
source_i686=($pkgname-$pkgver.zip::https://github.com/termapps/crude/releases/download/v$pkgver/crude-v$pkgver-i686-unknown-linux-gnu.zip)
sha256sums_i686=("63870da1c6a964cc09dc4d59481ce2e77962319ff7c86c4a5a0751bc54398e16")

package() {
    cd "$srcdir"
    install -Dm755 "crude" "$pkgdir/usr/bin/crude"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/crude/LICENSE"
}
