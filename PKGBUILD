# Maintainer: Marley Rae <marley at punkfairie dot net>

pkgname=(ttf-fairiesevka ttf-fairiesevka-term ttf-fairiesevka-propo)
pkgbase=fairiesevka-font
pkgver=1.0.1
pkgrel=1
pkgdesc='My personal flavor of the Iosevka font; patched with Nerd Font glyphs'
arch=('any')
url='https://github.com/punkfairie/Fairiesevka'
license=(OFL)
provides=('ttf-font-nerd')

source=(${url}/releases/download/v${pkgver}/Fairiesevka.zip)
sha256sums=('50248015c1c7eda62573b45e874dae8dc5830c0b74346a1557fd7dca2e12e5ee')

package_ttf-fairiesevka() {
  pkgdesc+='.'
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
  install -Dm644 -t "$pkgdir/usr/share/fonts/fairiesevka" reg/*.ttf
}

package_ttf-fairiesevka-term() {
  pkgdesc+=' (single-width/mono variant).'
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
  install -Dm644 -t "$pkgdir/usr/share/fonts/fairiesevka" term/*.ttf
}

package_ttf-fairiesevka-propo() {
  pkgdesc+=' (variable-width/propo variant).'
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
  install -Dm644 -t "$pkgdir/usr/share/fonts/fairiesevka" propo/*.ttf
}
