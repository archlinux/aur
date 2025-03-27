# Maintainer: Wenqian <lazycat7706@gmail.com>

pkgname=otree-release
pkgver=0.3.1
pkgrel=1
pkgdesc="A command line tool to view objects (JSON/YAML/TOML) in TUI tree widget"
arch=('x86_64')
url="https://github.com/fioncat/otree"
license=('MIT')

source=("$pkgname-$pkgver::https://github.com/fioncat/otree/releases/download/v${pkgver}/otree-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('9b8ca244c0475808956d4b0f4fe41b4fcd937f1a29d2ae28f1a908d4dd7f6723')

options=('!strip' '!debug')

package() {
    install -Dm755 "otree" "$pkgdir/usr/bin/otree"
}
