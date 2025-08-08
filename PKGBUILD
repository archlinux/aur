# Maintainer: Wenqian <lazycat7706@gmail.com>

pkgname=otree-release
pkgver=0.5.0
pkgrel=1
pkgdesc="A command line tool to view objects (JSON/YAML/TOML) in TUI tree widget"
arch=('x86_64')
url="https://github.com/fioncat/otree"
license=('MIT')

source=("$pkgname-$pkgver::https://github.com/fioncat/otree/releases/download/v${pkgver}/otree-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('525f8032753ba09ceb1704ee09a129c7e494592e11a27ae56e8420912bc02f03')

options=('!strip' '!debug')

package() {
    install -Dm755 "otree" "$pkgdir/usr/bin/otree"
}
