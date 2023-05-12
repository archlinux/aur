# Maintainer: Echo https://github.com/CallMeEchoCodes
pkgname=dossier
pkgver=0.0.5
pkgrel=2
pkgdesc='A lightweight dotfile bootstrapper!'
arch=('any')
url="https://github.com/CallMeEchoCodes/dossier"
license=('MPL-2.0')
depends=( jq gum )
provides=( dossier )
source=("dossier::https://github.com/CallMeEchoCodes/Dossier/releases/download/$pkgver/dossier")
package() {
   install -Dm755 "$srcdir/dossier" "$pkgdir/usr/bin/dossier"
}
sha256sums=('db6537e52356ebe69af195104462494c4d154599322e1ddb6dba578fa5413020')
