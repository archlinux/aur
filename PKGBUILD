# Maintainer: uwuclxdy <https://github.com/uwuclxdy>
pkgname=larpshell
pkgver=0.2.2
pkgrel=1
pkgdesc='Convert natural language to shell commands using an LLM'
arch=('x86_64')
url='https://github.com/uwuclxdy/larpshell'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
conflicts=('larpshell-git')
provides=('larpshell')
source=("$pkgname-$pkgver::https://github.com/uwuclxdy/larpshell/releases/download/v$pkgver/larpshell"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/uwuclxdy/larpshell/v$pkgver/LICENSE")
sha256sums=('d5056341e1200f26f93879546539994c55a184d60d8d9b2d6448f14fda3b5133'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
    install -Dm0755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/larpshell"
    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
