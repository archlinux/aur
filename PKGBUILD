# Maintainer: Tom McKeesick <tmck01@gmail.com>
pkgname=pokesay-bin
pkgver=0.18.3
pkgrel=1
pkgdesc="Print pokemon in the CLI! An adaptation of the classic 'cowsay'"
url="https://github.com/tmck-code/pokesay"
license=("BSD-3-Clause")
arch=("x86_64")
provides=("pokesay")
conflicts=("pokesay")
source=("https://github.com/tmck-code/pokesay/releases/download/v$pkgver/pokesay-$pkgver-linux-amd64.tar.gz")
sha256sums=("2b1dd858ddef81c57c6cb8c4d552147fae276f0ca6efce609fbf6a15ee320119")

package() {
    install -Dm755 "pokesay-$pkgver-linux-amd64" "$pkgdir/usr/bin/pokesay"
    install -Dm644 "pokesay.1" "$pkgdir/usr/share/man/man1/pokesay.1"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/pokesay/LICENSE"
    install -Dm644 "pokesay-completion.bash" "$pkgdir/usr/share/bash-completion/completions/pokesay"
    install -Dm644 "pokesay-completion.zsh" "$pkgdir/usr/share/zsh/site-functions/_pokesay"
    install -Dm644 "pokesay-completion.fish" "$pkgdir/usr/share/fish/vendor_completions.d/pokesay.fish"
    install -Dm644 "pokesay-names.txt" "$pkgdir/usr/share/pokesay/pokesay-names.txt"
    install -Dm644 "pokesay-ids.txt" "$pkgdir/usr/share/pokesay/pokesay-ids.txt"
}
