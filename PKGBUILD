# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

_name=drop-down-terminal-x
pkgname="gnome-shell-extension-${_name}"
pkgver='1.3.0'
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
sha256sums=('05dee11579d81fc6d9895fd1b4368901c3ead77ff5e174953cb674c18b8a88be')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
  cp -ax "${_name}@bigbn.pro" "${pkgdir}/usr/share/gnome-shell/extensions/"
}
