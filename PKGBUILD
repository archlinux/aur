# Maintainer: Xavier Gongora <ixbalanque@protonmail.ch>
# Contributor: Ralph Benjamin Ruijs <ralph.benjamin@gmail.com>
# Contributor: Lucas Paul <reilithion+aur@gmail.com>
pkgname=(otf-hasklig ttf-hasklig)
_reponame=Hasklig
pkgver=1.2
pkgrel=1
pkgdesc="A font with symbol ligatures, intended for Haskell code"
arch=(any)
url="https://github.com/i-tu/$_reponame"
license=(OFL)
source=("$url/releases/download/v$pkgver/$_reponame-$pkgver.zip" "LICENSE")
sha512sums=('fd8254f6aa14569147bbdb3940a08a99a04b601a56226fa65d73fe3ddb917b49b2234e12f4ea10ac59ba707579ed333e61fa1f1d5f141d9a9b3581cc56c38750'
        	'25f5196ce0954bd91a3da62fc5044a28a2a1d372c02be5328f74d672005de51f542eb1178f8ab8b0ba1da879ad5c8b67102b555ffb25209238ac0ae0eebe8e74')

package_otf-hasklig() {
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" OTF/*.otf
}

package_ttf-hasklig() {
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" TTF/*.ttf
}
