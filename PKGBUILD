# Maintainer: Sébastien TERRIER <ouinouin at ouinouin dot eu>
pkgname=sudachi
pkgver=1.0.14
pkgrel=1
pkgdesc="Nintendo Switch emulator forked from yuzu."
arch=(x86_64)
url=https://sudachi.emuplace.app
license=(GPL-3.0-or-later)
provides=('sudachi')
depends=('qt6-base' 'qt6-webengine' 'qt6-multimedia' 'qt6-wayland' 'qt6-tools' 'sdl2-compat' 'ffmpeg' 'gamemode' 'hicolor-icon-theme' 'brotli')
makedepends=('git' 'cmake' 'nasm' 'doxygen' 'ninja' 'zip' 'unzip' 'spirv-headers' 'vulkan-headers' 'vulkan-utility-libraries')
conflicts=('sudachi')
options=(!debug)
source=(sudachi::https://github.com/emuplace/sudachi.emuplace.app/releases/download/v1.0.14/latest.zip
		enet::https://github.com/lsalzman/enet/archive/refs/tags/v1.3.18.tar.gz
		dynarmic::git+https://github.com/sudachi-emu/dynarmic
		libusb::https://github.com/libusb/libusb/archive/refs/tags/v1.0.27.tar.gz
    sirit::git+https://github.com/sudachi-emu/sirit
    mbedtls::git+https://github.com/sudachi-emu/mbedtls
    xbyak::https://github.com/herumi/xbyak/archive/refs/tags/v6.73.tar.gz
    opus::https://github.com/xiph/opus/archive/refs/tags/v1.5.2.tar.gz
    SDL::https://github.com/libsdl-org/SDL/archive/refs/tags/release-2.30.12.tar.gz
		cpp-httplib::https://github.com/yhirose/cpp-httplib/archive/refs/tags/v0.18.6.tar.gz
		ffmpeg::https://github.com/FFmpeg/FFmpeg/archive/refs/tags/n7.1.tar.gz
    cpp-jwt::https://github.com/arun11299/cpp-jwt/archive/refs/tags/v1.4.tar.gz
    libadrenotools::https://github.com/bylaws/libadrenotools/archive/refs/tags/v1.0.tar.gz
    VulkanMemoryAllocator::https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator/archive/refs/tags/v3.2.1.tar.gz
    breakpad::git+https://github.com/sudachi-emu/breakpad
    simpleini::https://github.com/brofield/simpleini/archive/refs/tags/v4.22.tar.gz
    oaknut::git+https://github.com/sudachi-emu/oaknut
    vcpkg::git+https://github.com/microsoft/vcpkg#tag=2025.01.13
    tzdb_to_nx::https://github.com/lat9nq/tzdb_to_nx/archive/refs/tags/221202.tar.gz
    cubeb::git+https://github.com/mozilla/cubeb
    googletest::https://github.com/google/googletest/archive/refs/tags/v1.15.2.tar.gz
    sanitizers-cmake::git+https://github.com/arsenm/sanitizers-cmake
    cubeb-coreaudio-rs::git+https://github.com/mozilla/cubeb-coreaudio-rs#branch=trailblazer
    cubeb-pulse-rs::git+https://github.com/mozilla/cubeb-pulse-rs#branch=dev
    zycore::https://github.com/zyantific/zycore-c/archive/refs/tags/v1.5.1.tar.gz
    linkernsbypass::git+https://github.com/bylaws/liblinkernsbypass#branch=master
    tz::git+https://github.com/eggert/tz#tag=2025a)
b2sums=(2ded3551a1daa676d9273396837b80878d4f9cc88c16a13ed9322965971a24b456cac871cf5efab8d859f29301a14bf71a5628f416acad91ee7e2efe62c8ef4d
				f8b4abf31d998b3b87a89010401ab9613ef819f5612929137147d1cfba04236568da270bcc1e633afeb4db37435e31a5d0e2f39088151f98b54a4ad8fb67210f
				'SKIP'
				ae697cfbbd3f7d160b687d846e5a5153e29466b75ba8379de33aad63e50d244031aef74bdbf028307b5cbe31aedcabc8c84909b4f519c406696bc9317756d0b3
				'SKIP'
				'SKIP'
				ba0597dd2f01973750f3ac50b821a6c4d8cc03203ba8b03a8943f016c1ca088f50cf8b87a7422bde4388d596be9c73823201911ef7d23408641f860eb842155b
				9a8a710e341b57551c3c5d1bd1979372e0c2120fe6d3fdb10bc90caa9b29b6cebe62aa118fb2884f25660fb99dcc5b8a6b521d675b1f3def8da9af3fd9b90637
				ac5bfec1053b67bb06514401d906d23ef53a49489d273085ed753e94f09c6fb619922a807ca87161e436803c63374f039021f31ce8562819e1d91023862c7751
				bee65790b8f2a19f80fd8f38799d650ceaef021b6e9f28b2fd0678f4c50b95d210f9764775d67365e65e6f9e03d6999091f28aa553655444c8ff369172cf13f9
				cc4afe1cd3f74e5275831b5a225f544399d8e6f61611fc623a0edb2cda8adf1d69f27233f8b7dc749682a2fd87d4212193e143b2acb729aa47fb5851ba879085
				5ded054cca527b803507d49edac82946cea2e9458ca783c5e693bba18313db1aba5c021eb79447bd4d2a077cb3483b9cf11e3119b9920eb4a9b35c43ea8a188e
				7c41a3b1342b9f726f965f7f11e2a3b959ecfb4a38052f9a7603de826e3f57dabf72bb40894f97d9829061db6a34d31c243f5ea18019c2b466033f988a128844
				b863bdc3c92e1e98ececf1ec8a8a901553a7abe70f91171f907627d91224aa52ba5b8522ef92e04727d2e36dad7d98441104a08e095ef64e672ccef82f352939
				'SKIP'
				22c63d089aa30b9a15644b485b4f8238e4bf5c8bffad887eff2fa738f10d5506e960dda505dc858d72795a16ed6ba20850c90796a9ec18ef3117a6330baa2a48
				'SKIP'
				'SKIP'
				7af924ac6ab78e4b28c8cb5971cb715c7bea02c0a14847ac64a4da3e1e5b27042f912d6970dad8093aca55d590a44beef06ac260d42c65ffc42b2b37d74b48e0
				'SKIP'
				2525d7a8572364cc2c2c129197201fc31e3cb4aadf4be37a995447a9b8e393205628e666dd190dca9a169b693883a5a2a5cafd6432cc3d1263a0c834ff8cf121
				'SKIP'
				'SKIP'
				'SKIP'
				18d82cc4efecef9b98646d305f5ec7934c60a8f278cd7b24464e1416486034b20f96d434d8a164d3ce181159dfc54db46a81c437b467017981847a4bcbbc6b73
				'SKIP'
				'SKIP')

prepare() {
	mv -T enet-1.3.18 externals/enet
	mv dynarmic externals/
	mv -T libusb-1.0.27 externals/libusb/libusb
	mkdir -p externals/dynarmic/externals/zydis/dependencies
	mv -T zycore-c-1.5.1 externals/dynarmic/externals/zydis/dependencies/zycore
	mv sirit externals/
	mv mbedtls externals/
	mv -T xbyak-6.73 externals/xbyak
	mv -T opus-1.5.2 externals/opus
	mv -T SDL-release-2.30.12 externals/SDL
	mv -T cpp-httplib-0.18.6 externals/cpp-httplib
	mv -T FFmpeg-n7.1 externals/ffmpeg/ffmpeg
	mv -T cpp-jwt-1.4 externals/cpp-jwt
	mv -T libadrenotools-1.0 externals/libadrenotools
	mv linkernsbypass externals/libadrenotools/lib/
	mv -T VulkanMemoryAllocator-3.2.1 externals/VulkanMemoryAllocator
	mv breakpad externals/
	mv -T simpleini-4.22 externals/simpleini
	mv oaknut externals/
	mv vcpkg externals/
	mv -T tzdb_to_nx-221202 externals/nx_tzdb/tzdb_to_nx
	mv tz externals/nx_tzdb/tzdb_to_nx/externals/tz/
	mv cubeb externals/
    mv -T googletest-1.15.2 externals/cubeb/googletest
    mv sanitizers-cmake externals/cubeb/cmake/
    mv cubeb-coreaudio-rs externals/cubeb/src/
    mv cubeb-pulse-rs externals/cubeb/src/
}

build() {
  cd "$srcdir"
  cmake -B build -GNinja \
    -DSUDACHI_TESTS=OFF \
    -DENABLE_QT6=ON \
    -DENABLE_QT_TRANSLATION=ON \
    -DSUDACHI_USE_QT_MULTIMEDIA=ON \
    -DSUDACHI_USE_QT_WEB_ENGINE=ON \
    -DSUDACHI_DOWNLOAD_ANDROID_VVL=OFF \
    -DSUDACHI_USE_BUNDLED_QT=OFF \
    -DSUDACHI_USE_BUNDLED_FFMPEG=ON \
    -DSUDACHI_USE_BUNDLED_VCPKG=ON \
    -DSUDACHI_USE_BUNDLED_SDL2=OFF \
    -DUSE_SDL2_FROM_EXTERNALS=OFF \
    -DSUDACHI_USE_EXTERNAL_VULKAN_HEADERS=OFF \
    -DSUDACHI_USE_EXTERNAL_VULKAN_UTILITY_LIBRARIES=OFF \
    -DSIRIT_USE_SYSTEM_SPIRV_HEADERS=ON \
    -DSUDACHI_ENABLE_LTO=ON \
    -DSUDACHI_USE_FASTER_LD=OFF \
    -DSUDACHI_CHECK_SUBMODULES=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="-march=native" \
    -DCMAKE_CXX_FLAGS="-march=native"
  ninja -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}
