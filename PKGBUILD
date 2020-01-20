# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-webgl
pkgver=2019.3.0f5
pkgrel=1
pkgdesc="Allows building your Unity projects for the WebGL platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta'
         'ffmpeg'
         'gzip'
         'ncurses5-compat-libs')
source=("2019.3.0f5.3.0f5.tar.xz::https://beta.unity3d.com/download/44796c9d3c2c/LinuxEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-2019.3.0f5.tar.xz")
md5sums=("325f732851bcc784eeb8caefeedfd246")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}"
  install -d "${_dest}"
  mv Editor "${_dest}"
}

