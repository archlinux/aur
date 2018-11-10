# Maintainer: Ainola
# Contributor: Florian Bruhin
# Contributor: Eric Anderson

pkgname=hib-dlagent
pkgver=0.7.1
pkgrel=1
pkgdesc='Tool to download Humble Indie Bundle binaries by file name'
arch=('any')
url='https://github.com/hagabaka/hib-dlagent'
license=('MIT')
depends=('bash' 'curl' 'python-humblebundle')
optdepends=('gnome-keyring-query: encrypted account password support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hagabaka/hib-dlagent/archive/$pkgver.tar.gz")
sha256sums=('fb3190ce8442e9b3bacede0f5ae1f63f6b083639d30cb006aaff69d73c5ca7df')

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 README -t "$pkgdir/usr/share/doc/hib-dlagent/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm755 hib-dlagent -t "$pkgdir/usr/bin/"
    install -Dm755 discover-url.py -t "$pkgdir/usr/share/hib-dlagent/"
}
