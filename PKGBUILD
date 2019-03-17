# Maintainer: David Barri <japgolly@gmail.com>

pkgname=tla-tools
pkgver=1.5.7
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
  'tlc'
  'tlc-colour'
  'tlc-dist-fp'
  'tlc-dist-server'
  'tlc-dist-worker'
  'tlc-dist-workerfp'
)
noextract=('tla2tools.jar')
sha256sums=('1626add371f8e198ea23f86d16d0c72166978456baaa61f1afec901283b92595'
            '9ad7854b6e5ce959ed8be9b6d0bf526b8197b1688881735713e2a6be99a35d18'
            'cfbc8a12b0c9071ecf8908f2b3df29fba791e174002209c0d73d24485453f3b8'
            '93fa12167a3d695a8b43dce9b3610fdd33f3f3e1ebb97121c3f05f871454e1ba'
            'c5b185bc06a0010b762100d530d9a5ecfbd0dc8fb2bb464001ed3017be4a592e'
            '7a19ee7fa00dd8502aa274abbf6b3cc39c205e78c738bd04bb5a4ee9ac83bfd2'
            '555ccfa5e688430cad3d9daf6c3cdf3602808c05b0a99d53f9e371b5e7b3773c'
            '212e01529d197aa9fa638851d6a03c3d5cf8a7eace6c05e44729ed7d60323f5c'
            '41010eada1dedb7c78e5af8222a113447bfd95393611aebb18fc392496a36e6b'
            '4099bd05576956bd345a2177fd8556117bee7ede43d51e87eb497c0e382251cc'
)

package() {
  mkdir -p "$pkgdir/usr/share/java" "$pkgdir/usr/bin"
  install -m644 tla2tools.jar "$pkgdir/usr/share/java"
  install -m755 pcal          "$pkgdir/usr/bin"
  install -m755 tla2sany      "$pkgdir/usr/bin"
  install -m755 tla2tex       "$pkgdir/usr/bin"
  install -m755 tlc           "$pkgdir/usr/bin"
  install -m755 tlc-colour    "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
