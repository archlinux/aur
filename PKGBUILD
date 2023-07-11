# Maintainer: Niklas Wojtkowiak <aur.7xcqe@passmail.com>
_pkgname='spacedrive'
_upkgname='Spacedrive'
pkgname="${_pkgname}-bin"
pkgver='2023.1.0'
pkgrel=1
pkgdesc="A file manager from the future."
arch=('x86_64')
url="https://spacedrive.com"
_url_source='https://github.com/Nim1com/spacedrive'
license=('AGPL3')
providers=("${_pkgname}")
conflicts=("${_pkgname}")
source=("$_url_source/releases/download/desktop@${pkgver}/data.tar.xz")
sha256sums=('8df5efae0fa10b72eb129e76f02a9156267c2d7799d29052cfdac5593773390c')

package() {
  tar -xvf 'data.tar.xz' -C "${pkgdir}" --strip-components=1
  install -dv "${pkgdir}/usr/bin"
}

