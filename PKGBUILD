# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=ttf-luciole
pkgver=1.0
pkgrel=3
pkgdesc="A typeface developed explicitly for visually impaired people."
arch=("any")
url="https://www.luciole-vision.com/luciole-en.html"
license=("CCPL:cc-by-4.0")
depends=(fontconfig)
source=("https://www.typographies.fr/N/luciole/Luciole-Regular.ttf"
        "https://www.typographies.fr/N/luciole/Luciole-Bold.ttf"
        "https://www.typographies.fr/N/luciole/Luciole-Regular-Italic.ttf"
        "https://www.typographies.fr/N/luciole/Luciole-Bold-Italic.ttf"
        "https://www.typographies.fr/N/luciole/Read%20Me.txt")
sha256sums=('1ae1bbefc9ae6741d4a7f22ae1f34436f2df779995bfd314ebc42a17250d3f8a'
            '7e141d4e2f4605e4634baea2d606434b24257a00d7f0000f00af178efad24df2'
            '389941ba7ad9a5db635b74bdedff43de54d91748597a991410346d9551efb875'
            'a945740a3f7307aad34f240320535b233afc3aea4fe3940bdc6647fd2cfefedf'
            'b65e176a58b7de57691aabc344f96cf9e4998adcc9dd268381b29ae6d8936e22')

package() {
  install -d -m755 "$pkgdir/usr/share/licenses/$pkgname"
  install -D -m644 "Read%20Me.txt" "$pkgdir/usr/share/licenses/$pkgname/readme.txt"

  install -d -m755 "$pkgdir/usr/share/fonts/TTF"
  install -D -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
}
