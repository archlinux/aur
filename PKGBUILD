# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2018.3.0
_build=b9
_randomstring=a3326ae325b2
_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-language-ja
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Japanese Language Pack (Preview)"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta')
source=("https://new-translate.unity3d.jp/v1/live/54/2018.3/ja")
sha1sums=('7a419b47d316d42dfb8a2ee4fdc28f859053d7fa')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/Localization"
  install -d "${_dest}"
  mv ja "${_dest}/ja.po"
}

