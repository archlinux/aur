# Maintainer: blocklisted <blocklisted at protonmail dot com>
pkgname=windscribe-v2-bin
pkgver=2.5.17
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
source=("https://deploy.totallyacdn.com/desktop-apps/${pkgver}/windscribe_${pkgver}_amd64.deb")
sha1sums=('e0fd6c69f3cef5ac592f06c4b9ebf6d525bf755a')

package() {
  bsdtar -C "${pkgdir}" -xJf data.tar.xz

  chmod -R 755 ${pkgdir}
}
