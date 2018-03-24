pkgname=ttf-opendyslexic
pkgver=1
pkgrel=2
url="https://github.com/antijingoist/open-dyslexic"
license=('Bitstream Vera License')
pkgdesc='OpenDyslexic is a new open source font created to increase readability for readers with dyslexia. It was built on Jim Lyles’s Bitstream Vera Sans, and is free for Commercial and Personal'
arch=('any')

source=("https://github.com/antijingoist/open-dyslexic/archive/master.zip")

sha256sums=(
  '527b5d58afea4133627eb8d7265c89c0c2a1ee29c73474ee2539f952287324ec'
)
install=$pkgname.install

package() {
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF 
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}/
  
  install -Dm644 "${srcdir}"/open-dyslexic-master/ttf/*.ttf "${pkgdir}"/usr/share/fonts/TTF/
  
  install -Dm644 "${srcdir}"/open-dyslexic-master/README.md "${pkgdir}"/usr/share/licenses/${pkgname}/README_ttf_OpenDyslexic.md
}
