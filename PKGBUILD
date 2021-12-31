# Maintainer: 3Jl0y_PYCCKUi <3jl0y_pycckui@riseup.net>
# Contributor: solopasha <daron439 at gmail dot com>
# Contributor: Ilya Fedin <fedin-ilja2010@ya.ru>
# Contributor: Auteiy <dmitry@auteiy.me>
pkgname=kotatogram-desktop
pkgver=1.4.8
pkgrel=1
pkgdesc='Kotatogram – experimental Telegram Desktop fork'
arch=('x86_64')
url="https://kotatogram.github.io"
license=('GPL3')
provides=(kotatogram-desktop)
_tg_owt_commit=6708e0d31a73e64fe12f54829bf4060c41b2658e
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt5-imageformats' 'qt5-svg' 'qt5-wayland' 'libdbusmenu-qt5' 'xxhash' 'kwayland' 'glibmm'
         'rnnoise' 'pipewire' 'libxtst' 'jemalloc' 'libxrandr' 'abseil-cpp' 'libjpeg-turbo' 'opus' 'openssl' 'libx11' 'libvpx' 'libxcomposite'
         'libxdamage' 'libxext' 'libxfixes' 'zlib' 'wayland'  'glibc' 'libsigc++' 'glib2' 'xcb-util-keysyms' 'libxcb' 'gcc-libs' 'rlottie-git' )
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl'
             'extra-cmake-modules' 'webkit2gtk' 'unzip'
             'yasm'

             'protobuf' 'libva'
             )
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
conflicts=('kotatogram-desktop-bin' 'kotatogram-desktop-dynamic-bin' 'kotatogram-dev-git' 'kotatogram-desktop-git')
source=("${pkgname}::git+https://github.com/kotatogram/${pkgname}.git#tag=k${pkgver}"
        "${pkgname}-libtgvoip::git+https://github.com/telegramdesktop/libtgvoip.git"
        "${pkgname}-GSL::git+https://github.com/Microsoft/GSL.git"
        "${pkgname}-Catch::git+https://github.com/philsquared/Catch"
        "${pkgname}-xxHash::git+https://github.com/Cyan4973/xxHash.git"
        "${pkgname}-rlottie::git+https://github.com/desktop-app/rlottie.git"
        "${pkgname}-lz4::git+https://github.com/lz4/lz4.git"
        "${pkgname}-lib_crl::git+https://github.com/desktop-app/lib_crl.git"
        "${pkgname}-lib_rpl::git+https://github.com/desktop-app/lib_rpl.git"
        "${pkgname}-lib_base::git+https://github.com/desktop-app/lib_base.git"
        "${pkgname}-codegen::git+https://github.com/desktop-app/codegen.git"
        "${pkgname}-lib_ui::git+https://github.com/kotatogram/lib_ui.git"
        "${pkgname}-lib_rlottie::git+https://github.com/desktop-app/lib_rlottie.git"
        "${pkgname}-lib_lottie::git+https://github.com/desktop-app/lib_lottie.git"
        "${pkgname}-lib_tl::git+https://github.com/desktop-app/lib_tl.git"
        "${pkgname}-lib_spellcheck::git+https://github.com/desktop-app/lib_spellcheck.git"
        "${pkgname}-lib_storage::git+https://github.com/desktop-app/lib_storage.git"
        "${pkgname}-cmake_helpers::git+https://github.com/kotatogram/cmake_helpers.git"
        "${pkgname}-expected::git+https://github.com/TartanLlama/expected.git"
        "${pkgname}-QR-Code-generator::git+https://github.com/nayuki/QR-Code-generator.git"
        "${pkgname}-lib_qr::git+https://github.com/desktop-app/lib_qr.git"
        "${pkgname}-libdbusmenu-qt::git+https://github.com/desktop-app/libdbusmenu-qt.git"
        "${pkgname}-hunspell::git+https://github.com/hunspell/hunspell.git"
        "${pkgname}-range-v3::git+https://github.com/ericniebler/range-v3.git"
        "${pkgname}-fcitx-qt5::git+https://github.com/fcitx/fcitx-qt5.git"
        "${pkgname}-nimf::git+https://github.com/hamonikr/nimf.git"
        "${pkgname}-hime::git+https://github.com/hime-ime/hime.git"
        "${pkgname}-fcitx5-qt::git+https://github.com/fcitx/fcitx5-qt.git"
        "${pkgname}-lib_webrtc::git+https://github.com/desktop-app/lib_webrtc.git"
        "${pkgname}-tgcalls::git+https://github.com/TelegramMessenger/tgcalls.git"
        "${pkgname}-lib_webview::git+https://github.com/desktop-app/lib_webview.git"
        "${pkgname}-lib_waylandshells::git+https://github.com/desktop-app/lib_waylandshells.git"
        "${pkgname}-jemalloc::git+https://github.com/jemalloc/jemalloc.git"
        "tg_owt::git+https://github.com/desktop-app/tg_owt.git#commit=${_tg_owt_commit}"

        "tg_owt-libvpx::git+https://chromium.googlesource.com/webm/libvpx.git"
        "tg_owt-libyuv::git+https://chromium.googlesource.com/libyuv/libyuv.git"
        "tg_owt-pipewire::git+https://github.com/PipeWire/pipewire.git"

        "0001-Add-an-option-to-hide-messages-from-blocked-users-in.patch"
        "block-sponsored_messages.patch"
        "lottie-fix.patch")


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
        '462900e97b9d7a9d40bc02d3dc7dacd3060cc19af02135065628e38e83835a2fb438581ca78001aaffc27d8b0473a78d39509c35f50e4ebb25607fe9c6bae264'
        '1e2705008ea8cef1a5c46793a6115ba0f35f77529d18ea04a03e5a0e89980916d78d49a9aa86863b1a0b440debb650262ceb3c9d68600ffe6e5c98fd65804526'
        '8feeb47ad0c238b32cb91788340b8794d6e58fa3a1c4027a57f7edcbd2c30d755cf27a778d446d59a4dbc07c255f3d0bcefdce4b5322ed2d00854c6e4a7831e0')

prepare() {
    cd "${srcdir}/${pkgname}"
    git submodule init

    git config submodule.cmake.url "${srcdir}/${pkgname}-cmake_helpers"

    git config submodule.Telegram/lib_crl.url "${srcdir}/${pkgname}-lib_crl"
    git config submodule.Telegram/lib_rpl.url "${srcdir}/${pkgname}-lib_rpl"
    git config submodule.Telegram/lib_base.url "${srcdir}/${pkgname}-lib_base"
    git config submodule.Telegram/codegen.url "${srcdir}/${pkgname}-codegen"
    git config submodule.Telegram/lib_ui.url "${srcdir}/${pkgname}-lib_ui"
    git config submodule.Telegram/lib_rlottie.url "${srcdir}/${pkgname}-lib_rlottie"
    git config submodule.Telegram/lib_lottie.url "${srcdir}/${pkgname}-lib_lottie"
    git config submodule.Telegram/lib_tl.url "${srcdir}/${pkgname}-lib_tl"
    git config submodule.Telegram/lib_spellcheck.url "${srcdir}/${pkgname}-lib_spellcheck"
    git config submodule.Telegram/lib_storage.url "${srcdir}/${pkgname}-lib_storage"
    git config submodule.Telegram/lib_qr.url "${srcdir}/${pkgname}-lib_qr"
    git config submodule.Telegram/lib_webrtc.url "${srcdir}/${pkgname}-lib_webrtc"
    git config submodule.Telegram/lib_webview.url "${srcdir}/${pkgname}-lib_webview"
    git config submodule.Telegram/lib_waylandshells.url "${srcdir}/${pkgname}-lib_waylandshells"

    git config submodule.Telegram/ThirdParty/libtgvoip.url "${srcdir}/${pkgname}-libtgvoip"
    git config submodule.Telegram/ThirdParty/GSL.url "${srcdir}/${pkgname}-GSL"
    git config submodule.Telegram/ThirdParty/Catch.url "${srcdir}/${pkgname}-Catch"
    git config submodule.Telegram/ThirdParty/xxHash.url "${srcdir}/${pkgname}-xxHash"
    git config submodule.Telegram/ThirdParty/rlottie.url "${srcdir}/${pkgname}-rlottie"
    git config submodule.Telegram/ThirdParty/lz4.url "${srcdir}/${pkgname}-lz4"
    git config submodule.Telegram/ThirdParty/expected.url "${srcdir}/${pkgname}-expected"
    git config submodule.Telegram/ThirdParty/QR.url "${srcdir}/${pkgname}-QR-Code-generator"
    git config submodule.Telegram/ThirdParty/libdbusmenu-qt.url "${srcdir}/${pkgname}-libdbusmenu-qt"
    git config submodule.Telegram/ThirdParty/hunspell.url "${srcdir}/${pkgname}-hunspell"
    git config submodule.Telegram/ThirdParty/range-v3.url "${srcdir}/${pkgname}-range-v3"
    git config submodule.Telegram/ThirdParty/fcitx-qt5.url "${srcdir}/${pkgname}-fcitx-qt5"
    git config submodule.Telegram/ThirdParty/nimf.url "${srcdir}/${pkgname}-nimf"
    git config submodule.Telegram/ThirdParty/hime.url "${srcdir}/${pkgname}-hime"
    git config submodule.Telegram/ThirdParty/fcitx5-qt.url "${srcdir}/${pkgname}-fcitx5-qt"
    git config submodule.Telegram/ThirdParty/tgcalls.url "${srcdir}/${pkgname}-tgcalls"
    git config submodule.Telegram/ThirdParty/jemalloc.url "${srcdir}/${pkgname}-jemalloc"

    git submodule update

    #patches
    patch -p1 < "${srcdir}/0001-Add-an-option-to-hide-messages-from-blocked-users-in.patch"
    patch -p1 < "${srcdir}/block-sponsored_messages.patch"

    cd "${srcdir}/tg_owt"
    git submodule init
    git config submodule.src/third_party/libvpx/source/libvpx.url "$srcdir"/tg_owt-libvpx
    git config submodule.src/third_party/libyuv.url "$srcdir"/tg_owt-libyuv
    git config submodule.src/third_party/pipewire.url "$srcdir"/tg_owt-pipewire
    git submodule update

    cd "${srcdir}/${pkgname}/Telegram/lib_lottie/"
    patch -p1 < $srcdir/lottie-fix.patch
}

build() {
    cd "${srcdir}/tg_owt"
    cmake . \
        -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DTG_OWT_BUILD_AUDIO_BACKENDS=OFF \
        -DBUILD_SHARED_LIBS=OFF

    cmake --build build

    cd "${srcdir}/${pkgname}"
    cmake . \
        -B build \
        -G Ninja \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DDESKTOP_APP_QT6=off \
        -Dtg_owt_DIR="${srcdir}/tg_owt/build" \
        -DTDESKTOP_API_TEST=ON

    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname}"
    DESTDIR="$pkgdir" cmake --install build
}
