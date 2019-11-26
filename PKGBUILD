# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=2.2.2
pkgrel=1
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/v2.2.2/fw')
sha256sums=('417df7864cf76385f9baee6e36442a0f79b6833c0d02f67e5d1461fa06701def')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

