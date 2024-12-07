# Maintainer: BrLi <brli at chakralinux.org>

pkgname=ublacklist
pkgver=8.9.2
pkgrel=1
pkgdesc="uBlackList prevents the sites you specify from appearing in search engines' results."
arch=('any')
url="https://github.com/iorate/ublacklist"
license=('MIT')
source=("${url}/releases/download/v${pkgver}/ublacklist-v${pkgver}-chrome.zip")
b2sums=('4579846e9b733fb8a94e384dcf7b3d39f9563ffa039a45eaca97094bc5c5d759ea5e2be5383addfcf8edb9fb5399c4c76a1330c34195d2d157b4fe1add897db0')

package() {
	cd "$srcdir"

	# create install dir
	install -dm755 "$pkgdir/usr/lib/${pkgname}"

	# install extension files
	cp -a icons manifest.json pages scripts third-party-notices.txt _locales "$pkgdir/usr/lib/${pkgname}"
}
