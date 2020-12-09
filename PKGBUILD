# Maintainer: David Barri <japgolly@gmail.com>

pkgname=tla-tools
pkgver=1.7.1
pkgrel=4
pkgdesc="Tools for the TLA+2 language (SANY, TLC, PlusCal translator and TLATeX)"
arch=('any')
url="http://research.microsoft.com/en-us/um/people/lamport/tla/tools.html"
license=('MIT')
depends=('java-runtime')
options=(!strip)
source=(
  "https://github.com/tlaplus/tlaplus/releases/download/v$pkgver/tla2tools.jar"
  'pcal'
  'tla-tools'
  'tla'
  'tla2sany'
  'tla2tex'
  'tlc-colour'
  'tlc-dist-fp'
  'tlc-dist-server'
  'tlc-dist-worker'
  'tlc-dist-workerfp'
  'tlc'
)
noextract=('tla2tools.jar')
sha256sums=('34ad47e58c85ec2b73f60ea4a8faaa7312003c921d69b7b67b9b34bbcbb09c6b'
            '06a0cc6028cec61252896d0b1b88282efd972de1e37ea7980a5e607b55a0257e'
            'c107b10578c71793043f707ffb8ec093e650ed99af757c4b54aa0c9dc14214d0'
            '1e30d6a6908e5c5f175538f673d4ac4ef495dcd88f89eb9cf93bdeefcdcd0f2b'
            '5517975359e764114cb231e3c80862dc24b800d5f11444b9c99cccaa5df11195'
            '1ed9e18cf3036f71ffb5f66ba53d4b13a46535ec6687185dd2b2f25a3aa2c051'
            '789cd76bddc8e957278a95ddfe7bdf3ebc22f7cb161b0c6bf1a644d525dc3431'
            '3ae8122f331b3aa9cd1952571d4bbc58d98246ec2e6f58bdfa9ce973fa7afc87'
            'fedb2f21d93526495ca4b8b6b10a6f37d6d4099d06a9203426b7c5f7c6996419'
            '450b00da072989f41f8cec7e6fdf535d8acdc31472d9372071a1ce769b860073'
            '7e1d17b97168d3d1359332c0311865d0a24ff4066b6640e802a1a7ee01a0e165'
            '1a0dcaebefe29e330aaf6ac42da41cd8ad5059d5f10411abf2063d2ef68c87af')

package() {
  mkdir -p "$pkgdir/usr/share/java" "$pkgdir/usr/bin"
  install -m644 tla2tools.jar       "$pkgdir/usr/share/java"
  install -m755 pcal                "$pkgdir/usr/bin"
  install -m755 tla                 "$pkgdir/usr/bin"
  install -m755 tla-tools           "$pkgdir/usr/bin"
  install -m755 tla2sany            "$pkgdir/usr/bin"
  install -m755 tla2tex             "$pkgdir/usr/bin"
  install -m755 tlc                 "$pkgdir/usr/bin"
  install -m755 tlc-colour          "$pkgdir/usr/bin"
  install -m755 tlc-dist-fp         "$pkgdir/usr/bin"
  install -m755 tlc-dist-server     "$pkgdir/usr/bin"
  install -m755 tlc-dist-worker     "$pkgdir/usr/bin"
  install -m755 tlc-dist-workerfp   "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
