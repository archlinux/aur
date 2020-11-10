# Maintainer: Protesilaos Stavrou <info@protesilaos.com>, archjo

pkgname=ubuntu-mate-icon-themes
pkgver=20.10.1
pkgrel=1
pkgdesc='The official icon themes for Ubuntu MATE'
arch=('any')
url='https://launchpad.net/ubuntu-mate/'
license=('GPL3')
optdepends=('ubuntu-mate-themes: GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE'
            'mate-icon-theme: MATE default icon theme')
groups=('mate-extra')
source=("https://mirrors.edge.kernel.org/ubuntu/pool/universe/u/ubuntu-mate-artwork/${pkgname}_${pkgver}_all.deb")
sha256sums=('25574f53178fa9f53b819b270003da9e416f9b0394b20e7923ba19707d35ac38')

package() {
    tar xf data.tar.xz
    mv usr $pkgdir/
}
