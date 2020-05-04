# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Gergan Penkov < gergan at gmail dot email >

pkgname="tilt-bin"
_pkgname="tilt"
pkgver=0.13.4
pkgrel=1
pkgdesc='Local Kubernetes development with no stress'
arch=('x86_64')
url='https://tilt.build/'
license=('Apache')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://github.com/windmilleng/tilt/releases/download/v${pkgver}/${_pkgname}.${pkgver}.linux.x86_64.tar.gz")
sha512sums=('779b7c2a03e6385d6a067e7669d4ec3d5ad827da10aedccba1eca66b68c40bfe7c8cb32053766f4c7c942c3bfe2c738739e085f1876d8b24688cfbaf670ae29a')

package() {
    install -D -m 0644 README.md "$pkgdir/usr/share/doc/tilt/README.md"
    install -D -m 0755 tilt "$pkgdir/usr/bin/$_pkgname"
}
