# Maintainer: Zoltan Guba <zoltan dot guba at gubamm dot hu>
# makepkg --printsrcinfo > .SRCINFO
# makepkg -g >>PKGBUILD

pkgname=archsysback
pkgver=0.2
pkgrel=1
pkgdesc="Archiso config for building Arch Linux Live Backup iso from your installed system"
arch=('any')
url="https://github.com/toxin265/archsysback"
license=('GPL')
groups=(system)
depends=(archiso refind-efi nbd syslinux timeshift amd-ucode intel-ucode memtest86+ xdg-user-dirs xterm)
makedepends=(xz)
provides=('archsysback')
conflicts=('archsysback')
source=("https://raw.githubusercontent.com/toxin265/archsysback/master/$pkgname-$pkgver.tar.xz")
# source=("file://./$pkgname-$pkgver.tar.xz")

package() {
    cd "$srcdir"
    tar xf *
    cp -r ./*/ "$pkgdir"
}
md5sums=('205a4953a57b1d66893e5cd993d8bdbd')
