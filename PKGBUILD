# Maintainer: Wenqian <lazycat7706@gmail.com>

pkgname=otree-release
pkgver=0.5.2
pkgrel=1
pkgdesc="A command line tool to view objects (JSON/YAML/TOML) in TUI tree widget"
arch=('x86_64')
url="https://github.com/fioncat/otree"
license=('MIT')

source=("$pkgname-$pkgver::https://github.com/fioncat/otree/releases/download/v${pkgver}/otree-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('9ad8b1e6b63f9dd76b2ef7ead5d112a2595419bf84a20a188929b4acd9e707ff')

options=('!strip' '!debug')

package() {
    install -Dm755 "otree" "$pkgdir/usr/bin/otree"
}
