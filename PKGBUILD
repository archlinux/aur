# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=pmy-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="General purpose context-aware zsh completion engine powered by fuzzy finder."
arch=('i386' 'x86_64')
depends=('fzf' 'zsh')
provides=('pmy')
url="https://github.com/relastle/pmy"
license=('MIT')
source_i686=("$pkgname-$pkgver.tar.gz::https://github.com/relastle/pmy/releases/download/v$pkgver/pmy_${pkgver}_Linux_i386.tar.gz")
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/relastle/pmy/releases/download/v$pkgver/pmy_${pkgver}_Linux_x86_64.tar.gz")
sha256sums_i686=('03e0d50014695e4cd3c22c139f80e0b7de6f4afdd9bd3a3ffe94d8b95656d44f')
sha256sums_x86_64=('9c5e44f6a1f3ba53df5f439351a12eacc52ee0dc480459e43cb242a246d43fbe')

package() {
    install -Dm755 "pmy" "$pkgdir/usr/bin/pmy"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/pmy/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/docs/pmy/READNE.md"
}
