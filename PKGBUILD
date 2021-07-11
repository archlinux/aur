# Maintainer: Pierre Penninckx <ibizapeanut@gmail.com>

pkgname='haskell-godaddy'
pkgver=0.0.0.5
pkgrel=1
pkgdesc='Command-line interface to configure a domain managed by Godaddy.'
arch=('any')
url='https://github.com/ibizaman/haskell-godaddy'
license=('GPL3')
source=(
    https://github.com/ibizaman/haskell-godaddy/releases/download/${pkgver}/godaddy.zip
	https://github.com/ibizaman/haskell-godaddy/blob/0.0.0.5/bin/godaddy-certbot-dns01-auth-hook
	https://github.com/ibizaman/haskell-godaddy/blob/0.0.0.5/bin/godaddy-certbot-dns01-cleanup-hook
)
sha512sums=('c553ecaaaea5944f54a7581786d1bf8668019423b74aab2f2b47475be4bc917110b80bc0e07a23f506498ef12e3612007e17fac9a245d8c64535547afb8dc35d'
            'f316a44966add4717d49a1d1c0b46889bfe47b8c08e6090d715b0aa7b5a4cc89fd4e3e97879f7bf70c9e2800b054670bd3b134aab99312f2b418253d4706d8b5'
            'db0d1be8f9e369845a90bd7985dce6759d10056d7048cc3b896050d5de503c1a5b0515ac2483724f16a6830c42f14d9e658517c20dda755246d3de9123494ad9')

package() {
  install -Dm0755 godaddy "$pkgdir"/usr/bin/godaddy
}
