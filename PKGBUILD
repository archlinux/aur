pkgname=fetchify
pkgver=1.0.3
pkgrel=7
arch=('x86_64')
url="https://github.com/GrandTheBest/fetchify"
license=('GNU General Public License')
source=("https://github.com/GrandTheBest/fetchify/releases/download/v1.0.3-generic/fetchify-1.0.3-linux-amd64.tar.gz")
sha256sums=('0625570986c15d363c9b6897046460d63b94ccbdbb9891932a3608354ef09241')

package() {
    cd "$srcdir"
    tar -xvzf fetchify-1.0.3-linux-amd64.tar.gz

    install -Dm755 "fetchify/fetchify" "$pkgdir/usr/bin/fetchify"

    cd ..
    rm -rf "$srcdir"
}

