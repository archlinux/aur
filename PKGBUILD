pkgname=bebz-essentials
pkgver=1.1.0
pkgrel=1
pkgdesc="L'installeur interactif de la Bebzerie (Gaming, Drivers)"
arch=('any')
url="https://github.com/FlyXOwl/aur-bebz-essentials"
license=('MIT')
install=bebz.install

depends=('gum' 'base-devel' 'git')

source=("bebzmenu.sh")
sha256sums=('daeb8f194c28b544b24ac98b2c9c8b30e839997d1219913465365825d5ca2942')

package() {
    install -Dm755 "${srcdir}/bebzmenu.sh" "${pkgdir}/usr/bin/bebzmenu"
}
