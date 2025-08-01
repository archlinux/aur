# Maintainer: JOLIMAITRE Matthieu <matthieu@imagevo.fr>
pkgname="regar-bin"
pkgver=1.1.1
pkgrel=1
pkgdesc="Cli for watching file changes and running commands periodically."
url="https://git.barnulf.net/mb/regar"
arch=("x86_64")
license=('MIT')
source=("https://git.barnulf.net/api/packages/mb/generic/regar/latest/regar-x86_64-unknown-linux-gnu.zip")
sha256sums=("994d5ba6b7d31d2b7163d9f2020ad06a878cf191c2b87d3817a7b2069baceb05")
options=("!strip")
provides=("regar")

package() {
    install -Dm755 regar "$pkgdir/usr/bin/regar"
}

pkgver() {
    ./regar -V
}
