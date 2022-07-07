# Maintainer: Max Gautier <mg@max.gautier.name>
pkgname=mutt-desktop
pkgver=1
pkgrel=2
pkgdesc="Mutt desktop file"
arch=('any')
url="http://mutt.org"
license=('GPL')
depends=('mutt' 'neomutt-logo')
source=("mutt.desktop")
md5sums=('SKIP')

package() {
    install -Dm 644 -t "$pkgdir"/usr/share/applications/ mutt.desktop
}
