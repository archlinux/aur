# Maintainer: Magnus Reid <magnus at msareid dot com>

pkgname=zsh-patina-bin
pkgver=1.5.0
pkgrel=1
pkgdesc='A blazingly fast Zsh syntax highlighter'
arch=('x86_64')
url='https://github.com/michel-kraemer/zsh-patina'
license=('MIT')
depends=('gcc-libs')
conflicts=('zsh-patina-git' 'zsh-patina')
source=("$url/releases/download/$pkgver/zsh-patina-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('5b1b8863d69d7fd20b793f8299fa78c66b594a0cb9c70f8701c05b467460b879')

package() {
    cd "$srcdir"/zsh-patina-v"$pkgver"-x86_64-unknown-linux-gnu

    install -Dm755 zsh-patina "$pkgdir/usr/bin/zsh-patina"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 completion/_zsh-patina "$pkgdir/usr/share/zsh/site-functions/_zsh-patina"
}
