# Maintainer: Protesilaos Stavrou <info@protesilaos.com>

pkgname=ubuntu-mate-icon-themes
pkgver=18.04.7
pkgrel=1
pkgdesc='The official icon themes for Ubuntu MATE'
arch=('any')
url='https://launchpad.net/ubuntu-mate/'
license=('GPL3')
optdepends=('ubuntu-mate-themes: GTK2, GTK3, Unity and Metacity themes from Ubuntu MATE'
            'mate-icon-theme: MATE default icon theme')
groups=('mate-extra')
source=("https://mirrors.kernel.org/ubuntu/pool/universe/u/ubuntu-mate-artwork/${pkgname}_${pkgver}_all.deb")
sha512sums=('a9d42a840bbf0a63e1f7242aae904ed53656be3fd0053b832ffa00d2f2f01b2d7da7111b4628994c34bbbe785b617667e4e73ac9849ba66fc61572c395dde70b')

package() {
    tar xf data.tar.xz
    mv usr $pkgdir/
}
