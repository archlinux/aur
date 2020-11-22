# Maintainer: fhdk <arch at nix dk>

pkgname='endeavouros-galleon-grub'
pgkdesc='EndeavourOS Galleon GRUB Theme'
pkgver=0.5
pkgrel=1
arch=('any')
license=('MIT')
source=("https://github.com/fhdk/endeavouros-galleon/archive/v$pkgver.tar.gz")
depends=('grub')
install=theme.install
provides=('endeavouros-galleon')
replaces=('endeavouros-nix')
md5sums=('2511bf16518ac06a30ad939221fba455')

package() {
    cd $srcdir/endeavouros-galleon-$pkgver
    install -d -m755 $pkgdir/usr/share/grub/themes/endeavouros-galleon
    cp -R endeavouros-galleon $pkgdir/usr/share/grub/themes/
}

