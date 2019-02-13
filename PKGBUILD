# Maintainer: David Stark <david@starkers.org>

pkgver=0.97
pkgrel=34
pkgname=telepresence
pkgdesc="Local development against a remote Kubernetes or OpenShift cluster - http://www.telepresence.io"
arch=('any')
license=('Apache')
url="https://github.com/datawire/telepresence"
makedepends=(
    'git'
)
backup=()
depends=(
    'conntrack-tools'
    'fuse2'
    'socat'
    'sshfs'
    'torsocks'
)

source=("https://github.com/datawire/telepresence/archive/${pkgver}.tar.gz")
md5sums=('93d6c261338d3142e1eb0f6561462278')

package(){
  cd ${srcdir}/${pkgname}-${pkgver}
  env PREFIX=${pkgdir}/usr ./install.sh
}

# vim:set ts=2 sw=2 et:
