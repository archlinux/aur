# Maintainer: Glob876 <gleb87687@gmail.com>
pkgname=mdfu-git
pkgver=1.0.0
pkgrel=1
pkgdesc="MogDop File Utils - CLI File Sorter"
arch=('any')
license=('MIT')
depends=('python')
source=('cli_main.py' 'sorter_core.py')
sha256sums=('SKIP' 'SKIP')

package() {
    install -dm755 "$pkgdir/usr/share/mdfu"
    install -dm755 "$pkgdir/usr/bin"

    install -m755 "$srcdir/cli_main.py" "$pkgdir/usr/share/mdfu/cli_main.py"
    install -m644 "$srcdir/sorter_core.py" "$pkgdir/usr/share/mdfu/sorter_core.py"

    ln -s /usr/share/mdfu/cli_main.py "$pkgdir/usr/bin/mdfu"
}
