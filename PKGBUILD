# Maintainer: ZeroDDS Contributors <admin@zerodds.org>
pkgname=zerodds-bin
pkgver=1.0.0_rc.7
pkgrel=1
pkgdesc="Pure-Rust OMG Data Distribution Service implementation (precompiled binaries)"
arch=('x86_64' 'aarch64')
url="https://zerodds.org"
license=('Apache-2.0')
provides=('zerodds')
conflicts=('zerodds')
depends=('glibc' 'gcc-libs')
# The binaries stay as the release built them; the static libraries of
# zerodds-dev (libzerodds-wire-cpp.a has no shared form) stay in.
options=('!strip' '!debug' 'staticlibs')
source_x86_64=(
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-core_1.0.0-rc.7_amd64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-cli_1.0.0-rc.7_amd64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-dev_1.0.0-rc.7_amd64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-ws-bridge_1.0.0-rc.7_amd64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-mqtt-bridge_1.0.0-rc.7_amd64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-coap-bridge_1.0.0-rc.7_amd64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-amqp-bridge_1.0.0-rc.7_amd64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-grpc-bridge_1.0.0-rc.7_amd64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-corba-bridge_1.0.0-rc.7_amd64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-zenoh-bridge_1.0.0-rc.7_amd64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-opcua-bridge_1.0.0-rc.7_amd64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-webdds-bridge_1.0.0-rc.7_amd64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-ros2_1.0.0-rc.7_amd64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-router_1.0.0-rc.7_amd64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-durability_1.0.0-rc.7_amd64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-naming_1.0.0-rc.7_amd64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-xrce-agent_1.0.0-rc.7_amd64.deb'
)
source_aarch64=(
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-core_1.0.0-rc.7_arm64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-cli_1.0.0-rc.7_arm64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-dev_1.0.0-rc.7_arm64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-ws-bridge_1.0.0-rc.7_arm64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-mqtt-bridge_1.0.0-rc.7_arm64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-coap-bridge_1.0.0-rc.7_arm64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-amqp-bridge_1.0.0-rc.7_arm64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-grpc-bridge_1.0.0-rc.7_arm64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-corba-bridge_1.0.0-rc.7_arm64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-zenoh-bridge_1.0.0-rc.7_arm64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-opcua-bridge_1.0.0-rc.7_arm64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-webdds-bridge_1.0.0-rc.7_arm64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-ros2_1.0.0-rc.7_arm64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-router_1.0.0-rc.7_arm64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-durability_1.0.0-rc.7_arm64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-naming_1.0.0-rc.7_arm64.deb'
  'https://github.com/zero-objects/zero-dds/releases/download/v1.0.0-rc.7/zerodds-xrce-agent_1.0.0-rc.7_arm64.deb'
)
sha256sums_x86_64=(
  '179eb1695374bc862dbb8c219b7b74a85b28a91824deb17d2fcddca82527ae5c'
  '9b79e75e22c69b180e57afb19a3675fc6be355fef2f02d57e3a6a3aa5872f126'
  '51245f4dad2dc00727cd12cddfbf4ca7e1d741e67ccecfaa821ab9c177e20060'
  '07baf5c5ef2385de11cb91952b4c70ff37fdac9486c908b742b25446981052d7'
  '0454bff79a74ca6d835f5ad1d8e8be436f92069fc0470d784e57c7720c8e4334'
  'd1617413649dd0bab728db7849a79780f265dcb30a877f5b6f65332b0a620c0c'
  'b35c56ec187b9dd9c0f84e17b9c0a2c62b99989601260105f6e35cee3c79b9b2'
  '1d463554180baf5d3d74f70ce866ce6497c12741bcec3b71721943b70255d51d'
  'a17238a294f8e5d970003952117dad044c3638d562608cdfee0d4b19db7d63c9'
  'fad2cf329b895d0a6beefd61054fb45d6a4a173e17e32fb7e52a3c27b0575245'
  '56e85f77125fd653af38bc1e270af72ec3dbb7b1f619e86568f6c3520b52499e'
  'f7435fbd1dbe46b4c956e98d9bc3e5581667fc81c715e31f6963c312e9f73033'
  '645f86cf825db4574c9d97009a5a894c1170e4f38b5fc7fac1c1b45bd46c3f6a'
  'e34d64da6739a159d3b5c4cd32ed46cc571856dccf7ad5d381d20dda5ac11d00'
  '56e6ccea488732fa1ef00ab2267b428e687576915612368cac91f24aea838f90'
  'c8a8c447137906f986b4b046af1fab21450a34f473393ac4be327e62a14ec93e'
  '11a4620ab37f99b484548df01e4618e283a03ecab0739febd67e3dfaa05a0f59'
)
sha256sums_aarch64=(
  '7d361ccc705b1ec80bb719e1d780f579553d8894d0b7f222b4a5771c7f60c0cd'
  'e8238ca08fdbe261b0e3f141841e0c852765d69c29fd1c707acd058d4b9dfeca'
  'ab3b9b837a430be3e7650c946c3b7962e6a6d2579c243451fd3a208f6e0bc206'
  'bf19babdcdcd44d5942d794dab92858653ab8a9e56fa77381cdcb0954e1ee5bd'
  '3eede9fcd1ef3e56801574ffeecd1c56a4cab7d89fcc64258f0affd0b1d632cd'
  '92cd67e1accc20f1e3d0e5d76b949bd1c1717dda53ae30b66a63fb474e43da4d'
  '08c6e1fe4f96e66024a37109ffd1630bdd576eb03dea893322fc182cd3eebda3'
  'bc612d39ce719047fe43f746f6634addb1e7ef70dbb7b61f8f580928b7d089b9'
  'cd4b1025a2d0ccea4a02a2694c85ea8eb0c80a2041a56b4de48b8cb06866f886'
  '5816e109927c775a4e5c3c444258477dbfb3264d01fa963f9033b9707804335a'
  '00494ff2f7bc251ad9f6f142de2ab15e95aff0f27a711a7250c53f15ec5b039d'
  'f3dcc3b2c0453b6c32336f79b65354a524724a53c5a58e1872b4e33b971a52ab'
  'c5a1c6b2436fc2951a96a37ccaa56623cccdfa3ff26a953894dc3fe604e875dc'
  'a44ae3730313f7be922793f69c989fb39c91b4b353c57cc1c4322f10ea93631a'
  '52f60def423f05ab7ec8a8805e954a6ca65166331487768af65f70d4ab3f4fc5'
  '6cb8306aa2ca86e9bfe9e9fdba2c22a5c19818d70ab1fdc9c699f1d3a50d5f1a'
  '6bc4e39334c724d353e62d8e2ff75cc214dc0be04b3e580d4d465d13da3ebd97'
)
noextract=(
  'zerodds-core_1.0.0-rc.7_amd64.deb'
  'zerodds-cli_1.0.0-rc.7_amd64.deb'
  'zerodds-dev_1.0.0-rc.7_amd64.deb'
  'zerodds-ws-bridge_1.0.0-rc.7_amd64.deb'
  'zerodds-mqtt-bridge_1.0.0-rc.7_amd64.deb'
  'zerodds-coap-bridge_1.0.0-rc.7_amd64.deb'
  'zerodds-amqp-bridge_1.0.0-rc.7_amd64.deb'
  'zerodds-grpc-bridge_1.0.0-rc.7_amd64.deb'
  'zerodds-corba-bridge_1.0.0-rc.7_amd64.deb'
  'zerodds-zenoh-bridge_1.0.0-rc.7_amd64.deb'
  'zerodds-opcua-bridge_1.0.0-rc.7_amd64.deb'
  'zerodds-webdds-bridge_1.0.0-rc.7_amd64.deb'
  'zerodds-ros2_1.0.0-rc.7_amd64.deb'
  'zerodds-router_1.0.0-rc.7_amd64.deb'
  'zerodds-durability_1.0.0-rc.7_amd64.deb'
  'zerodds-naming_1.0.0-rc.7_amd64.deb'
  'zerodds-xrce-agent_1.0.0-rc.7_amd64.deb'
  'zerodds-core_1.0.0-rc.7_arm64.deb'
  'zerodds-cli_1.0.0-rc.7_arm64.deb'
  'zerodds-dev_1.0.0-rc.7_arm64.deb'
  'zerodds-ws-bridge_1.0.0-rc.7_arm64.deb'
  'zerodds-mqtt-bridge_1.0.0-rc.7_arm64.deb'
  'zerodds-coap-bridge_1.0.0-rc.7_arm64.deb'
  'zerodds-amqp-bridge_1.0.0-rc.7_arm64.deb'
  'zerodds-grpc-bridge_1.0.0-rc.7_arm64.deb'
  'zerodds-corba-bridge_1.0.0-rc.7_arm64.deb'
  'zerodds-zenoh-bridge_1.0.0-rc.7_arm64.deb'
  'zerodds-opcua-bridge_1.0.0-rc.7_arm64.deb'
  'zerodds-webdds-bridge_1.0.0-rc.7_arm64.deb'
  'zerodds-ros2_1.0.0-rc.7_arm64.deb'
  'zerodds-router_1.0.0-rc.7_arm64.deb'
  'zerodds-durability_1.0.0-rc.7_arm64.deb'
  'zerodds-naming_1.0.0-rc.7_arm64.deb'
  'zerodds-xrce-agent_1.0.0-rc.7_arm64.deb'
)

_unpack_debs() {
    local deb
    for deb in "$1"/*.deb; do
        bsdtar -xOf "$deb" 'data.tar.*' | bsdtar -xpf - -C "${pkgdir}"
    done
}

package() {
    _unpack_debs "${srcdir}"
}
