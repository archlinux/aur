# Maintainer: aliu <aaron liu 0 one hundred and dirty @gmail.com>
# Contributor: Jingu <xiuluo dot android at gmail dot com>
# Contributor: Daniel Souza <aur at posix dot dev dot br>
_pkgauthor="chainner-org"
_pkgname="chainner"
pkgname="${_pkgname}-bin"
pkgver=0.20.2
pkgrel=1
pkgdesc='Node-based image processing and AI upscaling GUI'
arch=('x86_64')
url="https://github.com/chaiNNer-org/chaiNNer/"
license=('GPL3')
groups=()
depends=('libxcrypt-compat')
makedepends=()
optdepends=('python-pytorch' 'python-torchvision' 'python-facexlib' 'python-einops: PyTorch support'
		'python-ncnn-vulkan: NCNN support'
		'python-onnx' 'python-onnxoptimizer' 'python-onnxruntime' 'python-protobuf' 'python-numba: ONNX support' )
provides=("${_pkgname}")
conflicts=()
backup=()
options=('!emptydirs' '!strip')
install=
changelog=
source=("https://github.com/${_pkgauthor}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x64-linux-redhat.rpm")
noextract=()
sha256sums=('52befa2caf49632fb0f760000a4c15c45b9f77b6669eed619228197a9024152a')

# TODO: Convert to native electron

package() (
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/lib/"
    mkdir -p "${pkgdir}/usr/share/"
    cp -r "${srcdir}/usr/bin/." "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/usr/lib/${_pkgname}/." "${pkgdir}/usr/lib/${_pkgname}/"
    cp -r "${srcdir}/usr/share/." "${pkgdir}/usr/share/"
)
