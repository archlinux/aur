# Maintainer: fhdk <arch at nix dk>

pkgname='endeavouros-galleon-grub'
pgkdesc='EndeavourOS Galleon GRUB Theme'
pkgver=0.4
pkgrel=1
arch=('any')
license=('MIT')
source=("https://github.com/fhdk/endeavouros-galleon/archive/v$pkgver.tar.gz")
depends=('grub')
install=theme.install
provides=('endeavouros-galleon')
replaces=('endeavouros-nix')
md5sums=('4d178d06a8e7a17db4ba1855967307e1')

package() {
    cd $srcdir/$pkgname-$pkgver
    install -d -m755 $pkgdir/usr/share/grub/themes/$pkgname
    cp -R $pkgname $pkgdir/usr/share/grub/themes/
}

