# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2017.4.11
_build=f1
_randomstring=8c6b8ef6d111
_prefix=/opt/UnityLts

pkgname=unity-editor-lts-webgl
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Allows building your Unity projects for the WebGL platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts'
         'ffmpeg'
         'gzip')
source=("https://download.unity3d.com/download_unity/${_randomstring}/LinuxEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-${_version}${_build}.tar.xz")
md5sums=('ce24907dc638bf6ec45cf2f981b78acf')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}"
  install -d "${_dest}"
  mv Editor "${_dest}"
}

