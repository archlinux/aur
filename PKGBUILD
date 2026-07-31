# Maintainer: Philipp Thaler <aur@thaler.fyi>
pkgname=signal-cli-native-bin
pkgver=0.14.6
pkgrel=1
pkgdesc="signal-cli provides a commandline and dbus interface for the Signal messenger (GraalVM native binary)"
arch=('x86_64')
url="https://github.com/AsamK/signal-cli"
license=('GPL-3.0-only')
provides=('signal-cli')
conflicts=('signal-cli')

source=("https://github.com/AsamK/signal-cli/releases/download/v$pkgver/signal-cli-$pkgver-Linux-native.tar.gz"
        "https://github.com/AsamK/signal-cli/releases/download/v$pkgver/signal-cli-$pkgver-Linux-native.tar.gz.asc")
sha256sums=('c78639c2d3c14cd004872a99ecf129bd7d7c26ee7d9844d50c2b0afdafefea68'
            'SKIP')
sha512sums=('5bcdc164367b9bb49ed4c6203cd5995d6ccd6e1dcfbd111eccf465857ff93490fb8755a79767f5dcd80aa2b007a5d873f25faf866f8b6b0c0f3ae9369ed7e8e7'
            'SKIP')
validpgpkeys=('FA10826A74907F9EC6BBB7FC2BA2CD21B5B09570')

package() {
    install -Dm755 "$srcdir/signal-cli" "$pkgdir/usr/bin/signal-cli"
}
