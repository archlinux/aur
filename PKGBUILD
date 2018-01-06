# Maintainer: levinit <levinit@outlook.com>

pkgname=grub-themes-vimix
pkgver=1.0
pkgrel=1
pkgdesc='vimix grub2 theme'
arch=(any)
url='https://github.com/vinceliuice/grub2-themes'
license=('GPL')
depends=('grub')
optdepends=('grub-customizer')
makedepends=('git')
install=${pkgname}.install

source=('git://github.com/vinceliuice/grub2-themes')

md5sums=('SKIP')

package() {
    install -dm755 $pkgdir/boot/grub/themes/
    cd grub2-themes/grub-themes-vimix
    cp Vimix $pkgdir/boot/grub/themes/ -r
    
    echo '======='
    echo -e 'You should:\n1. edit\e[36m /etc/default/grub \e[0m,add (or modify) the line \n \e[1m GRUB_THEME="/boot/grub/themes/StylishDark/theme.txt"\e[0m'
    echo -e '\e[0m \n2. execute \n \e[1m sudo grub-mkconfig -o /boot/grub/grub.cfg \e[0m after installation.\e[0m'
    echo '----------'
    echo -e 'also you can use a gui app -- \e[1m grub-customizer \e[0m for changing grub'
    echo '======='
}

