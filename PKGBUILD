# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=flake8-eradicate
pkgname=python-$_pkgname

pkgver=0.4.0
pkgrel=1
pkgdesc="Flake8 plugin to find commented out or dead code"

url='https://github.com/sobolevn/flake8-eradicate'
arch=('any')
license=('MIT')

depends=('python' 'python-setuptools' 'python-dephell' 'python-eradicate')

source=("https://files.pythonhosted.org/packages/52/b5/ad7fce3e56fd4d9ff77ddcd4cebb8568a639bdbbbfa4b94eaae214d22d29/flake8-eradicate-0.4.0.tar.gz")
sha512sums=('0e766dbe73b8d9879153517f69e882e9be7afaea6f6af87c8830496981203460ceeadeb2016f4785ba8af299433d5ce18125f853677c3a4d7403c3f655160f88')

ackage() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
