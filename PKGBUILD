# Maintainer: David Stark <david@starkers.org>

pkgver=0.93
pkgrel=31
pkgname=telepresence
pkgdesc="Local development against a remote Kubernetes or OpenShift cluster - http://www.telepresence.io"
arch=('any')
license=('Apache')
url="https://github.com/datawire/telepresence"
makedepends=()
backup=()
depends=(
    'curl'
    'conntrack-tools'
    'git'
    'python'
    'python-virtualenv'
    'sshuttle'
    'socat'
    'sshfs'
    'torsocks'
    )

source=("https://github.com/datawire/telepresence/archive/${pkgver}.tar.gz")
md5sums=('2fd2e8fd6236985eccc25aa319306474')

package(){
  cd ${srcdir}/${pkgname}-${pkgver}
  env PREFIX=${pkgdir}/usr ./install.sh
}

# vim:set ts=2 sw=2 et:
