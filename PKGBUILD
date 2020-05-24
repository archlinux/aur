# Maintainer: Joel Almeida <aullidolunar (alsoat) gmail com>
# Contributor: Darshit Shah <darnir@gmail.com>
# Contributor: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Adria Arrufat <swiftscythe@gmail.com>

pkgname=xfwm-axiom-theme
pkgver=1
pkgrel=7
pkgdesc='Inspired by the metacity theme "fresh". Two xfwm themes are included, axiom for bright themes and axiomd for dark themes.'
arch=(any)
url="https://www.xfce-look.org/content/show.php/axiom?content=90145"
depends=('xfwm4')
license=('GPL')
source=('https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE0NjE3Njc3MzYiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6IjA2MzA0NmE2MGE2NzhkM2MxNjg2ODFlMzU5NDY3ZDdhNDMwMGUyODQ2YzdmOWFmZWNhNjhhZmRmMDg5ZDYyNTFlYzE1NTVkNWI5YjE2ZTc2MmRiNmZmY2E4ODg3NjVmOTQyY2I4NGM3M2I3MTYzYmM1MGEzOTE4MWI0ODIzZTkwIiwidCI6MTU5MDMzMjU4NSwic3RmcCI6IjZlMTRkMGM1NWEwMmJiMmFmOWQyNjcyOWI4MDMzYzNiIiwic3RpcCI6IjE4Ny4xOTAuMjA5Ljk3In0.j7KFMCn0SQdt0Q08yV-o47CX1K8gd9krL0BIBqxhVts/90145-axiom.tar.gz')
md5sums=('e9fd9f41f671afa17b3efbf43f0008de')

package() {
	cd "${srcdir}"
	find . -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
