# Mantainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Previous Maintainer: Samuel FORGIONE <samuel.forgione@gmail.com>

_appname=cocos2d-x
pkgname=cocos2d-x-src
pkgver=3.16
pkgrel=1
pkgdesc="Cocos2D-X is a game engine that supports multiple platforms such as iOS, Android, WinXP/7/8, WP8, BlackBerry, MeeGo, Marmelade, WebOS, Mac OS X"
arch=('i686' 'x86_64')
url="http://cdn.cocos2d-x.org/"
license=('MIT License')
depends=('glew' 'glfw' 'glibc' 'fontconfig' 'libgl' 'curl' 'libx11' 'zlib' 'libpng' 'freetype2' 'python2')
#depends=('openssl' 'sqlite3')
options=('!buildflags' '!strip' 'staticlibs')
source=(
"${url}${_appname}-${pkgver}.zip"
"README"
"$_appname.sh"
"$_appname.csh"
'ccShader_PositionTexture.frag.patch'
'ccShader_3D_ColorTex.frag.patch'
'ccShader_PositionTextureColor_noMVP.vert.patch'
'ccShader_3D_ColorNormalTex.frag.patch'
'ccShader_Label.vert.patch'
'ccShader_PositionTextureColorAlphaTest.frag.patch'
'ccShader_PositionTexture_uColor.vert.patch'
'ccShader_PositionTextureA8Color.vert.patch'
'CCGLViewImpl-desktop.cpp.patch'
'ccShader_3D_Color.frag.patch'
'ccShader_3D_PositionNormalTex.vert.patch'
'CMakeLists.patch'
'ccShader_ETC1AS_PositionTextureGray.frag.patch'
'ccShader_ETC1AS_PositionTextureColor.frag.patch'
'ccShader_Position_uColor.vert.patch'
'ccShader_3D_Skybox.vert.patch'
'ccShader_PositionColor.frag.patch'
'ccShader_Label_normal.frag.patch'
'ccShader_3D_Particle.frag.patch'
'ccShader_3D_PositionTex.vert.patch'
'ccShader_PositionTextureA8Color.frag.patch'
'ccShader_Label_outline.frag.patch'
'ccShader_CameraClear.frag.patch'
'CMakeLists.txt.patch'
'ccShader_CameraClear.vert.patch'
'ccShader_PositionTexture.vert.patch'
'Cocos2dxActivity.java.patch'
'ccShader_PositionColorLengthTexture.vert.patch'
'ccShader_3D_Skybox.frag.patch'
'ccShader_Label_df.frag.patch'
'ccShader_UI_Gray.frag.patch'
'ccShader_3D_Terrain.frag.patch'
'ccShader_3D_Terrain.vert.patch'
'ccShader_Position_uColor.frag.patch'
'ccShader_PositionColorTextureAsPointsize.vert.patch'
'ccShader_PositionTextureColor_noMVP.frag.patch'
'CCPhysicsBody.patch'
'ccShader_3D_ColorNormal.frag.patch'
'ccShader_Label_df_glow.frag.patch'
'ccShader_PositionColor.vert.patch'
'ccShader_PositionTextureColor.vert.patch'
'ccShader_PositionTexture_uColor.frag.patch'
'ccShader_PositionColorLengthTexture.frag.patch'
'ccShader_3D_Particle.vert.patch'
'ccShader_PositionTextureColor.frag.patch'
)
sha256sums=(
'36a2d5e9aab9ba3a7e4229546f3ead8ff4d47b693de4577bdf7db245d09180d6'
'09248ad9af9a94579b56c7c7dbf1b4276a59852c90423ad70c48b16355f28574'
'f2f74a36538c43045894bd2b2415a2396bcb5c28f9241296b0e6d39a452b56b1'
'3a7ae492fe9b2d7db8ef15c2d47e147746823942943e099d5a494c7076b2e92b'
'07d8dbc9dd529b04341bdd4dc047eafb6674f2413d54baa6450f9b7dce78ae53'
'0efc1d771e2b6a5bbca414732317e709c82a53878a0431c64aa2279b9f4321fe'
'120250a97af3be476df8dcac1472538c8a11d1ae9ab0624ddae8261b539695a8'
'13de90070e6242d299232778f8a9d41c22c92d518e3a38e32501577826f52149'
'2a7e2557b1d7d85405b1a8337a876d2633921dccdfef8d5a34fb13f923b0ffd2'
'308fa40e69de2c5cfa79e65edc326323bd80e26eb9da539d84ffeddf4e913017'
'35d5761e0005d8a583692a9c44517d956c9ae41da9c1cc69e05ce42d425e26fa'
'39bb1106c7df3a2958589b5ae5cdbbf9afd1b381951791761372424c28e4dd4e'
'3cc0e9666eeed8c0b4f7a8d0edfe1e5245c1cca53ca7e4a150660dc1bbf2a299'
'3f697c60080e85940a623a358a6d13ccab8a8f87346521c210196cc8ee48dcac'
'3fb4eb3b15dd0f28e8d171719c779d9680329126ae6cc56ce10d0d3784b0aa15'
'4616ec6d01530d168d5f9369bff764cbd33e944d8d0f66ff3ecffbc2d7423292'
'485ea7adc13632762aa78758c96287cc41f85a2d3edf2ab9e7b299883db52c9b'
'4b588741894aec0b2da47a35ff39787458202a431b88f0af6e422fcb4ee34709'
'5394b03f78a25d6736171c792b384b6abdb20e80647cbf5220c55729eb9a2650'
'572d86d285fa1bb6b72aa6d012244adfe3f3a304b66764fd555997dc8462baf4'
'5a7b57272514d4204fea0944151ab9eb23d533b1a97c289e408269eb2d877728'
'62db6b5d01b14d8f4322a8e32cd7257ca8b87b6d55aa9a18418bc90d85ccfc89'
'70351ae2d5a53fd42c96d5702efcef48d15a71ed7c4e55911c9678cfca7c4ab6'
'79b79366bc2690a01128fbfd0742f58ccf8f9f2ca1d7dd0a4b73d47c096ee7f6'
'7b33a4d78fa89b8b6a8fe3317dbf2e93e72f4579b9bedcefa1d4ac5daa5e4872'
'8437d3cf0d8ae3af545917095cf236b93fa0c2c480062cfefd786bfa2db5c209'
'898e63f7352513848213e8fa929364acbd85707c9bbf054250c253499b65b4b7'
'9a5a73ed7a1fc0cc152b0d27878b973abd525dd1a5906757d6dd385178f69835'
'9b7f760d99844b456a2f56e2a875e5355a7766537b4d2b33970d5d66bb397e3e'
'afe36a4cd2347c33c6c610b15966c1c4072d813a1b8a7ddcf611f3b8c0d08836'
'b2575e466cbba3d1abf3f467b0ea4505a00c3645de5ee8f8908b693d708b3c67'
'b2e422006a7f5348f3833d28b17a44ab1c4afd9daaeed65d4505bbedf0647eff'
'b8292b1c7971c285a7732e39b492f919df985c35a982a30bd9f004e9cd07f2fb'
'bdd4bb3218853c9f0a7675d3d98a50e5e1d6b69b1b3861255bf0f497782d8954'
'c4cb76c3d896e66391453173f30417f8646257c1d702ee5a3cb3e4980f3df000'
'c56d1402ddfa5a7c5607a23b44768880797f84bc1081cbf773fa457be5b2be0a'
'c7101ce86d01afa4c20efb4f89dd3e2b6d85059df233e57539648922c3eaca8f'
'db37cb1c64fc1990e26da2cc1d7a7756d50c2059a24c5d0d29757275850ace4d'
'dcb815b3c7a8e431fb8678701785d8cfb6568dc0976b86ab43c824fce765338c'
'de468779316ec6438fde600328aa648c7904db0dc3c918535efd59e67d410013'
'e0a639cb2f2aa2b918e8a320e4faf6fb30878d2db0235e4e999a0836a23d684f'
'e8418d25047914058adbddce65b5f9ca7abd88bf45a1e063d8eb69aa997d4a9c'
'e847773c38ef54d23b6f3fefbf9b717ca187a2780cd2b3d020f0eeb3b4a94971'
'e962c317447119b2730103ddb9cddad5f366c614cab05249a5b52a92d14d0147'
'eb2bee833918146282c2e9df02b3b021c5e95f0014d3eaa7df8da20ba3df7403'
'ed7882c39f4074cc71d3498a4825b0e20ee895bc926419fda30ad8de1a2eaa43'
'ef4fd5d339ed872d41848847596a49a79f6a5d26c46a7edce8aadf2a9764e53a'
'f956e3b937c663a159a6c7bc92d5c951fd18836113dcc125bb0fe46147e62531'
'ffd5fb98cc4f6edfdda8a2e807ce97351fca6bf2dfd9570e158da797fc6b1245'
)


prepare() {
	cd "$srcdir"/$_appname-$pkgver

	# Note: Disabled downloading external dependencies since they are included
	# with Cocos2D-X.  On some releases this might be needed:
	#chmod +x "download-deps.py"
	#python2 "download-deps.py" -r yes
}


package() {

	# Install preliminary files
	install -d "$pkgdir/opt/$_appname"
	install -Dm644 "README" "$pkgdir/opt/$_appname/README"
	install -Dm755 "$_appname.sh" "$pkgdir/etc/profile.d/$_appname.sh"
	install -Dm755 "$_appname.csh" "$pkgdir/etc/profile.d/$_appname.csh"

	## ===============PATCHES BEGIN=======================

	## Performance tweaks

	## TODO: add CMake configuration flags to ease the configuratino of libcocos2d:
	#patch -s "$srcdir"/$_appname-$pkgver/templates/cpp-template-default/CMakeLists.txt CMakeLists.txt.patch

	# Patch ProcessCpuTracker.cpp to fix NDK v15 issue:
	#patch -s "$srcdir"/$_appname-$pkgver/cocos/platform/android/jni/ProcessCpuTracker.cpp ProcessCpuTracker.cpp.patch

	# Switch C++ multiline string literal to the STRINGIFY macro which uses less memory. See https://github.com/cocos2d/cocos2d-x/pull/16742
	# TL;DR: For smoother development, using the C++ multiline string literal is convenient, however the STRINGIFY macro defined at ccShaders.cpp uses less memory.
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_3D_Color.frag ccShader_3D_Color.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_3D_ColorNormal.frag ccShader_3D_ColorNormal.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_3D_ColorNormalTex.frag ccShader_3D_ColorNormalTex.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_3D_ColorTex.frag ccShader_3D_ColorTex.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_3D_Particle.frag ccShader_3D_Particle.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_3D_Particle.vert ccShader_3D_Particle.vert.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_3D_PositionNormalTex.vert ccShader_3D_PositionNormalTex.vert.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_3D_PositionTex.vert ccShader_3D_PositionTex.vert.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_3D_Skybox.frag ccShader_3D_Skybox.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_3D_Skybox.vert ccShader_3D_Skybox.vert.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_3D_Terrain.frag ccShader_3D_Terrain.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_3D_Terrain.vert ccShader_3D_Terrain.vert.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_CameraClear.frag ccShader_CameraClear.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_CameraClear.vert ccShader_CameraClear.vert.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_ETC1AS_PositionTextureColor.frag ccShader_ETC1AS_PositionTextureColor.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_ETC1AS_PositionTextureGray.frag ccShader_ETC1AS_PositionTextureGray.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_Label.vert ccShader_Label.vert.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_Label_df.frag ccShader_Label_df.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_Label_df_glow.frag ccShader_Label_df_glow.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_Label_normal.frag ccShader_Label_normal.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_Label_outline.frag ccShader_Label_outline.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionColor.frag ccShader_PositionColor.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionColor.vert ccShader_PositionColor.vert.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionColorLengthTexture.frag ccShader_PositionColorLengthTexture.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionColorLengthTexture.vert ccShader_PositionColorLengthTexture.vert.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionColorTextureAsPointsize.vert ccShader_PositionColorTextureAsPointsize.vert.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionTexture.frag ccShader_PositionTexture.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionTexture.vert ccShader_PositionTexture.vert.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionTextureA8Color.frag ccShader_PositionTextureA8Color.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionTextureA8Color.vert ccShader_PositionTextureA8Color.vert.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionTextureColor.frag ccShader_PositionTextureColor.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionTextureColor.vert ccShader_PositionTextureColor.vert.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionTextureColorAlphaTest.frag ccShader_PositionTextureColorAlphaTest.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionTextureColor_noMVP.frag ccShader_PositionTextureColor_noMVP.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionTextureColor_noMVP.vert ccShader_PositionTextureColor_noMVP.vert.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionTexture_uColor.frag ccShader_PositionTexture_uColor.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionTexture_uColor.vert ccShader_PositionTexture_uColor.vert.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_Position_uColor.frag ccShader_Position_uColor.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_Position_uColor.vert ccShader_Position_uColor.vert.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_UI_Gray.frag ccShader_UI_Gray.frag.patch 

	# Engine tweaks that must be adjusted on a user basis -- must be enabled by the users. These change the behaviour of the engine in certain areas

	# Disable antialiasing globally for higher performance in general.
	# Pixel art looks better with this disabled.
	if [[ -n $COCOS2D_X_DISABLE_ANTIALIASING ]]; then
		msg "Disabling Antialiasing globally..."
		sed -e 's/_antialiasEnabled(true)/_antialiasEnabled(false)/g' -i "$srcdir"/$_appname-$pkgver/cocos/renderer/CCTexture2D.cpp
	fi

	# Disabled Multi-Sample Anti-Aliasing (MSAA) for higher performance
	if [[ -n $COCOS2D_X_DISABLE_MSAA ]]; then
		msg "Disabling MSAA globally..."
		# TODO: For Android
		# patch -s "$srcdir"/$_appname-$pkgver/cocos/platform/android/java/src/org/cocos2dx/lib/Cocos2dxActivity.java Cocos2dxActivity.java.patch

		# For Linux, Mac and Windows:
		patch -s "$srcdir"/$_appname-$pkgver/cocos/platform/desktop/CCGLViewImpl-desktop.cpp CCGLViewImpl-desktop.cpp.patch

		#iOS -- Not really necessary. Cocos2D-X, according to the documentation, requires iOS 7+ which are fairly new devices and disabling MSAA on those devices might not even increase performance. See http://gamesfromwithin.com/trying-out-multisampling-on-ios
		# There's some documentation here on working with iOS MSAA: https://developer.apple.com/library/content/documentation/3DDrawing/Conceptual/OpenGLES_ProgrammingGuide/WorkingwithEAGLContexts/WorkingwithEAGLContexts.html#//apple_ref/doc/uid/TP40008793-CH103-SW12
		# I might try implementing a patch for disabling MSAA on if I may need the performance boost. Leaving it on seems like the way to go for now.
	fi

	if [[ -n $COCOS2D_X_EXPERIMENTAL_FEATURES ]]; then
		warning "Enabling experimental features."
		# (EXPERIMENTAL) Enable high variable precision globaly in the shaders:
		# This can get rid of positioning and rendering artifacts but might affect performance on devices with a slow GPU.
		# See: https://github.com/cocos2d/cocos2d-x/issues/17046 and https://github.com/cocos2d/cocos2d-x/issues/17099
		# Until a proper patch gets developed, a simple 'sed' can set every variable from a medium precision (mediump) one to a high precision (highp) variable
		# Use at your own risk
		warning "Changing \"mediump\" to \"highp\" in shaders..."
		sed -i 's/mediump/highp/g' "$srcdir"/$_appname-$pkgver/cocos/renderer/*
	fi

	# Necessary libfmod symbolic link
	mkdir -p "$pkgdir/usr/lib"
	if [[ $CARCH == "x86_64" ]]; then
		mkdir -p "$pkgdir/usr/lib32"
		ln -sf /opt/cocos2d-x/external/linux-specific/fmod/prebuilt/64-bit/libfmod.so "$pkgdir/usr/lib/libfmod.so.6"
		ln -sf /opt/cocos2d-x/external/linux-specific/fmod/prebuilt/64-bit/libfmodL.so "$pkgdir/usr/lib/libfmodL.so.6"

		# 32-bit linux support was dropped.
		#ln -sf /opt/cocos2d-x/external/linux-specific/fmod/prebuilt/32-bit/libfmod.so "$pkgdir/usr/lib32/libfmod.so.6"
		#ln -sf /opt/cocos2d-x/external/linux-specific/fmod/prebuilt/32-bit/libfmodL.so "$pkgdir/usr/lib32/libfmodL.so.6"
	else
		ln -sf /opt/cocos2d-x/external/linux-specific/fmod/prebuilt/32-bit/libfmod.so "$pkgdir/usr/lib/libfmod.so.6"
		ln -sf /opt/cocos2d-x/external/linux-specific/fmod/prebuilt/32-bit/libfmodL.so "$pkgdir/usr/lib/libfmodL.so.6"
	fi

	# Update the file timestamps -- otherwise the build system will keep recompiling everything always:
	find "$srcdir"/$_appname-$pkgver -exec touch {} +

	# Set sdkbox python interpreter to python2
	sed -e 's/python/python2/g' -i "$srcdir"/$_appname-$pkgver/tools/cocos2d-console/plugins/plugin_package/sdkbox

	# Fix permissions:
	chmod 755 "$srcdir"/$_appname-$pkgver/tools/cocos2d-console/bin/cocos
	chmod 755 "$srcdir"/$_appname-$pkgver/tools/cocos2d-console/plugins/plugin_package/sdkbox

	# Package source
	mv "$srcdir"/$_appname-$pkgver/* "$pkgdir/opt/$_appname"
}
