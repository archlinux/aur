# Maintainer: Denis Polyakov <snarkrans@gmail.com>

pkgname=stardict-slovnyk-en-uk-en
pkgver=2.4.2
pkgrel=1
pkgdesc="Large ukainian-english-ukainian dictionary for Stardict"
license=('GPL')
optdepends=(
'stardict: for viewing this dictionary'
)
url='http://download.huzheng.org/mova.org/'
source=("http://snarkrans.online:9093/stardict-dictd_www.mova.org_slovnyk_en-uk-en-2.4.2.tar.zst")
md5sums=('e4ad45f642d521cae0ab9263bcd1e094')
arch=(any)
package() {
    tar xvf *.tar.zst --directory=/home/$USER/.stardict/
  }