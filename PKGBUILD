# Maintainer: 3Jl0y_PYCCKUi <3jl0y_pycckui@riseup.net>
# Contributor: solopasha <daron439 at gmail dot com>
# Contributor: Ilya Fedin <fedin-ilja2010@ya.ru>
# Contributor: Auteiy <dmitry@auteiy.me>

pkgname=kotatogram-desktop-beta
_pkgname=kotatogram-desktop
pkgver=1.4.9
pkgrel=4
pkgdesc='Kotatogram – experimental Telegram Desktop fork - Beta version'
arch=('x86_64')
url="https://kotatogram.github.io"
license=('GPL3')
provides=(kotatogram-desktop kotatogram-desktop-beta)
depends=('hunspell' 'ffmpeg4.4' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt5-imageformats' 'qt5-svg' 'qt5-wayland' 'xxhash' 'kwayland' 'glibmm'
         'rnnoise' 'pipewire' 'libxtst' 'jemalloc' 'libxrandr' 'abseil-cpp' 'libjpeg-turbo' 'opus' 'openssl' 'libx11' 'libvpx' 'libxcomposite' 'libdrm'
         'libxdamage' 'libxext' 'libxfixes' 'zlib' 'wayland'  'glibc' 'libsigc++' 'glib2' 'xcb-util-keysyms' 'libxcb' 'gcc-libs' 'libdispatch')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl'
             'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'webkit2gtk' 'unzip'
             'yasm' 'meson')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
conflicts=('kotatogram-desktop-bin' 'kotatogram-desktop-dynamic-bin' 'kotatogram-dev-git' 'kotatogram-desktop-git')
_tg_owt_commit=63a934db1ed212ebf8aaaa20f0010dd7b0d7b396
source=("${_pkgname}::git+https://github.com/kotatogram/${_pkgname}.git#tag=k${pkgver}"
        "${_pkgname}-libtgvoip::git+https://github.com/telegramdesktop/libtgvoip.git"
        "${_pkgname}-GSL::git+https://github.com/Microsoft/GSL.git"
        "${_pkgname}-xxHash::git+https://github.com/Cyan4973/xxHash.git"
        "${_pkgname}-rlottie::git+https://github.com/desktop-app/rlottie.git"
        "${_pkgname}-lz4::git+https://github.com/lz4/lz4.git"
        "${_pkgname}-lib_crl::git+https://github.com/desktop-app/lib_crl.git"
        "${_pkgname}-lib_rpl::git+https://github.com/desktop-app/lib_rpl.git"
        "${_pkgname}-lib_base::git+https://github.com/desktop-app/lib_base.git"
        "${_pkgname}-codegen::git+https://github.com/desktop-app/codegen.git"
        "${_pkgname}-lib_ui::git+https://github.com/kotatogram/lib_ui.git"
        "${_pkgname}-lib_lottie::git+https://github.com/desktop-app/lib_lottie.git"
        "${_pkgname}-lib_tl::git+https://github.com/desktop-app/lib_tl.git"
        "${_pkgname}-lib_spellcheck::git+https://github.com/desktop-app/lib_spellcheck.git"
        "${_pkgname}-lib_storage::git+https://github.com/desktop-app/lib_storage.git"
        "${_pkgname}-cmake_helpers::git+https://github.com/kotatogram/cmake_helpers.git"
        "${_pkgname}-expected::git+https://github.com/TartanLlama/expected.git"
        "${_pkgname}-QR-Code-generator::git+https://github.com/nayuki/QR-Code-generator.git"
        "${_pkgname}-lib_qr::git+https://github.com/desktop-app/lib_qr.git"
        "${_pkgname}-libdbusmenu-qt::git+https://github.com/desktop-app/libdbusmenu-qt.git"
        "${_pkgname}-hunspell::git+https://github.com/hunspell/hunspell.git"
        "${_pkgname}-range-v3::git+https://github.com/ericniebler/range-v3.git"
        "${_pkgname}-fcitx-qt5::git+https://github.com/fcitx/fcitx-qt5.git"
        "${_pkgname}-nimf::git+https://github.com/hamonikr/nimf.git"
        "${_pkgname}-hime::git+https://github.com/hime-ime/hime.git"
        "${_pkgname}-fcitx5-qt::git+https://github.com/fcitx/fcitx5-qt.git"
        "${_pkgname}-lib_webrtc::git+https://github.com/desktop-app/lib_webrtc.git"
        "${_pkgname}-tgcalls::git+https://github.com/TelegramMessenger/tgcalls.git"
        "${_pkgname}-lib_webview::git+https://github.com/desktop-app/lib_webview.git"
        "${_pkgname}-lib_waylandshells::git+https://github.com/desktop-app/lib_waylandshells.git"
        "${_pkgname}-jemalloc::git+https://github.com/jemalloc/jemalloc.git"
        "${_pkgname}-kwayland::git+https://github.com/KDE/kwayland.git"
        "${_pkgname}-dispatch::git+https://github.com/apple/swift-corelibs-libdispatch.git"
        "${_pkgname}-tg_owt::git+https://github.com/desktop-app/tg_owt.git#commit=${_tg_owt_commit}"
       
        "${_pkgname}-tg_owt-libvpx::git+https://chromium.googlesource.com/webm/libvpx.git"
        "${_pkgname}-tg_owt-libyuv::git+https://chromium.googlesource.com/libyuv/libyuv.git"
        "${_pkgname}-tg_owt-pipewire::git+https://github.com/PipeWire/pipewire.git"

        "include.patch"
        "kf594.patch"
        "https://patch-diff.githubusercontent.com/raw/kotatogram/kotatogram-desktop/pull/326.patch"
        "https://patch-diff.githubusercontent.com/raw/kotatogram/kotatogram-desktop/pull/333.patch"
        "https://patch-diff.githubusercontent.com/raw/kotatogram/kotatogram-desktop/pull/334.patch"
        "https://patch-diff.githubusercontent.com/raw/kotatogram/kotatogram-desktop/pull/335.patch"
        "https://patch-diff.githubusercontent.com/raw/kotatogram/kotatogram-desktop/pull/337.patch"
        
        "https://patch-diff.githubusercontent.com/raw/desktop-app/tg_owt/pull/101.patch"

        "0001-Add-an-option-to-hide-messages-from-blocked-users-in.patch"
        "block-sponsored_messages.patch"
        "allow-downloading-and-copying-from-restricted-channels.patch"
        )

b2sums=('SKIP'
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
        'a3448b085b2046a9cb19848f8e5c96c609ba00f41209e23cae82c09e23e22303fbc313f718ce635541d66d42b7682215b3dfa35a969575ecaba65b68354b2c2d'
        'c4e75540ed8363689265d57dfe3410ceeeed4a1f06d3b8efd4fd029c0c2792b7ecc992ea75bfeba0599133ff85814f4ba25ce7dab2a18264344de3fadb47e626'
        'e47587e2838e728c6a49e16db7b88372b5ab7819313f4d06aa453fb7bf41737521138bdd08835c4dc1e270397d6854ed1f005ff782e88d0f28d5233e741d4156'
        '6bf7dbefea67c97da542360a3e029059222138b82fc82c0fc1695d076f577bd466cc585ac804097716cf9c963cf8bac9026ed6777f7047d672e2143a4516870d'
        '4147d1a28829f02bacf51b06d22dc292e5b0adbf3ec6f1ba07a0811564b99d3b379f8ea47471b93a4e33cc51b4bb7412fddcd77899d966af8b6b492604bf7cce'
        '948f0210a301388d0146456fa70559cc5fc2c5a2c144fb1f1d27cc03a083bd52a743ee4e6d844ed7f933dce8749336c7ceda484b937a45a5d9949956690cc820'
        '9321818ba47c1d0bb5e49f5def7b96f21e8a9b49a14359a82f6ef57d43ce5357d93099f406eea731b2dc1a6f4dc113da6ce35bc6a945ffe96d202200d1c8359a'
        '3029740444c95cc99eb39fcb255ae1969e4111d6d21caef50481b183713e787c489ef8b3944f06dd27310c1a6dbaa5ae4639f5406e31c09e67b532e1f0da942c'
        '63c912c53b7c259d97162f96acdb67a88b625c99ac2144869abc88a08d96e940bfdefcf9478c3c20a95f03c19ac16428e3fa6f6a2fa16a879de29b2856b4b617'
        '96a703e3c7e4a2e2229c386daa24af0ca0228d130a35a6ba25e5da4885297d5d0b33fe37f26f71955cac01e3250dc4f811ebb6ff0fe58f3f7e5d5380a970347f'
        '5aca335099867de975d5ff1f05d2117c4c7d637213ad6636d6c892ae5249ee352b491195a8133023fdac79af7ce642bf6991e3d54e2d026580ddd02d3a950cd2')

prepare() {
    cd "${srcdir}/${_pkgname}"

    git config submodule.cmake.url "${srcdir}/${_pkgname}-cmake_helpers"

    git config submodule.Telegram/lib_crl.url "${srcdir}/${_pkgname}-lib_crl"
    git config submodule.Telegram/lib_rpl.url "${srcdir}/${_pkgname}-lib_rpl"
    git config submodule.Telegram/lib_base.url "${srcdir}/${_pkgname}-lib_base"
    git config submodule.Telegram/codegen.url "${srcdir}/${_pkgname}-codegen"
    git config submodule.Telegram/lib_ui.url "${srcdir}/${_pkgname}-lib_ui"
    git config submodule.Telegram/lib_lottie.url "${srcdir}/${_pkgname}-lib_lottie"
    git config submodule.Telegram/lib_tl.url "${srcdir}/${_pkgname}-lib_tl"
    git config submodule.Telegram/lib_spellcheck.url "${srcdir}/${_pkgname}-lib_spellcheck"
    git config submodule.Telegram/lib_storage.url "${srcdir}/${_pkgname}-lib_storage"
    git config submodule.Telegram/lib_qr.url "${srcdir}/${_pkgname}-lib_qr"
    git config submodule.Telegram/lib_webrtc.url "${srcdir}/${_pkgname}-lib_webrtc"
    git config submodule.Telegram/lib_webview.url "${srcdir}/${_pkgname}-lib_webview"
    git config submodule.Telegram/lib_waylandshells.url "${srcdir}/${_pkgname}-lib_waylandshells"

    git config submodule.Telegram/ThirdParty/libtgvoip.url "${srcdir}/${_pkgname}-libtgvoip"
    git config submodule.Telegram/ThirdParty/GSL.url "${srcdir}/${_pkgname}-GSL"
    git config submodule.Telegram/ThirdParty/xxHash.url "${srcdir}/${_pkgname}-xxHash"
    git config submodule.Telegram/ThirdParty/rlottie.url "${srcdir}/${_pkgname}-rlottie"
    git config submodule.Telegram/ThirdParty/lz4.url "${srcdir}/${_pkgname}-lz4"
    git config submodule.Telegram/ThirdParty/expected.url "${srcdir}/${_pkgname}-expected"
    git config submodule.Telegram/ThirdParty/QR.url "${srcdir}/${_pkgname}-QR-Code-generator"
    git config submodule.Telegram/ThirdParty/libdbusmenu-qt.url "${srcdir}/${_pkgname}-libdbusmenu-qt"
    git config submodule.Telegram/ThirdParty/hunspell.url "${srcdir}/${_pkgname}-hunspell"
    git config submodule.Telegram/ThirdParty/range-v3.url "${srcdir}/${_pkgname}-range-v3"
    git config submodule.Telegram/ThirdParty/fcitx-qt5.url "${srcdir}/${_pkgname}-fcitx-qt5"
    git config submodule.Telegram/ThirdParty/nimf.url "${srcdir}/${_pkgname}-nimf"
    git config submodule.Telegram/ThirdParty/hime.url "${srcdir}/${_pkgname}-hime"
    git config submodule.Telegram/ThirdParty/fcitx5-qt.url "${srcdir}/${_pkgname}-fcitx5-qt"
    git config submodule.Telegram/ThirdParty/tgcalls.url "${srcdir}/${_pkgname}-tgcalls"
    git config submodule.Telegram/ThirdParty/jemalloc.url "${srcdir}/${_pkgname}-jemalloc"
    git config submodule.Telegram/ThirdParty/kwayland.url "${srcdir}/${_pkgname}-kwayland"
    git config submodule.Telegram/ThirdParty/dispatch.url "${srcdir}/${_pkgname}-dispatch"

    git submodule update --init

    #patches
    patch -Np1 -i "${srcdir}/kf594.patch"
    patch -Np1 -i "${srcdir}/326.patch"
    patch -Np1 -i "${srcdir}/333.patch"
    patch -Np1 -i "${srcdir}/334.patch"
    patch -Np1 -i "${srcdir}/335.patch"
    patch -Np1 -i "${srcdir}/337.patch"

    patch -Np1 -i "${srcdir}/0001-Add-an-option-to-hide-messages-from-blocked-users-in.patch"
    patch -Np1 -i "${srcdir}/block-sponsored_messages.patch"
    patch -Np1 -i "${srcdir}/allow-downloading-and-copying-from-restricted-channels.patch"

    cd "${srcdir}/${_pkgname}-tg_owt"
    git config submodule.src/third_party/libvpx/source/libvpx.url "${srcdir}/${_pkgname}-tg_owt-libvpx"
    git config submodule.src/third_party/libyuv.url "${srcdir}/${_pkgname}-tg_owt-libyuv"
    git config submodule.src/third_party/pipewire.url "${srcdir}/${_pkgname}-tg_owt-pipewire"
    git submodule update --init
    patch -Np1 -i "$srcdir/101.patch"
    patch -Np1 -i "$srcdir/include.patch"
}

build() {
    export CXXFLAGS+=" -Wp,-U_GLIBCXX_ASSERTIONS"
    export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig' # force build with ffmpeg4.4


    cd "${srcdir}/${_pkgname}-tg_owt"
    cmake \
        -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
        -DBUILD_SHARED_LIBS=OFF \
        -DTG_OWT_USE_PROTOBUF=OFF \
        -DTG_OWT_PACKAGED_BUILD=ON
        
    CFLAGS+=" -ffat-lto-objects" CXXFLAGS+=" -ffat-lto-objects -I/usr/include/libdrm" cmake --build build

    cd "${srcdir}/${_pkgname}"
    cmake . \
        -B build \
        -G Ninja \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_TEST=ON \
        -Dtg_owt_DIR="${srcdir}/${_pkgname}-tg_owt/build" \
        -DDESKTOP_APP_QT6=OFF

    cmake --build build
}

package() {
    cd "${srcdir}/${_pkgname}"
    DESTDIR="$pkgdir" cmake --install build
}
