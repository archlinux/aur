# Maintainer: Michael Borders <michael.a.borders@gmail.com>

pkgname=python-napalm
_pkgname=napalm
pkgver=2.5.0
pkgrel=1
pkgdesc="Network Automation and Programmability Abstraction Layer with Multivendor support"
arch=('any')
url="https://github.com/napalm-automation/napalm"
license=('Apache')
depends=('python' 'python-cffi' 'python-paramiko' 'python-future' 'python-textfsm' 'python-jinja' 'python-netaddr' 'python-pyaml' 'python-netmiko' 'python-junos-eznc' 'python-scp' 'python-lxml')
optdepends=()
makedepends=('python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')
#sha256sums=('5522cb6218b467a7b9f5c8dd5f81a59d199f8712b8d02a1ad6c9161647256821')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
