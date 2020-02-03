# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

_name=drop-down-terminal-x
pkgname="gnome-shell-extension-${_name}"
pkgver='0.4.3'
pkgrel='1'
pkgdesc="Drop Down Terminal X extension for the Gnome Shell"
arch=('any')
url="https://github.com/bigbn/${_name}"
license=("GPL3")
conflicts=('gnome-shell-extension-drop-down-terminal'
    'gnome-shell-extension-drop-down-terminal-git'
    'gnome-shell-extension-drop-down-terminal-x-git')
depends=('gnome-shell')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('402934125e897b54ef5c2e6527eb22e0deb7375f885bf6581095cbcb11ae30f8')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
  cp -ax "${_name}@bigbn.pro" "${pkgdir}/usr/share/gnome-shell/extensions/"
}
