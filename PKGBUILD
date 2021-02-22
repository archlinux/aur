# Maintainer: YSU <Yosuu@protonmail.com>
pkgname=terminal-dictionary-git
pkgver=0.1
pkgrel=1
pkgdesc="A simple CLI tool that scrapes https://www.thefreedictionary.com/ and returns definitions to words."
arch=(any)
url="https://github.com/Yosuu69/Terminal-Dictionary"
license=('unknown')
depends=(ruby ruby-nokogiri curl)
makedepends=(git)
provides=(Dictionary)
conflicts=(Dictionary)
install=
changelog=
source=("git+$url")
md5sums=('SKIP')

package() {
	cd Terminal-Dictionary
	chmod +x Dictionary
	sudo cp Dictionary /usr/bin
}
