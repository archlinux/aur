# Maintainer: neodarz <neodarz at neodarz dot net>

pkgname=python-pylibscrypt
_pkgname=pylibscrypt

pkgver=2.0.0
pkgrel=1
pkgdesc="scrypt for python"

url='https://github.com/jvarho/pylibscrypt'
arch=('any')
license=('ISC')

depends=('python')

source=("https://github.com/jvarho/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('b233f343dae78f0c330962eaa2311ba7ccd41d4b3a707ce37a24ad02d79f31ad2774da69b3117d7f6da95073743a8670f95b2c374d21c4c39d6df651d2bd8767')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
