# Maintainer: Willy Micieli <micieli@vivaldi.net>

pkgname=continuous-testing
pkgver=1.0.0
pkgrel=5
pkgdesc="An rust program to test in continuous application"
provides=("again")
arch=('any')
url="https://github.com/taishingi/continuous-testing"
license=('GPL3')
depends=('packer' 'libnotify' 'curl' 'fuse-overlayfs' 'less' 'fd' 'git')
source=("${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2d79adb5f5828dc9fdb1c8f18af2749008b06cf92ac2e18bf42b0d74f1c4a006')

package() {
    cd "${pkgname}-${pkgver}"
    cargo install --path .
}
