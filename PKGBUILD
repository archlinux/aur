# Contributor: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Asuka Minato <i at asukaminato dot eu dot org>
# Contributor: tee < teeaur at duck dot com >
pkgdesc='Small and embeddable JavaScript engine'
pkgname=quickjs-bin
pkgver=2026.06.04
pkgrel=1
url='https://bellard.org/quickjs'
depends=(glibc)
arch=(x86_64 i686)
license=(MIT)
provides=(quickjs)
conflicts=(quickjs)
source=("https://raw.githubusercontent.com/bellard/quickjs/b5e62895c619d4ffc75c9d822c8d85f1ece77e5b/LICENSE")
source_x86_64=("$url/binary_releases/quickjs-linux-x86_64-${pkgver//./-}.zip")
source_i686=("$url/binary_releases/quickjs-linux-i686-${pkgver//./-}.zip")
b2sums=('81a700322186cff21873e646b849812c44bad322cd77954c40207c7a20b7f4bc54bbe322a6511cf233904791b1a9acd647b5153df2c50339e456ffbc3b3d349e')
b2sums_x86_64=('ea66f9eae38f966d9e942f1fca59c0c942060f1629ed07763dbd3bb82282de68aa29d9fb04656d998975351cc701a4d9368b20be0eedfe64dcc5a85432f5057e')
b2sums_i686=('eec80e300a421af64719c6516cc18f123c1c6859739c2732c2b8f61b4a1967fd819c99ea177e0d8c2413de1a39c92eed5dbca9d1bff43b5078e29153402f4c51')

package() {
	install -Dvm755 qjs -t "$pkgdir/usr/bin"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
