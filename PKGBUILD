# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=blogr-bin
pkgver=0.4.1
pkgrel=1
pkgdesc='Write, edit and publish your blog without leaving the terminal'
arch=('x86_64')
url='https://github.com/bahdotsh/blogr'
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=('blogr')
conflicts=('blogr')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/blogr-linux-x86_64.tar.gz")
sha256sums=('7fa541ba7085c5399c985c68f2a5d60b6c1d6fac625b7b91575eda9814c0b7ff')

package() {
    install -Dm755 blogr "${pkgdir}/usr/bin/blogr"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
MIT License - See https://github.com/bahdotsh/blogr/blob/main/LICENSE
EOF
}
