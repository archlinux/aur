# Maintainer: Vitalii Stepchyk <lowercase-name (v) at lowercase-surname (s) dot dev>
pkgname=ttf-ioskeley-mono-unhinted
pkgver=2025.10.09
pkgrel=1
pkgdesc="Iosevka configuration to mimic Berkeley Mono - unhinted TTF version"
arch=(any)
url="https://github.com/ahatem/IoskeleyMono"
license=('OFL-1.1')
source=("IoskeleyMono-TTF-Unhinted.zip::https://github.com/ahatem/IoskeleyMono/releases/download/2025.10.09-6/IoskeleyMono-TTF-Unhinted.zip")
sha256sums=('e61bec1f63199473f37abe78e53aba8ed5d2a2c16c1b61165adae972b1cc07ac')

package() {
  install -Dm644 "$srcdir/TTF-Unhinted"/*.ttf -t "$pkgdir/usr/share/fonts/ttf/$pkgname"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  cat > "$pkgdir/usr/share/licenses/$pkgname/LICENSE" << 'EOF'
This font package is based on Iosevka and is licensed under the
SIL Open Font License 1.1 (OFL-1.1).

IoskeleyMono is a custom configuration of the Iosevka typeface.
For the full license text, see: https://opensource.org/licenses/OFL-1.1
EOF
}
