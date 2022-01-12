# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Co Maintainer: 3Jl0y_PYCCKUi <3jl0y_pycckui@riseup.net>
# Contributor: solopasha <daron439 at gmail dot com>
# Contributor: Ilya Fedin <fedin-ilja2010@ya.ru>
# Contributor: Auteiy <dmitry@auteiy.me>

pkgname=kotatogram-dev-git
_pkgname=kotatogram-desktop
pkgver=k1.4.8.r174.g98f2683e5
pkgrel=2
pkgdesc='Kotatogram – experimental Telegram Desktop fork - Dev branch'
arch=('x86_64')
url="https://kotatogram.github.io"
license=('GPL3')
provides=(kotatogram-desktop kotatogram-desktop-git)
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt5-imageformats' 'qt5-svg' 'qt5-wayland' 'libdbusmenu-qt5' 'xxhash' 'kwayland' 'glibmm'
         'rnnoise' 'pipewire' 'libxtst' 'jemalloc' 'libxrandr' 'abseil-cpp' 'libjpeg-turbo' 'opus' 'openssl' 'libx11' 'libvpx' 'libxcomposite'
         'libxdamage' 'libxext' 'libxfixes' 'zlib' 'wayland'  'glibc' 'libsigc++' 'glib2' 'xcb-util-keysyms' 'libxcb' 'gcc-libs')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl'
             'extra-cmake-modules' 'webkit2gtk' 'unzip'
             'yasm' 'libtg_owt')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
conflicts=('kotatogram-desktop-bin' 'kotatogram-desktop-dynamic-bin' 'kotatogram-desktop')
source=("${_pkgname}::git+https://github.com/kotatogram/${_pkgname}.git#branch=dev"
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

        "0001-Add-an-option-to-hide-messages-from-blocked-users-in.patch"
        "block-sponsored_messages.patch")


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
        '462900e97b9d7a9d40bc02d3dc7dacd3060cc19af02135065628e38e83835a2fb438581ca78001aaffc27d8b0473a78d39509c35f50e4ebb25607fe9c6bae264'
        '96a703e3c7e4a2e2229c386daa24af0ca0228d130a35a6ba25e5da4885297d5d0b33fe37f26f71955cac01e3250dc4f811ebb6ff0fe58f3f7e5d5380a970347f')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    git submodule init

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

    git submodule update

    #patches
    patch -p1 < "${srcdir}/0001-Add-an-option-to-hide-messages-from-blocked-users-in.patch"
    patch -p1 < "${srcdir}/block-sponsored_messages.patch"
}

build() {
    cd "${srcdir}/${_pkgname}"
    cmake . \
        -B build \
        -G Ninja  \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DDESKTOP_APP_QT6=off \
        -DTDESKTOP_API_TEST=ON
    cmake --build build
}

package() {
    cd "${srcdir}/${_pkgname}"
    DESTDIR="$pkgdir" cmake --install build
}
