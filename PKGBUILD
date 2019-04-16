# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-webgl
pkgver=2019.1.0f2
pkgrel=1
pkgdesc="Allows building your Unity projects for the WebGL platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor'
         'ffmpeg'
         'gzip'
         'ncurses5-compat-libs')
source=("2019.1.0f2.1.0f2.tar.xz::https://beta.unity3d.com/download/292b93d75a2c/LinuxEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-2019.1.0f2.tar.xz")
md5sums=("e8f1429f10b9a654561ba32a5c006994")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}"
  install -d "${_dest}"
  mv Editor "${_dest}"
}

