# Maintainer: blocklisted <blocklisted at protonmail dot com>
pkgname=windscribe-v2-bin
pkgver=2.4.8_beta
pkgrel=1
pkgdesc="Windscribe GUI tool for Linux"
arch=('x86_64')
url="https://windscribe.com/guides/linux"
license=('GPL2')
depends=('bash' 'nftables' 'systemd')
provides=('windscribe')
conflicts=('windscribe-cli')
options=('!strip')
install=windscribe-v2-bin.install
source=("https://assets.totallyacdn.com/desktop/beta/windscribe_${pkgver}_amd64.deb")
sha1sums=('31fc81cd39c0bae2cf732165db76dabe6a55d13a')

package() {
  bsdtar -C "${pkgdir}" -xJf data.tar.xz

  chmod -R 755 ${pkgdir}
}
