# Contributor: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Asuka Minato <i at asukaminato dot eu dot org>
# Contributor: tee < teeaur at duck dot com >
pkgdesc='Small and embeddable JavaScript engine'
pkgname=quickjs-bin
pkgver=2025.09.13
pkgrel=1
url=https://bellard.org/quickjs
depends=(glibc)
arch=(x86_64 i686)
license=(MIT)
provides=(quickjs)
conflicts=(quickjs)
source=("https://raw.githubusercontent.com/bellard/quickjs/b5e62895c619d4ffc75c9d822c8d85f1ece77e5b/LICENSE")
source_x86_64=("https://bellard.org/quickjs/binary_releases/quickjs-linux-x86_64-${pkgver//./-}.zip")
source_i686=("https://bellard.org/quickjs/binary_releases/quickjs-linux-i686-${pkgver//./-}.zip")
b2sums=('81a700322186cff21873e646b849812c44bad322cd77954c40207c7a20b7f4bc54bbe322a6511cf233904791b1a9acd647b5153df2c50339e456ffbc3b3d349e')
b2sums_x86_64=('cd04ee4667c8f032ed680e53faec9cbc8ebdb9c5213f7b7541e10cf268150ed16623fb00c188ffd5f468cebf7d554698da9cf2cc653efc4981ef6be01fc5b1f2')
b2sums_i686=('a8686f34e056910c28c3ae201c38606e316e9ff5112a7708b94270e2fd2101538dfd53643c91b9374817a9222cf84039f36049f13447a0908693937f02923d77')

package() {
	install -vDm755 qjs -t $pkgdir/usr/bin
	install -vDm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname
}
