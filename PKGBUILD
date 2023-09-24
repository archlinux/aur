# Maintainer: Kha < ezkha at disroot dot org>
# Contributor: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >
pkgname=firefox-extension-fastforward
pkgver=0.2237
pkgrel=2
pkgdesc='Firefox extension that automatically skips annoying link shorteners.'
arch=('any')
url='https://fastforward.team/'
license=('unlicense')
depends=('firefox')
groups=('firefox-addons')
source=("${pkgname}-${pkgver}.xpi::https://github.com/FastForwardTeam/FastForward/releases/download/$pkgver/fastforwardteam-$pkgver.xpi")
b2sums=(
    '4ec36a015e2d3f4f2268117891d929c5443701c71a8ef112903bd6455a4b916c200a9690a89e20b7a279dbe4dda83ecbed48cf6272bd3ba892d79f347e0ae2d8'
)

package() {
    install -Dm644 ${pkgname}-${pkgver}.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/addon@fastforward.team.xpi"
}
