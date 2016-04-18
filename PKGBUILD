# Maintainer: David Donchez <david.donchez@gmail.com>
pkgname=kargo-cli
pkgver=0.2.8
pkgrel=1
pkgdesc="Kubernetes cluster deployment using Ansible"
arch=('any')
url="https://github.com/kubespray/kargo-cli"
license=('GPL3')
groups=()
depends=('python2' 'ansible' 'python-git' 'python-requests' 'python2-netaddr' 'python2-apache-libcloud')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("$pkgname::https://github.com/kubespray/kargo-cli/archive/$pkgver.zip")
sha256sums=('8bf4086f30b0cdbb3e054ba280b6f4822e2d3f25364f7c47ae97007066971359')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
