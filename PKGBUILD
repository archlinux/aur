# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Co Maintainer: 3Jl0y_PYCCKUi <3jl0y_pycckui@riseup.net>
# Contributor: solopasha <daron439 at gmail dot com>
# Contributor: Ilya Fedin <fedin-ilja2010@ya.ru>
# Contributor: Auteiy <dmitry@auteiy.me>

pkgname=kotatogram-dev-git
_pkgname=kotatogram-desktop
pkgver=k1.4.9.r2.g52b300cb3
pkgrel=1
pkgdesc='Kotatogram – experimental Telegram Desktop fork - Dev branch'
arch=('x86_64')
url="https://kotatogram.github.io"
license=('GPL3')
provides=(kotatogram-desktop kotatogram-desktop-git)
depends=('hunspell' 'ffmpeg4.4' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         # 'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'qt6-5compat'
         'qt5-imageformats' 'qt5-svg' 'qt5-wayland'
         'xxhash' 'kwayland' 'glibmm'
         'rnnoise' 'pipewire' 'libxtst' 'jemalloc' 'libxrandr' 'abseil-cpp' 'libjpeg-turbo' 'opus' 'openssl-1.1' 'libx11' 'libvpx' 'libxcomposite'
         'libxdamage' 'libxext' 'libxfixes' 'zlib' 'wayland'  'glibc' 'libsigc++' 'glib2' 'xcb-util-keysyms' 'libxcb' 'gcc-libs' 'libdispatch'
        )
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl'
             'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'webkit2gtk' 'unzip'
             'yasm' 'meson')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
conflicts=('kotatogram-desktop-bin' 'kotatogram-desktop-dynamic-bin' 'kotatogram-desktop')
_tg_owt_commit=63a934db1ed212ebf8aaaa20f0010dd7b0d7b396
source=("${_pkgname}::git+https://github.com/kotatogram/${_pkgname}.git#branch=dev"
        "${_pkgname}-tg_owt::git+https://github.com/desktop-app/tg_owt.git#commit=${_tg_owt_commit}"

        "include.patch"
        "kf594.patch"
        "https://patch-diff.githubusercontent.com/raw/kotatogram/kotatogram-desktop/pull/326.patch"
        "https://patch-diff.githubusercontent.com/raw/kotatogram/kotatogram-desktop/pull/333.patch"
        "https://patch-diff.githubusercontent.com/raw/kotatogram/kotatogram-desktop/pull/334.patch"
        "https://patch-diff.githubusercontent.com/raw/kotatogram/kotatogram-desktop/pull/335.patch"
        "https://patch-diff.githubusercontent.com/raw/kotatogram/kotatogram-desktop/pull/337.patch"

        "https://patch-diff.githubusercontent.com/raw/desktop-app/tg_owt/pull/101.patch"
        "tg_owt-fix.patch"

        "0001-Add-an-option-to-hide-messages-from-blocked-users-in.patch"
        "0002-Block-sponsored_messages.patch"
        "0003-Allow-downloading-and-copying-from-restricted-channels.patch"
        )

b2sums=('SKIP'
        'SKIP'
        'a3448b085b2046a9cb19848f8e5c96c609ba00f41209e23cae82c09e23e22303fbc313f718ce635541d66d42b7682215b3dfa35a969575ecaba65b68354b2c2d'
        'c4e75540ed8363689265d57dfe3410ceeeed4a1f06d3b8efd4fd029c0c2792b7ecc992ea75bfeba0599133ff85814f4ba25ce7dab2a18264344de3fadb47e626'
        '7564058d932166d6e267ad87d8da1e1bc9e33c42de057feae44f74da9cbdc0947f7233c724802af3e1d10fe699cdf1e7630a634fc7c47eb06d55f0237fd36972'
        '5fcc611dad411bc53a800a9f6e6f013bcf72ada64c5a70453f624941d983f02e80afb0cbcd646e4aaf51688ef3304f601d2cf1ab41de81a171250ca0d11cad5c'
        '228acce28b60cd60c54e954a281893bb9cbdbaccec9743907c237d0577963963f79efe44df7de932d69061603cc0a1626d4a8e04f78e04d167b1e3bf1c7c020b'
        'ab537548d871939e0d905849032d435f0732a1bd586dde212c8f7079f1652dafa07a0cde356cee78e47f5fb9a687185a9150fe3b70d08562fd781f20e6f64708'
        '802199bb3b6ec54437d8505695112743cbdaef1b13e25629d3832e68601147b48668738e3c0832296e74ee3bf1820914a46264aeda54411d4733fbb2e86260c9'
        '0d9d0927e401da06e5b77b6606c32d79966e946bc5dedb2086a5fc3fb5472a1c9039b8470031416d2bad81b3138ead5e29636b28e283774978e66b80cec15c2f'
        '9874a75e04500c2a9b8f67d75e9c81e970ab5dd8f62657fe82046a5be22f4dde371e3e8b50ab207d2a6a3017e3a209b5078f7ea16b94a2128a5a96db42f9d1c4'
        '63c912c53b7c259d97162f96acdb67a88b625c99ac2144869abc88a08d96e940bfdefcf9478c3c20a95f03c19ac16428e3fa6f6a2fa16a879de29b2856b4b617'
        '96a703e3c7e4a2e2229c386daa24af0ca0228d130a35a6ba25e5da4885297d5d0b33fe37f26f71955cac01e3250dc4f811ebb6ff0fe58f3f7e5d5380a970347f'
        'a2190defa8f08a7c8c42062debf7339ba1f6bf3171977cb23a0ca8a6264c6e4da8ac52966d9191bd395e6463531c431662ab009f7d7c8df82dd9219d07b9e5b6')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    apply-patch(){
        printf "Applying patch %s\n" "$1"
        patch -Np1 -i "$1"
    }

    cd "${srcdir}/${_pkgname}"

    git submodule update --init --recursive --depth 1 --jobs $(nproc)

    apply-patch "${srcdir}/kf594.patch"
    apply-patch "${srcdir}/326.patch"
    apply-patch "${srcdir}/333.patch"
    apply-patch "${srcdir}/334.patch"
    apply-patch "${srcdir}/335.patch"
    apply-patch "${srcdir}/337.patch"

    apply-patch "${srcdir}/0001-Add-an-option-to-hide-messages-from-blocked-users-in.patch"
    apply-patch "${srcdir}/0002-Block-sponsored_messages.patch"
    apply-patch "${srcdir}/0003-Allow-downloading-and-copying-from-restricted-channels.patch"

    cd "${srcdir}/${_pkgname}-tg_owt"
    git submodule update --init --recursive --depth 1 --jobs $(nproc)

    apply-patch "$srcdir/101.patch"
    # apply-patch "$srcdir/include.patch"
    apply-patch "$srcdir/tg_owt-fix.patch"
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
        -DTG_OWT_PACKAGED_BUILD=ON

    CFLAGS+=" -ffat-lto-objects" CXXFLAGS+=" -ffat-lto-objects -I/usr/include/libdrm" cmake --build build

    cd "${srcdir}/${_pkgname}"
    cmake . \
        -B build \
        -G Ninja  \
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
