# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='1.3.0+bb9ee328_10'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid-telicam-sdk)
optdepends=('opencl-nvidia: To use Zivid with Nvidia GPUs' 'opencl-amd: To use Zivid with Nvidia GPUs' 'intel-compute-runtime: To use Zivid with Intel GPUs')

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.3.0+bb9ee328-10/u18/zivid_1.3.0+bb9ee328-10_amd64.deb)
sha256sums=(04667a1c48ab9f625a0f6c77a6433be01f5cde103c807dec094ef594651f34ce)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}
