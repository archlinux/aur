# Maintainer: Nici <NicolasVontobel at protonmail dot com>
pkgname='wlprop'
pkgver=1.0
pkgrel=1
epoch=1
pkgdesc="xprop but for wayland"
arch=('any')
url="https://gist.github.com/f313386043395ff06570e02af2d9a8e0.git"
license=('MIT')
depends=('sway' 'jq' 'slurp' 'gawk')
makedepends=() 
source=('https://gist.githubusercontent.com/crispyricepc/f313386043395ff06570e02af2d9a8e0/raw/758c548bfb4be5b437c428c8062b3987f126f002/wlprop.sh') 
sha256sums=('d9f93047db8596197d35e3634f229c54e299d3bb7b1b659c322e87f3e9f5ef65')

package() {
	install -Dm755 ./wlprop.sh $pkgdir/usr/bin/$pkgname
}
