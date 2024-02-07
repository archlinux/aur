# Maintainer: Sich <little_sich@tuta.io>
# Contributor: Protesilaos Stavrou <info@protesilaos.com>, archjo
pkgname=ubuntu-mate-icon-themes
pkgver=23.04.1
pkgrel=1
pkgdesc='The official icon themes for Ubuntu MATE'
arch=('any')
url='https://launchpad.net/ubuntu-mate/'
license=('GPL3')
optdepends=('ubuntu-mate-themes: GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE'
            'mate-icon-theme: MATE default icon theme')
groups=('mate-extra')
source=("https://mirrors.edge.kernel.org/ubuntu/pool/universe/u/ubuntu-mate-artwork/${pkgname}_${pkgver}_all.deb")
sha512sums=('61a213e9fdd09fda58a54d51bf48cb357ac5dd937e5691bab539e8406b6b3c268b8536a509c2b36aad5c8f20c5fb5d3a7a6c25b2cb3bc641979b6de61d1b2600')

package() {
    tar xf data.tar.zst
    mv usr $pkgdir/
}
