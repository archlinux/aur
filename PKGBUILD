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
sha512sums=('7c185eb17070d0289ac66e9bd4678e6b812899d92145266569a3de55dcd4164d')

package() {
    cd $srcdir/$pkgname-$pkgver/src
    mkdir -p $pkgdir/usr/share/plymouth/themes/arch-charge-gdm-spinner
    install -Dm644 * "${pkgdir}"/usr/share/plymouth/themes/arch-charge-gdm-spinner
}


