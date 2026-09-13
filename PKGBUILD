# Maintainer: kirill <kirillpolozok843-boop@...wild>
pkgname=userfetch
pkgver=1.0
pkgrel=1
pkgdesc="Simple bash userfetch utility"
arch=('any')
license=('GPL3')
depends=('bash' 'chafa' 'coreutils')
source=('userfetch')
sha256sums=('01013545c58adbdaacf6746885e7175a6398071a395587718c213a0353b935ae')  # для локальных файлов лучше заменить на реальный хеш через makepkg -g

package() {
    install -Dm755 "$srcdir/userfetch" "$pkgdir/usr/bin/userfetch"
}
