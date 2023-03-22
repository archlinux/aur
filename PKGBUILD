# Maintainer: Echo https://github.com/CallMeEchoCodes
pkgname=dossier
pkgver=0.0.4
pkgrel=1
pkgdesc='A lightweight dotfile bootstrapper!'
arch=('any')
url="https://github.com/CallMeEchoCodes/dossier"
license=('MIT')
depends=( jq gum )
provides=( dossier )
source=("dossier::https://github.com/CallMeEchoCodes/Dossier/releases/download/$pkgver/dossier")
package() {
   install -Dm755 "$srcdir/dossier" "$pkgdir/usr/bin/dossier"
}
sha256sums=('1c0610d7c002e40184d731b5c5554a67612974eae7c71c241474556e76c9de51')
