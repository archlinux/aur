# Maintainer: uwuclxdy <https://github.com/uwuclxdy>
pkgname=larpshell
pkgver=0.1.2
pkgrel=1
pkgdesc='Convert natural language to shell commands using an LLM'
arch=('x86_64')
url='https://github.com/uwuclxdy/larpshell'
license=('MIT')
depends=('gcc-libs' 'glibc')
conflicts=('larpshell-git')
provides=('larpshell')
source=("$pkgname-$pkgver::https://github.com/uwuclxdy/larpshell/releases/download/v$pkgver/larpshell"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/uwuclxdy/larpshell/v$pkgver/LICENSE")
sha256sums=('7ddefbe5e0c60c8bab6aedb401696cb405a9e5d3601be47d10cc8f0b53b3f894'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
    install -Dm0755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/larpshell"
    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
