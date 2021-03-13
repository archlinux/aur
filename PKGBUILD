# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=pmy-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="General purpose context-aware zsh completion engine powered by fuzzy finder."
arch=('i386' 'x86_64')
depends=('fzf' 'zsh')
provides=('pmy')
url="https://github.com/relastle/pmy"
license=('MIT')
source_i386=("$pkgname-$pkgver.tar.gz::https://github.com/relastle/pmy/releases/download/v$pkgver/pmy_${pkgver}_Linux_i386.tar.gz")
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/relastle/pmy/releases/download/v$pkgver/pmy_${pkgver}_Linux_x86_64.tar.gz")
sha256sums_i386=('b564e976dd22178bcc7e29cf68099ea4d9d6882df34dec5326e8576be971e7d0')
sha256sums_x86_64=('7bf1beb69dd13b9e5ad892e0414b1b613038e43bb3bb8fa9592e77f4ecfdfdd5')

package() {
    install -Dm755 "pmy" "$pkgdir/usr/bin/pmy"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/pmy/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/docs/pmy/README.md"
}
