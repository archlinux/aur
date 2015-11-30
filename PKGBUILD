#Maintainer: jsayol <josep.sayol at gmail dot com>

pkgname=plymouth-theme-dark-arch
pkgver=20151130
pkgrel=1
pkgdesc="A Plymouth theme with a dark background and a big spinner around the ArchLinux logo."
arch=('any')
url="https://github.com/jsayol/plymouth-theme-dark-arch"
license=('GPL')
depends=('plymouth')

install='plymouth-theme-dark-arch.install'
source=('20151130-1.tar.gz::https://github.com/jsayol/plymouth-theme-dark-arch/archive/20151130-1.tar.gz'
        'plymouth-theme-dark-arch.install')
md5sums=('ba8149d9a28bbbbf86ebf5fce9f60056' 
         '07303446247afeeffd460bcdeb314321')

package() {
    cd $srcdir/${pkgname}-${pkgver}-${pkgrel}
    mkdir -p $pkgdir/usr/share/plymouth/themes/dark-arch
    install -Dm644 * "${pkgdir}"/usr/share/plymouth/themes/dark-arch
}

