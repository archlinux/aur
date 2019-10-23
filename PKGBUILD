# Maintainer: Rob McFadzean <rob@northxsouth.co>
# Upstream URL: https://github.com/cdr/sshcode

pkgname=sshcode-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Run VS Code on any server over SSH"
arch=('x86_64')

url="https://github.com/cdr/sshcode"
license=('MIT')
conflicts=('sshcode-bin')
depends=('rsync')
optdepends=('google-chrome: suggested supported browser')

source=("sshcode-${pkgver}.tar::https://github.com/cdr/sshcode/releases/download/v${pkgver}/sshcode-linux-amd64.tar")
sha256sums=('93f5ab8786308ac638b0fda6a2fb1e4e6db591d30e0b34d37e085db5cc67620b')

package() {
  install -Dm0755 "${srcdir}/sshcode" "${pkgdir}/usr/bin/sshcode"
}
