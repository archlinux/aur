# Contributor: James C Kimble <jckimble at gmail dot com>
pkgname='mkinitcpio-autofsck'
pkgver=0.0.2
pkgrel=1
pkgdesc='mkinitcpio hook containing auto fsck'
url='https://github.com/jckimble/mkinitcpio-autofsck'
arch=('any')
license=('BSD')
install="${pkgname}.install"
depends=('mkinitcpio>=0.9.0')
source=('autofsck_hook' 'autofsck_install')

package() {
    install -o root -g root -D ${srcdir}/autofsck_install ${pkgdir}/usr/lib/initcpio/install/autofsck
    install -o root -g root -D ${srcdir}/autofsck_hook    ${pkgdir}/usr/lib/initcpio/hooks/autofsck
}

md5sums=('cc263a07bdc61ac085f6a41e0c807d0b'
         '87f1878c956a19d883ab6dbb1c59d993')
