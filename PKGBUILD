# Mantainer: Paolo De Donato <dedonato95 at hotmail it>
# Contributor: Jose Riha <jose1711 gmail com>

pkgname=python-deltachat-bin
pkgver=1.155.6
pkgrel=1
pkgdesc="Python bindings for the Delta Chat Core library - Binary package"
url="https://pypi.org/project/deltachat/"
depends=('python>=3.12' 'libdeltachat' 'python-cffi' 'python-pluggy' 'python-idna' 'python-imap-tools')
makedepends=('python-wheel' 'python-installer')
license=('MPL-2.0')
arch=('x86_64')
_dcname="deltachat-1.142.7-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
source=("https://files.pythonhosted.org/packages/03/1e/5d575377a5c798df0d2f4630d3c99f2fc5b117c1cb80d5cf273bf2de3515/$_dcname") #Requires CPython
noextract=("$_dcname")
sha256sums=('b7eb1c7b110ccbfb23c17dca77d9ce1d857e2764d519532830669590d099c50d')

package() {
    python -m installer --destdir="${pkgdir}" "${srcdir}/$_dcname"
}
