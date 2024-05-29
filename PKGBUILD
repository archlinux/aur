# Maintainer: Stratos Zafeirelis <stratoszaf@gmail.com>
# Contributor: Nick Syntychakis <nsyntych@punkops.dev>

pkgname=e1s
pkgver=1.0.36
pkgrel=1.01
epoch=1
pkgdesc='E1S - Easily Manage AWS ECS Resources in Terminal'
arch=(x86_64 aarch64)
url='https://github.com/keidarcy/e1s'
license=('MIT')
depends=()
optdepends=()
provides=(e1s)
conflicts=(e1s-git)

source_x86_64=(${pkgname}-${pkgver}-x86_64.zip::https://github.com/keidarcy/e1s/releases/download/v${pkgver}/e1s_${pkgver}_linux_amd64.tar.gz)
source_aarch64=(${pkgname}-${pkgver}-aarch64.zip::https://github.com/keidarcy/e1s/releases/download/v${pkgver}/e1s_${pkgver}_linux_arm64.tar.gz)

sha256sums_x86_64=('5da1b7abf0782117ada51e343014391e6b66e4daf09c86fc3d53352f46ea123c')
sha256sums_aarch64=('fffdfe4f593e38ac41e9faf2ce26fd2c5e24196efb28d612db30b21ba0119e37')

package() {
    install -Dm755 e1s $pkgdir/usr/bin/e1s 
}
