# Maintainer: Echo https://github.com/CallMeEchoCodes
pkgname=dossier
pkgver=0.0.2
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
sha256sums=('3724a590d093f9f51ce4734d5c9a84a97a80dbf99a5ac228473660848ceef1ad')
