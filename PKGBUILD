# Maintainer: David Donchez <david.donchez@gmail.com>
pkgname=kargo-cli
pkgver=0.2.3
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
sha256sums=('0aee8b4dd863fd6c4379b62c0289311a4d8ddaa9cbfa60b379580160e2a3c550')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
