# Maintainer: 0xGingi <0xgingi@0xgingi.com>
pkgname=('phantom-editor-bin')
pkgver=2.0.0
pkgrel=1
pkgdesc="Phantom is a lightweight terminal-based text editor written in Rust"
arch=('x86_64')
url="https://github.com/0xGingi/phantom"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('git')
provides=('phantom-editor')
conflicts=('phantom-editor')
source=("https://github.com/0xgingi/phantom/releases/download/v$pkgver/phantom")
md5sums=('SKIP')

package() {
    install -Dm755 phantom "$pkgdir/usr/bin/phantom"
}
