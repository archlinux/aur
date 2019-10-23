# Maintainer: Dmitri McGuckin <dmitri.mcguckin26@gmail.com>
pkgname=uperm
pkgver=1.0.1
pkgrel=0
pkgdesc="Unified permissions"
arch=('any')
url='https://github.com/dmitri-mcguckin/uperm'
license=('MIT')
optdepends=('sudo: for installing as root')
source=("git://github.com/dmitri-mcguckin/$pkgname.git")
makedepends=('git')

package(){
    sudo rm -rf /opt/$pkgname
    sudo cp -r $srcdir/$pkgname /opt
    sudo ln -f -s /opt/$pkgname/$pkgname.sh /usr/bin/$pkgname
}
md5sums=('SKIP')
