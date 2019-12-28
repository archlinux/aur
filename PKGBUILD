# Maintainer: Zoltan Guba <zoltan dot guba at gubamm dot hu>
# makepkg --printsrcinfo > .SRCINFO
# makepkg -g >>PKGBUILD

pkgname=arch-grub2-theme
pkgver=1.0
pkgrel=1
pkgdesc="Grub2 GFX theme for Arch Linux"
arch=('any')
url="https://github.com/toxin265/arch-grub2-theme"
license=('GPL')
groups=(system)
depends=(grub)
makedepends=(xz)
provides=($pkgname)
conflicts=($pkgname)
source=("https://github.com/toxin265/arch-grub2-theme/raw/master/arch.tar.xz")
md5sums=('29f99092b42d44df6a3cc462a266565e')
install=$pkgname.install

package() {
    cd "$srcdir"
    mkdir -p boot/grub/themes
    mv arch -t boot/grub/themes
    cp -r ./*/ "$pkgdir"
}
