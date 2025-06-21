# Maintainer: HurricanePootis <hurricanepootis@protonmail.com
# Contributor: Ersei <contact at ersei dot net>
# Contributer: Paul <paul@mrarm.io>

pkgbase=mcpelauncher-linux
pkgname=('mcpelauncher-linux' 'lib32-mcpelauncher-linux')
pkgver=1.4.0
pkgrel=1
pkgdesc="Minecraft: Pocket Edition launcher for Linux"
arch=('x86_64')
url="https://github.com/minecraft-linux/mcpelauncher-manifest"
license=('GPL-3.0-only')
_makedepends=('git' 'cmake' 'ninja' 'clang' 'wayland-protocols' 'lld')
_depends=('zlib' 'libpng' 'sdl3' 'qt6-base' 'qt6-declarative' 'qt6-webengine' 'openssl' 'gcc-libs' 'glibc')
_32depends=('lib32-zlib' 'lib32-libpng' 'lib32-sdl3' 'lib32-openssl' 'lib32-gcc-libs' 'lib32-glibc')
depends=(${_depends[@]} ${_32depends[@]})
makedepends=(${_makedepends[@]} ${depends[@]})
_commit=cfb5ca51a6a977df13661fd1aec839a3f040a11d # qt6-base
source=(
  "git+https://github.com/minecraft-linux/mcpelauncher-manifest.git#commit=$_commit"
  'git+https://github.com/minecraft-linux/android-support-headers.git#commit=17b018ee74da6c02fec621e246e1ca839dfa76c3'
  'git+https://github.com/minecraft-linux/arg-parser.git#commit=888bc2fd82f28388fd9bc027fe0a10a90497a56c'
  'git+https://github.com/minecraft-linux/base64.git#commit=1a11a451781c1d40ad1ff3c252e300407d3f21a4'
  'git+https://github.com/minecraft-linux/cll-telemetry.git#commit=5410472d9295d04e68282633b3707324f8af361c'
  'git+https://github.com/minecraft-linux/daemon-utils.git#commit=f75fc4af8c0d1a7a1cb75ebec60d80c8d8a14e08'
  'git+https://github.com/minecraft-linux/eglut.git#commit=c786200d744d02156ce02f70384784c942bc68bc'
  'git+https://github.com/minecraft-linux/epoll-shim.git#commit=a53248da3959429e7c38c2ddfc49c23a381fac3c'
  'git+https://github.com/minecraft-linux/file-picker.git#commit=8c542e139de377914ae1157932de06d43a2f3ce7'
  'git+https://github.com/minecraft-linux/file-util.git#commit=3e7be1e26be892f47874f2cb903d6122b8640a97'
  'git+https://github.com/minecraft-linux/game-window.git#commit=eb0ca8098e76d44b8b68792fd3e5dd632cf3df18'
  'git+https://github.com/ocornut/imgui.git#commit=201899b611c34d35e6e38778abab91d76b0451c0'
  'git+https://github.com/minecraft-linux/libc-shim.git#commit=9005f18eb1ae0c5659e7e0d8c53b79abb9fc92b9'
  'git+https://github.com/ChristopherHX/libjnivm.git#commit=8c9db81dc67811a17edfaeb23ec274b85f0992a6'
  'git+https://github.com/MCMrARM/linux-gamepad.git#commit=68d75a74f80a93ec4ff7a96eea0909df28d45330'
  'git+https://github.com/minecraft-linux/logger.git#commit=a559598e8c1a6d8ec701b203e141dd74e21518c0'
  'git+https://github.com/minecraft-linux/mcpelauncher-client.git#commit=89d4f5c2f675c02a3b277dd0da710d04e43b43ce'
  'git+https://github.com/minecraft-linux/mcpelauncher-common.git#commit=277c84a3e238043b0b63732ce9108fab60ce58c9'
  'git+https://github.com/minecraft-linux/mcpelauncher-core.git#commit=d08b13b5f8bc38a5fc3da838a225e02451f1f8f7'
  'git+https://github.com/minecraft-linux/mcpelauncher-errorwindow.git#commit=dd34ad134f0f2954ebaa8a5d82b97300f9e4f28e'
  'git+https://github.com/minecraft-linux/mcpelauncher-linker.git#commit=2c0675cf2f12d3949455286e0b958386a6849305'
  'git+https://github.com/minecraft-linux/mcpelauncher-linux-bin.git#commit=f1d4f3ae9f38b13680a3d53cc3cc7c1768de2876'
  'git+https://github.com/minecraft-linux/mcpelauncher-mac-bin.git#commit=1ccb06468fe230ed987c909772639e951ee0928c'
  'git+https://github.com/minecraft-linux/mcpelauncher-webview.git#commit=9eb948778aeee9c580d48779b012280157a40fda'
  'git+https://github.com/minecraft-linux/minecraft-imported-symbols.git#commit=fe13ccc94fc3b4db8a5695aa3494e09a9399eb89'
  'git+https://github.com/minecraft-linux/msa-daemon-client.git#commit=a5bb100ee24b7a346aab300b58730195ebc3215f'
  'git+https://github.com/minecraft-linux/osx-elf-header.git#commit=3af774abbd9bb006fcbf2636e6b3a61acfd5ff2a'
  'git+https://github.com/minecraft-linux/properties-parser.git#commit=79f5360f889100bd4a1e069f4d9b86e94c902633'
  'git+https://github.com/MCMrARM/simple-ipc.git#commit=e71fdbdb8650454f04f798f35c8e33a9e1a18a6a'
  'git+https://github.com/minecraft-linux/android_bionic#commit=b10aecb97fcd34b0bd425fa8ae89829ea586f9f5'
  'git+https://github.com/libsdl-org/SDL.git#commit=5ac37a8ffcf89da390404c1016833d56e2d67ae4'
  # Temporary override of 'git+https://android.googlesource.com/platform/system/core'
  # git clone --mirror timed out on archlinux while it still works on ubuntu 22.04, the history has been truncated due to large files
  'git+https://github.com/minecraft-linux/android_core#commit=0235714fbf5593df145e8f991f82c5926c2df2df'
)

sha256sums=('9daf3449ab35f95ae69c03a43ce926e5d957efe441d930914e6cb23f72ce00ca'
            '7b951b80e95cf463223ec9f6a5b9c6dc9ab85435b66f695c9e9efd14c7556204'
            'f7758596bb6f5232b61098813baabd372cfa136a9a2f948d841db0f689e53bad'
            '640d05d8dc884f47f538593a7e40067070cc424e09bca723c1ad2f96669b3b51'
            '9685ff66b7f43c534da840b2050dceac7c451dd433e2d626f82a54f4184bee7e'
            '88ba85d318f1832511082dae60e2f60ff5118d0afd6e874ee2b5464c4bf1e229'
            'a3d8958c8551a689ed45c88887d5da78ef97a2700c2611c3364b332dee123e98'
            'd216053f95f11cf36d39173496d491eca44b3be69dfc7fc94b7d76f20374ec60'
            '0e0f449d95fa285e438f06df44ac852a3da8f7d829db841cf668cb7adba1260b'
            'ca32e57095fbcea6f397af0ca06eed4ffa65e6f134d86b5a95f8199d341e49f9'
            'ff670632b8479412a2639c8b92d805a39260e6f6ae7485fad4a6a0a384ed8f3d'
            'd6b49783ea398d42208a1483c2ff0582ff6cd51d9bf652430c411345df2d0f22'
            '052fe4b7255a951677241c7af5917f6a6c050b16d400450dd520cd89f6589e6e'
            '72bdb6f5d0bc7525854e444fd79bc7ec88ef5cbd26255a6982fd4efb88db4616'
            'a96329119a419e9ce37653193039cd7d20f1896a8579f14a6432e15c53b76907'
            '25c8a873faa78fb5258831fc6e22b7583fa19ff80e0cb33d5226175ecf59ea3b'
            '01e2c2f5af6a5f7b6e112eb83a741d5f00186642655be476ab659e9227c378ba'
            'd9db9005db8c086574674eb87a7af509d2efdfd4ac1644f1739a2c93a0e6ed7a'
            '2576ffdd7b1211304be9eac16a3218458988ebdf87d3386e7868fc27baf91af6'
            '30ee823b45857683dcc8dacfbbacd2028773c6b3756032aed1a2d7b3b693e1a5'
            '415e8806564b75d90499ccb3d9efaa3e91aef523ce97f42824727c6cf2f354ce'
            '27e581a99dcf59279577c8a964b5bb56ae29d0ab7e14cf63688188dcc259e2d8'
            'c674f52a630d91cb6c23b46a7d8a1651403adf6c28b0131850965604f2023726'
            '4be6d73d4b36130eea486c62f9abc2dd58f1d329024c6d3a9b76cdf69deb7330'
            'd40a68d92f71288f658066b6247cfd1c5df5ce503c40b7b5a6f2ff59ef81efb4'
            '640e55446eb4b860656c9e2cf7ab1e8106aeccf7bfdfb2664407ae6b782d9fb0'
            'b4e25bc86fec0332c658036eeadae516d2b2b6cc4b43e632644d07c571a47671'
            'f3a024329c2e2c38d40a8a85e84d31a532c71f6e315c01b4b9537744663de2c3'
            'ae6e3a64a184ae9e76a19c9f33d5e3e9254da3fd2f3401e7f212b23414c8f17a'
            '4adc4e7af406237d1e7f7e844ae7a71b10cd530479defcafbd04839d20681fb8'
            '099496d88945ce7e05d70d9fa5964512b7d7439db448f2d147500d101f703ed1'
            'c8071250634ef75560269400f0b85fec64ba7b5dab1455c79cd8d4a618b291bd')

prepare() {
  git -C mcpelauncher-manifest submodule init
  git -C mcpelauncher-manifest config submodule.android-support-headers.url "$srcdir/android-support-headers"
  git -C mcpelauncher-manifest config submodule.arg-parser.url "$srcdir/arg-parser"
  git -C mcpelauncher-manifest config submodule.base64.url "$srcdir/base64"
  git -C mcpelauncher-manifest config submodule.cll-telemetry.url "$srcdir/cll-telemetry"
  git -C mcpelauncher-manifest config submodule.daemon-utils.url "$srcdir/daemon-utils"
  git -C mcpelauncher-manifest config submodule.eglut.url "$srcdir/eglut"
  git -C mcpelauncher-manifest config submodule.epoll-shim.url "$srcdir/epoll-shim"
  git -C mcpelauncher-manifest config submodule.file-picker.url "$srcdir/file-picker"
  git -C mcpelauncher-manifest config submodule.file-util.url "$srcdir/file-util"
  git -C mcpelauncher-manifest config submodule.game-window.url "$srcdir/game-window"
  git -C mcpelauncher-manifest config submodule.libc-shim.url "$srcdir/libc-shim"
  git -C mcpelauncher-manifest config submodule.libjnivm.url "$srcdir/libjnivm"
  git -C mcpelauncher-manifest config submodule.linux-gamepad.url "$srcdir/linux-gamepad"
  git -C mcpelauncher-manifest config submodule.logger.url "$srcdir/logger"
  git -C mcpelauncher-manifest config submodule.mcpelauncher-client.url "$srcdir/mcpelauncher-client"
  git -C mcpelauncher-manifest config submodule.mcpelauncher-common.url "$srcdir/mcpelauncher-common"
  git -C mcpelauncher-manifest config submodule.mcpelauncher-core.url "$srcdir/mcpelauncher-core"
  git -C mcpelauncher-manifest config submodule.mcpelauncher-errorwindow.url "$srcdir/mcpelauncher-errorwindow"
  git -C mcpelauncher-manifest config submodule.mcpelauncher-linker.url "$srcdir/mcpelauncher-linker"
  git -C mcpelauncher-manifest config submodule.mcpelauncher-linux-bin.url "$srcdir/mcpelauncher-linux-bin"
  git -C mcpelauncher-manifest config submodule.mcpelauncher-mac-bin.url "$srcdir/mcpelauncher-mac-bin"
  git -C mcpelauncher-manifest config submodule.mcpelauncher-webview.url "$srcdir/mcpelauncher-webview"
  git -C mcpelauncher-manifest config submodule.minecraft-imported-symbols.url "$srcdir/minecraft-imported-symbols"
  git -C mcpelauncher-manifest config submodule.msa-daemon-client.url "$srcdir/msa-daemon-client"
  git -C mcpelauncher-manifest config submodule.osx-elf-header.url "$srcdir/osx-elf-header"
  git -C mcpelauncher-manifest config submodule.properties-parser.url "$srcdir/properties-parser"
  git -C mcpelauncher-manifest config submodule.simple-ipc.url "$srcdir/simple-ipc"
  git -C mcpelauncher-manifest config submodule.sdl3.url "$srcdir/SDL"
  git -C mcpelauncher-manifest config submodule.imgui.url "$srcdir/imgui"
  git -C mcpelauncher-manifest -c protocol.file.allow=always submodule update
  # Submodules of submodules
  git -C mcpelauncher-manifest/mcpelauncher-linker config submodule.bionic.url "$srcdir/android_bionic"
  git -C mcpelauncher-manifest/mcpelauncher-linker config submodule.core.url "$srcdir/android_core"
  git -C mcpelauncher-manifest/mcpelauncher-linker -c protocol.file.allow=always submodule update
}

build() {
	CXXFLAGS="$(echo $CXXFLAGS | sed 's/-Wp,-D_FORTIFY_SOURCE=3//g') -DNDEBUG -flto=thin"
	CFLAGS+=" -flto=thin"
	LDFLAGS+=" -fuse-ld=lld"
	_args=(
	-S mcpelauncher-manifest
	-G Ninja
	-DCMAKE_INSTALL_PREFIX=/usr
	-DCMAKE_C_COMPILER=clang
	-DCMAKE_CXX_COMPILER=clang++
	-DCMAKE_BUILD_TYPE=None
	-DENABLE_DEV_PATHS=OFF
	-DGAMEWINDOW_SYSTEM=SDL3
	-DSDL3_VENDORED=OFF
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5
	-Wno-dev
	)
	cmake -B build "${_args[@]}"
	cmake --build build

	_args+=(
	-DCMAKE_C_FLAGS="$CFLAGS -m32"
	-DCMAKE_CXX_FLAGS="$CXXFLAGS -m32"
	-DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS -m32"
	-DENABLE_QT_ERROR_UI=OFF
	-DENABLE_ERROR_WINDOW=OFF
	-DBUILD_WEBVIEW=OFF
	)
	PKG_CONFIG_PATH="/usr/lib32/pkgconfig" \
	cmake -B build32 "${_args[@]}"
	PKG_CONFIG_PATH="/usr/lib32/pkgconfig" \
	cmake --build build32
}

package_mcpelauncher-linux() {
  cd "$srcdir"
  DESTDIR="$pkgdir" cmake --install build
  depends=(${_depends[@]})
  optdepends=('mcpelauncher-ui: GUI for Launcher'
		'lib32-mcpelauncher-linux: x86 Game Support')
  provides=('mcpelauncher-client')
  install -Dm644 mcpelauncher-manifest/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 mcpelauncher-manifest/msa-daemon-client/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT"
  install -Dm644 mcpelauncher-manifest/mcpelauncher-linux-bin/FMod\ License.txt "$pkgdir/usr/share/licenses/$pkgname/fmod_license.txt"
  install -Dm644 mcpelauncher-manifest/eglut/LICENSE "$pkgdir/usr/share/licenses/$pkgname/eglut_license.txt"
}

package_lib32-mcpelauncher-linux() {
	depends=(${_32depends[@]})
	pkgdesc+=" (32bit client support)"
	cd "$srcdir"
	install -Dm755 "$srcdir/build32/mcpelauncher-client/mcpelauncher-client" "$pkgdir/usr/bin/mcpelauncher-client32"
}
