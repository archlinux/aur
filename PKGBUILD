# Maintainer: Echo https://github.com/CallMeEchoCodes
pkgname=dossier
pkgver=0.0.3
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
sha256sums=('adf3e9c27f9aa71a622e1b38de0a12e1957420fa137a2ca15b162078d94b6587')
