# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Faule Socke <github@socker.lepus.uberspace.de>

pkgbase='frida'
pkgname=(
	'frida'
	'python-frida'
)
pkgver=17.17.0
pkgrel=1
pkgdesc='Dynamic instrumentation toolkit for developers, reverse-engineers, and security researchers'
arch=('x86_64')
url='https://github.com/frida/frida'
license=(
	'LGPL-2.0-or-later WITH WxWindows-exception-3.1'
	'Zlib'
	'BSD-3-Clause'
	'BSD-2-Clause'
	'BSD-3-Clause WITH PCRE2-exception'
	'MIT'
	'LGPL-2.1-or-later'
	'0BSD'
	'Apache-2.0'
	'LicenseRef-Sqlite'
	'LGPL-2.0-or-later'
	'GPL-2.0-or-later OR LGPL-3.0-or-later'
)
options=('!lto')
depends=(
	'capstone'
	'glib2'
	'json-glib'
	'lib32-glibc'
	'libbpf'
	'libdwarf'
	'libffi'
	'libgee'
	'libnghttp2'
	'libngtcp2'
	'libnice'
	'libsoup3'
	'libunwind'
	'openssl'
	'sqlite'
	'systemd-libs'
)
makedepends=(
	'brotli'
	'cmake'
	'git'
	'go'
	'glib2-devel'
	'gobject-introspection'
	'lib32-gcc-libs'
	'lzfse'
	'meson'
	'ninja'
	'nodejs'
	'npm'
	'patchelf'
	'python'
	'python-build'
	'python-installer'
	'python-packaging'
	'python-setuptools'
	'python-wheel'
	'tcl'
	'vala'
)

_releng_commit='c9cc18138b364f691573c695e1fe47ddc4c56f26'
_meson_commit='6620128a0fc86218dd8d2843c7e9a3513772448e'
_tomlkit_commit='911cccd630965ff423316e25b4685ecf7df0ec0a'
_frida_core_commit='c812943c457376c906802f7bb79d13c67a6e4d22'
_frida_gum_commit='ddc10c5559cbb41a3dd72866bfba6ff3945ffa5c'
_capstone_commit='d536b1577fd033a31d75f48fd183aa425256cc18'
_glib_commit='790ffa82e80d99fba8a3db494e46f907d560893c'
_glib_networking_commit='ef47b1a09cf8c1875f181bcf901643689a56d12f'
_gvdb_commit='0854af0fdb6d527a8d1999835ac2c5059976c210'
_json_glib_commit='1a39cbe151b02c4192987c8fcc98997a59db2154'
_libbpf_commit='6c8d0d00a122fe126b7a3094f0785340128506f5'
_libdwarf_commit='61ff154ae803d2b0202dbc1bf385cda1ac3ece54'
_libgee_commit='ad17ed847039469fcc2dc711ecfee2bbf7d2bf87'
_libnice_commit='9a3da6e3e5bbcf935fd85b6b8557ff8c7dd9032c'
_lzfse_commit='5cfb7c86919d3c2c636d0d7552b51855a611ba1c'
_quickjs_commit='e05ed9f327d382f29ac8a854b0c3faa0dff87716'
_tinycc_commit='96e338ddfc6b1b409cd557356cadb3cf0d590d7b'
_vala_commit='172348fa9123ff4a95d541c5f9e56837434c4b6e'
_frida_python_commit='1cc0bcae641053fc08ec4433dc2118973389b5d2'
_frida_bindgen_commit='df17879d92d2700a7f1228a03271ba07e2fb579b'
_libusb_commit='ffff4bdfe8faa38cecfad5aab106cae923502d55'
_lwip_commit='a9f759897f26347c1a41d8d2a6d3a89aba9ce57b'
_usrsctp_commit='377fecfe06bb766c69cc0e1e1f6d5c72cf7704e6'
_sdk_version='20260717'
_sdk_zlib_commit='171a3eacaea8b731ef1fc586e7777b77742e2a1d'
_sdk_libffi_commit='4b75d8a1d9cf401d8a2fa16619938637ea7e7afa'
_sdk_pcre2_commit='b47486922fdc3486499b310dc9cf903449700474'
_sdk_elfutils_commit='1284bbc128473aea220337685985d465607fbac8'
_sdk_xz_commit='e70f5800ab5001c9509d374dbf3e7e6b866c43fe'
_sdk_brotli_commit='01d9e2922ca878965ebcd71ee8965d2a7aadb47a'
_sdk_minizip_ng_commit='dfc1ccc070ff7bb50726c80215cac515253a8ba0'
_sdk_sqlite_commit='9337327a50008f2d2236112ccb6f44059b1bafbd'
_sdk_libunwind_commit='4d0abea0effd3c80916e70abe38c2a6156596f05'
_sdk_libpsl_commit='b76c0fed2e27353d5fbb067ecdfdf76d2281eb91'
_sdk_publicsuffix_commit='06a4956ac640e9f93499fda6b2113846687adfb2'
_sdk_libxml2_commit='f09ad5551829b7f2df3666759e701644a0ea8558'
_sdk_ngtcp2_commit='5b21d4418ff668d9b5ddc4f744b7a28af4196abf'
_sdk_nghttp2_commit='ae13d24ea59c30e36ca53d1b22c4e664588d0445'
_sdk_libsoup_commit='4fd67869310b9de8fe2947bc8504ccbcf1abf285'
_sdk_openssl_commit='fa60a1c8c704e4ca0cc0dcb289c3be1fea1b50ff'
_sdk_v8_commit='a07af892420dfd873b33bd4ce4ba9d963072e1b9'
_compat32_zlib_pkg_commit='aba4401af6afa48804f1d592f8e65f8e3d7f9a06'
_compat32_pcre2_pkg_commit='36a926cf8f06655673e318ef6198e75359ed7f23'
_compat32_libffi_pkg_commit='338f9ff7682d4e039cfadbcb8cfcd15f9de189a7'
_compat32_glib2_pkg_commit='1bc9ef92ac7076424bb85e31302d65aa6c32cf96'
_compat32_xz_pkg_commit='11549581a11d6bb5e2633197198bf9e38c06324d'
_compat32_libunwind_pkg_commit='b1e371a5ba84d9c41ae1de2a4897ce79c83062c5'
_compat32_openssl_pkg_commit='8e5607b83b45ade52033980d94f0239e114ef319'
_compat32_sqlite_pkg_commit='18a00f62151d24a371c455b05ea6e991853129da'
_compat32_brotli_pkg_commit='d07abb35150afbdaf26865414ad41066e2c9869d'
_compat32_libpsl_pkg_commit='686a5785f6d8f159c6db95ce72e258c5349bc247'
_compat32_libnghttp2_pkg_commit='249b25ba99b997bd0bdf77d625f9a07629d7d297'
_compat32_libsoup3_pkg_commit='35c91072cf8027049662ffd49f77db1da06ab222'
_compat32_libelf_pkg_commit='adad482d3a12d958e8c11d623dd0e9abf5dc8fbd'

source=(
	"frida-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
	"releng-${_releng_commit}.tar.gz::https://github.com/frida/releng/archive/${_releng_commit}.tar.gz"
	"meson-${_meson_commit}.tar.gz::https://github.com/frida/meson/archive/${_meson_commit}.tar.gz"
	"tomlkit-${_tomlkit_commit}.tar.gz::https://github.com/python-poetry/tomlkit/archive/${_tomlkit_commit}.tar.gz"
	"frida-core-${_frida_core_commit}.tar.gz::https://github.com/frida/frida-core/archive/${_frida_core_commit}.tar.gz"
	"frida-gum-${_frida_gum_commit}.tar.gz::https://github.com/frida/frida-gum/archive/${_frida_gum_commit}.tar.gz"
	"capstone-${_capstone_commit}.tar.gz::https://github.com/frida/capstone/archive/${_capstone_commit}.tar.gz"
	"glib-${_glib_commit}.tar.gz::https://github.com/frida/glib/archive/${_glib_commit}.tar.gz"
	"glib-networking-${_glib_networking_commit}.tar.gz::https://github.com/frida/glib-networking/archive/${_glib_networking_commit}.tar.gz"
	"gvdb-${_gvdb_commit}.tar.gz::https://gitlab.gnome.org/GNOME/gvdb/-/archive/${_gvdb_commit}/gvdb-${_gvdb_commit}.tar.gz"
	"json-glib-${_json_glib_commit}.tar.gz::https://github.com/frida/json-glib/archive/${_json_glib_commit}.tar.gz"
	"libbpf-${_libbpf_commit}.tar.gz::https://github.com/frida/libbpf/archive/${_libbpf_commit}.tar.gz"
	"libdwarf-${_libdwarf_commit}.tar.gz::https://github.com/frida/libdwarf/archive/${_libdwarf_commit}.tar.gz"
	"libgee-${_libgee_commit}.tar.gz::https://github.com/frida/libgee/archive/${_libgee_commit}.tar.gz"
	"libnice-${_libnice_commit}.tar.gz::https://github.com/frida/libnice/archive/${_libnice_commit}.tar.gz"
	"lzfse-${_lzfse_commit}.tar.gz::https://github.com/frida/lzfse/archive/${_lzfse_commit}.tar.gz"
	"quickjs-${_quickjs_commit}.tar.gz::https://github.com/frida/quickjs/archive/${_quickjs_commit}.tar.gz"
	"tinycc-${_tinycc_commit}.tar.gz::https://github.com/frida/tinycc/archive/${_tinycc_commit}.tar.gz"
	"vala-${_vala_commit}.tar.gz::https://github.com/frida/vala/archive/${_vala_commit}.tar.gz"
	"frida-python-${_frida_python_commit}.tar.gz::https://github.com/frida/frida-python/archive/${_frida_python_commit}.tar.gz"
	"frida-bindgen-${_frida_bindgen_commit}.tar.gz::https://github.com/frida/frida-bindgen/archive/${_frida_bindgen_commit}.tar.gz"
	"libusb-${_libusb_commit}.tar.gz::https://github.com/frida/libusb/archive/${_libusb_commit}.tar.gz"
	"lwip-${_lwip_commit}.tar.gz::https://github.com/frida/lwip/archive/${_lwip_commit}.tar.gz"
	"usrsctp-${_usrsctp_commit}.tar.gz::https://github.com/frida/usrsctp/archive/${_usrsctp_commit}.tar.gz"
	"sdk-zlib-${_sdk_zlib_commit}.tar.gz::https://github.com/frida/zlib/archive/${_sdk_zlib_commit}.tar.gz"
	"sdk-libffi-${_sdk_libffi_commit}.tar.gz::https://github.com/frida/libffi/archive/${_sdk_libffi_commit}.tar.gz"
	"sdk-pcre2-${_sdk_pcre2_commit}.tar.gz::https://github.com/frida/pcre2/archive/${_sdk_pcre2_commit}.tar.gz"
	"sdk-elfutils-${_sdk_elfutils_commit}.tar.gz::https://github.com/frida/elfutils/archive/${_sdk_elfutils_commit}.tar.gz"
	"sdk-xz-${_sdk_xz_commit}.tar.gz::https://github.com/frida/xz/archive/${_sdk_xz_commit}.tar.gz"
	"sdk-brotli-${_sdk_brotli_commit}.tar.gz::https://github.com/frida/brotli/archive/${_sdk_brotli_commit}.tar.gz"
	"sdk-brotli-meson-${_sdk_brotli_commit}.build::https://raw.githubusercontent.com/frida/brotli/${_sdk_brotli_commit}/meson.build"
	"sdk-minizip-ng-${_sdk_minizip_ng_commit}.tar.gz::https://github.com/frida/minizip-ng/archive/${_sdk_minizip_ng_commit}.tar.gz"
	"sdk-sqlite-${_sdk_sqlite_commit}.tar.gz::https://github.com/frida/sqlite/archive/${_sdk_sqlite_commit}.tar.gz"
	"sdk-libunwind-${_sdk_libunwind_commit}.tar.gz::https://github.com/frida/libunwind/archive/${_sdk_libunwind_commit}.tar.gz"
	"sdk-libpsl-${_sdk_libpsl_commit}.tar.gz::https://github.com/frida/libpsl/archive/${_sdk_libpsl_commit}.tar.gz"
	"sdk-publicsuffix-${_sdk_publicsuffix_commit}.tar.gz::https://github.com/publicsuffix/list/archive/${_sdk_publicsuffix_commit}.tar.gz"
	"sdk-libxml2-${_sdk_libxml2_commit}.tar.gz::https://github.com/frida/libxml2/archive/${_sdk_libxml2_commit}.tar.gz"
	"sdk-ngtcp2-${_sdk_ngtcp2_commit}.tar.gz::https://github.com/frida/ngtcp2/archive/${_sdk_ngtcp2_commit}.tar.gz"
	"sdk-nghttp2-${_sdk_nghttp2_commit}.tar.gz::https://github.com/frida/nghttp2/archive/${_sdk_nghttp2_commit}.tar.gz"
	"sdk-libsoup-${_sdk_libsoup_commit}.tar.gz::https://github.com/frida/libsoup/archive/${_sdk_libsoup_commit}.tar.gz"
	'sdk-libsoup-skip-chunked.patch::https://gitlab.gnome.org/GNOME/libsoup/-/commit/1e9d2b827d97fa6b9925d697b371c0000b051c6a.patch'
	"sdk-openssl-${_sdk_openssl_commit}.tar.gz::https://github.com/frida/openssl/archive/${_sdk_openssl_commit}.tar.gz"
	"sdk-v8-${_sdk_v8_commit}.tar.gz::https://github.com/frida/v8/archive/${_sdk_v8_commit}.tar.gz"
	'sdk-v8-gcc16.patch'
	'sdk-relocatable-paths.patch'
	'frida-releng.patch'
	'frida-core-arch.patch'
	'frida-hardening.patch'
	'frida-valac.in'
	'frida-pkg-config-32'
	"lib32-zlib-${_compat32_zlib_pkg_commit}.tar.bz2::https://gitlab.archlinux.org/archlinux/packaging/packages/lib32-zlib/-/archive/${_compat32_zlib_pkg_commit}/lib32-zlib-${_compat32_zlib_pkg_commit}.tar.bz2"
	"lib32-pcre2-${_compat32_pcre2_pkg_commit}.tar.bz2::https://gitlab.archlinux.org/archlinux/packaging/packages/lib32-pcre2/-/archive/${_compat32_pcre2_pkg_commit}/lib32-pcre2-${_compat32_pcre2_pkg_commit}.tar.bz2"
	"lib32-libffi-${_compat32_libffi_pkg_commit}.tar.bz2::https://gitlab.archlinux.org/archlinux/packaging/packages/lib32-libffi/-/archive/${_compat32_libffi_pkg_commit}/lib32-libffi-${_compat32_libffi_pkg_commit}.tar.bz2"
	"lib32-glib2-${_compat32_glib2_pkg_commit}.tar.bz2::https://gitlab.archlinux.org/archlinux/packaging/packages/lib32-glib2/-/archive/${_compat32_glib2_pkg_commit}/lib32-glib2-${_compat32_glib2_pkg_commit}.tar.bz2"
	"lib32-xz-${_compat32_xz_pkg_commit}.tar.bz2::https://gitlab.archlinux.org/archlinux/packaging/packages/lib32-xz/-/archive/${_compat32_xz_pkg_commit}/lib32-xz-${_compat32_xz_pkg_commit}.tar.bz2"
	"lib32-libunwind-${_compat32_libunwind_pkg_commit}.tar.bz2::https://gitlab.archlinux.org/archlinux/packaging/packages/lib32-libunwind/-/archive/${_compat32_libunwind_pkg_commit}/lib32-libunwind-${_compat32_libunwind_pkg_commit}.tar.bz2"
	"lib32-openssl-${_compat32_openssl_pkg_commit}.tar.bz2::https://gitlab.archlinux.org/archlinux/packaging/packages/lib32-openssl/-/archive/${_compat32_openssl_pkg_commit}/lib32-openssl-${_compat32_openssl_pkg_commit}.tar.bz2"
	"lib32-sqlite-${_compat32_sqlite_pkg_commit}.tar.bz2::https://gitlab.archlinux.org/archlinux/packaging/packages/lib32-sqlite/-/archive/${_compat32_sqlite_pkg_commit}/lib32-sqlite-${_compat32_sqlite_pkg_commit}.tar.bz2"
	"lib32-brotli-${_compat32_brotli_pkg_commit}.tar.bz2::https://gitlab.archlinux.org/archlinux/packaging/packages/lib32-brotli/-/archive/${_compat32_brotli_pkg_commit}/lib32-brotli-${_compat32_brotli_pkg_commit}.tar.bz2"
	"lib32-libpsl-${_compat32_libpsl_pkg_commit}.tar.bz2::https://gitlab.archlinux.org/archlinux/packaging/packages/lib32-libpsl/-/archive/${_compat32_libpsl_pkg_commit}/lib32-libpsl-${_compat32_libpsl_pkg_commit}.tar.bz2"
	"lib32-libnghttp2-${_compat32_libnghttp2_pkg_commit}.tar.bz2::https://gitlab.archlinux.org/archlinux/packaging/packages/lib32-libnghttp2/-/archive/${_compat32_libnghttp2_pkg_commit}/lib32-libnghttp2-${_compat32_libnghttp2_pkg_commit}.tar.bz2"
	"lib32-libsoup3-${_compat32_libsoup3_pkg_commit}.tar.bz2::https://gitlab.archlinux.org/archlinux/packaging/packages/lib32-libsoup3/-/archive/${_compat32_libsoup3_pkg_commit}/lib32-libsoup3-${_compat32_libsoup3_pkg_commit}.tar.bz2"
	"lib32-libelf-${_compat32_libelf_pkg_commit}.tar.bz2::https://gitlab.archlinux.org/archlinux/packaging/packages/lib32-libelf/-/archive/${_compat32_libelf_pkg_commit}/lib32-libelf-${_compat32_libelf_pkg_commit}.tar.bz2"
	'compat32-zlib.patch'
	'compat32-pcre2.patch'
	'compat32-libffi.patch'
	'compat32-glib2.patch'
	'compat32-xz.patch'
	'compat32-libunwind.patch'
	'compat32-openssl.patch'
	'compat32-sqlite.patch'
	'compat32-brotli.patch'
	'compat32-libpsl.patch'
	'compat32-libnghttp2.patch'
	'compat32-libsoup3.patch'
	'compat32-libelf.patch'
)
b2sums=(
	'583bd0d5cc30dd84d8c6c4f0808ba1a7324047f9feb1e4b86d1e7f252be18e79957a399e1bf051c31e9592b540bd2e24e8a227bad35473ccee3a6b01079dd9b1'
	'a427f2d003b20241cab84564e00185a6bab0f970a32375c931e627b73a68c3f91b0439367d099d618af81f07af64df219d15e2952fb5876685e50cf44c6a0ebd'
	'1538b3360ce41fb884ceb4b8627689ab8420468b666b3ddbc98c619589e4edea8e9784aa5059899eba005d2a2b6205e6d1d6153960b7026713510eef9fc54bf3'
	'4127ac2a39b8e4aaf612b8e0c54d40e87e8a175c408ae1d427333cd7c0fa932d9122f2af01ab2eaad737a8234034c7fc906208cd6241e18918cf9c5ee25f43e9'
	'1c7252d80571b4b94cbdf66735106d2d4b7e98a07dae15c7bb2d00f24d2a572a4fccbc342f1c7320390e991f78b3fc77af88487639e64b41f5d32b2f9b813359'
	'c4c05793a29adfbafba7313c5ea304c01799c2a40229b5d1b42f23f008683995e3285a6ccc4ef138542542afc4eba227cc770744e12f6563f79434cc166b939a'
	'31ca08f88cdc0545d32de7e6b06fc6d292729f7368a77e9a7b45688c7d2f5bf99f339970fe1feb9902555ddee28950cc1ef3e39eb7bc49e6febafeacea825eee'
	'8dd7ab20d53ea03df8b939611a4bd7b6d165bbd659eab7ddaae8ed19c55181f571a322771e91beaea619cf13a02e7dec6ed4d8959cc54d3dda4dfcd3f36c523f'
	'f6c7c429f6b2f51cba67945c2a23d3521d7c581ac6501ed11602fa3f4d41f7d8047b19858d163c96b1dd67e2d7e1cb8e8b330c0080e8a681468a4f6c0aa2f1a3'
	'6f0dc922a7df8bcbf98600a152b17e8e20ff6a3d0531fbe41475a58159cde99a4045e733f9d3548e4b3302fb23019ef4975dd48b040a4e97edf6429235d2cfe2'
	'69f082cd148c83015362af4ea1e64d72a4b37badd95213f9c43339333d2771bc5f646b60f8da0f6dd345d4dd23f336c4620a211027a8cfa21b0bf4a6b40001b6'
	'772a342f8b546a89d109759941cb4e59a393e4b81c648dac93b4517904ace3b01a27996dcf9f47c6a4e589bf8aa1c16cdb923a06512ad45980bcead051159f8a'
	'be66cde556477afda4590a8980bb1e3b3a0de75699eebb245006a100884f798d2e9ea71a015488b0c2b4923103168ba52f5e62da3b7d9d3fc102a66aba458a97'
	'f78657c43cd94dc191a422e7a124eb7c24f72d02b13e065246bcc329db3fda3aa5366c1cdd7576d6a7770204b6061939886a77523c63b7b832453eccd7ea641a'
	'884738e164b04edcd09622440863bd856633749e28f42393143155767e25a5132b9fb3448929cf8f3bdf21e9b714d727f1b82fcff550ce9fe948a14f91cb8c4e'
	'2477febff4fc1fb3f0897001f3f17d57946ae451469f9ca61baf3e5ab7f8b6bf7472c45a5841384512e557be59c15a7f09d39975c0d785a40fdc82158769c8c8'
	'948a5a0e8339069e3e646d974af956ff75545a243089102b686358b07bc3678c778b68f2fd2565d32c0b654c63d88ef26e09f4e0f6d35af71552cb7f826bdb74'
	'c782fea3d5d47533e57542dafbb76946f396a19135b6fa485760bcae0a0f452b7a04fc3a522b8882a4f64098f3247e1c94fa9e12de5b73a6f47fa52beb422a5f'
	'd058bde27c8f89883de05a0229e3f4d83c19abc61e7db752bb4d43f6c99f0346ce962ca4ddae2be7ae1a6ededd4c8cf0b9ea4845e5efb2db9af8eda876903274'
	'c301569e499896be65e92d57536cb85dcdf38a6c61520d86b450d1c63c5acd7b7c7f6d43834469f4244c329d652abcf1fd9212bcc686c1cca68ca7070e6a6d91'
	'9b4e044bd74b8522b789d4026d642299b92e0becd9e5d1ec4ed7845637d864643c786001e1ec7b1085efeadea1aea931b084505796cf6fce4799d5ba8f8cbc53'
	'11a0be3615a0438b16a2989de8ab8b7e6a5737847fab7e895333b0720837b60b2b53c0883d3721456a4073ae4fae8220c7931b6742281f152d8c59c167000462'
	'6f4797662e66814dc178d365391a0370914bdefc05751e36ca6071fceba70ed1ac46fc7f47fef705347bf4a4221acee0df27e14e7032cbce95424a0ef2cc678e'
	'303b11566e3145c729aaf07a8585c1b3a0c8d39421c7ff378b789e1a1b57c33fcc0a280e2c87065eb643f7f2d8b840de6f7595c0bd32399fa67f7e0395ca9d27'
	'e9c192d82ac859f3ccf4338ab30fd9e40009263efc233f889a777a2b12979344a1f505a8109179d26c8327c989827bf15ad8b41f2b4d4c95eadb20ed8fd5d6c2'
	'9b674f56ffaba9bf8cb223c0b71f56fcfed225c33ba6e156c3290352180ece53988fc15f9a81ccf79b1da920a3b2e44657f505c23b4f81c601c51d498526b6e2'
	'e0ff54efb256c8ecfbdccd05c9ce3ec6715766835eb4942025949d973dca987f5cda1f7472409df0e59f3e948ffb38d7ca6e01bb9734b09348d19d181aaae477'
	'63cee68d27a68d2fec858971b1e147e53bbef0349693da4652d85637113154659ddb0623df46134d16d0676d215fa91a93c564863a8bd441b4cf2f1a2352b60e'
	'd03968c9826e952f97c634da0f2ca14fd3cd7faf80eb40e6e1d13ad02d8e49f10711f65856065b6f38fb02cbac2f0e836c96cfa70c405f467a2ab47b9151e18a'
	'8778c4209acee501d15ab210f57ec2cf25aefe88238e21c5f655f86dd4b0f047950ce60847a1ce06e752e8b95a557a026e0d9f5c5ab529c72b75658f924c97fc'
	'db92481ab7208a18637b14d01e5ced99dceccc26516a74057f1e97e0e067f2c78346eedc2ce854a68bee56b5721705f4ced9271e32a76dd1541246a0cad0f9e6'
	'0a512a75226327372a55c72a2aa16d19461a9b62880ca5b31ab134bb861be80812b57ee1685caa9aa211500eae55bcde2a1120b22e22270148980a06c2763d5b'
	'0cc182fa8227c7e4008dfdc91f492084c27b270b69419dcd728b90a066f9ca0e20fe3a1e3cee471b36e274c70728ca4c129c5ee45d02e5eb984bda4d192bfd10'
	'9c4aaabdf97041669d74e7e0599e8384e23a4a6da6614cc3b3e082f4dcf0a158540e2fea4b859dbae325d685d14529e0459804abe4cbe773e5c4f6df233bb6c2'
	'4d14d92e45d745e7f1025352c4f44cf492b6eb31ed45c3ee53e6861541edfa03c0ae650e3715665e19d879b6b1171acbc443b161dfacb295882d695da852eb62'
	'9a9fbf2b295ede59b45a8d88ad30dca98d17874eede72af811fd3460c75b61cf2a15691f23941e07f852bb82db00110a726a1b443317a5bf6460e9c30c8e391f'
	'905e2bef43e30078530b35b2c9f3e45042d42f5104a136e59610010599c87d0953819b4bb728699b87b82c6d11dc30073bcd60b365b4f2cf68eccf616bac5080'
	'77047cb00326a91365baec9c3349a7a4520468386f384efc4e633dcdb5de53595d39d4717150c2b85849f8cb1edd72f523d3968934acd6911982ae50f630e0bc'
	'a2ef86d7c8b3490c0cd1a4488eec81d050cba1d834e76589d1462a6cc374f1bf670277cee0f4479af77f700a20c553a1d094ba5e52118b9e46c87b6222e8dfcd'
	'eb2babf107878f87347c542daf84dfc2bb548807d6f015277717f4beb110f381d11d2e6926d2d36932f98b3ea49e1752986c495d3c449ab558d989f9b240a964'
	'b97a4daae1e65294f378c9f2a559eb3620ed2b2e6d1c01860f63c88b915eafa0afa4d50018ba834240503485e9fb29e29087b2c55215727bce1cf1c24b15077f'
	'30409e02626d886dd1e976ed3a074039c8cb58030b1e74e6b29209d76ed8c38952a2771077c26433575728d64abc8f1888282d19dd964de3f29be3d2fa6e8e39'
	'c8917bd0643b4b22c95e57c0eb411f048ab7630a92ed54c3bd97244b31e42bc56b68766ac34ce1b77152b15c4da7195cc9e093252c3a1a0ef679a88a437ff3c8'
	'b12192f399a09598a6c49cf82dae81bdce62f9e621233eda650ce585fc84998dca05444926e6749c65d12386ac06240bed1e886c107ade4ba0f2032087b4d729'
	'626b745ad1e6e40d443c26712b791ae44af732cbaf97c6baef066d3c88d64811e3e923cd3f85375687af1c186092cbb971cf983b267bdea81858d786395adb7a'
	'7d4c652d381f315c675fed49e81580c803479c90f131204709769d1e8ba94774b83d464ee832c3e2f560a2304f5ce2f72dd6740e987c89d7c241608151af98ae'
	'242c94ad87f147fe337575e7639dae7c486e6b8a9c089dea2fd67fcd496e076165afaba3003652f2a9d4da4b49d47273852b7e6753d3e527bc65d56ebcf3dcd3'
	'85da1f19171e0524a5c62fe049b81d21368f41e46e725514a62a3887d14de87a4dcaf99757aad9f6606088a87cd5cf4b0d9bb78830bd4447f72f380077993b22'
	'7ba008b86fd730eacd9868b66ce4e132719ef3976b92f5c035a7e5308368724eb3fadac7b051c76ff67daca37a59a16cb22cb1752ba4048e2ecc5ee2870f180f'
	'5a2fa0418c540d8082c622b9db8534d5878ed30fbe817f01979e5773abaa475740b3f8d2b5f1af3caf7c43701af9c41113e5e5da7080260a43608e8260def01f'
	'd6f6dee0b4abce002222d6e406934d4d43b4c261a61ce1092d8435eba4509d693bd2e278e06f0a5d89cacd5d6a1f78cea7cab225b700c431a14676a00d3f0cec'
	'4e74d7e9b495542bc88a0c5f50e1cd9cf24df020513bb50708975dbf9673a9a9481aeef23f2ed20a0db3cd0ccea75043335ecb11477d008206222149cf0faccd'
	'b92e7463bb80633e95d87139c08f7a6325e2b568536c8da02595fe63242bdc5f855c6d2cf46d6c43542c5e6dd41a61c1641c514de5e3e210ab5eeea0590023d3'
	'c3c28cb317caa1da9e0edec878348d94ff43703fd843d4e99a6a167508a58e174cefde4b3ce088a94f9178717c719208c411164a402ce467e942e2d8ab1c6665'
	'96a0c6d68eba9514a82ed0ba3a487f657b16eb2798bf42cbf0115967ebade33889e351775a44eb93f2c354558c8be5e86426dba09f32bfdd09a1161461104149'
	'47e8ed9dee72b31f3e6ba6d526e763f4be352605d457a25bb4d0967854c5698939da45ebebafaa5a75309486158cd36ef5782bb08b644df5d3d1db7fed166527'
	'0152710b0b0deafa41896e63ec81bd97f41017d1736ce22b1d2d5cdb7a4d909f82e4d7d04d29890719000be0c566947464a31fa848bf5b1937fa9de44830c585'
	'0f2ff875e71eb90355bcb99604cc507bbe59adf9d891832744f3353a59b6759ab8f8ab2fd43de0035d0d71109c6502b3978a534f7625bffa450df5d8b98bdbbb'
	'0b768810078071b1c74b0f36d0bc7bd632009acf987f4c0577945b215b4dcecafed7cbdf358e7f8831532b9a42cf721b49482801a9a4baf6d2bab34477ff8aed'
	'ba9d347271ca6abba1e0d293710323ba09aa3de3ef459a13345cd4c401734b8f36ab57c5d5fd202e20a6163a38addbfb1eb5a89cf783f668c746e526ea030913'
	'c47a8ed3f6435633de56d063f20d9dcd8bcad188f3a78b94b3fd543dc0c7b49bf44c9f6b24f1a317eee22ffe399bcb19bc5f15e8e47e8b0c8cd3e1ba57031043'
	'6248e66c8fe2e997b97c360cdc37e03aa859adaafa866be9a371e0682d35b1c51056d4d4549a33cfa4e4b0a650d1b4faf33f46e333545c8069561c8870e0472c'
	'a51b1cecbbf1324099963ee4826d58f5519c8169461a8572825a1cd5c52ebbdf5c34d15e36bd7b82c6fa43ff239bd57daf96f633a160f2b194a96c1d9c0d269d'
	'7e5d90c787f4737d035cad67a0fa54de77be81e8a971a790c0e5e1ae384798a325eb9bb26f4b8703c5b30681b4165ea8d4c080e4c3455a3842f8b2529f3a998e'
	'1225dad32ba798670a8a3cf2721336101d44ba7b4fd5e468e0c7966407c2a3ab171953c16c9b77eec35a978583e9162aa194e4e8608e27bbb4acc0f8c9299d8d'
	'f13b67bb284ae3e1d558d32d2289efeee1ab48dd41b5f596647ae28fbd07f57b01f2586c581dc0636f381d6d64f5715f8757b9461a16510ae507df4f638abef2'
	'628914bf5b1f5eb74a71bf5e32838d81514e75bcca02b61da5278f7d233274535275b31294147f07a990c0cae0f8de5b2d5cdaa706c5b6c4914435dbc82c797b'
	'c28644068415ec063cc0ea52e4cc8bb01db4eda5ea5305174f5b2a7b6deb5413f3356b44326ff4fcafd8a12fdb2db43f8afeb81db2dce2c22f64e91663529ec6'
	'a45e9e27d6e5f4af676fd2cd385105c85dcd88f60f4c40e04926d4b31ec444aa74ad7d1a67c6fb8bd952de302a3984adc8f9e302b84a030b5a86e3cb62e03117'
	'0506a63f43196804d9f25e83dd1b9cc38ae027bbb196206e971f49694b60939cadab72430975bd889e12750f0f537df3b62eeed4e6427d28d369bee3e7f3ce3e'
	'fc247585bf7fbc3e3261a7d80904f26634d7f7e4ebcb3830b5e596531c9151db6f7a7cd7020f9fe421d3db1a08aed709f4b8b4e3c45e7daecf9a7ead8df29d4a'
	'51e7b3e773b4cc7077045abc40c28e6f1468351af542ef4866515da2593c56cf2400b6599c95ad288f94d515958c0b4d2ec1ef3a575e8d0ba80ada1c396ff009'
	'4a2bdaf9cc9e3da6e83ea6bdc1e5e1ad421eea9e326dcf44a9ed678cc967859a92982eb6346aa9190409eb923cd42ca271cadc541e5557b47d911e4b8bd98ea2'
	'52c5d0779c64949bc4778a9ae6381e7e440968a3482389ed7ffef435aeb5e941af86021444fa89e41a23a782bd512c5da073d61bcd303a60e2b66e929dd84e05'
	'4c7a7e68fa4a605c9d720d9771b80b286eb978f8ca81e464990649dbf59e9a41092d8b4e6cbfdb3773237eb94f9b3bc724b6fb8024d9b9a9335d2206991f01f0'
	'67f999beb4bf7fa84db88a9b09bcea31d843c51de2b05f1bf0251a156789b1c3be6ea259d83d08f4c942ea3cf55a74f1b5638ae1d7fbda97d10aad732a578f6d'
)

_makepkg_jobs() {
	local _arg
	local _jobs=''
	local _jobs_next=0

	for _arg in ${MAKEFLAGS:-}; do
		if (( _jobs_next == 1 )); then
			case "${_arg}" in
				''|*[!0-9]*) ;;
				*) _jobs="${_arg}" ;;
			esac
			_jobs_next=0
			continue
		fi

		case "${_arg}" in
			-j|--jobs)
				_jobs_next=1
				;;
			-j[0-9]*)
				_jobs="${_arg#-j}"
				;;
			--jobs=[0-9]*)
				_jobs="${_arg#--jobs=}"
				;;
		esac
	done

	printf '%s\n' "${_jobs:-1}"
}

_compat32_flags() {
	local _input="${1:-}"
	local _flag
	local _flags=()

	for _flag in ${_input}; do
		[[ "${_flag}" == -m* ]] && continue
		_flags+=("${_flag}")
	done
	printf '%s\n' "${_flags[*]} -m32 -march=pentium4 -mfpmath=sse -mstackrealign -fPIC"
}

_compat32_builddir() {
	local _name="${1:?missing recipe name}"
	printf '%s\n' "${srcdir}/compat32-build/lib32-${_name}"
}

_prepare_compat32_recipe() {
	local _name="${1:?missing recipe name}"
	local _commit="${2:?missing recipe commit}"
	local _patch="${3:?missing recipe patch}"
	local _recipe_dir="${srcdir}/lib32-${_name}-${_commit}"
	local _patch_path="${srcdir}/${_patch}"
	local _nested_builddir
	local _compat_cflags
	local _compat_cxxflags

	_nested_builddir="$(_compat32_builddir "${_name}")"
	_compat_cflags="$(_compat32_flags "${CFLAGS:-}")"
	_compat_cxxflags="$(_compat32_flags "${CXXFLAGS:-}")"

	(
		cd -- "${_recipe_dir}" || exit 1
		if [[ "${_name}" == 'glib2' ]]; then
			ln -sf -- "${srcdir}/glib-${_glib_commit}.tar.gz" \
				"glib-${_glib_commit}.tar.gz"
			ln -sf -- "${srcdir}/gvdb-${_gvdb_commit}.tar.gz" \
				"gvdb-${_gvdb_commit}.tar.gz"
		fi
		if patch --dry-run -Np1 --fuzz=0 -i "${_patch_path}" >/dev/null 2>&1; then
			patch -Np1 --fuzz=0 -i "${_patch_path}"
		elif patch --dry-run -Rp1 --fuzz=0 -i "${_patch_path}" >/dev/null 2>&1; then
			printf 'compat32 %s patch already applied\n' "${_name}"
		else
			printf 'compat32 %s patch state is inconsistent\n' "${_name}" >&2
			exit 1
		fi
		makepkg -d --nobuild --skippgpcheck \
			"BUILDDIR=${_nested_builddir}" \
			"CFLAGS=${_compat_cflags}" \
			"CXXFLAGS=${_compat_cxxflags}"
	)
}

_stage_compat32_recipe() {
	local _name="${1:?missing recipe name}"
	local _compat32_sysroot="${2:?missing compat32 sysroot}"
	local _nested_builddir
	local _package_root

	_nested_builddir="$(_compat32_builddir "${_name}")"
	_package_root="${_nested_builddir}/lib32-${_name}/pkg/lib32-${_name}/usr"

	[[ -d "${_package_root}" ]] || return 1
	mkdir -p -- "${_compat32_sysroot}/usr/include" "${_compat32_sysroot}/usr/lib32"

	if [[ -d "${_package_root}/include" ]]; then
		cp -a -- "${_package_root}/include/." "${_compat32_sysroot}/usr/include/"
	fi
	if [[ -d "${_package_root}/lib32" ]]; then
		cp -a -- "${_package_root}/lib32/." "${_compat32_sysroot}/usr/lib32/"
	fi
	if [[ -d "${_package_root}/share/licenses/lib32-${_name}" ]]; then
		mkdir -p -- "${_compat32_sysroot}/usr/share/licenses/frida/compat32/${_name}"
		cp -aL -- "${_package_root}/share/licenses/lib32-${_name}/." \
			"${_compat32_sysroot}/usr/share/licenses/frida/compat32/${_name}/"
	fi
}

_build_compat32_recipe() {
	local _name="${1:?missing recipe name}"
	local _commit="${2:?missing recipe commit}"
	local _compat32_sysroot="${3:?missing compat32 sysroot}"
	local _recipe_dir="${srcdir}/lib32-${_name}-${_commit}"
	local _nested_builddir
	local _compat_cflags
	local _compat_cxxflags

	_nested_builddir="$(_compat32_builddir "${_name}")"
	_compat_cflags="$(_compat32_flags "${CFLAGS:-}")"
	_compat_cxxflags="$(_compat32_flags "${CXXFLAGS:-}")"

	(
		cd -- "${_recipe_dir}" || exit 1
		unset PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR
		PATH="${srcdir}/compat32-bin:${PATH}" \
		FRIDA_COMPAT_SYSROOT="${_compat32_sysroot}" \
			PKG_CONFIG_PATH='' \
			CPATH="${_compat32_sysroot}/usr/include${CPATH:+:${CPATH}}" \
			LDFLAGS="${LDFLAGS:-} -L${_compat32_sysroot}/usr/lib32" \
			makepkg -d --noextract --noprepare --nocheck --noarchive --force \
				"BUILDDIR=${_nested_builddir}" \
				"CFLAGS=${_compat_cflags}" \
				"CXXFLAGS=${_compat_cxxflags}"
	) || return 1

	_stage_compat32_recipe "${_name}" "${_compat32_sysroot}"
}

_build_compat32_sysroot() {
	local _compat32_sysroot="${srcdir}/compat32"
	local _compat32_bin="${srcdir}/compat32-bin"
	local _glib_pc="${_compat32_sysroot}/usr/lib32/pkgconfig/glib-2.0.pc"

	rm -rf -- "${_compat32_sysroot}" "${_compat32_bin}"
	mkdir -p -- "${_compat32_sysroot}/usr/include" "${_compat32_sysroot}/usr/lib32"
	mkdir -p -- "${_compat32_bin}"
	ln -s -- "${srcdir}/frida-pkg-config-32" "${_compat32_bin}/i686-pc-linux-gnu-pkg-config"

	_build_compat32_recipe 'zlib' "${_compat32_zlib_pkg_commit}" "${_compat32_sysroot}"
	_build_compat32_recipe 'pcre2' "${_compat32_pcre2_pkg_commit}" "${_compat32_sysroot}"
	_build_compat32_recipe 'libffi' "${_compat32_libffi_pkg_commit}" "${_compat32_sysroot}"
	_build_compat32_recipe 'glib2' "${_compat32_glib2_pkg_commit}" "${_compat32_sysroot}"

	[[ -f "${_glib_pc}" ]] || return 1
	sed -i \
		-e 's/^Cflags:/Cflags: -DGLIB_STATIC_COMPILATION/' \
		"${_glib_pc}"


	_build_compat32_recipe 'xz' "${_compat32_xz_pkg_commit}" "${_compat32_sysroot}"
	_build_compat32_recipe 'libunwind' "${_compat32_libunwind_pkg_commit}" "${_compat32_sysroot}"
	_build_compat32_recipe 'openssl' "${_compat32_openssl_pkg_commit}" "${_compat32_sysroot}"
	_build_compat32_recipe 'sqlite' "${_compat32_sqlite_pkg_commit}" "${_compat32_sysroot}"
	_build_compat32_recipe 'brotli' "${_compat32_brotli_pkg_commit}" "${_compat32_sysroot}"
	_build_compat32_recipe 'libpsl' "${_compat32_libpsl_pkg_commit}" "${_compat32_sysroot}"
	_build_compat32_recipe 'libnghttp2' "${_compat32_libnghttp2_pkg_commit}" "${_compat32_sysroot}"
	_build_compat32_recipe 'libsoup3' "${_compat32_libsoup3_pkg_commit}" "${_compat32_sysroot}"
	_build_compat32_recipe 'libelf' "${_compat32_libelf_pkg_commit}" "${_compat32_sysroot}"

	if find "${_compat32_sysroot}/usr/lib32" \( -type f -o -type l \) -name '*.so*' -print -quit | grep -q .; then
		printf 'compat32 sysroot unexpectedly contains shared libraries\n' >&2
		return 1
	fi

	PKG_CONFIG_PATH='' \
		PKG_CONFIG_LIBDIR="${_compat32_sysroot}/usr/lib32/pkgconfig" \
		PKG_CONFIG_SYSROOT_DIR="${_compat32_sysroot}" \
		pkg-config --static --exists \
			'zlib' 'libpcre2-8' 'libffi' 'glib-2.0' \
			'liblzma' 'libunwind' 'openssl' 'sqlite3' \
			'libbrotlidec' 'libpsl' 'libnghttp2' 'libsoup-3.0' 'libelf'
}

_stage_frida_sdk_source() {
	local _name="${1:?missing SDK source name}"
	local _archive="${2:?missing SDK source archive}"
	local _revision="${3:?missing SDK source revision}"
	local _dest="${srcdir}/frida-sdk-sources/${_name}"

	rm -rf -- "${_dest}"
	mkdir -p -- "${_dest}"
	bsdtar -xf "${srcdir}/${_archive}" -C "${_dest}" --strip-components 1
	printf '%s\n' "${_revision}" > "${_dest}/.frida-source-revision"
}

_prepare_frida_sdk_sources() {
	local _sdk_root="${srcdir}/frida-sdk-sources"
	local _glib_subprojects

	rm -rf -- "${_sdk_root}"
	mkdir -p -- "${_sdk_root}"

	_stage_frida_sdk_source 'zlib' "sdk-zlib-${_sdk_zlib_commit}.tar.gz" "${_sdk_zlib_commit}"
	_stage_frida_sdk_source 'libffi' "sdk-libffi-${_sdk_libffi_commit}.tar.gz" "${_sdk_libffi_commit}"
	_stage_frida_sdk_source 'pcre2' "sdk-pcre2-${_sdk_pcre2_commit}.tar.gz" "${_sdk_pcre2_commit}"
	_stage_frida_sdk_source 'glib' "glib-${_glib_commit}.tar.gz" "${_glib_commit}"
	_stage_frida_sdk_source 'elfutils' "sdk-elfutils-${_sdk_elfutils_commit}.tar.gz" "${_sdk_elfutils_commit}"
	_stage_frida_sdk_source 'libdwarf' "libdwarf-${_libdwarf_commit}.tar.gz" "${_libdwarf_commit}"
	_stage_frida_sdk_source 'libbpf' "libbpf-${_libbpf_commit}.tar.gz" "${_libbpf_commit}"
	_stage_frida_sdk_source 'xz' "sdk-xz-${_sdk_xz_commit}.tar.gz" "${_sdk_xz_commit}"
	_stage_frida_sdk_source 'brotli' "sdk-brotli-${_sdk_brotli_commit}.tar.gz" "${_sdk_brotli_commit}"
	install -Dm644 -- "${srcdir}/sdk-brotli-meson-${_sdk_brotli_commit}.build" \
		"${_sdk_root}/brotli/meson.build"
	_stage_frida_sdk_source 'lzfse' "lzfse-${_lzfse_commit}.tar.gz" "${_lzfse_commit}"
	_stage_frida_sdk_source 'minizip-ng' "sdk-minizip-ng-${_sdk_minizip_ng_commit}.tar.gz" "${_sdk_minizip_ng_commit}"
	_stage_frida_sdk_source 'sqlite' "sdk-sqlite-${_sdk_sqlite_commit}.tar.gz" "${_sdk_sqlite_commit}"
	_stage_frida_sdk_source 'libunwind' "sdk-libunwind-${_sdk_libunwind_commit}.tar.gz" "${_sdk_libunwind_commit}"
	_stage_frida_sdk_source 'glib-networking' "glib-networking-${_glib_networking_commit}.tar.gz" "${_glib_networking_commit}"
	_stage_frida_sdk_source 'libnice' "libnice-${_libnice_commit}.tar.gz" "${_libnice_commit}"
	_stage_frida_sdk_source 'libusb' "libusb-${_libusb_commit}.tar.gz" "${_libusb_commit}"
	_stage_frida_sdk_source 'lwip' "lwip-${_lwip_commit}.tar.gz" "${_lwip_commit}"
	_stage_frida_sdk_source 'usrsctp' "usrsctp-${_usrsctp_commit}.tar.gz" "${_usrsctp_commit}"
	_stage_frida_sdk_source 'libgee' "libgee-${_libgee_commit}.tar.gz" "${_libgee_commit}"
	_stage_frida_sdk_source 'json-glib' "json-glib-${_json_glib_commit}.tar.gz" "${_json_glib_commit}"
	_stage_frida_sdk_source 'libpsl' "sdk-libpsl-${_sdk_libpsl_commit}.tar.gz" "${_sdk_libpsl_commit}"
	rm -rf -- "${_sdk_root}/libpsl/list"
	mkdir -p -- "${_sdk_root}/libpsl/list"
	bsdtar -xf "${srcdir}/sdk-publicsuffix-${_sdk_publicsuffix_commit}.tar.gz" \
		-C "${_sdk_root}/libpsl/list" --strip-components 1
	_stage_frida_sdk_source 'libxml2' "sdk-libxml2-${_sdk_libxml2_commit}.tar.gz" "${_sdk_libxml2_commit}"
	_stage_frida_sdk_source 'ngtcp2' "sdk-ngtcp2-${_sdk_ngtcp2_commit}.tar.gz" "${_sdk_ngtcp2_commit}"
	_stage_frida_sdk_source 'nghttp2' "sdk-nghttp2-${_sdk_nghttp2_commit}.tar.gz" "${_sdk_nghttp2_commit}"
	_stage_frida_sdk_source 'libsoup' "sdk-libsoup-${_sdk_libsoup_commit}.tar.gz" "${_sdk_libsoup_commit}"
	patch -d "${_sdk_root}/libsoup" -Np1 --fuzz=0 -i "${srcdir}/sdk-libsoup-skip-chunked.patch"
	_stage_frida_sdk_source 'capstone' "capstone-${_capstone_commit}.tar.gz" "${_capstone_commit}"
	_stage_frida_sdk_source 'quickjs' "quickjs-${_quickjs_commit}.tar.gz" "${_quickjs_commit}"
	_stage_frida_sdk_source 'tinycc' "tinycc-${_tinycc_commit}.tar.gz" "${_tinycc_commit}"
	patch -d "${_sdk_root}" -Np1 --fuzz=0 -i "${srcdir}/sdk-relocatable-paths.patch"
	_stage_frida_sdk_source 'openssl' "sdk-openssl-${_sdk_openssl_commit}.tar.gz" "${_sdk_openssl_commit}"
	_stage_frida_sdk_source 'v8' "sdk-v8-${_sdk_v8_commit}.tar.gz" "${_sdk_v8_commit}"
	patch -d "${_sdk_root}/v8" -Np1 --fuzz=0 -i "${srcdir}/sdk-v8-gcc16.patch"

	_glib_subprojects="${_sdk_root}/glib/subprojects"
	rm -rf -- "${_glib_subprojects}/pcre2" "${_glib_subprojects}/gvdb"
	mkdir -p -- "${_glib_subprojects}/pcre2" "${_glib_subprojects}/gvdb"
	bsdtar -xf "${srcdir}/sdk-pcre2-${_sdk_pcre2_commit}.tar.gz" \
		-C "${_glib_subprojects}/pcre2" --strip-components 1
	bsdtar -xf "${srcdir}/gvdb-${_gvdb_commit}.tar.gz" \
		-C "${_glib_subprojects}/gvdb" --strip-components 1
}

prepare() {
	local _npm_dir
	local _npm_cache="${srcdir}/npm-cache"
	local _go_mod_cache="${srcdir}/go-mod-cache"
	local _go_build_cache="${srcdir}/go-build-cache"

	_prepare_frida_sdk_sources

	cd -- "frida-${pkgver}" || return 1

	rm -rf -- releng \
		subprojects/frida-core \
		subprojects/frida-gum \
		subprojects/frida-python

	mv -- "${srcdir}/releng-${_releng_commit}" releng
	rm -rf -- releng/meson releng/tomlkit
	mv -- "${srcdir}/meson-${_meson_commit}" releng/meson
	mv -- "${srcdir}/tomlkit-${_tomlkit_commit}" releng/tomlkit
	mv -- "${srcdir}/frida-core-${_frida_core_commit}" subprojects/frida-core
	mv -- "${srcdir}/frida-gum-${_frida_gum_commit}" subprojects/frida-gum
	mv -- "${srcdir}/capstone-${_capstone_commit}" subprojects/frida-gum/subprojects/capstone
	mv -- "${srcdir}/glib-${_glib_commit}" subprojects/frida-core/subprojects/glib
	mv -- "${srcdir}/gvdb-${_gvdb_commit}" subprojects/frida-core/subprojects/glib/subprojects/gvdb
	mv -- "${srcdir}/glib-networking-${_glib_networking_commit}" subprojects/frida-gum/subprojects/glib-networking
	mv -- "${srcdir}/json-glib-${_json_glib_commit}" subprojects/frida-gum/subprojects/json-glib
	mv -- "${srcdir}/libdwarf-${_libdwarf_commit}" subprojects/frida-gum/subprojects/libdwarf
	mv -- "${srcdir}/libbpf-${_libbpf_commit}" subprojects/frida-core/subprojects/libbpf
	mv -- "${srcdir}/libgee-${_libgee_commit}" subprojects/frida-core/subprojects/libgee
	mv -- "${srcdir}/libnice-${_libnice_commit}" subprojects/frida-core/subprojects/libnice
	mv -- "${srcdir}/lzfse-${_lzfse_commit}" subprojects/frida-core/subprojects/lzfse
	mv -- "${srcdir}/quickjs-${_quickjs_commit}" subprojects/frida-gum/subprojects/quickjs
	mv -- "${srcdir}/tinycc-${_tinycc_commit}" subprojects/frida-gum/subprojects/tinycc
	mv -- "${srcdir}/frida-python-${_frida_python_commit}" subprojects/frida-python
	rm -rf -- subprojects/frida-python/frida-bindgen
	mv -- "${srcdir}/frida-bindgen-${_frida_bindgen_commit}" subprojects/frida-python/frida-bindgen
	mv -- "${srcdir}/libusb-${_libusb_commit}" subprojects/frida-core/subprojects/libusb
	mv -- "${srcdir}/lwip-${_lwip_commit}" subprojects/frida-core/subprojects/lwip
	mv -- "${srcdir}/usrsctp-${_usrsctp_commit}" subprojects/frida-core/subprojects/usrsctp

	patch -Np1 --fuzz=0 -i "${srcdir}/frida-releng.patch"
	patch -Np1 --fuzz=0 -i "${srcdir}/frida-core-arch.patch"
	patch -Np1 --fuzz=0 -i "${srcdir}/frida-hardening.patch"

	sed -i \
		"s/libgvc_dep = dependency('libgvc'.*/libgvc_dep = disabler()/" \
		"${srcdir}/vala-${_vala_commit}/meson.build"

	mkdir -p -- "${_npm_cache}" "${_go_mod_cache}" "${_go_build_cache}"
	export npm_config_cache="${_npm_cache}"
	export npm_config_audit=false
	export npm_config_fund=false

	for _npm_dir in \
		subprojects/frida-core/src/compiler \
		subprojects/frida-core/src/barebone; do
		(
			cd -- "${_npm_dir}" || exit 1
			npm ci --ignore-scripts
		)
	done

	(
		cd -- subprojects/frida-core/src/compiler || exit 1
		GOMODCACHE="${_go_mod_cache}" \
			GOCACHE="${_go_build_cache}" \
			go mod download
	)

	_prepare_compat32_recipe 'zlib' "${_compat32_zlib_pkg_commit}" 'compat32-zlib.patch'
	_prepare_compat32_recipe 'pcre2' "${_compat32_pcre2_pkg_commit}" 'compat32-pcre2.patch'
	_prepare_compat32_recipe 'libffi' "${_compat32_libffi_pkg_commit}" 'compat32-libffi.patch'
	_prepare_compat32_recipe 'glib2' "${_compat32_glib2_pkg_commit}" 'compat32-glib2.patch'
	_prepare_compat32_recipe 'xz' "${_compat32_xz_pkg_commit}" 'compat32-xz.patch'
	_prepare_compat32_recipe 'libunwind' "${_compat32_libunwind_pkg_commit}" 'compat32-libunwind.patch'
	_prepare_compat32_recipe 'openssl' "${_compat32_openssl_pkg_commit}" 'compat32-openssl.patch'
	_prepare_compat32_recipe 'sqlite' "${_compat32_sqlite_pkg_commit}" 'compat32-sqlite.patch'
	_prepare_compat32_recipe 'brotli' "${_compat32_brotli_pkg_commit}" 'compat32-brotli.patch'
	_prepare_compat32_recipe 'libpsl' "${_compat32_libpsl_pkg_commit}" 'compat32-libpsl.patch'
	_prepare_compat32_recipe 'libnghttp2' "${_compat32_libnghttp2_pkg_commit}" 'compat32-libnghttp2.patch'
	_prepare_compat32_recipe 'libsoup3' "${_compat32_libsoup3_pkg_commit}" 'compat32-libsoup3.patch'
	_prepare_compat32_recipe 'libelf' "${_compat32_libelf_pkg_commit}" 'compat32-libelf.patch'
}

_build_frida_sdk() {
	local _toolchain_prefix="${1:?missing toolchain prefix}"
	local _jobs="${2:?missing job count}"
	local _sdk_work_root="${FRIDA_SDK_WORK_ROOT:-${srcdir}}/frida-sdk-build"
	local _sdk_source_root="${srcdir}/frida-sdk-sources"
	local _sdk_archive="${_sdk_work_root}/sdk-linux-${CARCH}.tar.xz"
	local _sdk_prefix="${srcdir}/frida-sdk"
	local _deps_toml="${srcdir}/frida-${pkgver}/releng/deps.toml"

	if ! grep -qx "version = \"${_sdk_version}\"" "${_deps_toml}"; then
		printf 'Frida dependency version does not match expected SDK %s\n' "${_sdk_version}" >&2
		return 1
	fi

	rm -rf -- "${_sdk_work_root}" "${_sdk_prefix}"
	mkdir -p -- "${_sdk_work_root}" "${_sdk_prefix}"

	FRIDA_DEPS="${_sdk_work_root}" \
	FRIDA_DEPS_SOURCE_ROOT="${_sdk_source_root}" \
	FRIDA_DEPS_TOOLCHAIN_PREFIX="${_toolchain_prefix}" \
	FRIDA_MAKE_JOBS="${_jobs}" \
		python "${srcdir}/frida-${pkgver}/releng/deps.py" build \
			--bundle=sdk \
			--host="linux-${CARCH}"

	[[ -f "${_sdk_archive}" ]] || {
		printf 'Missing source-built Frida SDK archive: %s\n' "${_sdk_archive}" >&2
		return 1
	}
	bsdtar -xf "${_sdk_archive}" -C "${_sdk_prefix}"
	[[ "$(<"${_sdk_prefix}/VERSION.txt")" == "${_sdk_version}" ]] || {
		printf 'Source-built Frida SDK has an unexpected version\n' >&2
		return 1
	}
}

_build_env() {
	export FRIDA_VERSION="${pkgver}"
	export FRIDA_COMPAT_SYSROOT="${srcdir}/compat32"
	export npm_config_cache="${srcdir}/npm-cache"
	export npm_config_offline=true
	export npm_config_audit=false
	export npm_config_fund=false
	export GOMODCACHE="${srcdir}/go-mod-cache"
	export GOCACHE="${srcdir}/go-build-cache"
	export GOPROXY=off
	export GOSUMDB=off
}

build() {
	local _jobs
	local _toolchain_prefix
	local _vala_builddir

	_jobs="$(_makepkg_jobs)"
	_toolchain_prefix="${srcdir}/frida-${pkgver}/deps/toolchain-linux-${CARCH}"
	_vala_builddir="${srcdir}/build-vala"

	_build_env
	_build_compat32_sysroot

	[[ -d "${_toolchain_prefix}" ]] && chmod -R u+w -- "${_toolchain_prefix}"
	[[ -d "${_vala_builddir}" ]] && chmod -R u+w -- "${_vala_builddir}"
	rm -rf -- "${_toolchain_prefix}" "${_vala_builddir}"

	python "${srcdir}/frida-${pkgver}/releng/meson/meson.py" setup \
		--prefix="${_toolchain_prefix}" \
		-Doptimization=2 \
		"${_vala_builddir}" \
		"${srcdir}/vala-${_vala_commit}"
	python "${srcdir}/frida-${pkgver}/releng/meson/meson.py" compile \
		-C "${_vala_builddir}" \
		--jobs "${_jobs}"
	python "${srcdir}/frida-${pkgver}/releng/meson/meson.py" install \
		-C "${_vala_builddir}"

	sed \
		-e "s|@TOOLCHAIN_PREFIX@|${_toolchain_prefix}|g" \
		-e "s|@VALA_BUILDDIR@|${_vala_builddir}|g" \
		"${srcdir}/frida-valac.in" > "${srcdir}/frida-valac"
	chmod +x -- "${srcdir}/frida-valac"

	cd -- "frida-${pkgver}" || return 1
	rm -rf -- build

	export FRIDA_MAKE_JOBS="${_jobs}"
	export FRIDA_COMPAT_PKG_CONFIG="${srcdir}/frida-pkg-config-32"
	export PATH="${_toolchain_prefix}/bin:${PATH}"
	export LD_LIBRARY_PATH="${_toolchain_prefix}/lib:${_toolchain_prefix}/lib/vala-0.58:${LD_LIBRARY_PATH:-}"
	export VALAC="${srcdir}/frida-valac"
	export PYTHONPATH="${PWD}:${PYTHONPATH}"
	export VAPIGEN="${_toolchain_prefix}/bin/vapigen-0.58"

	_build_frida_sdk "${_toolchain_prefix}" "${_jobs}"
	export FRIDA_COMPAT_SDK="${srcdir}/frida-sdk"

	./configure \
		--prefix=/usr \
		--enable-shared \
		--without-prebuilds=toolchain,sdk \
		--disable-frida-tools \
		--enable-gadget \
		--enable-server \
		--enable-inject \
		--enable-frida-python \
		-- \
		-Dportal=disabled \
		-Dfrida-core:barebone_backend=enabled \
		-Dfrida-core:compiler_backend=enabled \
		--wrap-mode=nodownload

	make -C build

	rm -rf -- "${srcdir}/python-frida-dist"
	FRIDA_EXTENSION="${PWD}/build/subprojects/frida-python/frida/_frida.abi3.so" \
		python -m build \
			--wheel \
			--no-isolation \
			--outdir "${srcdir}/python-frida-dist" \
			subprojects/frida-python
}

_stage_install() {
	local _dest="$1"

	_build_env

	cd -- "${srcdir}/frida-${pkgver}" || return 1
	DESTDIR="${_dest}" python releng/meson/meson.py install \
		-C build \
		--no-rebuild
}

package_frida() {
	local _compiler_backend="${pkgdir}/usr/lib/frida-1.0/plugins/frida-compiler-backend.so"
	local _embedded_symbols
	local _embedded_symbols_raw
	local _gumjs_lib="${pkgdir}/usr/lib/libfrida-gumjs-1.0.so"
	local _gumjs_pc="${pkgdir}/usr/lib/pkgconfig/frida-gumjs-1.0.pc"
	local _gumjs_symbols
	local _gumjs_symbols_raw
	local _quickjs_lib="${srcdir}/frida-${pkgver}/build/subprojects/frida-gum/subprojects/quickjs/libquickjs.a"
	local _tinycc_lib="${srcdir}/frida-${pkgver}/build/subprojects/frida-gum/subprojects/tinycc/libtcc.a"
	local _rpath_target
	local _sdk_component
	local _sdk_source
	local _license_file
	local _license_first_line
	local _license_relative
	local _python_dir

	optdepends=('frida-tools: command-line tools')

	_stage_install "${pkgdir}"

	_python_dir="$(find "${pkgdir}/usr/lib" -mindepth 1 -maxdepth 1 -type d -name 'python*' -print -quit)"
	[[ -n "${_python_dir}" ]] || {
		printf '%s\n' 'Missing installed Python directory' >&2
		return 1
	}
	rm -rf -- "${_python_dir}/site-packages/frida"
	rmdir -- "${_python_dir}/site-packages" "${_python_dir}" 2>/dev/null || true

	rm -rf -- \
		"${pkgdir}/usr/include/libusb-1.0" \
		"${pkgdir}/usr/include/lwip" \
		"${pkgdir}/usr/include/quickjs" \
		"${pkgdir}/usr/include/libtcc.h" \
		"${pkgdir}/usr/include/usrsctp.h" \
		"${pkgdir}/usr/lib/libusb-1.0.a" \
		"${pkgdir}/usr/lib/liblwip.a" \
		"${pkgdir}/usr/lib/libquickjs.a" \
		"${pkgdir}/usr/lib/libtcc.a" \
		"${pkgdir}/usr/lib/libusrsctp.a" \
		"${pkgdir}/usr/lib/tcc" \
		"${pkgdir}/usr/lib/pkgconfig/libusb-1.0.pc" \
		"${pkgdir}/usr/lib/pkgconfig/lwip.pc" \
		"${pkgdir}/usr/lib/pkgconfig/quickjs.pc" \
		"${pkgdir}/usr/lib/pkgconfig/libtcc.pc" \
		"${pkgdir}/usr/lib/pkgconfig/usrsctp.pc"

	[[ -f "${_gumjs_pc}" ]] || {
		printf 'Missing GumJS pkg-config file: %s\n' "${_gumjs_pc}" >&2
		return 1
	}
	sed -i \
		-e 's/, quickjs//' \
		-e 's/, libtcc//' \
		"${_gumjs_pc}"
	if grep -Eq '^Requires\.private:.*(quickjs|libtcc)' "${_gumjs_pc}"; then
		printf '%s\n' 'Internal GumJS dependencies leaked into installed pkg-config metadata' >&2
		return 1
	fi

	[[ -f "${_gumjs_lib}" ]] || {
		printf 'Missing GumJS library: %s\n' "${_gumjs_lib}" >&2
		return 1
	}
	[[ -f "${_quickjs_lib}" ]] || {
		printf 'Missing QuickJS static library: %s\n' "${_quickjs_lib}" >&2
		return 1
	}
	[[ -f "${_tinycc_lib}" ]] || {
		printf 'Missing TinyCC static library: %s\n' "${_tinycc_lib}" >&2
		return 1
	}

	_gumjs_symbols="$(mktemp)" || return 1
	_gumjs_symbols_raw="$(mktemp)" || {
		rm -f -- "${_gumjs_symbols}"
		return 1
	}
	_embedded_symbols="$(mktemp)" || {
		rm -f -- "${_gumjs_symbols}" "${_gumjs_symbols_raw}"
		return 1
	}
	_embedded_symbols_raw="$(mktemp)" || {
		rm -f -- "${_gumjs_symbols}" "${_gumjs_symbols_raw}" "${_embedded_symbols}"
		return 1
	}
	if ! nm -D --defined-only "${_gumjs_lib}" > "${_gumjs_symbols_raw}"; then
		rm -f -- "${_gumjs_symbols}" "${_gumjs_symbols_raw}" "${_embedded_symbols}" "${_embedded_symbols_raw}"
		return 1
	fi
	if ! nm -g --defined-only "${_quickjs_lib}" "${_tinycc_lib}" > "${_embedded_symbols_raw}"; then
		rm -f -- "${_gumjs_symbols}" "${_gumjs_symbols_raw}" "${_embedded_symbols}" "${_embedded_symbols_raw}"
		return 1
	fi
	awk '{ print $3 }' "${_gumjs_symbols_raw}" | sort -u > "${_gumjs_symbols}"
	awk '{ print $3 }' "${_embedded_symbols_raw}" | sort -u > "${_embedded_symbols}"
	rm -f -- "${_gumjs_symbols_raw}" "${_embedded_symbols_raw}"
	if comm -12 "${_gumjs_symbols}" "${_embedded_symbols}" | grep -q .; then
		rm -f -- "${_gumjs_symbols}" "${_embedded_symbols}"
		printf '%s\n' 'Embedded QuickJS or TinyCC symbols leaked from GumJS' >&2
		return 1
	fi
	rm -f -- "${_gumjs_symbols}" "${_embedded_symbols}"

	for _rpath_target in \
		"${pkgdir}/usr/bin/frida-server" \
		"${pkgdir}/usr/bin/frida-inject" \
		"${pkgdir}/usr/lib/frida-1.0/64/frida-helper"; do
		[[ -f "${_rpath_target}" ]] || continue
		patchelf --remove-rpath "${_rpath_target}"
	done

	[[ -f "${_compiler_backend}" ]] || {
		printf 'Missing Frida compiler backend: %s\n' "${_compiler_backend}" >&2
		return 1
	}
	if grep -aqF "${srcdir}" "${_compiler_backend}"; then
		printf '%s\n' 'Build path leaked into Frida compiler backend' >&2
		return 1
	fi

	install -Dm644 "${srcdir}/frida-${pkgver}/COPYING" \
		"${pkgdir}/usr/share/licenses/frida/COPYING"

	for _sdk_source in "${srcdir}"/frida-sdk-sources/*; do
		[[ -d "${_sdk_source}" ]] || continue
		_sdk_component="${_sdk_source##*/}"
		while IFS= read -r -d '' _license_file; do
			grep -Iq . -- "${_license_file}" || continue
			_license_first_line=''
			IFS= read -r _license_first_line < "${_license_file}" || true
			[[ "${_license_first_line}" == '#!'* ]] && continue
			_license_relative="${_license_file#"${_sdk_source}/"}"
			install -Dm644 -- "${_license_file}" \
				"${pkgdir}/usr/share/licenses/frida/sdk/${_sdk_component}/${_license_relative}"
		done < <(
			find "${_sdk_source}" -type f \
				\( -iname 'LICENSE*' -o -iname 'COPYING*' -o -iname 'COPYRIGHT*' -o -iname 'NOTICE*' \) \
				-print0
		)
	done

	if [[ -d "${srcdir}/compat32/usr/share/licenses/frida/compat32" ]]; then
		cp -a -- "${srcdir}/compat32/usr/share/licenses/frida/compat32" \
			"${pkgdir}/usr/share/licenses/frida/"
	fi
}

package_python-frida() {
	local _extension
	local _wheel

	pkgdesc='Python bindings for Frida'
	license=('LGPL-2.0-or-later WITH WxWindows-exception-3.1')
	depends=(
		"frida=${pkgver}-${pkgrel}"
		'glib2'
		'python'
	)

	_wheel="$(find "${srcdir}/python-frida-dist" -maxdepth 1 -type f -name 'frida-*.whl' -print -quit)"
	[[ -n "${_wheel}" ]] || {
		printf '%s\n' 'Missing prebuilt Frida Python wheel' >&2
		return 1
	}
	python -m installer \
		--destdir="${pkgdir}" \
		--compile-bytecode=2 \
		"${_wheel}"

	_extension="$(find "${pkgdir}/usr/lib" -type f -path '*/site-packages/frida/_frida.abi3.so' -print -quit)"
	[[ -n "${_extension}" ]] || {
		printf '%s\n' 'Missing installed Frida Python extension' >&2
		return 1
	}
	patchelf --remove-rpath "${_extension}"

	install -Dm644 "${srcdir}/frida-${pkgver}/subprojects/frida-python/COPYING" \
		"${pkgdir}/usr/share/licenses/python-frida/COPYING"
}
