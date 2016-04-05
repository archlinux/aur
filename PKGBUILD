# Maintainer: David Donchez <david.donchez@gmail.com>
pkgname=kpm
pkgver=0.11.0
pkgrel=1
pkgdesc="CLI to deploy and manage applications stack on Kubernetes"
arch=('any')
url="https://github.com/kubespray/kpm"
license=('Apache')
groups=()
depends=('python2' 'python2-yaml' 'python2-jinja' 'python-requests' 'python2-jsonpatch' 'python2-tabulate' 'python2-termcolor')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("$pkgname::https://github.com/kubespray/kpm/archive/v$pkgver.zip")
sha256sums=('2e755500f1e6075ed14f14f37005cefa4879813f770cf0d4cac0a8a8a9aff485')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
