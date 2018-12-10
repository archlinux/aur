# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2017.4.17
_build=f1
_randomstring=05307cddbb71
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
md5sums=('6d907f829f987a796015be6afafbe052')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}"
  install -d "${_dest}"
  mv Editor "${_dest}"
}

