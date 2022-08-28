pkgname=onnxruntime-lib-git
pkgver=1.12.1
pkgrel=1
pkgdesc="ONNX Runtime: cross-platform, high performance ML inferencing and training accelerator"
arch=('x86_64')
url="https://www.onnxruntime.ai/"
license=('MIT')
groups=()
depends=()
makedepends=()
provides=("onnxruntime")
conflicts=("onnxruntime")
replaces=()
backup=()
options=()
# install=
source=("https://github.com/microsoft/onnxruntime/releases/download/v${pkgver}/onnxruntime-linux-x64-${pkgver}.tgz")
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

package() {
    install -D "${srcdir}/onnxruntime-linux-x64-${pkgver}/include"/* -t "${pkgdir}/usr/include"
    install -D "${srcdir}/onnxruntime-linux-x64-${pkgver}/lib"/* -t "${pkgdir}/usr/lib"
}