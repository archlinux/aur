# Contributor: Andrew Rabert <ar nullsum.net>

pkgname=harmonize
pkgver=0.3.2
pkgrel=1
pkgdesc="Create and synchronize transcoded copies of audio folders."
url="https://github.com/nvllsvm/harmonize"
depends=('flac' 'lame' 'python' 'python-mutagen')
makedepends=('python-setuptools')
license=('APACHE')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0d53eb928aa305f3d1379fcddb0a3e16ea4738032bd51a971ae192a91ae3b256')

package() {
  cd harmonize-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
