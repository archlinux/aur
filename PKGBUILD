# Maintainer: vyzu <vyzu AT vyzu DOT net>
pkgname='python-comicapi'
_name=${pkgname#python-}
_src_folder='comicapi-3.2.0'
pkgver='3.2.0'
pkgrel=1
pkgdesc="Comic archive (cbr/cbz/cbt) and metadata utilities. Extracted from the comictagger project."
url="https://github.com/OzzieIsaacs/comicapi"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('Apache-2.0')
arch=('x86_64')
# source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.linux-${arch}.tar.gz"
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('75e165a814af164a0f5eb7de8433077e4f1700709b8c129e195c09e4dc4d9840')

package() {
    python -m installer --destdir="${pkgdir}" $_name-$pkgver-py3-none-any.whl
}
