# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

pkgname=android-rust
pkgver=2
pkgrel=1
arch=('any')
pkgdesc="Script providing common environment variables and functions for Rust build on Android."
url='https://aur.archlinux.org/packages/android-rust'
license=('MIT')
depends=('android-environment'
         'cargo-c'
         'rustup')
source=('android-rust-env.sh')
md5sums=('b4cec673167780158ffd5d586c779529')

package() {
    install -d ${pkgdir}/usr/bin
    install -m755 android-rust-env.sh ${pkgdir}/usr/bin/android-rust-env
}
