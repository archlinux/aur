# Maintainer: gavasc
# Contributor: gavasc
pkgname=grons
pkgver=0.0.0
pkgrel=1
pkgdesc="Terminal UI for managing cron jobs"
arch=('x86_64' 'aarch64')
url="https://github.com/gavasc/grons"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=()
sha256sums=()
build() { cd "${srcdir}/${pkgname}_${pkgver}"; go build -ldflags="-s -w" -o grons .; }
package() { install -Dm755 "./grons" "${pkgdir}/usr/bin/grons"; }
