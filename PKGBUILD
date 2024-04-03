# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=ttf-boogaloo
pkgver=1.002
pkgrel=3
_commit=47a6c224b3e0287b2e48e3ffef8c9ce2ca4931f4
pkgdesc='Font reminding of the 1960s Latin music'
arch=(any)
url="https://fonts.google.com/specimen/Boogaloo"
license=(OFL-1.1-RFN)
source=("https://github.com/google/fonts/raw/$_commit/ofl/boogaloo/OFL.txt"
        "https://github.com/google/fonts/raw/$_commit/ofl/boogaloo/Boogaloo-Regular.ttf")
sha256sums=('4653c63a4bab99aa50de5190853fa21ea6c0a25d69d49f5a42cd51f0f67665e0'
            'c38febf770bec2b8e30ea6bc1ddb39c9b0ce0e8625d94ceeafbe3af1c7096d9d')

package() {
	install -D -m644 -t "$pkgdir/usr/share/fonts/TTF" Boogaloo-Regular.ttf
	install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}
