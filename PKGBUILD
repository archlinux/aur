# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=hamonikr-onboard-layout-ko
pkgver=1.2.2
pkgrel=1
pkgdesc="Korean Keyboard Layout for onboard"
arch=('any')
url="https://github.com/hamonikr/hamonikr-onboard-layout-ko"
license=('GPL3')
depends=('onboard')
_commit=cd745c731a33102f2489ccede2ac5dcf0d7f3e6a # 1.2.2
_path=usr/share/onboard/layouts
source=("$url/raw/$_commit/$_path/Compact-ko.onboard"
        "$url/raw/$_commit/$_path/Full-Keyboard-ko.onboard"
        "$url/raw/$_commit/$_path/Middle-Keyboard-ko.onboard")
sha256sums=('cec35230669f63668432d7122b1e3fdf00e7ea6e7b2132b8057f042f582ca1ba'
            '527bacbbfdacfb69bedbb1228356d3f3ad8d456ba1cce9f271eef8ee38a20d5f'
            '1bdd7d91dec0f41db4a81cef36b1a100a0ccde55ec597496742b36d6c9c1f644')

package() {
  mkdir -p "$pkgdir/$_path"
  install -Dm644 Compact-ko.onboard Full-Keyboard-ko.onboard Middle-Keyboard-ko.onboard "$pkgdir/$_path"
}
