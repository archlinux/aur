# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-spline-sans
pkgver=1.000
pkgrel=1
_commit='9cace6ea0d563fcfbe20ae73e6623b064dd2743b'
pkgdesc="Grotesque sans serif typeface family, purpose-built for UI interfaces, checkout processes, and paragraphs of text"
arch=('any')
url="https://github.com/SorkinType/SplineSans"
license=('custom:OFL')
source=("https://github.com/SorkinType/SplineSans/raw/$_commit/fonts/ttf/SplineSans-Bold.ttf"
        "https://github.com/SorkinType/SplineSans/raw/$_commit/fonts/ttf/SplineSans-Light.ttf"
        "https://github.com/SorkinType/SplineSans/raw/$_commit/fonts/ttf/SplineSans-Medium.ttf"
        "https://github.com/SorkinType/SplineSans/raw/$_commit/fonts/ttf/SplineSans-Regular.ttf"
        "https://github.com/SorkinType/SplineSans/raw/$_commit/fonts/ttf/SplineSans-SemiBold.ttf"
        "https://github.com/SorkinType/SplineSans/raw/$_commit/OFL.txt")
sha256sums=('211e833f1ca92403f3256d552b44dbe3a60343c1ca0358a07d7fa7cad587ea96'
            '274a302b7ccd806944ceba1cc5a12cc631c02cff3b896080cf719591a3448393'
            '2776aee7c08ab09a3428d7977a0b4ea0ca68dfbc48f865db22bf568057b9e4ec'
            '9106e71c5d8804fd8fea063c20342e9250c2186d777d2bb8f3118c1b8cf81ca2'
            '421ae73a3897b6c9d1dd5d805a33a38e2f3a8c6337e32957af9a17fd1976faac'
            '45b2aa0796f435bd620d864b6b44ff08855dc575524f23ffb43161e69cb5dbfc')

package() {
  install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 *.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 OFL.txt
}
