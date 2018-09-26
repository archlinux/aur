# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2018.3.0
_build=b2
_randomstring=21e0e8a5466d
_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-language-ko
pkgver=${_version}${_build}
pkgrel=2
pkgdesc="Korean Language Pack (Preview)"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta')
source=("https://new-translate.unity3d.jp/v1/live/54/2018.3/ko")
sha1sums=('388429b264027e4e9e5c8fa086d547a21aa53f30')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/Localization"
  install -d "${_dest}"
  mv ko "${_dest}/ko.po"
}

