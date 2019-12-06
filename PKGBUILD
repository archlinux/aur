# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-webgl
pkgver=2019.2.15f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the WebGL platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor'
         'ffmpeg'
         'gzip'
         'ncurses5-compat-libs')
source=("2019.2.15f1.2.15f1.tar.xz::https://download.unity3d.com/download_unity/dcb72c2e9334/LinuxEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-2019.2.15f1.tar.xz")
md5sums=("8c88370c5c4d830025390150a1a90a8b")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}"
  install -d "${_dest}"
  mv Editor "${_dest}"
}

