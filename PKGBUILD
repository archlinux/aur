# Maintainer: Sich <little_sich@tuta.io>
# Contributor: Protesilaos Stavrou <info@protesilaos.com>, archjo
pkgname=ubuntu-mate-icon-themes
pkgver=24.10.0
pkgrel=1
pkgdesc='The official icon themes for Ubuntu MATE'
arch=('any')
url='https://launchpad.net/ubuntu-mate/'
license=('GPL3')
optdepends=('ubuntu-mate-themes: GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE'
            'mate-icon-theme: MATE default icon theme')
groups=('mate-extra')
source=("https://mirrors.edge.kernel.org/ubuntu/pool/universe/u/ubuntu-mate-artwork/${pkgname}_${pkgver}_all.deb")
sha1sums=('56d359838e6c4f56f32513ed31bc30ba42de760f')

package() {
    tar xf data.tar.zst
    mv usr $pkgdir/
}
