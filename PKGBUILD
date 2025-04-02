pkgname=fetchify
pkgver=1.0.2
pkgrel=6
arch=('x86_64')
url="https://github.com/GrandTheBest/fetchify"
license=('GNU General Public License')
source=("https://github.com/GrandTheBest/fetchify/releases/download/v1.0.2-generic/fetchify-1.0.0-linux-amd64.tar.gz")
sha256sums=('8395c4d0a252591fa859cf4b16dc7d54dadba8ec77370cdfff7d4097fea4a56b')

package() {
    cd "$srcdir"
    tar -xvzf fetchify-1.0.0-linux-amd64.tar.gz

    install -Dm755 "fetchify/fetchify" "$pkgdir/usr/bin/fetchify"

    cd ..
    rm -rf "$srcdir"
}

