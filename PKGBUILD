# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-webgl
pkgver=2019.1.0a12
pkgrel=1
pkgdesc="Allows building your Unity projects for the WebGL platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta'
         'ffmpeg'
         'gzip'
         'ncurses5-compat-libs')
source=("2019.1.0a12.1.0a12.tar.xz::https://beta.unity3d.com/download/5175bce2e5d4/LinuxEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-2019.1.0a12.tar.xz")
md5sums=("eaf3e0f818c82da87e3924630fb17413")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}"
  install -d "${_dest}"
  mv Editor "${_dest}"
}

