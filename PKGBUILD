pkgname=larryshell
pkgver='1.3.1'
pkgrel='1'
pkgdesc="LarryShell modifies bash to create a more affluent command-line interface."
arch=('any')
license=('MIT')
depends=('bash')
source=("https://jhoughton.me/larryshell/${pkgver}-${pkgrel}.tar.gz")
url='https://github.com/Devon-Austin-Wood-Thomas/larryshell'
md5sums=('0030479b379f4f9fa01b8241a28f6001')

package() {
    cd $srcdir/larryshell

    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/etc/larryshell
    mkdir -p $pkgdir/usr/share/larryshell

    cp larryshell $pkgdir/usr/bin/
    cp larryshellrc $pkgdir/etc/laryshell
    cp larryshell-errors.txt $pkgdir/usr/share/larryshell
    cp larryascii $pkgdir/usr/share/larryshell
}
