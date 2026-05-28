# Maintainer: lyj404 <lyj404@outlook.com>

pkgname=proxy-term-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A desktop proxy management tool with GUI"
arch=('x86_64')
url="https://github.com/lyj404/proxy_term"
license=('Apache')
depends=()
makedepends=()
conflicts=('proxy-term')
provides=('proxy-term')
source=("${url}/releases/download/v${pkgver}/proxy_term-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('SKIP')

package() {
  install -Dm755 proxy_term "${pkgdir}/usr/bin/proxy_term"
}
