# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

_name=drop-down-terminal-x
pkgname="gnome-shell-extension-${_name}"
pkgver='1.4.4'
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
sha256sums=('d22a37aab1eb677355052d568cfb5c9021aa9ecfc1ba5ab6e426901828e424bc')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
  cp -ax "${_name}@bigbn.pro" "${pkgdir}/usr/share/gnome-shell/extensions/"
}
