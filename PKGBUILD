# Maintainer: oatmealraisin <archlinux at oatmealrais dot in>

pkgname='firefox-extension-old-reddit-redirect'
pkgver=1.8.2
pkgrel=1
pkgdesc='Ensure Reddit always loads the old design'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/old-reddit-redirect/'
license=('MIT')
depends=('firefox')
source=(
	"old_reddit_redirect-${pkgver}.xpi"::"https://addons.mozilla.org/firefox/downloads/file/4342347/old_reddit_redirect-${pkgver}.xpi"
	"LICENSE::https://raw.githubusercontent.com/tom-james-watson/old-reddit-redirect/refs/heads/master/manifest-v2/LICENSE.txt"
)
b2sums=(
	'790454b3a5b07b99253047006e19139ae28902360034031eea1017063796b08477858793acab81745ebfb74dbef5f0ef1277cc1b3e481b7407c2016511596de1'
	'835547e78b9178788088d8b037c24a5f535329275790419a95dc4e1f3a42c7c7a10681fe5556409e2e50b3af6dc833ef2f85ef790661d4294bd73ee724660d1d'
)

package() {
  install -Dm644 "old_reddit_redirect-${pkgver}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/{9063c2e9-e07c-4c2c-9646-cfe7ca8d0498}.xpi"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
