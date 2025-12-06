# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>

pkgname='nohang-openrc'
pkgver='0.0.4'
pkgrel='1'
arch=('any')
pkgdesc='OpenRC init script for nohang'
url='https://github.com/Nitrux/nohang-openrc'
depends=('nohang' 'openrc')
license=('BSD-3-Clause')
source=('nohang' 'LICENSE')
b2sums=('34f26be43645eff52b8a9a84283f6c4621c215dc49da90edd5f7ec60a18d01838b56f57d33ec4a2f6a72bfd5eac4232d16a94e13eb7f9b7f920625f29defca4b'
        '727515e1a773b214e8c5206cd5c2fb1d4f4ec14977dabf809d74f27bcbf46372d5a45f6adb5cf26f051e98e4b843db99e63812e0b678fafb696233592534f521')

package() {
  install -Dm755 nohang $pkgdir/etc/init.d/nohang
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
