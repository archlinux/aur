# Maintainer: Vlad Vasiliu <vladvasiliun@yahoo.fr>
pkgname=copilot-cli-bin
pkgver=1.10.0
pkgrel=1
pkgdesc='Your toolkit for containerized applications on AWS.'
arch=('aarch64' 'x86_64')
url='https://aws.github.io/copilot-cli/'
license=('Apache')
provides=()
makedepends=()
depends=()
conflicts=('copilot-cli')
source_x86_64=("copilot-${pkgver}::https://github.com/aws/copilot-cli/releases/download/v${pkgver}/copilot-linux-amd64-v${pkgver}")
source_aarch64=("copilot-${pkgver}::https://github.com/aws/copilot-cli/releases/download/v${pkgver}/copilot-linux-arm64-v${pkgver}")
md5sums_x86_64=('feaca46b91fa62014385129a2152961e')
md5sums_aarch64=('2d6bb35f3491fa4c4eeaa4820f0886ac')
noextract=("copilot-${pkgver}")

package() {
    install -Dm 755 ${srcdir}/copilot-${pkgver} ${pkgdir}/usr/bin/copilot
}

