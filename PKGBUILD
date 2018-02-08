# Maintainer: Mikel Pintado <mikelaitornube2010@gmail.com>

pkgname=nuclear-player
pkgver=0.4.0
pkgrel=1
pkgdesc="A free, multiplatform music player app that streams from multiple sources."
arch=('x86_64')
url="http://nuclear.gumblert.tech/"
install=nuclear-player.install
license=('GPL3')
depends=('gconf' 'libnotify' 'libappindicator-gtk3' 'libxtst' 'nss')
source=(https://github.com/nukeop/nuclear/releases/download/20180208152230-ef027aa/nuclear_0.4.0_amd64.deb)
md5sums=('a7088938ed99f215da3e8c19a17a4b28')

package()   {
    tar xf data.tar.xz

    cp --preserve=mode -r usr "${pkgdir}"
    cp --preserve=mode -r opt "${pkgdir}"

    find "${pkgdir}" -type d -exec chmod 755 {} +
}

