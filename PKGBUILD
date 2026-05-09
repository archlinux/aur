# Maintainer: uwuclxdy <https://github.com/uwuclxdy>
pkgname=larpshell
pkgver=0.2.3
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
sha256sums=('c28c4eb7676324081664c94fc3cdf4079cd8b16d1083110d320eaa91d4a9104f'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
    install -Dm0755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/larpshell"
    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
