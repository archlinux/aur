pkgname=nagram-desktop
pkgver=7.3.3.2
_td_commit=c15d3f5a5de6e3ba5839822c451152e5e18bb700
_wallet_engine_ver=0.0.7
pkgrel=1
pkgdesc='An independent Telegram client built with Qt.'
arch=('x86_64')
url="https://github.com/NextAlone/Nagram-Qt"
license=('GPL-3.0-or-later WITH OpenSSL-exception')
depends=(
  'abseil-cpp'
  'ada'
  'ffmpeg'
  'glib2'
  'glibc'
  'hicolor-icon-theme'
  'hunspell'
  'kcoreaddons'
  'libavif'
  'libfido2'
  'libgcc'
  'libheif'
  'libjpeg-turbo'
  'libjxl'
  'libpipewire'
  'libsrtp'
  'libstdc++'
  'libvpx'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxtst'
  'lz4'
  'minizip'
  'openal'
  'openh264'
  'openssl'
  'opus'
  'pipewire'
  'qt6-base'
  'qt6-declarative'
  'qt6-imageformats'
  'qt6-svg'
  'qt6-wayland'
  'rnnoise'
  'tlottie'
  'xxhash'
  'zlib'
)
makedepends=(
  'boost'
  'boost-libs'
  'cargo'
  'cmake'
  'git'
  'glib2-devel'
  'gobject-introspection'
  'just'
  'qt6-shadertools'
  'gperf'
  'libtg_owt'
  'microsoft-gsl'
  'ninja'
  'python'
  'range-v3'
  'tl-expected'
  'vulkan-headers'
)
optdepends=(
  'geoclue: geoinformation support'
  'crow-translate: translation provider'
  'webkit2gtk-4.1: embedded browser features provided by webkit2gtk-4.1 (gtk3)'
  'webkitgtk-6.0: embedded browser features provided by webkitgtk-6.0 (gtk4)'
  'xdg-desktop-portal: desktop integration'
)
source=(
  "git+https://github.com/NextAlone/Nagram-Qt.git#tag=v${pkgver}"
  "git+https://github.com/tdlib/td.git#commit=${_td_commit}"
  # We're vendoring wallet-engine because tdesktop requires a massive patch against it.
  "wallet-engine-${_wallet_engine_ver}.tar.gz::https://github.com/i582/wallet-engine/archive/refs/tags/v${_wallet_engine_ver}.tar.gz"
  "https://github.com/desktop-app/patches/raw/refs/heads/master/wallet-engine.patch"
  "git+https://github.com/Microsoft/GSL.git"
  "git+https://github.com/Cyan4973/xxHash.git"
  "git+https://github.com/lz4/lz4.git"
  "git+https://github.com/desktop-app/lib_crl.git"
  "git+https://github.com/desktop-app/lib_rpl.git"
  "git+https://github.com/desktop-app/lib_base.git"
  "git+https://github.com/desktop-app/codegen.git"
  "git+https://github.com/desktop-app/lib_ui.git"
  "git+https://github.com/desktop-app/lib_lottie.git"
  "git+https://github.com/desktop-app/lib_tl.git"
  "git+https://github.com/desktop-app/lib_spellcheck.git"
  "git+https://github.com/desktop-app/lib_storage.git"
  "git+https://github.com/desktop-app/cmake_helpers.git"
  "git+https://github.com/TartanLlama/expected.git"
  "git+https://github.com/nayuki/QR-Code-generator.git"
  "git+https://github.com/desktop-app/lib_qr.git"
  "git+https://github.com/hunspell/hunspell.git"
  "git+https://github.com/ericniebler/range-v3.git"
  "git+https://github.com/hamonikr/nimf.git"
  "git+https://github.com/hime-ime/hime.git"
  "git+https://github.com/fcitx/fcitx5-qt.git"
  "git+https://github.com/desktop-app/lib_webrtc.git"
  "git+https://github.com/TelegramMessenger/tgcalls.git"
  "git+https://github.com/desktop-app/lib_webview.git"
  "git+https://github.com/KDE/kimageformats.git"
  "git+https://github.com/KDE/kcoreaddons.git"
  "git+https://github.com/google/cld3.git"
  "git+https://github.com/desktop-app/libprisma.git"
  "git+https://github.com/flatpak/xdg-desktop-portal.git"
  "git+https://github.com/desktop-app/lib_translate.git"
  "git+https://github.com/desktop-app/cmark-gfm.git"
  "git+https://github.com/desktop-app/MicroTeX.git"
  "git+https://github.com/tzcnt/TooManyCooks.git"
  "git+https://github.com/PJK/libcbor.git"
  "git+https://github.com/Yubico/libfido2.git"
  "git+https://github.com/tsyrogit/zxcvbn-c.git"
  "git+https://gitlab.com/mnauw/cppgir.git"
  "git+https://github.com/martinmoene/expected-lite.git"
)
sha512sums=('f2ffc861fe6ff4061a2107ddcacb6a9ff0baefafc46af4ca46c10038156fa9a2b7fc85abf930f345665072cfe19ecb72ff6cde82fe694f7403042efb79251472'
            'dd4741b3621c5e76ba7c9eee44ffd41b1e6b6c24fdb19988efd780d307aff79a9dcfd710be9ad63db6857cbbd71c273c54d82be524a5326fc22f1233d9eb6ca2'
            'f1a38de20459c5b780c98aaab037fdf34357980e7f3b93c4b523636d016ca4ffc9d9679c2ee4a246b138ef0474b8190d2db1874b204c006b0f30b3c950c62ff6'
            '79460145f706d3eb244335700a30be2e6862db2bcda042244cf45ec5227956130a366c54a4240167327e33fde4c9fa671305a7f942acedd17e994d24e0612a2b'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  git -C Nagram-Qt submodule init
  git -C Nagram-Qt config --local submodule."Telegram/ThirdParty/GSL".url "file://${srcdir}/GSL"
  git -C Nagram-Qt config --local submodule."Telegram/ThirdParty/xxHash".url "file://${srcdir}/xxHash"
  git -C Nagram-Qt config --local submodule."Telegram/ThirdParty/lz4".url "file://${srcdir}/lz4"
  git -C Nagram-Qt config --local submodule."Telegram/lib_crl".url "file://${srcdir}/lib_crl"
  git -C Nagram-Qt config --local submodule."Telegram/lib_rpl".url "file://${srcdir}/lib_rpl"
  git -C Nagram-Qt config --local submodule."Telegram/lib_base".url "file://${srcdir}/lib_base"
  git -C Nagram-Qt config --local submodule."Telegram/codegen".url "file://${srcdir}/codegen"
  git -C Nagram-Qt config --local submodule."Telegram/lib_ui".url "file://${srcdir}/lib_ui"
  git -C Nagram-Qt config --local submodule."Telegram/lib_lottie".url "file://${srcdir}/lib_lottie"
  git -C Nagram-Qt config --local submodule."Telegram/lib_tl".url "file://${srcdir}/lib_tl"
  git -C Nagram-Qt config --local submodule."Telegram/lib_spellcheck".url "file://${srcdir}/lib_spellcheck"
  git -C Nagram-Qt config --local submodule."Telegram/lib_storage".url "file://${srcdir}/lib_storage"
  git -C Nagram-Qt config --local submodule."cmake".url "file://${srcdir}/cmake_helpers"
  git -C Nagram-Qt config --local submodule."Telegram/ThirdParty/expected".url "file://${srcdir}/expected"
  git -C Nagram-Qt config --local submodule."Telegram/ThirdParty/QR".url "file://${srcdir}/QR-Code-generator"
  git -C Nagram-Qt config --local submodule."Telegram/lib_qr".url "file://${srcdir}/lib_qr"
  git -C Nagram-Qt config --local submodule."Telegram/ThirdParty/hunspell".url "file://${srcdir}/hunspell"
  git -C Nagram-Qt config --local submodule."Telegram/ThirdParty/range-v3".url "file://${srcdir}/range-v3"
  git -C Nagram-Qt config --local submodule."Telegram/ThirdParty/nimf".url "file://${srcdir}/nimf"
  git -C Nagram-Qt config --local submodule."Telegram/ThirdParty/fcitx5-qt".url "file://${srcdir}/fcitx5-qt"
  git -C Nagram-Qt config --local submodule."Telegram/lib_webrtc".url "file://${srcdir}/lib_webrtc"
  git -C Nagram-Qt config --local submodule."Telegram/ThirdParty/tgcalls".url "file://${srcdir}/tgcalls"
  git -C Nagram-Qt config --local submodule."Telegram/lib_webview".url "file://${srcdir}/lib_webview"
  git -C Nagram-Qt config --local submodule."Telegram/ThirdParty/kimageformats".url "file://${srcdir}/kimageformats"
  git -C Nagram-Qt config --local submodule."Telegram/ThirdParty/kcoreaddons".url "file://${srcdir}/kcoreaddons"
  git -C Nagram-Qt config --local submodule."Telegram/ThirdParty/cld3".url "file://${srcdir}/cld3"
  git -C Nagram-Qt config --local submodule."Telegram/ThirdParty/libprisma".url "file://${srcdir}/libprisma"
  git -C Nagram-Qt config --local submodule."Telegram/ThirdParty/xdg-desktop-portal".url "file://${srcdir}/xdg-desktop-portal"
  git -C Nagram-Qt config --local submodule."Telegram/lib_translate".url "file://${srcdir}/lib_translate"
  git -C Nagram-Qt config --local submodule."Telegram/ThirdParty/cmark-gfm".url "file://${srcdir}/cmark-gfm"
  git -C Nagram-Qt config --local submodule."Telegram/ThirdParty/MicroTeX".url "file://${srcdir}/MicroTeX"
  git -C Nagram-Qt config --local submodule."Telegram/ThirdParty/TooManyCooks".url "file://${srcdir}/TooManyCooks"
  git -C Nagram-Qt config --local submodule."Telegram/ThirdParty/libcbor".url "file://${srcdir}/libcbor"
  git -C Nagram-Qt config --local submodule."Telegram/ThirdParty/libfido2".url "file://${srcdir}/libfido2"
  git -C Nagram-Qt config --local submodule."Telegram/ThirdParty/zxcvbn".url "file://${srcdir}/zxcvbn-c"
  git -C Nagram-Qt -c protocol.file.allow=always submodule update

  git -C Nagram-Qt/cmake submodule init
  git -C Nagram-Qt/cmake config --local submodule."external/glib/cppgir".url "file://${srcdir}/cppgir"
  git -C Nagram-Qt/cmake -c protocol.file.allow=always submodule update

  git -C Nagram-Qt/cmake/external/glib/cppgir submodule init
  git -C Nagram-Qt/cmake/external/glib/cppgir config --local submodule."expected-lite".url "file://${srcdir}/expected-lite" 
  git -C Nagram-Qt/cmake/external/glib/cppgir -c protocol.file.allow=always submodule update

  cd wallet-engine-${_wallet_engine_ver}
  patch -Np1 -i "$srcdir"/wallet-engine.patch
}

build() {
  # Build wallet-engine
  cd wallet-engine-${_wallet_engine_ver}
  just build
  just bindings-cpp
  install -Dm644 target/release/libwallet_engine.a -t install/lib/
  install -Dm644 bindings/cpp-experimental/* -t install/include/wallet_engine/
  cd ..

  # Build td
  cmake -S td -B td/build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX="$PWD/td/install" \
    -Wno-dev \
    -DTD_E2E_ONLY=ON
  cmake --build td/build
  cmake --install td/build

  if [[ -n "${MAKEPKG_NAGRAM_DESKTOP_API_ID}" ]] && [[ -n "${MAKEPKG_NAGRAM_DESKTOP_API_HASH}" ]]
  then
  	_api_defines=(-DTDESKTOP_API_ID="${MAKEPKG_NAGRAM_DESKTOP_API_ID}"
                  -DTDESKTOP_API_HASH="${MAKEPKG_NAGRAM_DESKTOP_API_HASH}")
  else
  	_api_defines=(-DTDESKTOP_API_TEST=ON)
  fi

  cmake -B build -S Nagram-Qt -G Ninja \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -Dtde2e_DIR="$PWD/td/install/lib/cmake/tde2e" \
    -DCMAKE_PREFIX_PATH="$PWD/wallet-engine-${_wallet_engine_ver}/install" \
    -DCMAKE_BUILD_TYPE=None \
    "${_api_defines[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

