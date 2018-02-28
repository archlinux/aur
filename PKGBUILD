# Maintainer: Prasad Kumar
pkgname=arrongin.left.button-gtk-theme
pkgver=1.4
pkgrel=1
pkgdesc="Arrongin GTK theme with window-control-buttons on the left-side."
arch=('any')
url="https://www.opendesktop.org/p/1215199/"
license=("CC BY-NC-SA")
depends=('bash')
provides=('arrongin.left.button-gtk-theme')
source=("${pkgname}::https://dl.opendesktop.org/api/files/downloadfile/id/1519777332/s/a9ad8c01a5b923afaff0d41785bf56fe/t/1519795001/u//Arrongin-W-buttons-left-$pkgver.tar.xz")
sha512sums=('4c6cddb3851346eccac9fe395d9ae17b9dfe392914c9802005568db256ab4a66598b7c0a945a84e2738e0fc93b7d510505bc417b8373da47d5bd15a91ce86ce9')
package() {
  cd ${srcdir}/Arrongin-W-buttons-left-${pkgver}
  install -d "$pkgdir"/usr/share/themes/${pkgname}
  cp -rf * "$pkgdir"/usr/share/themes/${pkgname}
}
