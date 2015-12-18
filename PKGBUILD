# Contributor: Brandon Taylor <dmn2004404@gmail.com>
pkgname=fortune-mod-heinlein
pkgver=20151218
pkgrel=1
pkgdesc="Fortune cookies from the 'Notebooks of Lazarus Long' in 'Time Enough for Love' by Robert A. Heinlein"
arch=('any')
url="https://www.dropbox.com/s/zihpxwdizov1ecr/heinlein"
license=('WTFPL')
depends=('fortune-mod')
source=("$url")
md5sums=('e3696e7e2b0f221f6f29e30d8b40ed64')

build()
{
    cd ${srcdir}
    strfile heinlein heinlein.dat
}

package()
{
    install -D -m644 heinlein ${pkgdir}/usr/share/fortune/heinlein
        install -D -m644 heinlein.dat ${pkgdir}/usr/share/fortune/heinlein.dat
}