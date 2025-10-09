# Maintainer: Tom McKeesick <tmck01@gmail.com>
pkgname=pokesay-bin
pkgver=0.18.2
pkgrel=1
pkgdesc="Print pokemon in the CLI! An adaptation of the classic 'cowsay'"
url="https://github.com/tmck-code/pokesay"
license=("BSD-3-Clause")
arch=("x86_64")
provides=("pokesay")
conflicts=("pokesay")
source=("https://github.com/tmck-code/pokesay/releases/download/v$pkgver/pokesay-$pkgver-linux-amd64.tar.gz")
sha256sums=("726bfa7e6f8b105f96992cbc4026252a1bab92a95466de5e764c5a2afb5473a1")

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
