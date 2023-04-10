# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname="catimporter"
pkgver=1.0
pkgrel=5
pkgdesc="Import a category (with its subcategories) across mediawiki instances."
arch=('any')
_github="https://github.com"
_ns="ferdi2005"
url="${_github}/${_ns}/${pkgname}"
depends=("ruby-httparty"
         "ruby-addressable"
         "ruby-mediawiki_api")
license=("MIT")
_commit="e0860e75df541ab5dcde57a7ca27e4d09d513aac"
source=("${pkgname}::git+${url}")
sha256sums=("SKIP")

package(){
   install -Dm755 "${srcdir}/catimporter/process.rb" \
                  "${pkgdir}/usr/bin/catimporter"
}
