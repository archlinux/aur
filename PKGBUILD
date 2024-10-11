# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=hamonikr-onboard-layout-ko
pkgver=1.3.3
_commit=99125d9a379df5bc130b20b8e3a5a14a4091e86c
pkgrel=1
pkgdesc="Korean Keyboard Layout for onboard"
url="https://github.com/hamonikr/hamonikr-onboard-layout-ko"
arch=('any')
license=('GPL-3.0-or-later')
depends=('onboard')
_path=usr/share/onboard/layouts
source=("$url/raw/$_commit/$_path/Compact-ko.onboard"
        "$url/raw/$_commit/$_path/Full-Keyboard-ko.onboard"
        "$url/raw/$_commit/$_path/Grid-ko.onboard"
        "$url/raw/$_commit/$_path/Middle-Keyboard-ko.onboard"
        "$url/raw/$_commit/$_path/Phone-ko.onboard"
        "$url/raw/$_commit/$_path/Small-ko.onboard")
sha256sums=('cec35230669f63668432d7122b1e3fdf00e7ea6e7b2132b8057f042f582ca1ba'
            '527bacbbfdacfb69bedbb1228356d3f3ad8d456ba1cce9f271eef8ee38a20d5f'
            '52d775b07b634311cc8a0ebf6331e5a1918cdd5beb65eb5cd35f8edb21c98255'
            '1bdd7d91dec0f41db4a81cef36b1a100a0ccde55ec597496742b36d6c9c1f644'
            '58b930d03d62665178e49237605ad228b9e587358d910a0e4e9ae75d04c088bd'
            '39171d332b91bbece73181e607623337734f85b3264aee15e51a2a2f1a8b0026')

package() {
  mkdir -p "$pkgdir/$_path"
  install -Dm644 *-ko.onboard "$pkgdir/$_path"
}
