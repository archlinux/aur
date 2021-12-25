# Maintainer: Joel Almeida <aullidolunar (alsoat) gmail com>
# Contributor: Darshit Shah <darnir@gmail.com>
# Contributor: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Adria Arrufat <swiftscythe@gmail.com>

pkgname=xfwm-axiom-theme
pkgver=1
pkgrel=8
pkgdesc='Inspired by the metacity theme "fresh". Two xfwm themes are included, axiom for bright themes and axiomd for dark themes.'
arch=(any)
url="https://www.xfce-look.org/content/show.php/axiom?content=90145"
depends=('xfwm4')
license=('GPL')
source=('https://dllb.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE0NjE3Njc3MzYiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6IjA0YmU2NGRjZDgwZTZkYWQyMzcwODA1M2I1MzI3NzYwZDcyZjY5ZGQxOTcwZWRiN2IxOTVhOWFkYzQwNTFhZTcwMTJkNGFkMzJhYjIwMjI1OTI5OGJiNjI4MzRjNzUzZGRhODRmNTg3ZjBhYjBiNjA0YWRiODY0NjQ1MjQzMjg0IiwidCI6MTY0MDQ2OTcxNSwic3RmcCI6IjJmNTU3NmNhOTFlMGViYTk5Y2VkOGE0ODhjNTQ3ZDJjIiwic3RpcCI6IjI4MDY6MmYwOjEwMDE6MzkwMDpkMzg1OjQ5ZTE6OWE1MjpkNGNmIn0.L9FAV_dwkRCD3qBCxMGrM3mrNYG87q4OxtanVZHWR8M/90145-axiom.tar.gz')
md5sums=('e9fd9f41f671afa17b3efbf43f0008de')

package() {
	cd "${srcdir}"
	find . -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
