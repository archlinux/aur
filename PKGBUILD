# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-webgl
pkgver=2019.2.1f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the WebGL platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta'
         'ffmpeg'
         'gzip'
         'ncurses5-compat-libs')
source=("2019.2.1f1.2.1f1.tar.xz::https://beta.unity3d.com/download/ca4d5af0be6f/LinuxEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-2019.2.1f1.tar.xz")
md5sums=("d9a688980750885a13858b8e66a76f44")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}"
  install -d "${_dest}"
  mv Editor "${_dest}"
}

