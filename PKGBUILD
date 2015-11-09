pkgname=denix-scripts
pkgver=1.0
pkgrel=2
pkgdesc="DeniX scripts"
arch=("any")
url="https://github.com/denix666/denix-scripts"
license=('GPL')
source=("git+https://github.com/denix666/denix-scripts.git")
md5sums=('SKIP')

package() {
    cd ${srcdir}/${pkgname}
    install -D -m644 etc/profile.d/denix.sh ${pkgdir}/etc/profile.d/denix.sh
}
