# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

pkgname=android-rust
pkgver=1
pkgrel=1
arch=('any')
pkgdesc="Script providing common environment variables and functions for Rust build on Android."
url='https://aur.archlinux.org/packages/android-rust'
license=('MIT')
depends=('android-environment'
         'cargo-c'
         'rustup')
source=('android-rust-env.sh')
md5sums=('5c46880c932383df93abb6a0520ea3e2')

package() {
    install -d ${pkgdir}/usr/bin
    install -m755 android-rust-env.sh ${pkgdir}/usr/bin/android-rust-env
}
