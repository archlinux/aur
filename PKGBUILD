# Maintainer: JOLIMAITRE Matthieu <matthieu@imagevo.fr>
pkgname="regar-bin"
pkgver=1.1.2
pkgrel=1
pkgdesc="Cli for watching file changes and running commands periodically."
url="https://git.barnulf.net/mb/regar"
arch=("x86_64")
license=('MIT')
source=("https://git.barnulf.net/api/packages/mb/generic/regar/latest/regar-x86_64-unknown-linux-gnu.zip")
sha256sums=("a8556e48382320432b0083d4aaa1af2e45097aa02a01340690b28f78197468bd")
options=("!strip")
provides=("regar")

package() {
    install -Dm755 regar "$pkgdir/usr/bin/regar"
}

pkgver() {
    ./regar -V
}
