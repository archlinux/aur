# Maintainer: Protesilaos Stavrou <info@protesilaos.com>, archjo

pkgname=ubuntu-mate-icon-themes
pkgver=20.04.2
pkgrel=1
pkgdesc='The official icon themes for Ubuntu MATE'
arch=('any')
url='https://launchpad.net/ubuntu-mate/'
license=('GPL3')
optdepends=('ubuntu-mate-themes: GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE'
            'mate-icon-theme: MATE default icon theme')
groups=('mate-extra')
source=("https://mirrors.edge.kernel.org/ubuntu/pool/universe/u/ubuntu-mate-artwork/${pkgname}_${pkgver}_all.deb")
sha256sums=('2b102341004b3b54153ea76f7655869e23419842d72820acf17fdeec566a3940')

package() {
    tar xf data.tar.xz
    mv usr $pkgdir/
}
