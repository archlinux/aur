# Maintainer: V. claw <vinzzer@protonmail.com>
pkgname=pastesearch
pkgver=2020.10.11
pkgrel=1
pkgdesc='Cli pastebin searcher'
url="https://github.com/mmpx12/pastesearch"
arch=('any')
license=('MIT')
depends=('curl' 'jq' 'bash')
source=("${pkgname}-${pkgver}::git+${url}.git")
sha1sums=('SKIP')

package() {
    cd "$pkgname-$pkgver"
    sudo install -m755 pastesearch.sh /usr/bin/pastesearch
}

