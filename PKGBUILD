# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdecs='Typeface based loosely on early Grotesques with extensive OpenType features'
pkgname=ttf-work-sans
pkgver=2.010
pkgrel=1
replaces=(otf-work-sans-ibx otf-work-sans)
arch=(any)
license=(custom:OFL)
url=http://weiweihuanghuang.github.io/Work-Sans/
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/weiweihuanghuang/Work-Sans/archive/v${pkgver}.tar.gz")
sha512sums=('37396630564156a16ddcc386f0f8abfe41e624cd3f9dbbaf8226772b2511e311af3ccd75308c9a6562001ec2903eefaac5fec032d08b8fe3066fc30fbdf085f4')

package () {
	cd "Work-Sans-${pkgver}"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" fonts/static/TTF/*.ttf
	install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
