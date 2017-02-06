pkgname=larryshell
pkgver='1.3'
pkgrel='1'
pkgdesc="LarryShell modifies bash to create a more affluent command-line interface."
arch=('any')
license=('MIT')
depends=('bash')
source=("http://jhoughton.me/larryshell/${pkgver}-${pkgrel}.tar.gz")
url='https://github.com/Devon-Austin-Wood-Thomas/larryshell'
md5sums=('2785712259d53a035ef1e595c94961f7')

package() {
    cd $srcdir/larryshell

    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/etc/larryshell
    mkdir -p $pkgdir/usr/share/larryshell

    cp larryshell $pkgdir/usr/bin/
    cp larryshellrc $pkgdir/etc/larryshell/
    cp larryshell-errors.txt $pkgdir/usr/share/larryshell/
    cp larryascii $pkgdir/usr/share/larryshell/
    cp larry.cow $pkgdir/usr/share/larryshell/
}
