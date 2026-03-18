pkgname=bebz-essentials
pkgver=1.0.0
pkgrel=1
pkgdesc="L'installeur interactif de la Bebzerie (Gaming, Drivers)"
arch=('any')
url="https://github.com/FlyXOwl/aur-bebz-essentials"
license=('MIT')
install=bebz.install

depends=('gum' 'base-devel' 'git')

source=("bebzmenu.sh")
sha256sums=('12f6b66cf8de7f0cb7d68fd3d8536565f4a19094d44cd4ac57626172a8ba99db')

package() {
    install -Dm755 "${srcdir}/bebzmenu.sh" "${pkgdir}/usr/bin/bebzmenu"
}
