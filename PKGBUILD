# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=blogr-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='Write, edit and publish your blog without leaving the terminal'
arch=('x86_64')
url='https://github.com/bahdotsh/blogr'
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=('blogr')
conflicts=('blogr')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/blogr-linux-x86_64.tar.gz")
sha256sums=('163a1ebe03fe7d51734d5b7d1b6cc795404b012bbe84f365587d46599106b742')

package() {
    install -Dm755 blogr "${pkgdir}/usr/bin/blogr"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
MIT License - See https://github.com/bahdotsh/blogr/blob/main/LICENSE
EOF
}
