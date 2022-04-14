# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-spline-sans-mono
pkgver=1.000
pkgrel=1
_commit='fd94fa5f329b3b586fcda16a0547bca62b2269b3'
pkgdesc="Monospaced Grotesque purpose-built for UI interfaces, checkout processes, and programming"
arch=('any')
url="https://github.com/SorkinType/SplineSansMono"
license=('custom:OFL')
source=("$url/raw/$_commit/fonts/ttf/SplineSansMono-Bold.ttf"
        "$url/raw/$_commit/fonts/ttf/SplineSansMono-Light.ttf"
        "$url/raw/$_commit/fonts/ttf/SplineSansMono-Medium.ttf"
        "$url/raw/$_commit/fonts/ttf/SplineSansMono-Regular.ttf"
        "$url/raw/$_commit/fonts/ttf/SplineSansMono-SemiBold.ttf"
        "$url/raw/$_commit/OFL.txt")
sha256sums=('20ad66150548e5df503c82e0c203cb4ab57bc2f3a6e0db03f8de8fce65346d01'
            '4029e9d9d4e75fa09e6aa7a4a70e517a78c5cfabb3d9ced3b22a7b7367721dda'
            'cf9e3f0ea43be1d33028683fb17b8c4179cfa30e42159bb9f5d929047817b2a9'
            '84cd44a3ef3b51dd2522c1dc445170a8d1b7edcbb4265fe050b026470a7fcdce'
            'cbd1ab8ccf50722bbcd21330dc1c684882e33f76e2921c4f144d3bfdf9172c59'
            '4abb88162e4c0c5f9fc6c2f15d7085f7b7e27fd89f541a13488e1bcb829bde3f')

package() {
  install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 *.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 OFL.txt
}
