# Maintainer:  Thorsten Töpper <atsutane-aur at freethoughts dot de>
# Contributor: Clar Fon <them@lightdark.xyz>

pkgname=uap-core
pkgver=0.18.0
pkgrel=1
pkgdesc="Regex file for BrowserScope's user agent parser"
arch=('any')
url='https://github.com/ua-parser/uap-core'
license=('Apache-2.0')
makedepends=('git')
source=("git+https://github.com/ua-parser/uap-core#tag=v${pkgver}")
sha256sums=('20659cd539f7db03632088471fa72bd431dc092bbf324741b541cad0d85ef94f')

package() {
  install -Dm644 "${srcdir}/${pkgname}/regexes.yaml" "${pkgdir}/usr/share/uap-core/regexes.yaml"
}
