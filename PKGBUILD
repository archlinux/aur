# Maintainer: Philipp Thaler <aur@thaler.fyi>
pkgname=signal-cli-native-bin
pkgver=0.14.10
pkgrel=1
pkgdesc="signal-cli provides a commandline and dbus interface for the Signal messenger (GraalVM native binary)"
arch=('x86_64')
depends=('glibc' 'zlib')
options=('!strip' '!debug')
url="https://github.com/AsamK/signal-cli"
license=('GPL-3.0-only')
provides=('signal-cli')
conflicts=('signal-cli')

source=("https://github.com/AsamK/signal-cli/releases/download/v$pkgver/signal-cli-$pkgver-Linux-native.tar.gz"
        "https://github.com/AsamK/signal-cli/releases/download/v$pkgver/signal-cli-$pkgver-Linux-native.tar.gz.asc")
sha256sums=('db9297789c5bbc6131df505d2f37abe43efa0b54200585f5e56b478e1cd93916'
            'SKIP')
sha512sums=('270e7663aa7ef95e2827275a5b3d416fb67c56049d3795786e1ca86d695eb56f332fa56887f0bb31494fede2c29e6da560152b11fbd374243d9dbf34067d77df'
            'SKIP')
validpgpkeys=('FA10826A74907F9EC6BBB7FC2BA2CD21B5B09570')

package() {
    install -Dm755 "$srcdir/signal-cli" "$pkgdir/usr/bin/signal-cli"
}
