# Maintainer: 0x4A4FRN <dfntlynotjorn@gmail.com>

pkgname=zig-zsh-completion
pkgver=0.14.0
pkgrel=1
pkgdesc="Zsh completions for the Zig compiler."
arch=('any')
url="https://github.com/ziglang/shell-completions"
license=('MIT')
depends=('zsh')
install=zig-zsh-completion.install
source=(
  "https://raw.githubusercontent.com/ziglang/shell-completions/master/_zig"
  "https://raw.githubusercontent.com/ziglang/shell-completions/master/LICENSE"
)
sha256sums=('cb8176f9dc43cfba9f547c67a40f33adcf65b3ef5e4c22372941fe9ceb7835e6'
            '393bb489ffcbcfe7a07314f3b522a1dee9c62660c8498df83382d92928362fbb')

package() {
  install -vDm 644 "$srcdir/_zig" "$pkgdir/usr/share/zsh/site-functions/_zig"
  install -vDm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
