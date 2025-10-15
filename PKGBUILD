# Maintainer: Wenqian <lazycat7706@gmail.com>

pkgname=otree-release
pkgver=0.6.2
pkgrel=1
pkgdesc="A command line tool to view objects (JSON/YAML/TOML) in TUI tree widget"
arch=('x86_64')
url="https://github.com/fioncat/otree"
license=('MIT')

source=("$pkgname-$pkgver::https://github.com/fioncat/otree/releases/download/v${pkgver}/otree-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('10a348593468bc34ee28d7e331f69cb6fb37fe4733bc220b200d49edff4aa1ee')

options=('!strip' '!debug')

package() {
    install -Dm755 "otree" "$pkgdir/usr/bin/otree"
}
