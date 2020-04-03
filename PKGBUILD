# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=mercure
pkgver=0.9.0
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
sha256sums_i686=('2f6a37db441ee58d7ab3a24df3bcbe3111d93ce23a06fc71fad96a94f6b969c3')
sha256sums_x86_64=('995d58587430801809289d230a63ef6e016430b97a528f9ca4be14eb595df974')

package(){
  install -Dm 755 mercure "$pkgdir/usr/bin/mercure"
  install -Dm 755 mercure.service "$pkgdir"/usr/lib/systemd/system/mercure.service
}
