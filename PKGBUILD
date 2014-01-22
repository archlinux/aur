# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=quake2-demo
pkgver=3.14
pkgrel=1
pkgdesc="Quake II demo (0.pak) for quake II engines"
arch=('any')
url="http://www.idsoftware.com/games/quake/quake2"
license=('custom: shareware')
optdepends=('yamagi-quake2: recommended engine to play'
            'quake2: another engine to play')
source=("ftp://ftp.idsoftware.com/idstuff/quake2/q2-314-demo-x86.exe")
sha256sums=('7ace5a43983f10d6bdc9d9b6e17a1032ba6223118d389bd170df89b945a04a1e')

package() {
  # install files
  install -Dm644 license.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt
  install -Dm644 Install/Data/baseq2/pak0.pak "$pkgdir"/usr/share/games/quake2/pak0.pak
  cp -r Install/Data/baseq2/players "$pkgdir"/usr/share/games/quake2
}
