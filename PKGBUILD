# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=wezterm-bin
pkgver=20200517.122836.92c201c6
_pkgver=20200517-122836-92c201c6
pkgrel=1
pkgdesc='A GPU-accelerated cross-platform terminal emulator and multiplexer implemented in Rust'
arch=('i686' 'x86_64')
url='https://wezfurlong.org/wezterm'
license=('MIT')
provides=('wezterm')
depends=('dbus'
         'libxkbcommon-x11'
         'fontconfig'
         'mesa'
         'xcb-util-keysyms'
         'xcb-util-wm'
         'python')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/wez/wezterm/releases/download/${_pkgver}/wezterm-${_pkgver}.Ubuntu16.04.tar.xz"
        'LICENSE::https://github.com/wez/wezterm/raw/master/LICENSE.md')
sha256sums=('779d4ff0e1aa00583d08c40af5230cf7ee14e678e22c58e95477f6fd82786a46'
            '191c46fcf52061382b1c51a70311eb9081381cc158e5899f3739473a9432185b')

package() {
  install -Dm755 wezterm -t "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}