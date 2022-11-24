# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=pmy-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="General purpose context-aware zsh completion engine powered by fuzzy finder."
arch=('i386' 'x86_64')
depends=('fzf' 'zsh')
provides=('pmy')
url="https://github.com/relastle/pmy"
license=('MIT')
source_i386=("$pkgname-$pkgver.tar.gz::https://github.com/relastle/pmy/releases/download/v$pkgver/pmy_${pkgver}_Linux_i386.tar.gz")
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/relastle/pmy/releases/download/v$pkgver/pmy_${pkgver}_Linux_x86_64.tar.gz")
sha256sums_i386=('bcbad5d6675034b24aa154016ed91cee05c383b06c8dbebc9fae5821638f8c02')
sha256sums_x86_64=('2e562469c3b99ae8ac54bd40a8a6502a070e7e74f39f41687c778eadbf69bade')

package() {
    install -Dm755 "pmy" "$pkgdir/usr/bin/pmy"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/pmy/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/docs/pmy/README.md"
}
