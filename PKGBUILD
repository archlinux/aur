# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-spline-sans-mono
pkgver=1.002
pkgrel=1
_commit='635218dc887e4f8f39f4c0ee8b95462df1be4866'
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
sha256sums=('455691b19152f0f823b2cf62f898da3c5cc8a09568494e47b0b4897dcaf7999e'
            '5931fe8ec9f6de01cad8b519fe2a17b2d50f98ec66a3f0a37aacaa5affda9bc8'
            '088fcc19a6ade38d93c29524dd18f9f0472eec4f481cafd860006411bcfea9b3'
            'bb9af4e0c8b0db6bae0f190dd0b588b634565bfafbfab058ebfd719f17b9edcb'
            'cc330c58b629060e7f86f475929da1ff5f73486d3c4f631e7a597b935ec08835'
            '4abb88162e4c0c5f9fc6c2f15d7085f7b7e27fd89f541a13488e1bcb829bde3f')

package() {
  install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 *.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 OFL.txt
}
