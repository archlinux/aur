pkgname=radicle
pkgver=0.0.4
pkgrel=1
pkgdesc="Radicle tools for decentralized git."
arch=('x86_64')
url="https://radicle.xyz"
license=('MIT')
groups=('')
depends=('git' 'gmp' 'ncurses' 'zlib' 'ncurses5-compat-libs')
options=('!strip' '!emptydirs')
source_x86_64=("https://storage.googleapis.com/static.radicle.xyz/releases/radicle_latest_amd64.deb")
sha512sums_x86_64=('bc4fdf29331085dae8c394df40020fcabb20e8a2da21cfcef2fa11e2e638af9df09e69d187b4e0de77d545f6eeb8f6bd5a3b93dafb473df4adafa416dec9b069')

package(){
	# Extract package data
	tar xzf data.tar.gz -C "${pkgdir}"
}
