# Maintainer: Estela <i at estela dot moe>
pkgname=how
pkgver=0.1
pkgrel=1
pkgdesc='AI assistant in command line'
arch=(any)
url=https://github.com/saeziae/how
license=("BSD 2-Clause")
depends=('bash' 'curl' 'jq' 'glow' 'ollama')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b28394557120b4e1d16a809ea33995c42a8e4a31e16d376e7b4c96ea033d4859')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" how
    install -Dm644 -t "$pkgdir/usr/share/licenses/how/" LICENSE
}
