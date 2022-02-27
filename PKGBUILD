# Maintainer: Zoltan Guba <zoltan dot guba at gubamm dot hu>
# makepkg --printsrcinfo > .SRCINFO
# makepkg -g >>PKGBUILD

pkgname=archsysback
pkgver=0.4
pkgrel=1
pkgdesc="Archiso config for building Arch Linux Live Backup iso from your installed system"
arch=('any')
url="https://github.com/toxin265/archsysback"
license=('GPL')
groups=(system)
depends=(archiso=0.46 mkinitcpio-archiso=0.46 refind-efi nbd syslinux timeshift amd-ucode intel-ucode memtest86+ xdg-user-dirs xterm mkinitcpio-nfs-utils)
makedepends=(xz)
provides=('archsysback')
conflicts=('archsysback')
source=("https://raw.githubusercontent.com/toxin265/archsysback/master/$pkgname-$pkgver.tar.xz")
#source=("file://./$pkgname-$pkgver.tar.xz")

package() {
    cd "$srcdir"
    tar xf "$pkgname-$pkgver.tar.xz"
    cp -r ./*/ "$pkgdir"
}


md5sums=('4566532f456dfedd4f48ad7fa03080e3')
