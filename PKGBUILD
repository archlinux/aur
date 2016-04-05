# Maintainer: David Donchez <david.donchez@gmail.com>
pkgname=kargo-cli
pkgver=0.2.1
pkgrel=1
pkgdesc="Kubernetes cluster deployment using Ansible"
arch=('any')
url="https://github.com/kubespray/kargo-cli"
license=('GPLv3')
groups=()
depends=('python2' 'ansible' 'python-git' 'python-requests' 'python2-netaddr' 'python2-apache-libcloud')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("$pkgname::https://github.com/kubespray/kargo-cli/archive/master.zip")
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname-master"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
