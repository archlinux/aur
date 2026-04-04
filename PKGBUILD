# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=blogr-bin
pkgver=0.5.1
pkgrel=1
pkgdesc='Write, edit and publish your blog without leaving the terminal'
arch=('x86_64')
url='https://github.com/bahdotsh/blogr'
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=('blogr')
conflicts=('blogr')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/blogr-linux-x86_64.tar.gz")
sha256sums=('bb1f1e7adbbeaebd12a5ec16c332ea1d69d145df3b3b3c72f73b6cb711dca45f')

package() {
    install -Dm755 blogr "${pkgdir}/usr/bin/blogr"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
MIT License - See https://github.com/bahdotsh/blogr/blob/main/LICENSE
EOF
}
