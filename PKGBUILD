# Maintainer: Rohit Goswami (HaoZeke) <rohit.goswami@aol.com>
pkgname=ttf-neuton
pkgver=20260521
pkgrel=1
pkgdesc="Neuton is a clean, dark, somewhat Dutch-inspired serif font which reminds you a little of Times."
url="https://fonts.google.com/specimen/Neuton"
arch=(any)
license=('OFL-1.1')
provides=('ttf-neuton')
# Pin to google/fonts main path; fonts.google.com/download returns HTML, not a zip
# Use live main branch raw URLs with fixed sha256 (content-addressed)
source=(
  "Neuton-Bold.ttf::https://raw.githubusercontent.com/google/fonts/main/ofl/neuton/Neuton-Bold.ttf"
  "Neuton-ExtraBold.ttf::https://raw.githubusercontent.com/google/fonts/main/ofl/neuton/Neuton-ExtraBold.ttf"
  "Neuton-ExtraLight.ttf::https://raw.githubusercontent.com/google/fonts/main/ofl/neuton/Neuton-ExtraLight.ttf"
  "Neuton-Italic.ttf::https://raw.githubusercontent.com/google/fonts/main/ofl/neuton/Neuton-Italic.ttf"
  "Neuton-Light.ttf::https://raw.githubusercontent.com/google/fonts/main/ofl/neuton/Neuton-Light.ttf"
  "Neuton-Regular.ttf::https://raw.githubusercontent.com/google/fonts/main/ofl/neuton/Neuton-Regular.ttf"
  "OFL.txt::https://raw.githubusercontent.com/google/fonts/main/ofl/neuton/OFL.txt"
)
sha256sums=(
  '6e9594b4efae7508d434acd863e0c5fd22502ee76798e72a2e79a94a4255fa74'
  '5b590903d739180edbca3c20363466358824e7ce34895829a53495ed91122a65'
  '0dde410696b33f5546bf3975cecce5d00810dc367fb9d62c4e8c4deda6c84eb6'
  'b5c66a502ed69b489300887b7019923e79925f90f1bed92cebbc398ec54b5199'
  '055582e4bafdb13759e9f9bfc0b88d64c57c395c414b2c1e452866ccd1f5ef9d'
  '28ae41fd0ff18925c1a829358b7bd334e27994da23d6abdd72eaff646cacadb6'
  '636d62f04d7bda9fcf9354f258f6244e7e18288cae036b95122e204f1acbec80'
)

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -t "$pkgdir/usr/share/fonts/TTF" -m644 \
    Neuton-Bold.ttf Neuton-ExtraBold.ttf Neuton-ExtraLight.ttf \
    Neuton-Italic.ttf Neuton-Light.ttf Neuton-Regular.ttf
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
