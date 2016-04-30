# Maintainer: Daniel Maslowski <info@orangecms.org>
pkgname=git-big-picture
pkgver=0.9.0
pkgrel=3
pkgdesc="Visualization tool for Git repositories"
arch=('any')
url="https://github.com/esc/git-big-picture"
license=('GPL')
depends=('python2' 'git' 'graphviz')
makedepends=('git')
provides=('git-big-picture')
source=("git+https://github.com/esc/git-big-picture.git")
md5sums=('SKIP')

package() {
    sed -i '0,/python/s/python/python2/' "${srcdir}/${pkgname}/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
