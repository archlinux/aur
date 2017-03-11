# Maintainer: BrLi <brli@chakralinux.org>

pkgname=("plasma5-wallpapers-chakra-tulip")
pkgver=2016.05
pkgrel=1
pkgdesc="Chakra Tulip Wallpaper by almack"
url="http://www.chakralinux.org"
license=("GPL" "CC-BY-SA")
arch=('any')
source=("http://rsync.chakraos.org/sources/chakra-artwork/wallpapers/tulip/tulip_${pkgver}-1.tar.gz")
md5sums=('25b914f22d367cedca93084ea10a898e')

package() {
    cd ${srcdir}/tulip

    mkdir -pv ${pkgdir}/usr/share/wallpapers/tulip/contents/
    cp -Rv * ${pkgdir}/usr/share/wallpapers/tulip
}
