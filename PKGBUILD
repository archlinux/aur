# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail dot com>

pkgname=ugit
pkgver=1.0
pkgrel=2
pkgdesc="ugit helps you undo your last git command with grace. Your damage control git buddy"
arch=('any')
url="https://github.com/Bhupesh-V/ugit"
license=('MIT')
groups=('')
depends=('bash' 'awk' 'grep' 'ncurses')
options=('!strip' '!emptydirs')
source=("ugit::https://github.com/Bhupesh-V/ugit/releases/latest/download/ugit")
sha512sums=('2707641cf42e4ca34618ec25ab6b13dabdc994ee51cc67bc7d6302296f93de80d05f072933b342a32439f082f3757773f6886f0bf1db91c73791f9846b5c8e1d')

package(){

	install -Dm 755 "$srcdir/ugit" "$pkgdir/usr/bin/ugit"

}
