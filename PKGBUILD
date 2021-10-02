# Maintainer: tekacs <pkg@tekacs.com>
# Maintainer: rafaeldelboni <rafael@delboni.cc>

pkgname=tandem-chat
pkgver=2.0.1001
pkgrel=1
pkgdesc='Tandem Chat - a virtual office for remote teams'
arch=('x86_64')
url="https://tandem.chat/"
license=('Proprietary')
options=('!emptydirs' '!strip')
depends=('at-spi2-core' 'gtk3' 'libxtst' 'libnotify' 'nss' 'xdg-utils')
install=${pkgname}.install

source_x86_64=("$pkgname-$pkgver::https://downloads.tandem.chat/linux/rpm/x64")
sha512sums_x86_64=('SKIP')

package() (
  mkdir -p "${pkgdir}/opt/"
  mkdir -p "${pkgdir}/usr/lib/"
  mkdir -p "${pkgdir}/usr/share/"
  cp -r "${srcdir}/opt/." "${pkgdir}/opt/"
  cp -r "${srcdir}/usr/lib/." "${pkgdir}/usr/lib/"
  cp -r "${srcdir}/usr/share/." "${pkgdir}/usr/share/"
)
