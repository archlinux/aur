# Maintainer: Ilya Fedin <fedin-ilja2010@ya.ru>
# Contributor: Auteiy <dmitry@auteiy.me>

pkgname=kotatogram-desktop
pkgver=1.1.2
pkgrel=3
pkgdesc="Unofficial desktop client for the Telegram messenger, based on Telegram Desktop."
arch=(x86_64)
url="https://github.com/kotatogram/kotatogram-desktop"
license=(GPL3)
depends=(
	qt5-base
	qt5-imageformats
	ffmpeg
	openal
	xz
	lz4
	xxhash
	zlib
	minizip
	openssl
	libtgvoip
	rlottie-tdesktop
	hicolor-icon-theme
	desktop-file-utils
)
makedepends=(
	git
	python
	cmake
	ninja
	range-v3
	enchant
	dos2unix
)
optdepends=(
	'enchant: spellchecking support'
	'ttf-opensans: default Open Sans font family'
)
conflicts=('kotatogram-desktop-bin' 'telegram-desktop' 'telegram-desktop-bin')
source=(
	"$pkgname::git+$url.git#tag=k$pkgver"

	"Catch2::git+https://github.com/catchorg/Catch2.git"
	"crl::git+https://github.com/telegramdesktop/crl.git"
	"GSL::git+https://github.com/Microsoft/GSL.git"
	"libtgvoip::git+https://github.com/telegramdesktop/libtgvoip.git"
	"lz4::git+https://github.com/lz4/lz4.git"
	"rlottie::git+https://github.com/desktop-app/rlottie.git"
	"variant::git+https://github.com/mapbox/variant.git"
	"xxHash::git+https://github.com/Cyan4973/xxHash.git"
	"codegen::git+https://github.com/desktop-app/codegen.git"
	"lib_base::git+https://github.com/desktop-app/lib_base.git"
	"lib_crl::git+https://github.com/desktop-app/lib_crl.git"
	"lib_lottie::git+https://github.com/desktop-app/lib_lottie.git"
	"lib_rlottie::git+https://github.com/desktop-app/lib_rlottie.git"
	"lib_rpl::git+https://github.com/desktop-app/lib_rpl.git"
	"lib_spellcheck::git+https://github.com/desktop-app/lib_spellcheck.git"
	"lib_tl::git+https://github.com/desktop-app/lib_tl.git"
	"lib_ui::git+https://github.com/kotatogram/lib_ui.git"

	"https://raw.githubusercontent.com/telegramdesktop/tdesktop/100fed362271ada828fdaeb27e52f660a5a05d18/Telegram/Resources/icons/intro_qr_plane.png"
	"https://raw.githubusercontent.com/telegramdesktop/tdesktop/100fed362271ada828fdaeb27e52f660a5a05d18/Telegram/Resources/icons/intro_qr_plane@2x.png"
	"https://raw.githubusercontent.com/telegramdesktop/tdesktop/100fed362271ada828fdaeb27e52f660a5a05d18/Telegram/Resources/icons/intro_qr_plane@3x.png"

	"https://raw.githubusercontent.com/ilya-fedin/nur-repository/master/pkgs/kotatogram-desktop/update-to-v1.9.3.patch"
	"cmake-rules-fix.patch"
	"fix-spellcheck.patch"
	"add-default-notification-action.patch"
	"Use-system-font.patch"
	"Use-system-wide-font.patch"
	"system-tray-icon.patch"
	"linux-autostart.patch"
	"Use-system-font-by-default.patch"
	"Use-native-notifications-by-default.patch"

	"autostart.desktop"
)
sha512sums=('SKIP'
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
            '767cc5f3a8e25ff94cfc4a0ad6968455ab52875262e40515cfd4ebea1765014808913ee624efa47c57b15de7cceb492bf7232de981d519bd104036f6d498b788'
            'ac55bcd0c572b1e5fdd72cd0dd9db4bb5eb9c12adc8c702f348201a52b1cf0271f550e144e6654605753960cab55146604a8b52d5294861f73d85b548e5503f0'
            'ec16fd3a70a225fd9aa54c8042b1115d0bdb15e2a95c1abbc74cee50a06878196a4e8c451167c9849ff816ce36e48f46166cb7e99790258d575bde11e305e548'
            '98936bf3828a29bbaf766051b48b5dbf2b50de4fece910d3d92311a854f21ac3068c09f5c0e33c08d6821cbbb64939b7362104083edbe489413d43170df0a599'
            '18c8e8a6f1e3f09bde405beddb991fe32e5a1ee4000246fb203306f7aa2563f1fd5b38c9f9830305f9680f048f2c00f257303add8ea58f3dc7550d63d2e3db10'
            'd1804b9e8728adf3db9dccb581bdff6b9b76b9afc3ee9b55fe1846c404a8fe8c79d47c13f8005c4df23907ad80841df30a7431cc5204a55fe48c65ee12236939'
            '77fc5b177fe967768b87b411902c0bb890891f613d3ce72290976d2adc5eb8aa3a3815f95dc71b9e1391a09038dfa4dc05583117f7bb22363188809130b0e140'
            'b9fe9cb91e19271920c4cf075ba83703f093111d6a692cab91eb493563940091cda7b204742711157beb1e9857c1fefd6788ec8784f7b362423a9564925c0de6'
            '94ea7c337c6c9dd6be7727d3b8e9f44cdcfe391c574607491aa32b6e64a93eff7bcc6adc993e7c93e8f5b75a4646a1cf884646fce65ca78edf1df7a969bcf56a'
            '6bdb73dd7ebd8cd50da0f09f2f1fa201e687fee949c4a05f90e62e7e6167ccca877a078021ca611ce8fbb464aab329b92270f07e0cb770c2b7a89a436d37549a'
            'aaef50685b8871f32820e6cca2014aa986500ddcf34f4e99216081310e8622a242420a7d1ce30e277af85eb3f1d1e73c5a67dab9e02b42ef03ae6d76381fe635'
            'a95122676e18b1505b796b79e24521adcf5b29a28a01b7cd3285b5855c8d27e5e0e8f15928f61826e81163dfd3f06e71d27879bef748c1d491a3cd8f9e3212cc'
            '14064af25fda0fcd31a0dc7626687eaf61c329e9100fb55a8a0a455600a63a761e864056088aa486afdd053eccad0a55f8b332151eeb46c90a2c562a64a0a36e'
            '610ce239e1e8ae6cfaaccc507eb2ca174f38e340ceec8f56bec4da1a6e390b516c56be5c82a90674e92d0958ac7c8f2fdba560b044f30fb165b522a58bfb600a')

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init

	git config submodule.Telegram/ThirdParty/Catch.url "$srcdir/Catch2"
	git config submodule.Telegram/ThirdParty/crl.url "$srcdir/crl"
	git config submodule.Telegram/ThirdParty/GSL.url "$srcdir/GSL"
	git config submodule.Telegram/ThirdParty/libtgvoip.url "$srcdir/libtgvoip"
	git config submodule.Telegram/ThirdParty/lz4.url "$srcdir/lz4"
	git config submodule.Telegram/ThirdParty/rlottie.url "$srcdir/rlottie"
	git config submodule.Telegram/ThirdParty/SPMediaKeyTap.url "$srcdir/SPMediaKeyTap"
	git config submodule.Telegram/ThirdParty/variant.url "$srcdir/variant"
	git config submodule.Telegram/ThirdParty/xxHash.url "$srcdir/xxHash"

	git config submodule.Telegram/codegen.url "$srcdir/codegen"
	git config submodule.Telegram/lib_base.url "$srcdir/lib_base"
	git config submodule.Telegram/lib_crl.url "$srcdir/lib_crl"
	git config submodule.Telegram/lib_lottie.url "$srcdir/lib_lottie"
	git config submodule.Telegram/lib_rlottie.url "$srcdir/lib_rlottie"
	git config submodule.Telegram/lib_rpl.url "$srcdir/lib_rpl"
	git config submodule.Telegram/lib_spellcheck.url "$srcdir/lib_spellcheck"
	git config submodule.Telegram/lib_tl.url "$srcdir/lib_tl"
	git config submodule.Telegram/lib_ui.url "$srcdir/lib_ui"

	git submodule update

	dos2unix "$srcdir/$pkgname/Telegram/build/build.bat"

	patch -Np1 -i "$srcdir/update-to-v1.9.3.patch"
	patch -Np1 -i "$srcdir/cmake-rules-fix.patch"
	patch -Np1 -i "$srcdir/fix-spellcheck.patch"
	patch -Np1 -i "$srcdir/add-default-notification-action.patch"
	patch -Np1 -i "$srcdir/Use-system-font.patch"
	patch -Np1 -i "$srcdir/Use-system-wide-font.patch"
	patch -Np1 -i "$srcdir/system-tray-icon.patch"
	patch -Np1 -i "$srcdir/linux-autostart.patch"
	patch -Np1 -i "$srcdir/Use-system-font-by-default.patch"
	patch -Np1 -i "$srcdir/Use-native-notifications-by-default.patch"

	unix2dos "$srcdir/$pkgname/Telegram/build/build.bat"

	cp "$srcdir/intro_qr_plane.png" "$srcdir/$pkgname/Telegram/Resources/icons/intro_qr_plane.png"
	cp "$srcdir/intro_qr_plane@2x.png" "$srcdir/$pkgname/Telegram/Resources/icons/intro_qr_plane@2x.png"
	cp "$srcdir/intro_qr_plane@3x.png" "$srcdir/$pkgname/Telegram/Resources/icons/intro_qr_plane@3x.png"
}

build() {
	cd "$srcdir/$pkgname"

	# Telegram requires us to set API_ID and API_HASH for some reason but they do not provide a way to receive a pair
	# See https://github.com/telegramdesktop/tdesktop/commit/65b2db216033aa08b7bc846df27843e566f08981 and
	# https://github.com/telegramdesktop/tdesktop/issues/4717
	# The official API_ID seems to be 2040 while the API_HASH is "b18441a1ff607e10a989891a5462e627".
	# We're going to use the defaults for now but might at some point use the official ones from the official binaries as noted above.

	cmake -G Ninja . \
		-DCMAKE_BUILD_TYPE=Release \
		-DTDESKTOP_API_TEST=ON \
		-DDESKTOP_APP_DISABLE_CRASH_REPORTS=ON \
		-DTDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME=ON \
		-DTDESKTOP_DISABLE_DESKTOP_FILE_GENERATION=ON \
		-DTDESKTOP_DISABLE_GTK_INTEGRATION=ON

	cmake --build .
}

package() {
	install -dm755 "$pkgdir/usr/bin"
	install -m755 "$srcdir/$pkgname/bin/Telegram" "$pkgdir/usr/bin/kotatogram-desktop"

	install -d "$pkgdir/usr/share/KotatogramDesktop/autostart"
	install -m644 "$srcdir/autostart.desktop" "$pkgdir/usr/share/KotatogramDesktop/autostart/kotatogramdesktop.desktop"

	install -d "$pkgdir/usr/share/applications"
	install -m644 "$srcdir/$pkgname/lib/xdg/kotatogramdesktop.desktop" "$pkgdir/usr/share/applications/kotatogramdesktop.desktop"

	install -d "$pkgdir/usr/share/kservices5"
	install -m644 "$srcdir/$pkgname/lib/xdg/tg.protocol" "$pkgdir/usr/share/kservices5/tg.protocol"

	local icon_size icon_dir
	for icon_size in 16 32 48 64 128 256 512; do
		icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"

		install -d "$icon_dir"
		install -m644 "$srcdir/$pkgname/Telegram/Resources/art/icon${icon_size}.png" "$icon_dir/kotatogram.png"
	done
}
