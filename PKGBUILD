# Contributor: Andrew Rabert <ar nullsum.net>

pkgname=harmonize
pkgver=0.3.1
pkgrel=1
pkgdesc="Create and synchronize transcoded copies of audio folders."
url="https://github.com/nvllsvm/harmonize"
depends=('flac' 'lame' 'python' 'python-mutagen')
makedepends=('python-setuptools')
license=('APACHE')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d7feab799108b2566eb2011996807a89863fba298a6d6b187c299e3e17ec653a')

package() {
  cd harmonize-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
