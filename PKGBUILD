# Maintainer: Zoltan Guba <zoltan dot guba at gubamm dot hu>
# makepkg --printsrcinfo > .SRCINFO
# makepkg -g >>PKGBUILD

pkgname=archsysback
pkgver=0.1
pkgrel=1
pkgdesc="Archiso config for building Arch Linux Live Backup iso from your installed system"
arch=('any')
url="https://github.com/toxin265/archsysback"
license=('GPL')
groups=(system)
depends=(archiso refind-efi nbd syslinux timeshift amd-ucode intel-ucode memtest86+)
makedepends=(xz)
provides=('archsysback')
conflicts=('archsysback')
source=("https://raw.githubusercontent.com/toxin265/archsysback/master/archsysback.tar.xz")
md5sums=('8946fe8eef5a5450807506dbacff8c14')

package() {
    cd "$srcdir"
    cp -r ./*/ "$pkgdir"
}
