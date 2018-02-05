# Maintainer: Protesilaos Stavrou <info@protesilaos.com>

pkgname=ubuntu-mate-icon-themes
pkgver=17.10.10
pkgrel=1
pkgdesc="The official icon themes for Ubuntu MATE."
arch=('any')
url="https://launchpad.net/ubuntu-mate/"
license=('GPL3')
optdepends=("ubuntu-mate-themes: GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE")
groups=('mate-extra')
source=("http://mirrors.kernel.org/ubuntu/pool/universe/u/ubuntu-mate-artwork/${pkgname}_${pkgver}_all.deb")
sha512sums=('2189fdc0718c8ec2e8edbc0c8f0adce08d22c008a28fe1f430920243aeadb290599cfc7187f86156d4619cb3113a8edaa1ba77b57f104bdd3195b7bf28a04ecb')

package() {
    tar xf data.tar.xz
    mv usr $pkgdir/
}
