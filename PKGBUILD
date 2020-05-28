# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=mercure
pkgver=0.10.0
pkgrel=1
pkgdesc='Server-sent live updates: protocol and reference implementation'
arch=('i686' 'x86_64')
url='https://mercure.rocks'
install='mercure.install'
license=('AGPL-3.0')

source=('mercure.service')
source_i686=("mercure-${pkgver}_i686::https://github.com/dunglas/mercure/releases/download/v${pkgver}/mercure_${pkgver}_Linux_i386.tar.gz")
source_x86_64=("mercure-${pkgver}_x86_64::https://github.com/dunglas/mercure/releases/download/v${pkgver}/mercure_${pkgver}_Linux_x86_64.tar.gz")

sha256sums=('277572c9cbc93b74b368aec4fd40a8a9542d220e74b14383ef68e24630b2a4dc')
sha256sums_i686=('01d55d7bddde21f1cde86d61e913de507ffaabd87f5761e84e5e8f491401889d')
sha256sums_x86_64=('17ae7889ae9616ff501c1d2653df7e3c0681cc6b3ac176945acbffa1eabf918d')

package(){
  install -Dm 755 mercure "$pkgdir/usr/bin/mercure"
  install -Dm 755 mercure.service "$pkgdir"/usr/lib/systemd/system/mercure.service
}
