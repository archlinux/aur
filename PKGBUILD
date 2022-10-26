# Maintainer: endaaman <endaaman@frontier.hokudai.ac.jp>
_version='20221014'
pkgname=(otf-line-seed ttf-line-seed)
pkgver=1.0.$_version
pkgrel=1
pkgdesc='LINE Seed font'
arch=(any)
url="https://seed.line.me"
license=(custom)
source=(
	"https://seed.line.me/src/images/fonts/LINE_Seed_Sans_JP.zip"
	"license.txt"
)
sha512sums=(
	'6b7593e746b84d90700581ce7c21350ca5effc65f78d3291e7785e08682fc2870366711b066b46ffcc9a42d8b317ac4cd69dd04cb3ea34f5102ba94579b8fb58'
	'6e98e0884f66a1070ada6c12ee98069341ca4d72e23c1a6318524f9e15b21ba73521322301d0be091bfa75ef148cce4e538cc62dd8b8d6f0402ff9271fe1013a'
)

package_otf-line-seed() {
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" license.txt
	cd LINE_Seed_JP_$_version
	# cd "$(find -maxdepth 1 -mindepth 1 -type d -name 'LINE_Seed*' -print)"
	install -Dm644 -t "$pkgdir/usr/share/fonts/line-seed" Desktop/OTF/*.otf
}

package_ttf-line-seed() {
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" license.txt
	cd LINE_Seed_JP_$_version
	# cd "$(find -maxdepth 1 -mindepth 1 -type d -name 'LINE_Seed*' -print)"
	install -Dm644 -t "$pkgdir/usr/share/fonts/line-seed" Desktop/TTF/*.ttf
}
