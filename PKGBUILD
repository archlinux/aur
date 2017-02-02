pkgname=larryshell
pkgver='1.3.1'
pkgrel='2'
pkgdesc="LarryShell modifies bash to create a more affluent command-line interface."
arch=('any')
license=('MIT')
depends=('bash')
source=("http://jhoughton.me/larryshell/${pkgver}-${pkgrel}.tar.gz")
url='https://github.com/Devon-Austin-Wood-Thomas/larryshell'
md5sums=('2ee2c53d21f43bcf6f6eac3499129cef')

package() {
    cd $srcdir/larryshell

    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/etc/larryshell
    mkdir -p $pkgdir/usr/share/larryshell

    cp larryshell $pkgdir/usr/bin/
    cp larryshellrc $pkgdir/etc/larryshell
    cp larryshell-errors.txt $pkgdir/usr/share/larryshell
    cp larryascii $pkgdir/usr/share/larryshell
}
