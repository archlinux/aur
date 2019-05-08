# Maintainer: Rob McFadzean <rob@northxsouth.co>
# Upstream URL: https://github.com/cdr/sshcode

pkgname=sshcode-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Run VS Code on any server over SSH"
arch=('x86_64')

url="https://github.com/cdr/sshcode"
license=('MIT')
conflicts=('sshcode-bin')
depends=('rsync')
optdepends=('google-chrome: suggested supported browser')

source=("sshcode-${pkgver}.tar::https://github.com/cdr/sshcode/releases/download/v${pkgver}/sshcode-linux-amd64.tar")
sha256sums=('736af5f619839a816a5bb9363873c663828efc53edadb1349f787adc1cd78618')

package() {
  install -Dm0755 "${srcdir}/sshcode" "${pkgdir}/usr/bin/sshcode"
}