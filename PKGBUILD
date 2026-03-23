# Maintainer: Vitalii Stepchyk <lowercase-name (v) at lowercase-surname (s) dot dev>
pkgname=ttf-ioskeley-mono-unhinted
epoch=1
pkgver=2.0.0beta1
pkgrel=1
pkgdesc="Iosevka configuration to mimic Berkeley Mono - unhinted TTF version"
arch=(any)
url="https://github.com/ahatem/IoskeleyMono"
license=('OFL-1.1')
source=("IoskeleyMono-Normal.zip::https://github.com/ahatem/IoskeleyMono/releases/download/v2.0.0-beta.1/IoskeleyMono-Normal.zip")
sha256sums=('00693cd2ce76e93fccc357b0357a92b5ec2e17fa3cd994e67355baafbe98f8b7')

package() {
  install -Dm644 "$srcdir/Unhinted"/*.ttf -t "$pkgdir/usr/share/fonts/ttf/$pkgname"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  cat > "$pkgdir/usr/share/licenses/$pkgname/LICENSE" << 'EOF'
This font package is based on Iosevka and is licensed under the
SIL Open Font License 1.1 (OFL-1.1).

IoskeleyMono is a custom configuration of the Iosevka typeface.
For the full license text, see: https://opensource.org/licenses/OFL-1.1
EOF
}
