# Maintainer: Kaz Malhotra <kazmal@protonmail.com>

pkgname='cws'
pkgver=1.01
pkgrel=1
pkgdesc='A CLI tool that finds the most common words in a file'
arch=('any')
url='https://kazmal.tech/cws/'
license=('MIT')
depends=('python')
optdepends=('lolcat: make stuff look pretty')
source=("cws")
md5sums=('20254d90ecc536928e49d4d29d2f7669')
md5sums=('2c6a191f71a62d7b512bd9e8c8715b4d')


package(){

  return 0
}


build() {

  sudo chmod +x cws
  sudo cp cws /usr/bin
  echo Installed cws. | lolcat
}
