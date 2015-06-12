# Maintainer: Lara Maia <lara@craft.net.br>
DLAGENTS=('http::/usr/bin/curl -e "http://www.geeks3d.com/20131028/gputest-0-6-0-opengl-benchmark-for-windows-mac-os-x-and-linux-downloads/" -fLC - --retry 3 --retry-delay 3 -o %o %u')

pkgname=glslhacker-sample-pack
pkgdesc="GLSLHacker code sample pack"
url='http://www.geeks3d.com/glslhacker/'
license="custom"
pkgver=2.30.0
pkgrel=1
arch=('any');
source=('http://www.ozone3d.net/glslhacker/dl/GLSLHacker_CodeSamplePack_DEV.zip')
md5sums=('94fc780d87beaa12ea3af8ed41687b44')
makedepends=('unzip')

package() {
    cd "GLSLHacker_CodeSamplePack"

    install -Dm644 readme.txt "$pkgdir/usr/share/licenses/$pkgname/readme.txt"

    install -dm755 "$pkgdir/usr/share/$pkgname/"
    cp -rf data/ host_api/ moon3d "$pkgdir/usr/share/$pkgname/"
}
