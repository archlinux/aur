# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=adobe-source-han-mono-classic-fonts
pkgver=1.002
_commit=5888cdabc66f48976e7a9605aae91ed39cea27f8
pkgrel=6
pkgdesc='Adobe Source Han Mono fonts with classic orthography.'
arch=('any')
url="https://github.com/redchenjs/source-han-mono-classic"
license=('custom:OFL')
source=("https://github.com/redchenjs/source-han-mono-classic/archive/$_commit/source-han-mono-classic-$_commit.tar.gz")
sha512sums=('438ed2426479979cd908734b4f7c5c56870cbbcec4365c6ecc9cb86b79a14a37ebacb1df7050fdbb8726a0c268b24fc0e4d60f6d56e9cccb9bd71c77f749abe9')

package() {
  cd "source-han-mono-classic-$_commit"

  mkdir -p "$pkgdir/usr/share/fonts/adobe-source-han-sans"
  install -Dm644 *.otf "$pkgdir/usr/share/fonts/adobe-source-han-sans/"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
