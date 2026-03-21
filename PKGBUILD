# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgdesc='Grotesk font based inspired by the California state car plates and road signs'
pkgname=ttf-barlow
pkgver=1.422
pkgrel=2
url=https://tribby.com/fonts/barlow/
arch=(any)
license=(OFL)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jpt/barlow/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('35584c7c9021e02d854770cfa1a89d5c5178bb39de39d98658f34c704b38e4a720ffe81d9bae0d4a9a6f9b0435bcfc5a22bdb0794d36938ae89c5af9af6847bf')

package ()
{
	cd "barlow-$pkgver"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" fonts/ttf/*.ttf
}
