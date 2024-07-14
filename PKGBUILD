pkgname=publisher
pkgver=0.1.1
pkgrel=0
pkgdesc="Tool to publish & distribute CLI tools"
arch=('x86_64' 'i686')
url="https://github.com/termapps/publisher"
license=("MIT")
provides=("publisher")
conflicts=()
source_x86_64=($pkgname-$pkgver.zip::https://github.com/termapps/publisher/releases/download/v$pkgver/publisher-v$pkgver-x86_64-unknown-linux-gnu.zip)
sha256sums_x86_64=("e879ec8e0dfc16322d939c926bd11c6f0eb8a0b70ce76ad6879b2f10fc68c557")
source_i686=($pkgname-$pkgver.zip::https://github.com/termapps/publisher/releases/download/v$pkgver/publisher-v$pkgver-i686-unknown-linux-gnu.zip)
sha256sums_i686=("1dcff5eb40e84efeb88861d1e49791b4a62c74d3b74fd4ec860f9c9ade34a5f9")

package() {
    cd "$srcdir"
    install -Dm755 "publisher" "$pkgdir/usr/bin/publisher"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/publisher/LICENSE"
}
