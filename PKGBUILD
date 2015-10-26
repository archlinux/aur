# Maintainer: Janosch Dobler <janosch.dobler@gmx.de>
pkgname=pac_manage
pkgver=1.2
pkgrel=1
pkgdesc="pacman/yaourt helper - manage packages in a single file"
arch=('x86_64')
url="https://github.com/jandob/pac_manage"
license=('WTFPL')
depends=('pacman' 'yaourt' 'bash' 'sed')
source=('pac_manage.sh')
md5sums=('49b383f95dfb856d84cce3ce146ed61e')

package() {
    install -Dm755 pac_manage.sh "${pkgdir}/usr/bin/pac_manage"
}
