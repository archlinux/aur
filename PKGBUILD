pkgname=ttf-opendyslexic
pkgver=1
pkgrel=1
url="https://fontlibrary.org/en/font/opendyslexic"
license=('Bitstream Vera License')
pkgdesc='OpenDyslexic is a new open source font created to increase readability for readers with dyslexia. It was built on Jim Lyles’s Bitstream Vera Sans, and is free for Commercial and Personal'
arch=('any')
source=(
  "https://fontlibrary.org/assets/downloads/opendyslexic/b4e7d55cde7f4de04f5bff29c9f1a819/opendyslexic.zip"
)
sha256sums=(
  '3b4a84f573d3f5d75e198bbf362ff6fa812b33d6559dce651e44df455be929cc'
)
install=$pkgname.install

package() {
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF 
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}/
  
  install -Dm644 "${srcdir}"/open-dyslexic-20160623-Stable/ttf/*.ttf "${pkgdir}"/usr/share/fonts/TTF/
  
  install -Dm644 "${srcdir}"/open-dyslexic-20160623-Stable/README.md "${pkgdir}"/usr/share/licenses/${pkgname}/README_ttf_OpenDyslexic.md
}
