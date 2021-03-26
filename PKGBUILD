# Maintainer: SeineEloquenz alexander minus linder at gmx dot de

pkgname=jjbmc
pkgver=1.0
pkgrel=1
pkgdesc="Java Software Verification Tool"
arch=(any)
url="https://github.com/JonasKlamroth/JJBMC"
license=('unknown')
depends=("jre8-openjdk-headless")
optdepends=()
source=("https://github.com/JonasKlamroth/JJBMC/releases/download/ISoLa/JJBMC.jar"
        "jjbmc.sh")
noextract=('JJBMC.jar')
sha256sums=('a678dabf3c8bc986d5f589c8830ac828545c8a4a36e2011a1246639d24641258'
            '143b2d54b35d8602a9bdbb2009fc39d1c0065890f4ad50bc311f9c80446cf986')

build() {
  ls
  # assume ant defaults to UTF8 encoding.
}

package() {
  install -m 755 -D "jjbmc.sh" "$pkgdir/usr/bin/jjbmc"

  mkdir -p "${pkgdir}/usr/share/java/jjbmc"

  cp JJBMC.jar "${pkgdir}/usr/share/java/jjbmc/jjbmc.jar"

  ls "${pkgdir}/usr/share/java/jjbmc"
}
