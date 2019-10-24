# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-webgl
pkgver=2019.2.10f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the WebGL platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor'
         'ffmpeg'
         'gzip'
         'ncurses5-compat-libs')
source=("2019.2.10f1.2.10f1.tar.xz::https://download.unity3d.com/download_unity/923acd2d43aa/LinuxEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-2019.2.10f1.tar.xz")
md5sums=("2861b9fb61c5fdd994d792038e393f44")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}"
  install -d "${_dest}"
  mv Editor "${_dest}"
}

