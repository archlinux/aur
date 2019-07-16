# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-webgl
pkgver=2019.2.0b9
pkgrel=1
pkgdesc="Allows building your Unity projects for the WebGL platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta'
         'ffmpeg'
         'gzip'
         'ncurses5-compat-libs')
source=("2019.2.0b9.2.0b9.tar.xz::https://beta.unity3d.com/download/eabe87e2a246/LinuxEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-2019.2.0b9.tar.xz")
md5sums=("e1aa4abec8b18dafe74a1546b648dbaf")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}"
  install -d "${_dest}"
  mv Editor "${_dest}"
}

