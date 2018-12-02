# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2018.3.0
_build=b12
_randomstring=77f6238a7ced
_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-language-ko
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Korean Language Pack (Preview)"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta')
source=("https://new-translate.unity3d.jp/v1/live/54/2018.3/ko")
sha1sums=('240b07c9b52464d82ef113a284ae499a1628a0ab')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/Localization"
  install -d "${_dest}"
  mv ko "${_dest}/ko.po"
}

