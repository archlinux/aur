# Maintainer: Wenqian <lazycat7706@gmail.com>

pkgname=otree-release
pkgver=0.6.3
pkgrel=1
pkgdesc="A command line tool to view objects (JSON/YAML/TOML) in TUI tree widget"
arch=('x86_64')
url="https://github.com/fioncat/otree"
license=('MIT')

source=("$pkgname-$pkgver::https://github.com/fioncat/otree/releases/download/v${pkgver}/otree-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('76af3e61f0ec00b96eea16696656cc754ab57b795bcf600a2d19bdf0e5142983')

options=('!strip' '!debug')

package() {
    install -Dm755 "otree" "$pkgdir/usr/bin/otree"
}
