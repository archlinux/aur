# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Dennis Fink <metalgamer@c3l.lu>
# Contributor: Tobias Frilling <tobias@frilling-online.de>

pkgname=ttf-monaco
pkgver=6.1
pkgrel=4
pkgdesc="The Monaco monospaced sans-serif typeface with special characters added"
arch=('any')
license=('unknown')
url="https://github.com/todylu/monaco.ttf"
source=("Monaco_Linux.ttf::https://github.com/todylu/monaco.ttf/blob/master/monaco.ttf?raw=true")
md5sums=('5152b5a652b84e8572c5d527aa590e82')

package() {
    install -Dm644 Monaco_Linux.ttf -t "${pkgdir}/usr/share/fonts/TTF/"
}
