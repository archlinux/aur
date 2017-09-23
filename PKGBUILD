# Maintainer: levinit <levinit@outlook.com>

pkgname=grub-themes-solarized-dark-materialized
_pkgname=solarized-dark-materialized
pkgver=1.0
pkgrel=1
pkgdesc='Solarized-Dark-Materialized grub2 theme'
arch=(any)
url='https://www.gnome-look.org/p/1180510/'
license=('custom')
depends=('grub')
optdepends=('grub-customizer')

source=('https://dl.opendesktop.org/api/files/download/id/1497095343/Solarized-Dark-Materialized.zip')
md5sums=('SKIP')

package() {
    install -Ddm755 $pkgdir/usr/share/grub/themes/
    cp $srcdir/$_pkgname $pkgdir/usr/share/grub/themes/ -r

    echo '======='
    echo -e 'You should:\n1. edit\e[36m /etc/default/grub \e[0m,add (or modify) the line \n \e[1m GRUB_THEME="/boot/grub/themes/solarized-dark-materialized/theme.txt"\e[0m'
    echo -e '\e[0m \n2. execute \n \e[1m sudo grub-mkconfig -o /boot/grub/grub.cfg \e[0m after installation.\e[0m'
    echo '----------'
    echo -e 'also you can use a gui app -- \e[1m grub-customizer \e[0m for changing grub'
    echo '======='
}
