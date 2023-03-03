# Maintainer: Gurkirat Singh <tbhaxor@proton.me>

pkgname=qalvpn
pkgver=1.2.1
pkgrel=1
pkgdesc="QAL VPN is a post-quantum VPN service to protect you against the future of computing: quantum computers"
arch=('x86_64')
url="https://www.qalvpn.com"
depends=('nss' 'binutils')
license=('custom')
source=("https://web.qalvpn.com/apps/qalvpn${pkgver}.deb")
md5sums=('885aae63f0fea2f1440455d8424cb558')

package() {
  ar x "${srcdir}/qalvpn${pkgver}.deb"
  tar -xJf data.tar.xz -C "$pkgdir"
  mv "$pkgdir/opt/QAL VPN" "$pkgdir/opt/qalvpn"
}

