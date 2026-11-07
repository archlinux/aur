# Maintainer: Maciej Dems <maciej.dems@p.lodz.pl>
pkgname=plask-bin
pkgver=2026.11.06
pkgrel=1
pkgdesc="Photonic LAser Simulation Kit: a comprehensive tool for numerical
analysis of broad range of physical phenomena in photonic devices"
url="https://plask.app"
arch=('x86_64')
license=('custom')
provides=('plask')
replaces=('plask')
conflicts=('plask' 'plask-git')
depends=('boost-libs' 'expat' 'fmt' 'openmp' 'intel-oneapi-mkl' 'lapack'
         'python-numpy' 'python-matplotlib' 'python-lxml' 'python-yaml' 'pyside6' 'libx11')
optdepends=('python-h5py: for saving results to files'
            'python-scipy: for scientific tools'
            'python-jedi: for Python hints in GUI'
            'python-paramiko: for remote computation launching'
            'ipython: for interactive shell')
source=("plask-$pkgver-$pkgrel.tar.zst::https://get.plask.app/packages/plask-$pkgver-$pkgrel-x86_64.pkg.tar.zst")
sha256sums=('ba74a81b5e26fba430ed1e7d8c0fbfe6495467041828ac9fc2d7990fbd5e8535')
noextract=("plask-$pkgver-$pkgrel.tar.zst")

package() {
    cd "$pkgdir"
    tar xf "$srcdir/plask-$pkgver-$pkgrel.tar.zst" --zstd --exclude='.*'
}
