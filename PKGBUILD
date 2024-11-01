# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>

pkgname=chrome-manifest-v2-policy
pkgver=1
pkgrel=1
epoch=1
pkgdesc="Google Chrome Policy to keep manifest v2 extensions enabled"
arch=('any')
url="https://github.com/uBlockOrigin/uBlock-issues/discussions/2977#discussioncomment-9521603"
license=('custom')
depends=()
makedepends=()

source=("ExtensionManifestV2Availability.json")

md5sums=(SKIP)

package() {
	install -Dm644 "${srcdir}/ExtensionManifestV2Availability.json" "${pkgdir}/etc/opt/chrome/policies/managed/ExtensionManifestV2Availability.json"
}
