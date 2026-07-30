# Maintainer: MISTER NEGATIVE <misternegative21@gmail.com>

pkgname=matsyaos-grub-theme
pkgver=3.4
pkgrel=1
pkgdesc="MatsyaOS GRUB2 theme (fork of vinceliuice/grub2-themes)"
arch=('any')
url="https://github.com/MatsyaOs/matsyaos-grub-theme"
license=('GPL-3.0-only')
depends=('grub')
makedepends=('optipng')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install using the bundled installer with custom prefix
    bash install.sh -t tela -s 2k -p "$pkgdir/usr" -i color
}
