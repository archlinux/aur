# Maintainer: Protesilaos Stavrou <info@protesilaos.com>, archjo

pkgname=ubuntu-mate-icon-themes
pkgver=18.10.1
pkgrel=1
pkgdesc='The official icon themes for Ubuntu MATE'
arch=('any')
url='https://launchpad.net/ubuntu-mate/'
license=('GPL3')
optdepends=('ubuntu-mate-themes: GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE'
            'mate-icon-theme: MATE default icon theme')
groups=('mate-extra')
source=("https://mirrors.edge.kernel.org/ubuntu/pool/universe/u/ubuntu-mate-artwork/${pkgname}_${pkgver}_all.deb")
sha256sums=('6c200d309da45ab6b3cf2bc747e015b136c751c3a739a0a13f25e27b5393c0e8')

package() {
    tar xf data.tar.xz
    mv usr $pkgdir/
}
