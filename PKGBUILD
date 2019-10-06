# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=mercure
pkgver=0.7.0
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
sha256sums_i686=('e8a274736eacc19a52f2b49d539c30619226d8442b5506005e28f9271a31c674')
sha256sums_x86_64=('734d7f1e7868bdeb80d7f8d51ff7c6cc550ec0b91ab6ad5b4a154ebb04583a0a')

package(){
  install -Dm 755 mercure "$pkgdir/usr/bin/mercure"
  install -Dm 755 mercure.service "$pkgdir"/usr/lib/systemd/system/mercure.service
}
