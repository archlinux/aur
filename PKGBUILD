# Maintainer: Echo https://github.com/CallMeEchoCodes
pkgname=dossier
pkgver=0.0.1
pkgrel=1
pkgdesc='A lightweight dotfile bootstrapper!'
arch=('any')
url="https://github.com/CallMeEchoCodes/dossier"
license=('MIT')
depends=( jq gum )
provides=( dossier )
source=("dossier::https://github.com/CallMeEchoCodes/Dossier/releases/download/$pkgver/dossier")
sha256sums=('670babf0b914c60f07b40429a5ac8add0ed81c02de9e3bf8523e42e9b2411111')
package() {
   install -Dm755 "$srcdir/dossier" "$pkgdir/usr/bin/dossier"
}