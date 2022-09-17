# Maintainer: CodeCraft <CodeCraft07@outlook.com>
pkgname=(sf-fonts)
pkg=(SF-Fonts)
_reponame=Fonts
pkgbase=sf-fonts
pkgver=1.0.0
pkgrel=1
pkgdesc='Sans typeface by Kostas Bartsokas'
arch=(any)
url="https://github.com/ProjectOSX/$_reponame"
# https://github.com/ProjectOSX/Fonts/releases/download/v1.0.0/SF-Fonts.zip
license=('MIT')
makedepends=(git)
source=("$url/releases/download/v$pkgver/$pkg.zip")
sha256sums=('7b7388fcd3a99d552a7724d5aca1ab3b68cf0fb430fb738db2d8dc6d06d1fc4d')
provide=(sf-fonts)
package() {
	cd "$pkg"
	install -Dm644 -t "$pkgdir/usr/share/fonts/sf-fonts" Fonts/*.otf
}
