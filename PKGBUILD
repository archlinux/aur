# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=kotatogram-dev-git
_pkgname=kotatogram-desktop
pkgver=k1.4.12.g40df43998
pkgrel=4
pkgdesc="Kotatogram – experimental Telegram Desktop fork - Dev branch"
arch=(x86_64)
url="https://github.com/kotatogram/kotatogram-desktop"
license=(GPL3)
depends=(
	qt5-imageformats
	ffmpeg
	openal
  glibmm
  kwayland
	lz4
	xxhash
	minizip
	libdbusmenu-qt5
	hunspell
)
makedepends=(
  cmake
	git
  ninja
	python
	range-v3
	tl-expected
  microsoft-gsl
  libtg_owt
  gtk3
  webkit2gtk
)
optdepends=(
	'ttf-opensans: default Open Sans font family'
)
conflicts=('kotatogram-desktop')
provides=('kotatogram-desktop')
source=(
  "${_pkgname}::git+${url}.git#branch=dev"
  "${_pkgname}-libtgvoip::git+https://github.com/telegramdesktop/libtgvoip"
  "${_pkgname}-rlottie::git+https://github.com/desktop-app/rlottie.git"
  "${_pkgname}-lib_crl::git+https://github.com/desktop-app/lib_crl.git"
  "${_pkgname}-lib_rpl::git+https://github.com/desktop-app/lib_rpl.git"
  "${_pkgname}-lib_base::git+https://github.com/kotatogram/lib_base.git"
  "${_pkgname}-codegen::git+https://github.com/desktop-app/codegen.git"
  "${_pkgname}-lib_ui::git+https://github.com/kotatogram/lib_ui.git"
  "${_pkgname}-lib_rlottie::git+https://github.com/desktop-app/lib_rlottie.git"
  "${_pkgname}-lib_lottie::git+https://github.com/desktop-app/lib_lottie.git"
  "${_pkgname}-lib_tl::git+https://github.com/desktop-app/lib_tl.git"
  "${_pkgname}-lib_spellcheck::git+https://github.com/desktop-app/lib_spellcheck"
  "${_pkgname}-lib_storage::git+https://github.com/desktop-app/lib_storage.git"
  "${_pkgname}-cmake_helpers::git+https://github.com/kotatogram/cmake_helpers.git"
  "${_pkgname}-QR-Code-generator::git+https://github.com/nayuki/QR-Code-generator"
  "${_pkgname}-lib_qr::git+https://github.com/desktop-app/lib_qr.git"
  "${_pkgname}-lib_webrtc::git+https://github.com/desktop-app/lib_webrtc.git"
  "${_pkgname}-tgcalls::git+https://github.com/TelegramMessenger/tgcalls.git"
  "${_pkgname}-lib_webview::git+https://github.com/kotatogram/lib_webview.git"
  "${_pkgname}-mallocng::git+https://github.com/desktop-app/mallocng.git"
  "0001-Add-an-option-to-hide-messages-from-blocked-users-in.patch"
  "dlopen-gtk.patch"
  "https://github.com/telegramdesktop/tdesktop/commit/71deaa48afab2bcf9df67b9b347b1f44aad3a9ce.patch"
  "https://github.com/telegramdesktop/tdesktop/commit/a8807bc915f2439acc7c84f06d931d96d6ca602a.patch"
  "https://github.com/telegramdesktop/tdesktop/commit/d87ea056c6166345d061fc3a69a6f95eceaab0a1.patch"
  "https://github.com/telegramdesktop/tdesktop/commit/98180d3a9e994081a134196adad0023651d28bf3.patch"
  "https://github.com/telegramdesktop/tdesktop/commit/383acf0ffc489990302797ff0f048519b3c7c9bf.patch"
  "lib_base-gcc11-fix.patch"
  "lib_base-gtk-loading-fix.patch"
  "https://github.com/desktop-app/lib_webview/commit/8816639c74a4cb6d512cba8e2271aceb404b0492.patch"
  "mallocng.patch"
  "https://github.com/desktop-app/cmake_helpers/commit/5318ac7c54dbf33b17ccc4bd3281bb8b8db25e02.patch"
  "https://github.com/desktop-app/cmake_helpers/commit/de65519132126db2c2166cdf5af5f12e61652419.patch"
  "https://github.com/desktop-app/cmake_helpers/commit/45be9e321517f15378982bd0353f80ab884679eb.patch"
  "https://github.com/desktop-app/cmake_helpers/commit/bcc0ac15f497513455aa144ffe4e658f7aca0e73.patch")
sha512sums=(
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
            '13357d081fb658c735bb2575360f5d48214e1cf5002719ba410405a2fe05c7c3d2379588c2ca3c2ca6a5e6ff64e01e6d1ff3aecdaee8f3dd0519a64f6ee94182'
            '3a2cf87836153d2a184b18e8ede4a279e5b55c6c8023e2ac5234482c510c4a7aff58fade8f6fcb4d52fb76601afda11b676694d4eaf3029836101aeeee0007e7'
            'cabdadddc7a6873c7c6fc8128ceddf2712c0c73d3316520482162e5c67937bda2a627ddb2f078558a52e812c2a876351196488a5a75381d84a43815b873bac5b'
            '72ef9bddef1f40e09b9c4334153f1ab8aaddf63d95d9f25dc1b0a0826b7f2ae24f7c5fc4cb5ce90aae2c3144a5d52c4cb870d643f447d654190c4a2c78079354'
            'b285c65c2e6bb70730eddca2fe6b58e0d0cee466f919913f00f5b81fd4e67e3edd147de572bb5604317ad0c16b568ae4001e63433bd40d6a910b9cdb6aa61d83'
            'fcc4c5f649381ace974a3b73cd76f7dd3e78c3a8c0d0bffeccd3e66ec45b84c0cada1f6fd91e1498e0442ed70b679d6b975b499b1f37d25113053b38c873e9e7'
            'c5511bd073095a171b998ae8425d01305ac7927398640c0b62d5dcbcc2184e8dae25c1430a5950c45fac38ec5de353449765454f428fa6e16dc588214edd8db8'
            'ce364d20b9c3e8d65d4d0def6c2f025e16814c8782c78f720ee5e9891e0b296c6edca9f3a7fa46652516c6a748e29a8cdbbf5f7d1273e4e1a64c7216275c5cda'
            '956cd39e5a488b8ce02eddbca75c3f05467dcd4ff0f62907a966a1ad36b7d9329130e48f570f2e3ee95c135a085106442ce87bd48e0288db3bf8d8f06821f28d'
            'c82e41e9fab49d7eca4602327ebb10c795cf6db414a3c5fe91271af336c327fed5a5c67e3219734e20b7559ff7cbca220be8b94b3b551bf33c162c90370e5af3'
            '12c6a439b3960cb5a25edd2b2b1959f96fdbba634f281890f5ec91420834a852a7bcfa5d11051dfdf4fe719137345b23ae77a8e48eb6b9444ad973a34574cb84'
            '2f7c24851e9879b238366c82f35a046c5a69ec5059e6441ac6eae578450669f094bb659a63b79be635dcae93ddd388bc957e29a219cc3cfc0e6591f0f333d7e3'
            '6bce17e6e763859a95a35ff759b56aa5e51b7ba7534d5502517ae3a970cb42d901b2f6a9862a4ef06adfa5ef85e6e3e517a16ce7ab516ee9f3e4c21c38bb8cdb'
            '110654df22e36fc3185e8db05fd4cefcee30ade1a76f0640b97a15bcf532b8b560e8a9740f4e73be48accad4459487e5246d8f44d988a021b9f8024d27d29bfe'
            'db3d5b53436a732ea2950c7772c9edec2e6879caefa2bfb6112e5bb12f464a33a11ca9d4f3d2699da99df97d6721fbcf958a8b2256e911fb9a18c8229e5b67fd'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  git describe --tags --long | sed 's/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    git submodule init
    git config submodule.Telegram/ThirdParty/libtgvoip.url "${srcdir}/${_pkgname}-libtgvoip"
    git config submodule.Telegram/ThirdParty/rlottie.url "${srcdir}/${_pkgname}-rlottie"
    git config submodule.Telegram/lib_crl.url "${srcdir}/${_pkgname}-lib_crl"
    git config submodule.Telegram/lib_rpl.url "${srcdir}/${_pkgname}-lib_rpl"
    git config submodule.Telegram/lib_base.url "${srcdir}/${_pkgname}-lib_base"
    git config submodule.Telegram/codegen.url "${srcdir}/${_pkgname}-codegen"
    git config submodule.Telegram/lib_ui.url "${srcdir}/${_pkgname}-lib_ui"
    git config submodule.Telegram/lib_rlottie.url "${srcdir}/${_pkgname}-lib_rlottie"
    git config submodule.Telegram/lib_lottie.url "${srcdir}/${_pkgname}-lib_lottie"
    git config submodule.Telegram/lib_tl.url "${srcdir}/${_pkgname}-lib_tl"
    git config submodule.Telegram/lib_spellcheck.url "${srcdir}/${_pkgname}-lib_spellcheck"
    git config submodule.Telegram/lib_storage.url "${srcdir}/${_pkgname}-lib_storage"
    git config submodule.cmake.url "${srcdir}/${_pkgname}-cmake_helpers"
    git config submodule.Telegram/ThirdParty/QR.url "${srcdir}/${_pkgname}-QR-Code-generator"
    git config submodule.Telegram/lib_qr.url "${srcdir}/${_pkgname}-lib_qr"
    git config sumbodule.Telegram/lib_webrtc.url "${srcdir}/${_pkgname}-lib_webrtc"
    git config sumbodule.Telegram/ThirdParty/tgcalls.url "${srcdir}/${_pkgname}-tgcalls"
    git config submodule.Telegram/lib_webview.url "${srcdir}/${_pkgname}-lib_webview"
    git submodule update

    pushd cmake
    # force webrtc link to libjpeg
    echo "target_link_libraries(external_webrtc INTERFACE jpeg)" | tee -a external/webrtc/CMakeLists.txt
    popd

    patch -p1 < ${srcdir}/0001-Add-an-option-to-hide-messages-from-blocked-users-in.patch
    # patch -p1 < ${srcdir}/dlopen-gtk.patch

    # some fixes
    patch -p1 < ${srcdir}/71deaa48afab2bcf9df67b9b347b1f44aad3a9ce.patch
    patch -p1 < ${srcdir}/a8807bc915f2439acc7c84f06d931d96d6ca602a.patch
    patch -p1 < ${srcdir}/d87ea056c6166345d061fc3a69a6f95eceaab0a1.patch
    patch -p1 < ${srcdir}/98180d3a9e994081a134196adad0023651d28bf3.patch
    patch -p1 < ${srcdir}/383acf0ffc489990302797ff0f048519b3c7c9bf.patch
    pushd Telegram/lib_base
    patch -p1 < ${srcdir}/lib_base-gcc11-fix.patch
    patch -p1 < ${srcdir}/lib_base-gtk-loading-fix.patch
    popd
    pushd Telegram/lib_webview
    patch -p1 < ${srcdir}/8816639c74a4cb6d512cba8e2271aceb404b0492.patch
    popd

    # backported mallocng usage
    patch -p1 < ${srcdir}/mallocng.patch
    pushd cmake
    patch -p1 < ${srcdir}/5318ac7c54dbf33b17ccc4bd3281bb8b8db25e02.patch
    patch -p1 < ${srcdir}/de65519132126db2c2166cdf5af5f12e61652419.patch
    patch -p1 < ${srcdir}/45be9e321517f15378982bd0353f80ab884679eb.patch
    patch -p1 < ${srcdir}/bcc0ac15f497513455aa144ffe4e658f7aca0e73.patch
    popd
    git submodule add "${srcdir}/${_pkgname}-mallocng" Telegram/ThirdParty/mallocng
    pushd Telegram/ThirdParty/mallocng
    git checkout cf3eabc443292aad8ee63491274d7865b5e0864c
    popd
}

build() {
	cd "${srcdir}/${_pkgname}/"

  cmake . \
    -B build \
    -G Ninja \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_BUILD_TYPE=Release \
    -DTDESKTOP_API_TEST=ON

  cmake --build build
}

package() {
	cd "${srcdir}/${_pkgname}"

  DESTDIR="$pkgdir" ninja -C build install
}
# vim:set ts=2 sw=2 et:
