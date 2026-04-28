# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=classfi-bin
_pkgname=classfi
pkgver=0.2.0
pkgrel=1
pkgdesc='A simple classical music player'
arch=('x86_64')
url='https://github.com/carmiac/classfi'
license=('GPL-3.0')
depends=('mpv')
options=(!debug)
provides=('classfi')
conflicts=('classfi' 'classfi-git')
source=("$_pkgname-$pkgver-bin.tar.gz::$url/releases/download/v$pkgver/classfi-x86_64-unknown-linux-gnu.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/carmiac/classfi/refs/tags/v$pkgver/LICENSE")
sha256sums=('86a56ba95c3149c69210b77c4a787abc8d72797440ece32d9e02d2f0f5c230ef'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
    install -Dm0755 classfi "$pkgdir/usr/bin/classfi"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

# vim: ts=4 sw=4 et:
