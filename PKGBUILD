# Maintainer: Nikolas Koesling <nikolas@koesling.info>

pkgname=mdx2iso
pkgrel=1
pkgver=1.0.0
pkgdesc="Convert mdx disc image files to iso"
url="https://gist.github.com/NikolasK-source/2a3b4d8841f5af59b93b859991204637"
license=('MIT')
arch=('any')
depends=('bash' 'iat')
source=("git+https://github.com/NikolasK-source/mdx2iso.git#tag=v${pkgver}")

sha256sums=('SKIP')

package() {
    cd mdx2iso
    install -Dm755 mdx2iso.sh "${pkgdir}/usr/bin/mdx2iso"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
