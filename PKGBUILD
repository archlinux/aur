# Maintainer: Protesilaos Stavrou <info@protesilaos.com>, archjo

pkgname=ubuntu-mate-icon-themes
pkgver=21.04.6
pkgrel=1
pkgdesc='The official icon themes for Ubuntu MATE'
arch=('any')
url='https://launchpad.net/ubuntu-mate/'
license=('GPL3')
optdepends=('ubuntu-mate-themes: GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE'
            'mate-icon-theme: MATE default icon theme')
groups=('mate-extra')
source=("https://mirrors.edge.kernel.org/ubuntu/pool/universe/u/ubuntu-mate-artwork/${pkgname}_${pkgver}_all.deb")
sha256sums=('236fdabf25db46b9cb4875b3f842deee3d943429f38f91e3fc7e9062e4936f03')

package() {
    tar xf data.tar.xz
    mv usr $pkgdir/
}
