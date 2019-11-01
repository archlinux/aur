# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>
# shellcheck disable=SC2034
# shellcheck disable=SC2154

pkgname=clickhouse-static
pkgver=19.16.2.2
pkgrel=1
pkgdesc='An open-source column-oriented database management system that allows generating analytical data reports in real time. Static binary'
arch=('i686' 'x86_64')
url='https://clickhouse.yandex/'
license=('Apache')
makedepends=('cmake' 'python' 'ninja')
source=("https://github.com/yandex/ClickHouse/archive/v$pkgver-stable.tar.gz"
  'arrow.tgz::https://github.com/apache/arrow/archive/87ac6fdd.tar.gz'
  'base64.tgz::https://github.com/aklomp/base64/archive/a27c565.tar.gz'
  'boost.tgz::https://github.com/ClickHouse-Extras/boost/archive/830e51ed.tar.gz'
  'brotli.tgz::https://github.com/google/brotli/archive/5805f99.tar.gz'
  'capnproto.tgz::https://github.com/capnproto/capnproto/archive/a00ccd91.tar.gz'
  'cctz.tgz::https://github.com/google/cctz/archive/4f9776a.tar.gz'
  'cppkafka.tgz::https://github.com/ClickHouse-Extras/cppkafka/archive/9b184d8.tar.gz'
  'double-conversion.tgz::https://github.com/google/double-conversion/archive/cf2f0f3.tar.gz'
  'fastops.tgz::https://github.com/ClickHouse-Extras/fastops/archive/88752a5.tar.gz'
  'googletest.tgz::https://github.com/google/googletest/archive/d175c8b.tar.gz'
  'h3.tgz::https://github.com/uber/h3/archive/6cfd649.tar.gz'
  'hyperscan.tgz::https://github.com/ClickHouse-Extras/hyperscan/archive/3058c9c.tar.gz'
  'jemalloc.tgz::https://github.com/jemalloc/jemalloc/archive/cd2931ad.tar.gz'
  'libgsasl.tgz::https://github.com/ClickHouse-Extras/libgsasl/archive/3b8948a.tar.gz'
  'libhdfs3.tgz::https://github.com/ClickHouse-Extras/libhdfs3/archive/e2131aa.tar.gz'
  'librdkafka.tgz::https://github.com/edenhill/librdkafka/archive/6160ec2.tar.gz'
  'libunwind.tgz::https://github.com/ClickHouse-Extras/libunwind/archive/5afe6d8.tar.gz'
  'libxml2.tgz::https://github.com/GNOME/libxml2/archive/18890f47.tar.gz'
  'llvm.tgz::https://github.com/ClickHouse-Extras/llvm/archive/163def2.tar.gz'
  'lz4.tgz::https://github.com/lz4/lz4/archive/7a4e3b1f.tar.gz'
  'mariadb-connector-c.tgz::https://github.com/ClickHouse-Extras/mariadb-connector-c/archive/1801630.tar.gz'
  'orc.tgz::https://github.com/apache/orc/archive/5981208.tar.gz'
  'poco.tgz::https://github.com/ClickHouse-Extras/poco/archive/6216cc0.tar.gz'
  'protobuf.tgz::https://github.com/ClickHouse-Extras/protobuf/archive/1273537.tar.gz'
  'rapidjson.tgz::https://github.com/Tencent/rapidjson/archive/01950eb7.tar.gz'
  're2.tgz::https://github.com/google/re2/archive/7cf8b88.tar.gz'
  'simdjson.tgz::https://github.com/lemire/simdjson/archive/e9be643.tar.gz'
  'snappy.tgz::https://github.com/google/snappy/archive/3f194ac.tar.gz'
  'sparsehash-c11.tgz::https://github.com/sparsehash/sparsehash-c11/archive/cf0bffa.tar.gz'
  'ssl.tgz::https://github.com/ClickHouse-Extras/ssl/archive/ba8de79.tar.gz'
  'thrift.tgz::https://github.com/apache/thrift/archive/010ccf0a.tar.gz'
  'UnixODBC.tgz::https://github.com/ClickHouse-Extras/UnixODBC/archive/b0ad30f.tar.gz'
  'zlib-ng.tgz::https://github.com/ClickHouse-Extras/zlib-ng/archive/cff0f50.tar.gz'
  'zstd.tgz::https://github.com/facebook/zstd/archive/25559750.tar.gz'
)
sha256sums=(
  145e43fa7a2af862bf4e05e91f661c08718449b6bc1a9d5183a35348cc7c7dbd # clickhouse sources
  80837520237b40e27c36edb5b71127dd9051e3bcb93e26d7fa3301f2e0563e3f # arrow.tgz
  fd586532ea7c0f297f36f1fa076da6ca421abc5d2dee05f96175267a753e7154 # base64.tgz
  18a057463753f377524d2223b38c32319a704f1f220b1fd307dabeceed6f3bd1 # boost.tgz
  fe21f9191db985e3f95956576ac23096b0687e2d272ccb1300872eb4522c3024 # brotli.tgz
  54d891645f39682dd6688aa3b3d88a6ef7944a7230e375055fbb9006b4608078 # capnproto.tgz
  6c67a1c2c312c578281f8fa4034512904f6a23f0519bb67306165a8e3f2a6584 # cctz.tgz
  2390e9f9bbd11a7e47d9fb0ceb65a50480f9dd71e10d4acbf1b404b09b8708a2 # cppkafka.tgz
  546a1eb8ce6ab886c885a6f68e193142f09483c64a0f182e1a54f682af637b04 # double-conversion.tgz
  90076d2436b59a5573a89df0f7fe1e84e3767e0e18eedb336b49da5ec23d893c # fastops.tgz
  39a708e81cf68af02ca20cad879d1dbd055364f3ae5588a5743c919a51d7ad46 # googletest.tgz
  f66fdff8281e5a6fb8d42992369960e2ebdea17709049965cda0806f7b6c42f8 # h3.tgz
  e686c68d0026b905bde9f5ddfb349fa509306621821ea60eb976b0eadf25dbfe # hyperscan.tgz
  aa1523658d0b1dbebccdf3f0fabdf7add86f14758d846fa6ba797ee2469c45be # jemalloc.tgz
  c41328df4d1b79f9043ad86219320d12af18dedcacbe76aa6115f906c28c6381 # libgsasl.tgz
  6744b54d9465db5bdc844a1ccd5e93fc35c804652978d304fd59772ef25ab18d # libhdfs3.tgz
  6dd22b23e544c7c2f433e666701f7fa92636194111dccdbe90a54b69ce826e45 # librdkafka.tgz
  00846b9d9d28296103d29c7b9c8a48366bb932445048fa54a9a280dff5e25e49 # libunwind.tgz
  2c3d9a93e651b02fef59489e796546a16df9010288905e62598816eaa2c7eb33 # libxml2.tgz
  86389e971f15512ae6952584cf4c4a471a72a7489e8063cfba5e0c6b3af826a4 # llvm.tgz
  b4ac86c2d511e836455a5732cbc4d6f472b9334998b04c3ea203f9fc88abaa30 # lz4.tgz
  3316dd42dc0c0d688fe3dbab840c84d157dcd04c9abbc563eb0c98c217a6cf59 # mariadb-connector-c.tgz
  3207d094a85a4b2fed16fd7fda8720449e83931010efe04104986bd1e0053e1c # orc.tgz
  b750be8035351a7afe9e0717b23725a06bb478c4e5619615d94f2cb713ca5cb7 # poco.tgz
  92a47cda264ef66dbaa28608e830a560871311b2f5558a91ea34ce27747cbfb7 # protobuf.tgz
  fcbbd610196f3e4f550ebb3a6bb2359b56cab969a2dce65e33a1bc8504a38168 # rapidjson.tgz
  2e1d268c4340fc86206756f265f5910608c6d8e07a3668a955191c486afb072b # re2.tgz
  c23d33ee945b4441a10e19f7f69e58ef5946e69251a5e220962becdc77e5a871 # simdjson.tgz
  5811308e224ae6a405c4f20356388df80a01513af20958e3568791c5444765a3 # snappy.tgz
  cd154b2e72af81ddce7963eb7eb2f695c60711f436c1278130f9afd8e3ea1f0e # sparsehash-c11.tgz
  665635a1eca4bdf5bc3de2a8daf841d919e3a39be18b53018247cc43e1fc122d # ssl.tgz
  ebf4c0ec59f84598953f6ad9fd274230c22fcc6c03916afd4e34186c5207546d # thrift.tgz
  5560ff2c30c9e1c571df9a94ec11338075ff8812e729359adb0df8232010a52e # UnixODBC.tgz
  c6bde6ce0a5c5621d0ff1b95aae21192d6c26b41c98299ed625d80490014dd18 # zlib-ng.tgz
  f9f3bb69c7d1cef48bb122b5a82da3d750583f76092f2ec478848da1bc77ca87 # zstd.tgz
)
provides=('clickhouse')
conflicts=('clickhouse')
install="${pkgname}.install"

prepare() {
  for contrib_tar in *.tgz; do
    local contrib=${contrib_tar/.tgz/}
    # Destination directory is lowercase
    local contrib_dst="${contrib,,}"
    cp -a "$contrib-"*/. "ClickHouse-$pkgver-stable/contrib/$contrib_dst"
  done
}

build() {
  cd ClickHouse-$pkgver-stable || exit
  cmake .
  cmake --build . --target clickhouse
}

package() {
  cd ClickHouse-$pkgver-stable || exit
  mkdir -p "${pkgdir}/etc/clickhouse-client"
  mkdir -p "${pkgdir}/etc/clickhouse-server"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  cp dbms/programs/server/config.xml dbms/programs/server/users.xml "${pkgdir}/etc/clickhouse-server/"
  cp dbms/programs/client/clickhouse-client.xml "${pkgdir}/etc/clickhouse-client/config.xml"
  cp dbms/programs/clickhouse "${pkgdir}/usr/bin/"
  cp debian/clickhouse-server.service "${pkgdir}/usr/lib/systemd/system/"
  local ch_binaries
  ch_binaries=$(./dbms/programs/clickhouse 2>&1 | awk '/^clickhouse/ {print $2}')
  for bin in $ch_binaries; do
    ln -s clickhouse "${pkgdir}/usr/bin/clickhouse-${bin}"
  done
}
