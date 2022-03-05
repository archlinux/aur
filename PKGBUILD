# Maintainer: Super Bo <supernbo@gmail.com>
pkgname=bazel31-bin
pkgver=3.1.0
pkgrel=1
pkgdesc='Build and test software of any size, quickly and reliably.'
arch=('x86_64')
url='https://bazel.build'
license=('Apache')
depends=('java-environment=8')
provides=("${pkgname%-bin}" "bazel=${pkgver}")
conflicts=('bazel31' 'bazel3' 'bazel3-bin' 'bazel')
options=('!strip')
source=(
    "https://github.com/bazelbuild/bazel/releases/download/${pkgver}/bazel-${pkgver}-linux-x86_64"
)
noextract=("bazel-${pkgver}-linux-x86_64")
sha256sums=(
    "753434f4fa730266cf5ce21d1fdd425e1e167dd9347ad3e8adc19e8c0d54edca"
)

package() {
    install -Dm755 bazel-${pkgver}-linux-x86_64 "${pkgdir}/usr/bin/bazel"
}
