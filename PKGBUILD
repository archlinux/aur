# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2018.2.12
_build=f1
_randomstring=0a46ddfcfad4
_prefix=/opt/Unity

pkgname=unity-editor-language-zh-cn
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Chinese Language Pack (Preview)"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
source=("https://new-translate.unity3d.jp/v1/live/54/2018.2/zh-cn")
sha1sums=('9187a2a4a13c70721573228343ecb77ddb40c157')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/Localization"
  install -d "${_dest}"
  mv zh-cn "${_dest}/zh-cn.po"
}

