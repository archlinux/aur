# Maintainer: Rob McFadzean <rob@northxsouth.co>
# Upstream URL: https://github.com/cdr/sshcode

pkgname=sshcode-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Run VS Code on any server over SSH"
arch=('x86_64')

url="https://github.com/cdr/sshcode"
license=('MIT')
conflicts=('sshcode-bin')
depends=('rsync')
optdepends=('google-chrome: suggested supported browser')

source=("sshcode-${pkgver}.tar::https://github.com/cdr/sshcode/releases/download/v${pkgver}/sshcode-linux-amd64.tar")
sha256sums=('37f2c6abe6b8cc6467ae63954e46cc9a2b930074b02c0400d38075f4a757a61c')

package() {
  install -Dm0755 "${srcdir}/sshcode" "${pkgdir}/usr/bin/sshcode"
}
