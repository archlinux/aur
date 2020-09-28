# Maintainer: Yamada Hayao <hayao@fascode.net>

_pkgname=numix-blue-gtk-theme
pkgname=numix-blue-gtk-theme-bin
#pkgver="20.04.1"
pkgver="0.54"
pkgrel="2"
pkgdesc='Variant of the Numix theme with blue highlights'
arch=('any')
url='https://packages.ubuntu.com/focal/numix-blue-gtk-theme'
#source=("http://mirrors.kernel.org/ubuntu/pool/universe/u/ubuntustudio-look/numix-blue-gtk-theme__all.deb")
source=("http://archive.ubuntu.com/ubuntu/pool/universe/u/ubuntustudio-look/numix-blue-gtk-theme_${pkgver}_all.deb")
license=('GPL')
depends=('gtk-engine-murrine')
md5sums=("SKIP")


prepare() {
    tar -xvf data.tar.xz
}

package() {
    cp -r ${srcdir}/usr ${pkgdir}/usr
}
