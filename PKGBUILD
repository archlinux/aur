# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgdesc='Grotesk font based inspired by the California state car plates and road signs'
pkgname=ttf-barlow
pkgver=1.422
pkgrel=1
url=https://tribby.com/fonts/barlow/
arch=(any)
license=(custom:OFL)
source=("${url}/download/barlow-${pkgver}.zip"
        'https://github.com/jpt/barlow/raw/master/OFL.txt')
sha512sums=('ecd9d3c66161e5043cf5ae7edf60863a27d51655b13ea01fabe83abcb4adf6a84366ad14f7c01cd0a7160dda357e81996dceae272fac65f97b3384bef9589df8'
            '94888ef1743b295f8cc9f5cff7351689bd57e096ede1c6df4dab101d3ca711f5e560b0c3da859540d49eb400e1a095db3a85c8887a9d79f8d73c15dece45360d')

package ()
{
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" fonts/ttf/*.ttf
	install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
