_pkgbase=stt_model_manager
_pkgname=stt-model-manager
pkgname=python-${_pkgname}
pkgver=0.0.21
pkgrel=1
pkgdesc="Coqui STT Model Manager - install, manage and try out Coqui STT models from the Model Zoo"
arch=('x86_64')
license=('MPL2')
<<<<<<< HEAD
url="https://github.com/coqui-ai/${_pkgname}"
depends=('python-pip' 'python-stt')
source=("${_pkgbase}-${pkgver}::git+https://github.com/coqui-ai/${_pkgname}.git")
=======
url="https://github.com/coqui-ai/${pkgname}"
depends=('python-pip')
source=("${_pkgbase}-${pkgver}::git+https://github.com/coqui-ai/${pkgname}.git")
>>>>>>> e5a3e64 (initial commit)
sha256sums=('SKIP')
provides=($_pkgname)

prepare() {
    echo "Installing Coqui STT Model Manager ${pkgver}-${pkgrel} ..."
}

package() {
    cd $srcdir/${_pkgbase}-${pkgver}
    pip install --root="$pkgdir" .
}
