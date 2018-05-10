# Maintainer: Protesilaos Stavrou <info@protesilaos.com>

pkgname=ubuntu-mate-icon-themes
pkgver=18.04.11
pkgrel=1
pkgdesc='The official icon themes for Ubuntu MATE'
arch=('any')
url='https://launchpad.net/ubuntu-mate/'
license=('GPL3')
optdepends=('ubuntu-mate-themes: GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE'
            'mate-icon-theme: MATE default icon theme')
groups=('mate-extra')
source=("https://mirrors.edge.kernel.org/ubuntu/pool/universe/u/ubuntu-mate-artwork/${pkgname}_${pkgver}_all.deb")
sha512sums=('aa81f511be74a5aff856268116f341a196b745933831245bd174113e4c4d90c6a52ff929901eba0ac29f1715184d6167d73057b4416f770be035992fd8ccca3b')

package() {
    tar xf data.tar.xz
    mv usr $pkgdir/
}
