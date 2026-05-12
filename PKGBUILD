# Maintainer: Kevin Boss <kevin dot boss at outlook dot com>
pkgname=haus-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Command-line interface for Home Assistant"
arch=('x86_64')
url="https://github.com/kevinboss/haus"
license=('GPL-3.0-or-later')
provides=('haus')
conflicts=('haus')
options=('!strip')
source_x86_64=("${url}/releases/download/v${pkgver}/haus-v${pkgver}-linux-x64.tar.gz")
sha256sums_x86_64=('f84f7a026027da28778dd2f46e928ae7b8b69c38f12460580edfac08ebe40f45')

package() {
  install -Dm755 "${srcdir}/haus-v${pkgver}-linux-x64/Haus" "${pkgdir}/usr/bin/haus"
}
