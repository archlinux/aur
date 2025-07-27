# Maintainer: Hanashiko <hlichisper@gmail.com>
pkgname=sshtool
pkgver=0.1.1
pkgrel=1
pkgdesc="Interactive SSH session manager with GPG-encrypted config support"
arch=('any')
url="https://github.com/hanashiko/sshtool"
license=('MIT')
depends=('python' 'gnupg' 'fzf')
optdepends=(
    'sshpass: for password-based SSH'
    'mosh: for mosh support'
    'tmate: for tmate support'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ee6762076c6f1c2cbef31fa85321dc75744047948359869251696b59c818e7fb')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/sshtool" "$pkgdir/usr/bin/sshtool"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
