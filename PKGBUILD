# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2018.2.9
_build=f1
_randomstring=2207421190e9
_prefix=/opt/Unity

pkgname=unity-editor-language-ko
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Korean Language Pack (Preview)"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
source=("https://new-translate.unity3d.jp/v1/live/54/2018.2/ko")
sha1sums=('ff06cb07205ce33fa1f534e67716daddc8eac047')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/Localization"
  install -d "${_dest}"
  mv ko "${_dest}/ko.po"
}

