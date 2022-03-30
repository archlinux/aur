#Maintainer: A. Taha Baki <atahabaki@pm.me>

pkgname=plymouth-theme-arch-charge-gdm-spinner
pkgver=0.3.1
pkgrel=1
pkgdesc="A Plyouth theme based on Fedora's Charge theme, but featuring the ArchLinux logo. Based on sjmcdougall's Arch Charge theme replaced password prompt with the spinner's theme"
arch=('any')
url="https://github.com/atahabaki/plymouth-theme-arch-charge-gdm-spinner"
license=('GPL')
depends=('plymouth')

install='plymouth-theme-arch-charge-gdm-spinner.install'
source=("https://github.com/atahabaki/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('dda2aae20b00d2dcfd2d9959f8fb159acabc3ff0dfc94b81c03a94d9e86643e5c66b04b9a3eaef2afad66dfad83ce9b7f3b589089ff24234887f18bbf95835d3')

package() {
    cd $srcdir/$pkgname-$pkgver/src
    mkdir -p $pkgdir/usr/share/plymouth/themes/arch-charge-gdm-spinner
    install -Dm644 * "${pkgdir}"/usr/share/plymouth/themes/arch-charge-gdm-spinner
}


