pkgname=memo-git
pkgver=git
pkgrel=1
pkgdesc="Memo is a Unix-style note-taking software"
arch=('i686' 'x86_64')
source=(
  'git+https://github.com/nrosvall/memo.git'
 
)
md5sums=(
  'SKIP'
  
)
license=('GPL')
url="http://www.getmemo.org/"


build(){
  cd "${srcdir}"/memo
  
  make
}

package(){
  cd "${srcdir}"/memo
  mkdir -p ${pkgdir}/usr/local/bin/
  make PREFIX=${pkgdir}/usr/local install
}
