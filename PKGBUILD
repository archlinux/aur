# Maintainer: blocklisted <blocklisted at protonmail dot com>
pkgname=windscribe-v2-bin
pkgver=2.5.18
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
sha1sums=('f539a4e0254ee800203b3671885d2ca433f610f7')

package() {
  bsdtar -C "${pkgdir}" -xJf data.tar.xz

  chmod -R 755 ${pkgdir}
}
