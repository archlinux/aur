# Maintainer: Denis Polyakov <snarkrans@gmail.com>

pkgname=stardict-slovnyk-en-uk
pkgver=2.4.2
pkgrel=3
pkgdesc="english-ukrainian dictionary for Stardict"
license=('GPL')
optdepends=(
'stardict: for viewing this dictionary'
)
url='http://download.huzheng.org/mova.org/'
source=("http://download.huzheng.org/mova.org/stardict-dictd_www.mova.org_slovnyk_en-uk-2.4.2.tar.bz2")
md5sums=('SKIP')
arch=(any)
package() {
    ls -l /home/$USER/.stardict/dic > /dev/null 2>&1 || mkdir -p /home/$USER/.stardict/dic
    tar xvf *.tar.bz2 --directory=/home/$USER/.stardict/dic
  }
