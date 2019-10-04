# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=mercure
pkgver=0.6.2
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
sha256sums_i686=('7dd0dabb10e38eb0bce5fcc9905b6bc2d8e8753cd43a34d5a7060df8cfacb1b9')
sha256sums_x86_64=('0cd0c6307f4f9eec9922c84e1f3a42226d398a9466998d225562deea23bf11cc')

package(){
  install -Dm 755 mercure "$pkgdir/usr/bin/mercure"
  install -Dm 755 mercure.service "$pkgdir"/usr/lib/systemd/system/mercure.service
}
