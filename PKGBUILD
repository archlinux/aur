# Maintainer: Protesilaos Stavrou <info@protesilaos.com>, archjo

pkgname=ubuntu-mate-icon-themes
pkgver=19.04.0
pkgrel=1
pkgdesc='The official icon themes for Ubuntu MATE'
arch=('any')
url='https://launchpad.net/ubuntu-mate/'
license=('GPL3')
optdepends=('ubuntu-mate-themes: GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE'
            'mate-icon-theme: MATE default icon theme')
groups=('mate-extra')
source=("https://mirrors.edge.kernel.org/ubuntu/pool/universe/u/ubuntu-mate-artwork/${pkgname}_${pkgver}_all.deb")
sha256sums=('1b7d17ebedadd05de40e68f3312007dda25214e2551c96475b6f3db4807ae5b0')

package() {
    tar xf data.tar.xz
    mv usr $pkgdir/
}
