# Maintainer: JOLIMAITRE Matthieu <matthieu@imagevo.fr>
pkgname="regar-bin"
pkgver=1.1.0
pkgrel=1
pkgdesc="Cli for watching file changes and running commands periodically."
url="https://git.barnulf.net/mb/regar"
arch=("x86_64")
license=('MIT')
source=("https://git.barnulf.net/api/packages/mb/generic/regar/latest/regar-x86_64-unknown-linux-gnu.zip")
sha256sums=("c9b125d06f5085561e80335435baa57697442c3ba0d219cea854eff84f4af1e2")
options=("!strip")
provides=("regar")

package() {
    install -Dm755 regar "$pkgdir/usr/bin/regar"
}

pkgver() {
    ./regar -V
}
