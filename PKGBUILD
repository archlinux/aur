# Mantainer: Snaporaz
# Contributor: Andrea Pelloni <apelloni@ethz.ch>

pkgbase="python-symbolica"
pkgname=("python-symbolica")
pkgver=0.6.0
pkgrel=1
pkgdesc="Symbolica is a blazing fast and modern computer algebra system which aims to handle huge expressions. It can easily be incorporated into existing projects using its Python, Rust or C++ bindings."
arch=('x86_64')
#makedepends=('cython')
license=('Custome')
url=https://github.com/benruijl/symbolica
wheel_url="https://files.pythonhosted.org/packages/e6/ad/f7b6259229a56cb1c02dbfbb7cac264285092bfd6662ae0c6fdf53460e1f"
wheel_file="symbolica-0.6.0-cp37-abi3-manylinux_2_34_x86_64.whl"
source=("${wheel_url}/${wheel_file}")

package_python-symbolica() {
    cd "$srcdir"
	wheel unpack "$wheel_file"
}

sha256sums=('0508b996ba4f72981510a9f27bdb3ad01489fa82748772712232d6a08810bada')
