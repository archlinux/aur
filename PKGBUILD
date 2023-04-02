# Maintainer: begin-theadventure <begin-thecontact.ncncb@dralias.com>
# Previous-Maintainer: João Miguel <jmcf125 at openmailbox dot org>
pkgname=ghc-raspbian-bin
pkgver=8.8.4
pkgrel=2
pkgdesc="GHC binaries for Raspberry Pi from Raspian repositories"
arch=('armv6h')
url='https://www.haskell.org/ghc/'
license=('custom')
depends=('perl' 'gmp' 'gcc' 'libffi')
makedepends=('dpkg')
conflicts=('ghc')
provides=("ghc=$pkgver"
          'haskell-array=0.5.1.0'
          'haskell-base=4.8.2.0'
          'haskell-binary=0.7.5.0'
          'haskell-bin-package-db=0.0.0.0'
          'haskell-bytestring=0.10.6.0'
          'haskell-cabal=1.22.5.0'
          'haskell-containers=0.5.6.2'
          'haskell-deepseq=1.4.1.1'
          'haskell-directory=1.2.2.0'
          'haskell-filepath=1.4.0.0'
          'haskell-ghc-prim=0.4.0.0'
          'haskell-haskeline=0.7.2.1'
          'haskell-hoopl=3.10.0.2'
          'haskell-hpc=0.6.0.2'
          'haskell-integer-gmp=1.0.0.0'
          'haskell-pretty=1.1.2.0'
          'haskell-process=1.2.3.0'
          'haskell-template-haskell=2.10.0.0'
          'haskell-terminfo=0.4.0.1'
          'haskell-time=1.5.0.1'
          'haskell-transformers=0.4.2.0'
          'haskell-unix=2.7.1.0'
          'haskell-xhtml=3000.2.1')
replaces=('haskell-array'
          'haskell-base'
          'haskell-binary'
          'haskell-bin-package-db'
          'haskell-bytestring'
          'haskell-cabal'
          'haskell-containers'
          'haskell-deepseq'
          'haskell-directory'
          'haskell-filepath'
          'haskell-ghc-prim'
          'haskell-haskeline'
          'haskell-hoopl'
          'haskell-hpc'
          'haskell-integer-gmp'
          'haskell-pretty'
          'haskell-process'
          'haskell-template-haskell'
          'haskell-terminfo'
          'haskell-time'
          'haskell-transformers'
          'haskell-unix'
          'haskell-xhtml')
install="$pkgname.install"
options=('staticlibs')
install="${pkgname}.install"
options=('staticlibs')
_filename="ghc_${pkgver}-${pkgrel}+rpi1_armhf.deb"
source=("https://archive.raspbian.org/raspbian/pool/main/g/ghc/$_filename")
sha256sums=('8c502b462ba3bcd3a8418789c2a917a0a0c82dfa75429092a345c6532cabb9e7')

package() {
   echo '==> Extracting with dpkg. Note: packaging may take over 40 minutes.'
   dpkg -x "$srcdir/$_filename" "$pkgdir"
}
