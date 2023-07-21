# Maintainer: GT610 <myddz1005@163.com>

pkgname=keyviz-bin
pkgver=2.0.0a
pkgrel=1
pkgdesc="A free and open-source tool to visualize your keystrokes keyboard in real-time (Official GNU/Linux build, binary)"
arch=('x86_64')
url="https://github.com/mulaRahul/keyviz"
license=('GPL')
source=("https://github.com/mulaRahul/keyviz/releases/download/v${pkgver}/keyviz_v${pkgver}_linux_x64.zip")
md5sums=('cd681bebf246bcf387c1aa525d9fcf76')
sha256sum=('48f7498af490e0eee4786b8166e0b539c4a40a3312477c979f26a3525f858e3c')

package() {
  mkdir -p "${pkgdir}"/usr/bin "${pkgdir}"/usr/share/applications "${pkgdir}"/usr/share/icons
  cp -r "${srcdir}"/* "${pkgdir}"/usr/bin
  cp ../keyviz.desktop "${pkgdir}"/usr/share/applications
  cp ../keyviz-icon.xpm "${pkgdir}"/usr/share/icons
  chmod +x "${pkgdir}"/usr/bin/keyviz
  echo "Currently keyviz for GNU/Linux is in alpha release. It may not work properly or have some bugs. \
  For any issues about the application itself, please refer to https://github.com/mulaRahul/keyviz/issues."
}