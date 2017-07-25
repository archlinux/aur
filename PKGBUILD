# Maintainer: Janosch Dobler <janosch.dobler@gmx.de>
pkgname=pac_manage
pkgver=1.7
pkgrel=1
pkgdesc="pacman/yaourt helper - manage packages in a single file"
arch=('any')
url="https://github.com/jandob/pac_manage"
license=('WTFPL')
depends=('pacman' 'yaourt' 'bash' 'sed')
source=("git+https://github.com/jandob/pac_manage.git#tag=$pkgver")
md5sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/pac_manage/pac_manage.sh" "${pkgdir}/usr/bin/pac_manage"
}
