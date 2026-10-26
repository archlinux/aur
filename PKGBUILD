# Maintainer: Ulises Jeremias <ulisescf.24@gmail.com>
pkgname=create-awesome-rust-app-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Rust-native scaffolding CLI for the Rust programming language (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Create-Rust-App/create-rust-app"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=('create-rust-app' 'create-awesome-rust-app')
conflicts=('create-awesome-rust-app' 'create-rust-app')
source=("create-rust-app-linux-x86_64::https://github.com/Create-Rust-App/create-rust-app/releases/download/create-rust-app@${pkgver}/create-rust-app-linux-x86_64")
sha256sums=('299a3f6d157333cc8c6fcf0f28fe0f37bf072a375497fcf7fb941b824fcdde3f')

package() {
  install -Dm755 "${srcdir}/create-rust-app-linux-x86_64" "$pkgdir/usr/bin/create-rust-app"
  ln -s create-rust-app "$pkgdir/usr/bin/create-awesome-rust-app"
}
