# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

pkgname=clickhouse-static
pkgver=19.9.2.4
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
  'googletest.tgz::https://github.com/google/googletest/archive/d175c8b.tar.gz'
  'hyperscan.tgz::https://github.com/ClickHouse-Extras/hyperscan/archive/01e6b83f.tar.gz'
  'jemalloc.tgz::https://github.com/jemalloc/jemalloc/archive/cd2931ad.tar.gz'
  'libgsasl.tgz::https://github.com/ClickHouse-Extras/libgsasl/archive/3b8948a.tar.gz'
  'libhdfs3.tgz::https://github.com/ClickHouse-Extras/libhdfs3/archive/e2131aa.tar.gz'
  'librdkafka.tgz::https://github.com/edenhill/librdkafka/archive/8695b9d6.tar.gz'
  'libxml2.tgz::https://github.com/GNOME/libxml2/archive/18890f47.tar.gz'
  'llvm.tgz::https://github.com/ClickHouse-Extras/llvm/archive/163def2.tar.gz'
  'lz4.tgz::https://github.com/lz4/lz4/archive/7a4e3b1f.tar.gz'
  'mariadb-connector-c.tgz::https://github.com/ClickHouse-Extras/mariadb-connector-c/archive/d85d0e9.tar.gz'
  'poco.tgz::https://github.com/ClickHouse-Extras/poco/archive/29439cf.tar.gz'
  'protobuf.tgz::https://github.com/ClickHouse-Extras/protobuf/archive/1273537.tar.gz'
  'rapidjson.tgz::https://github.com/Tencent/rapidjson/archive/01950eb7.tar.gz'
  're2.tgz::https://github.com/google/re2/archive/7cf8b88.tar.gz'
  'simdjson.tgz::https://github.com/lemire/simdjson/archive/2151ad7f.tar.gz'
  'snappy.tgz::https://github.com/google/snappy/archive/3f194ac.tar.gz'
  'ssl.tgz::https://github.com/ClickHouse-Extras/ssl/archive/ba8de79.tar.gz'
  'thrift.tgz::https://github.com/apache/thrift/archive/010ccf0a.tar.gz'
  'UnixODBC.tgz::https://github.com/ClickHouse-Extras/UnixODBC/archive/b0ad30f.tar.gz'
  'zlib-ng.tgz::https://github.com/ClickHouse-Extras/zlib-ng/archive/9173b89.tar.gz'
  'zstd.tgz::https://github.com/facebook/zstd/archive/25559750.tar.gz'
)
sha256sums=(
  8c6c0616c80b347342d840e319afaa358cf6df57d54b17ffd8084c36b13f3a1a # clickhouse sources
  80837520237b40e27c36edb5b71127dd9051e3bcb93e26d7fa3301f2e0563e3f # arrow.tgz
  fd586532ea7c0f297f36f1fa076da6ca421abc5d2dee05f96175267a753e7154 # base64.tgz
  18a057463753f377524d2223b38c32319a704f1f220b1fd307dabeceed6f3bd1 # boost.tgz
  fe21f9191db985e3f95956576ac23096b0687e2d272ccb1300872eb4522c3024 # brotli.tgz
  54d891645f39682dd6688aa3b3d88a6ef7944a7230e375055fbb9006b4608078 # capnproto.tgz
  6c67a1c2c312c578281f8fa4034512904f6a23f0519bb67306165a8e3f2a6584 # cctz.tgz
  2390e9f9bbd11a7e47d9fb0ceb65a50480f9dd71e10d4acbf1b404b09b8708a2 # cppkafka.tgz
  546a1eb8ce6ab886c885a6f68e193142f09483c64a0f182e1a54f682af637b04 # double-conversion.tgz
  39a708e81cf68af02ca20cad879d1dbd055364f3ae5588a5743c919a51d7ad46 # googletest.tgz
  d31b444484915d1d2c1758bb8ec957f2a0bec837ed93a0f001d20084299ef5cf # hyperscan.tgz
  aa1523658d0b1dbebccdf3f0fabdf7add86f14758d846fa6ba797ee2469c45be # jemalloc.tgz
  c41328df4d1b79f9043ad86219320d12af18dedcacbe76aa6115f906c28c6381 # libgsasl.tgz
  6744b54d9465db5bdc844a1ccd5e93fc35c804652978d304fd59772ef25ab18d # libhdfs3.tgz
  8128a888fd4254063193cec75ad1fa513ce2d05ad297889d070ba4c9eb81dfd0 # librdkafka.tgz
  2c3d9a93e651b02fef59489e796546a16df9010288905e62598816eaa2c7eb33 # libxml2.tgz
  86389e971f15512ae6952584cf4c4a471a72a7489e8063cfba5e0c6b3af826a4 # llvm.tgz
  b4ac86c2d511e836455a5732cbc4d6f472b9334998b04c3ea203f9fc88abaa30 # lz4.tgz
  91739101b1e73c19dddb5a3389f7af4ab1a3dbb3b00a4d8769369df8aa394d4c # mariadb-connector-c.tgz
  7ca4874794a5b1aa5472fe21368910f2a641fb6eba84b46cb4617b9d7aef6c4e # poco.tgz
  92a47cda264ef66dbaa28608e830a560871311b2f5558a91ea34ce27747cbfb7 # protobuf.tgz
  fcbbd610196f3e4f550ebb3a6bb2359b56cab969a2dce65e33a1bc8504a38168 # rapidjson.tgz
  2e1d268c4340fc86206756f265f5910608c6d8e07a3668a955191c486afb072b # re2.tgz
  6635650df7936a2e30669b3549f1fe1cfc1cba8e7b06afadfd045ffdac9613c1 # simdjson.tgz
  5811308e224ae6a405c4f20356388df80a01513af20958e3568791c5444765a3 # snappy.tgz
  665635a1eca4bdf5bc3de2a8daf841d919e3a39be18b53018247cc43e1fc122d # ssl.tgz
  ebf4c0ec59f84598953f6ad9fd274230c22fcc6c03916afd4e34186c5207546d # thrift.tgz
  5560ff2c30c9e1c571df9a94ec11338075ff8812e729359adb0df8232010a52e # unixodbc.tgz
  3430d7f8002d8e312cb811d5b33b1dd653f10eb0626bc194a0283d92381ed0e2 # zlib-ng.tgz
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
  # TODO: remove `-Wno-error=missing-attributes`
  # after https://github.com/yandex/ClickHouse/issues/5717
  cmake -DCMAKE_CXX_FLAGS:STRING='-Wno-error=missing-attributes' -DCMAKE_C_FLAGS:STRING='-Wno-error=missing-attributes' .
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
  local ch_binaries="benchmark client compressor copier extract-from-config format local obfuscator performance-test server"
  for bin in $ch_binaries; do
    ln -s clickhouse "${pkgdir}/usr/bin/clickhouse-${bin}"
  done
}
