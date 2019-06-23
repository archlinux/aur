# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=python2-funcy
pkgver=1.12
pkgrel=1

pkgdesc='Pyhton2 funcy library.'
url='https://github.com/Suor/funcy'
arch=('i686' 'x86_64')
license=('GPL')

depends=('python2')
makedepends=('python2-pip')

source=('https://github.com/Suor/funcy/archive/1.12.tar.gz')
sha1sums=('ebdd0f28763930e94f48dac54afe44834c51535e')


build()
{
    cd $srcdir/funcy-1.12
}


package()
{
    cd $srcdir/funcy-1.12
    pip2.7 install --root=$pkgdir funcy
}
