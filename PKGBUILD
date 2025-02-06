# Maintainer: Maciej Dems <maciej.dems@p.lodz.pl>
pkgname=plask-bin
pkgver=2025.02.05
pkgrel=1
pkgdesc="Photonic LAser Simulation Kit: a comprehensive tool for numerical
analysis of broad range of physical phenomena in photonic devices"
url="https://plask.app"
arch=('x86_64')
license=('custom')
provides=('plask')
replaces=('plask')
conflicts=('plask' 'plask-git')
depends=('boost-libs' 'expat' 'fmt' 'openmp' 'intel-oneapi-mkl' 'lapack' 'qt5-declarative' 'qt5-tools'
         'python-numpy' 'python-matplotlib' 'python-lxml' 'python-yaml' 'pyside2' 'libx11')
optdepends=('python-h5py: for saving results to files'
            'python-scipy: for scientific tools'
            'python-jedi: for Python hints in GUI'
            'python-paramiko: for remote computation launching'
            'ipython: for interactive shell')
source=("plask-$pkgver.tar.zst::https://get.plask.app/packages/plask-$pkgver-1-x86_64.pkg.tar.zst")
sha256sums=('bdb89697a69c82be33d3b76ce2ac3b59d74e5d0313ca8c3bcf3ebb7f5fb63716')
noextract=("plask-$pkgver.tar.zst")

package() {
    cd "$pkgdir"
    tar xf "$srcdir/plask-$pkgver.tar.zst" --zstd --exclude='.*'
}
