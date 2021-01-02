# Maintainer: rakoo <m@rako.space>
arch=('x86_64')
license=('AGPL3')
pkgdesc="Autonomous (self-hosted) BitTorrent DHT search engine suite."
pkgname=magnetico-bin
pkgrel=1
pkgver=0.12.0
provides=('magneticod' 'magneticow')
#source_x86_64=("https://github.com/caddyserver/caddy/releases/download/v${pkgver}/caddy_${pkgver}_linux_amd64.tar.gz")
source=(
	"https://github.com/boramalper/magnetico/releases/download/v${pkgver}/magneticod"
	"https://github.com/boramalper/magnetico/releases/download/v${pkgver}/magneticow")
sha512sums=(
	'4b24727ca44ae731c2552413d93b06d4cbbdeab483d27084f3742161b5977ca2ff65b20f3addd40b8e3643fb3601d39921fe2497cb77e4deaf4346b5b07ae408'
	'db0eb1c581979ad8d1a7eca9eed09a8f51cbf79aa17eca36ae52a4dedc69f18ba75fa9b6e47ef42cb14e002adaf071c8cbdf8e8b8f49fd7611059401e5b16e10')
url='https://github.com/boramalper/magnetico'

package() {
  install -D -m755 magneticod "$pkgdir/usr/bin/magneticod"
  install -D -m755 magneticow "$pkgdir/usr/bin/magneticow"
}
