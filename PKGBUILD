# Maintainer: JOLIMAITRE Matthieu <matthieu@imagevo.fr>
pkgname="regar-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc="Cli for watching file changes and running commands periodically."
url="https://git.barnulf.net/mb/regar"
arch=("x86_64")
license=('MIT')
source=("https://git.barnulf.net/api/packages/mb/generic/regar/latest/regar-x86_64-unknown-linux-gnu.zip")
sha256sums=("73248c044fa53704ebdfbdfdb1162bdd61c828ef6f3f9de998eeb1c5ef5f3f06")
options=("!strip")
provides=("regar")

package() {
    install -Dm755 regar "$pkgdir/usr/bin/regar"
}

pkgver() {
    ./regar -V
}
