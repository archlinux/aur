# Maintainer: airwoodix <airwoodix at posteo dot me>
pkgname=kicad-interactive-html-bom-plugin
_name=InteractiveHtmlBom
pkgver=2.10.0
pkgrel=1
pkgdesc="Interactive HTML BOM generation plugin for KiCAD"
arch=('i686' 'x86_64')
url="https://github.com/openscopeproject/InteractiveHtmlBom"
license=('MIT')
depends=('kicad')
source=("https://github.com/openscopeproject/${_name}/archive/v${pkgver}.tar.gz")
md5sums=('a9d05a9e90fc9f529767c462480868cb')
sha256sums=('973a3db0eed0a516df8f6bb837964d260b9581d14d3594554cd03d76af365c54')

package() {
  cd "$srcdir/${_name}-${pkgver}"

  install -m755 -d "${pkgdir}/usr/share/kicad/scripting/plugins"
  cp -R "${_name}/" "${pkgdir}/usr/share/kicad/scripting/plugins"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
