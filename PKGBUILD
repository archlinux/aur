pkgname=larryshell
pkgver='0.0.4'
pkgrel='1'
pkgdesc="LarryShell modifies bash to create a more affluent command-line interface."
arch=('any')
license=('MIT')
depends=('bash')
source=("https://jhoughton.me/larryshell/${pkgver}-${pkgrel}.tar.gz")
url='https://github.com/Devon-Austin-Wood-Thomas/larryshell'
md5sums=('463e1c485dc0afb36a7852e1357a9baa')

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
