# Maintainer: archblue <jhswx84@aliyun.com>
pkgname=wiznoteplus-appimage
_pkgname=wiznoteplus
pkgver=2.11.3
pkgrel=1
pkgdesc="支持插件的第三方为知笔记客户端，插件安装方式请参见官网"
arch=("any")
url="https://github.com/altairwei/WizNotePlus"
license=('Apache License 2.0')
source=("${_pkgname}.AppImage::https://github.com/altairwei/WizNotePlus/releases/download/v${pkgver}/WizNotePlus-linux-v${pkgver}.AppImage"
  "${_pkgname}.png::https://raw.githubusercontent.com/altairwei/WizNotePlus/master/resources/logo_256.png"
  "${_pkgname}.desktop")
sha256sums=('002baf5f38a75e9560d178df52145d8b6b424743cd6bc51befc3f0537b1c00e4'
	 '7f1bb0f24d9f478513af3e9503b2fe3eccb6142a01e785439fbb6d15490aad04'
   "710290ba4306015f5f6ff2ce6261ce1fd6393f4c2752581b1412a5416266d14f" )


package() {
  cd "${srcdir}"

  install -Dm 555 ${_pkgname}.AppImage ${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage
  install -Dm 644 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  install -Dm 644 ${_pkgname}.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png

}

