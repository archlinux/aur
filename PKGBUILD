# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-webgl
pkgver=2018.3.6f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the WebGL platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor'
         'ffmpeg'
         'gzip'
         'ncurses5-compat-libs')
source=("2018.3.6f1.3.6f1.tar.xz::https://download.unity3d.com/download_unity/a220877bc173/LinuxEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-2018.3.6f1.tar.xz")
md5sums=("40e7b7a4b001419ac248f88390bf3bea")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}"
  install -d "${_dest}"
  mv Editor "${_dest}"
}

