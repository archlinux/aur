
# Maintaoner: Yamada Hayao <development@fascode.net>

pkgname="cinnamenu"
pkgver=20200801
pkgrel=1
pkgdesc="A flexible menu providing formatting options, web bookmarks, search provider support and fuzzy searching."
arch=('any')
url="https://cinnamon-spices.linuxmint.com/applets/view/322"
license=('GPLv3')
#depends=('cinnamon')
makedepends=('git')
source=("https://cinnamon-spices.linuxmint.com/files/applets/Cinnamenu@json.zip")
md5sums=('SKIP')

pkgver() {
  date +%Y%m%d
}

package() {
    mkdir -p "${pkgdir}/usr/share/cinnamon/applets/"
    cp -r "${srcdir}/Cinnamenu@json" "${pkgdir}/usr/share/cinnamon/applets/"
    chmod 755 -R "${pkgdir}/usr/share/cinnamon/applets/"
}
