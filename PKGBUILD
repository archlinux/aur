# Maintainer: JOLIMAITRE Matthieu <matthieu@imagevo.fr>
pkgname="regar-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc="Cli for watching file changes and running commands periodically."
url="https://git.barnulf.net/mb/regar"
arch=("x86_64")
license=('MIT')
source=("https://git.barnulf.net/api/packages/mb/generic/regar/latest/regar-x86_64-unknown-linux-gnu.zip")
sha256sums=("4f04da4f00e74032d86f6a8051d10120588d16ba3d0eb3bf5bd4742f836975ab")
options=("!strip")
provides=("regar")

package() {
    install -Dm755 regar "$pkgdir/usr/bin/regar"
}

pkgver() {
    ./regar -V
}
