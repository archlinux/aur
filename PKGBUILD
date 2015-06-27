# Maintainer: Ondrej Kucera <ondrej.kucera@centrum.cz>
pkgname=tred
pkgver=2.5049
pkgrel=1
pkgdesc="Tree editor TrEd"
arch=("any")
url="http://ufal.mff.cuni.cz/tred/"
license=("GPL")
depends=('perl' 'perl-tk' 'perl-file-which' 'perl-tie-ixhash' 'perl-tk-codetext' 'perl-xml-libxslt' 'perl-xml-libxml-iterator' 'perl-xml-sax-writer' 'perl-xml-writer' 'perl-io-string' 'perl-treex-pml' 'perl-readonly')
source=(http://ufal.mff.cuni.cz/tred/$pkgname-current.tar.gz)
md5sums=('1782ccd5fa72b3a47f6bfb35076a86f6')

package() {
  mkdir -p ${pkgdir}/opt
  cp -r ${srcdir}/${pkgname} ${pkgdir}/opt
  mkdir -p ${pkgdir}/usr/bin
  cd ${pkgdir}/usr/bin
  ln -s ../../opt/tred/tred tred
  ln -s ../../opt/tred/btred btred
  ln -s ../../opt/tred/ntred ntred
}
