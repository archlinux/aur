# Maintainer: Vitalii Stepchyk <lowercase-name (v) at lowercase-surname (s) dot dev>
pkgname=ttf-ioskeley-mono-unhinted
epoch=1
pkgver=2.0.0
pkgrel=1
pkgdesc="Iosevka configuration to mimic Berkeley Mono - unhinted TTF version"
arch=(any)
url="https://github.com/ahatem/IoskeleyMono"
license=('OFL-1.1')
source=("IoskeleyMono-${pkgver}.zip::https://github.com/ahatem/IoskeleyMono/releases/download/v${pkgver}/IoskeleyMono.zip")
sha256sums=('dc37763fbb82cbb99611955ee3196c774c164c716c0f659b4bddbe3d370c3204')

package() {
  install -Dm644 "$srcdir/Normal/Unhinted"/*.ttf -t "$pkgdir/usr/share/fonts/ttf/$pkgname"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  cat > "$pkgdir/usr/share/licenses/$pkgname/LICENSE" << 'EOF'
This font package is based on Iosevka and is licensed under the
SIL Open Font License 1.1 (OFL-1.1).

IoskeleyMono is a custom configuration of the Iosevka typeface.
For the full license text, see: https://opensource.org/licenses/OFL-1.1
EOF
}
