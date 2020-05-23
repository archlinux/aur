# Maintainer: David Barri <japgolly@gmail.com>

pkgname=tla-tools
pkgver=1.7.0
pkgrel=1
pkgdesc="Tools for the TLA+2 language (SANY, TLC, PlusCal translator and TLATeX)"
arch=('any')
url="http://research.microsoft.com/en-us/um/people/lamport/tla/tools.html"
license=('MIT')
depends=('java-runtime')
options=(!strip)
source=(
  "https://github.com/tlaplus/tlaplus/releases/download/v$pkgver/tla2tools.jar"
  'pcal'
  'tla2sany'
  'tla2tex'
  'tla-tools'
  'tlc'
  'tlc-colour'
  'tlc-dist-fp'
  'tlc-dist-server'
  'tlc-dist-worker'
  'tlc-dist-workerfp'
)
noextract=('tla2tools.jar')
sha256sums=('8cce75caa1e59d0b0483bb8fb881ba33825edce8b2d98aba59d66ce685dd3d1a'
            '06a0cc6028cec61252896d0b1b88282efd972de1e37ea7980a5e607b55a0257e'
            '5517975359e764114cb231e3c80862dc24b800d5f11444b9c99cccaa5df11195'
            '1ed9e18cf3036f71ffb5f66ba53d4b13a46535ec6687185dd2b2f25a3aa2c051'
            '8b87025166b15e93fd90803ba5165e505a4ee5e67d8f5e462276badd2443a16c'
            '1a0dcaebefe29e330aaf6ac42da41cd8ad5059d5f10411abf2063d2ef68c87af'
            'bb661b1c30aa343f1c34e9cf9a19f9abaf974e1b124a2c1311c470ba79bf5935'
            '3ae8122f331b3aa9cd1952571d4bbc58d98246ec2e6f58bdfa9ce973fa7afc87'
            'fedb2f21d93526495ca4b8b6b10a6f37d6d4099d06a9203426b7c5f7c6996419'
            '450b00da072989f41f8cec7e6fdf535d8acdc31472d9372071a1ce769b860073'
            '7e1d17b97168d3d1359332c0311865d0a24ff4066b6640e802a1a7ee01a0e165')

package() {
  mkdir -p "$pkgdir/usr/share/java" "$pkgdir/usr/bin"
  install -m644 tla2tools.jar       "$pkgdir/usr/share/java"
  install -m755 pcal                "$pkgdir/usr/bin"
  install -m755 tla2sany            "$pkgdir/usr/bin"
  install -m755 tla2tex             "$pkgdir/usr/bin"
  install -m755 tla-tools           "$pkgdir/usr/bin"
  install -m755 tlc                 "$pkgdir/usr/bin"
  install -m755 tlc-colour          "$pkgdir/usr/bin"
  install -m755 tlc-dist-fp         "$pkgdir/usr/bin"
  install -m755 tlc-dist-server     "$pkgdir/usr/bin"
  install -m755 tlc-dist-worker     "$pkgdir/usr/bin"
  install -m755 tlc-dist-workerfp   "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
