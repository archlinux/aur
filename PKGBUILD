# Maintainer: Breno Ramalho Lemes <breno@br-lemes.net>
pkgname=kanata-bin
pkgver=1.3.0
pkgrel=1
pkgdesc='Improve keyboard comfort and usability with advanced customization'
arch=('x86_64')
url='https://github.com/jtroo/kanata/'
license=('LGPL3')
provides=('kanata')
depends=('gcc-libs')
source=("https://github.com/jtroo/kanata/releases/download/v${pkgver//_/-}/kanata"
	'https://github.com/jtroo/kanata/raw/main/LICENSE')
sha256sums=('561b58713d9b0967be17e782355766feca3fa9bed45e6b396fa0ba224eba36b5'
	'a5681bf9b05db14d86776930017c647ad9e6e56ff6bbcfdf21e5848288dfaf1b')

package() {
	install -Dm755 kanata "${pkgdir}/usr/bin/kanata"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
