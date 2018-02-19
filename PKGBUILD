# Maintainer: Protesilaos Stavrou <info@protesilaos.com>

pkgname=ubuntu-mate-icon-themes
pkgver=18.04.3
pkgrel=3
pkgdesc='The official icon themes for Ubuntu MATE'
arch=('any')
url='https://launchpad.net/ubuntu-mate/'
license=('GPL3')
optdepends=('ubuntu-mate-themes: GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE'
            'mate-icon-theme: MATE default icon theme')
groups=('mate-extra')
source=("https://mirrors.kernel.org/ubuntu/pool/universe/u/ubuntu-mate-artwork/${pkgname}_${pkgver}_all.deb")
sha512sums=('00c03047241c74869e3a4834b1d77c620aa1893e4361aa56586b48f6ce22cc5330a2a827215359369d642b1c3aa6b53ea4017abc6d0fb9dbbeb726509a1abbe9')

package() {
    tar xf data.tar.xz
    mv usr $pkgdir/
}
