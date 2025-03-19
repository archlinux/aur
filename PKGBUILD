# Maintainer: Mercas <me@smj.im>

pkgname=anytype-alpha
pkgver=0.45.11
_tag="alpha" # alpha, beta or leave blank
pkgrel=1
pkgdesc="The everything app for those who celebrate trust & autonomy"
arch=('x86_64')
url="https://anytype.io/"
license=('custom')
depends=('glibc' 'gtk3' 'nss' 'libxss' 'libsecret')
optdepends=('org.freedesktop.secrets: auto login support')
conflicts=('anytype-bin'
  'anytype-electron-bin'
  'anytype-alpha-bin')
source=("https://github.com/anyproto/anytype-ts/releases/download/v${pkgver}-${_tag}/anytype_${pkgver}-${_tag}_amd64.deb")
sha256sums=('7e165d5a4bc014a61e917a0eb75a5f760494eb837a47def2c292dba6410c8200')

package() {
  echo "Extract data.tar.xz ..."
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}
