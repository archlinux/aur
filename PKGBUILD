# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: MeisBarry <bajavata@gmail.com>

pkgname=moby-thesaurus
pkgver=1.02
pkgrel=2
pkgdesc="The Project Gutenberg Etext of Moby Thesaurus II by Grady Ward"
arch=('any')
url="https://www.gutenberg.org/ebooks/3202"
license=('custom')
source=(http://www.gutenberg.readingroo.ms/etext02/mthes10.zip)
sha256sums=('e8773a5a8922e62ee685b2d1945830ad68711af69df1099bbb17b4509b95682b')

package() {
  msg 'Installing license...'
  install -Dm 644 aaREADME.txt "$pkgdir/usr/share/licenses/moby-thesaurus/aaREADME.txt"

  msg 'Installing...'
  install -Dm 644 mthesaur.txt "$pkgdir/usr/share/thesaurus/moby-thesaurus.txt"
}
