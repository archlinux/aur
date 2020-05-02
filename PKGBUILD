# Maintainer: Rob McFadzean <rob@northxsouth.co>
# Upstream URL: https://github.com/cdr/sshcode

pkgname=sshcode-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Run VS Code on any server over SSH"
arch=('x86_64')

url="https://github.com/cdr/sshcode"
license=('MIT')
conflicts=('sshcode-bin')
depends=('rsync')
optdepends=('google-chrome: suggested supported browser')

source=("sshcode-${pkgver}.tar.gz::https://github.com/cdr/sshcode/releases/download/v${pkgver}/sshcode-linux-amd64.tar.gz")
sha256sums=('94933565b0a82f25f477dc2180167fcc1a869e67521b456cd36ded051eb2dd25')

package() {
  install -Dm0755 "${srcdir}/sshcode" "${pkgdir}/usr/bin/sshcode"
}
