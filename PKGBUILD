pkgname=larryshell
pkgver='1.2'
pkgrel='1'
pkgdesc="LarryShell modifies bash to create a more affluent command-line interface."
arch=('any')
license=('MIT')
depends=('bash')
source=("https://jhoughton.me/larryshell/${pkgver}-${pkgrel}.tar.gz")
url='https://github.com/Devon-Austin-Wood-Thomas/larryshell'
md5sums=('1916c99007a84717133eb4df2ff02603')

package() {
    cd $srcdir/larryshell

    mkdir -p $pkgdir/usr/bin

    cp larryshell $pkgdir/usr/bin/
    cp larryshellrc $pkgdir/usr/bin/
    cp larryshell-errors.txt $pkgdir/usr/bin/larryshell-errors.txt
}
