# Maintainer: Pig Monkey <pm@pig-monkey.com>

pkgname=dict-moby-thesaurus
pkgver=1.0
pkgrel=3
pkgdesc="Largest and most comprehensive thesaurus for dictd et al."
arch=('any')
url='https://www.gutenberg.org/ebooks/3202'
license=('custom: Public Domain')
optdepends=('dictd: dict client and server')
makedepends=('dictd')
install=${pkgname}.install
source=("https://github.com/ferdnyc/dictd-dicts/raw/master/moby-thesaurus.dict"
        "https://github.com/ferdnyc/dictd-dicts/raw/master/moby-thesaurus.index")
sha512sums=('2faca5ec01cc44ac21e5398bb0c6b673aad88809bd15714a47c790009341f62ffe06514cc68aee8bd3464f9b63acf60b14449ab74f2e8ef1393f92663aaa11ba'
            'cf72738857e8bc404d4e5ee750ce17fa2b4db752b695aa3c323d854c415787f0d5185e604feba2c8d5ee200e4994c8310a0c350380220185d731a3705d04b2d5')


package() {
	install -m 0755 -d "${pkgdir}/usr/share/dictd"
	install -m 0644 -t "${pkgdir}/usr/share/dictd/" moby-thesaurus.{dict,index}
}
