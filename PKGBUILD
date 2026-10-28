# Maintainer: Philipp Thaler <aur@thaler.fyi>
pkgname=signal-cli-native-bin
pkgver=0.14.9
pkgrel=1
pkgdesc="signal-cli provides a commandline and dbus interface for the Signal messenger (GraalVM native binary)"
arch=('x86_64')
url="https://github.com/AsamK/signal-cli"
license=('GPL-3.0-only')
provides=('signal-cli')
conflicts=('signal-cli')

source=("https://github.com/AsamK/signal-cli/releases/download/v$pkgver/signal-cli-$pkgver-Linux-native.tar.gz"
        "https://github.com/AsamK/signal-cli/releases/download/v$pkgver/signal-cli-$pkgver-Linux-native.tar.gz.asc")
sha256sums=('a8fab78b5e8053abf3db5725272957ad11d1745b9a16848ddb2ace4743dfa5d5'
            'SKIP')
sha512sums=('89d861c6dccc4277d601719845892c4196272c44a8a5af68b054bd8e237c0915a52d9830ee6322f4cc6b74ad6a4a704010b34e884fc5869cc5827abd112cea96'
            'SKIP')
validpgpkeys=('FA10826A74907F9EC6BBB7FC2BA2CD21B5B09570')

package() {
    install -Dm755 "$srcdir/signal-cli" "$pkgdir/usr/bin/signal-cli"
}
