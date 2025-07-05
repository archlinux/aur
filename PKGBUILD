# Maintainer: Hanashiko <hlichisper@gmail.com>
pkgname=sshtool
pkgver=0.1.0
pkgrel=2
pkgdesc="Interactive SSH session manager with GPG-encrypted config support"
arch=('any')
url="https://github.com/hanashiko/sshtool.git"
license=('MIT')
depends=('python' 'gnupg' 'fzf')
optdepends=(
    'sshpass: for password-based SSH'
    'mosh: for mosh support'
    'tmate: for tmate support'
)
source=("sshtool" "LICENSE" "README.md")
sha256sums=('f49bdf34fdb3de65370ed0c7d52ee612f92184e14de6c7ffadb9087ac8921277' 
            '97ad9eb02154bcf1ea19abb6b529506eb0b20df9f0aefb8b11b87af1b2c4f884' 
            '3a420d407040b1a0a305f5776e01eef0087c9735a98d721b5340ac4defa73330')

package() {
    install -Dm755 "$srcdir/sshtool" "$pkgdir/usr/bin/sshtool"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
