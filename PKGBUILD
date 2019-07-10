# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-webgl
pkgver=2019.1.9f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the WebGL platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor'
         'ffmpeg'
         'gzip'
         'ncurses5-compat-libs')
source=("2019.1.9f1.1.9f1.tar.xz::https://download.unity3d.com/download_unity/d5f1b37da199/LinuxEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-2019.1.9f1.tar.xz")
md5sums=("d43822c9e2666ae2a298df886057887e")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}"
  install -d "${_dest}"
  mv Editor "${_dest}"
}

