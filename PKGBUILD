# Maintainer: Maciej Dems <maciej.dems@p.lodz.pl>
pkgname=plask
pkgver=2021.11.09
pkgrel=1
pkgdesc="Photonic LAser Simulation Kit: a comprehensive tool for numerical
analysis of broad range of physical phenomena in photonic devices"
url="https://plask.app"
arch=('x86_64')
license=('custom')
depends=('boost-libs' 'expat' 'openmp' 'intel-mkl' 'lapack' 'qt5-declarative' 'qt5-tools'
         'python-numpy' 'python-matplotlib' 'python-lxml' 'python-yaml' 'pyside2')
optdepends=('python-h5py: for saving results to files'
            'python-scipy: for scientific tools'
            'python-jedi: for Python hints in GUI'
            'python-paramiko: for remote computation launching'
            'ipython: for interactive shell')
source=("plask-$pkgver.tar.zst::https://get.plask.app/packages/plask-$pkgver-1-x86_64.pkg.tar.zst")
sha256sums=('4b3b16873eb8ef25a01b86b4f8e7982908f1588c96d16b0e5990cc6b5dc4d961')
noextract=("plask-$pkgver.tar.zst")

package() {
    cd "$pkgdir"
    tar xf "$srcdir/plask-$pkgver.tar.zst" --zstd --exclude='.*'
}
