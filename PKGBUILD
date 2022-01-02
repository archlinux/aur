# Maintainer: blocklisted <blocklisted at protonmail dot com>
pkgname=windscribe-v2-bin
pkgver=2.3.15_beta
pkgrel=2
pkgdesc="Windscribe GUI tool for Linux"
arch=('x86_64')
url="https://windscribe.com/guides/linux"
license=('GPL2')
depends=('bash' 'nftables')
provides=('windscribe')
conflicts=('windscribe-cli')
options=('!strip')
install=windscribe-v2-bin.install
source=("https://deploy-do.windscribe.com/apps/windscribe_${pkgver}_amd64.deb")
sha1sums=('64f065ce1ee991f8af424673275e9eb9c2b30e86')

package() {
  bsdtar -C "${pkgdir}" -xJf data.tar.xz

  chmod -R 755 ${pkgdir}
}
