# Mantainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Submitter: Samuel FORGIONE <samuel.forgione@gmail.com>

_appname=cocos2d-x
pkgname=cocos2d-x-src
pkgver=3.14
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
"CMakeLists.patch"
"CCPhysicsBody.patch"
"HelloWorldScene.cpp.patch"
"HelloWorldScene.h.patch"
"ccShader_3D_Color.frag.patch"
"ccShader_3D_ColorNormal.frag.patch"
"ccShader_3D_ColorNormalTex.frag.patch"
"ccShader_3D_ColorTex.frag.patch"
"ccShader_3D_Particle.frag.patch"
"ccShader_3D_Particle.vert.patch"
"ccShader_3D_PositionNormalTex.vert.patch"
"ccShader_3D_PositionTex.vert.patch"
"ccShader_3D_Skybox.frag.patch"
"ccShader_3D_Skybox.vert.patch"
"ccShader_3D_Terrain.frag.patch"
"ccShader_3D_Terrain.vert.patch"
"ccShader_CameraClear.frag.patch"
"ccShader_CameraClear.vert.patch"
"ccShader_ETC1AS_PositionTextureColor.frag.patch"
"ccShader_ETC1AS_PositionTextureGray.frag.patch"
"ccShader_Label_df.frag.patch"
"ccShader_Label_df_glow.frag.patch"
"ccShader_Label_normal.frag.patch"
"ccShader_Label_outline.frag.patch"
"ccShader_Label.vert.patch"
"ccShader_PositionColor.frag.patch"
"ccShader_PositionColorLengthTexture.frag.patch"
"ccShader_PositionColorLengthTexture.vert.patch"
"ccShader_PositionColorTextureAsPointsize.vert.patch"
"ccShader_PositionColor.vert.patch"
"ccShader_PositionTextureA8Color.frag.patch"
"ccShader_PositionTextureA8Color.vert.patch"
"ccShader_PositionTextureColorAlphaTest.frag.patch"
"ccShader_PositionTextureColor.frag.patch"
"ccShader_PositionTextureColor_noMVP.frag.patch"
"ccShader_PositionTextureColor_noMVP.vert.patch"
"ccShader_PositionTextureColor.vert.patch"
"ccShader_PositionTexture.frag.patch"
"ccShader_PositionTexture_uColor.frag.patch"
"ccShader_PositionTexture_uColor.vert.patch"
"ccShader_PositionTexture.vert.patch"
"ccShader_Position_uColor.frag.patch"
"ccShader_Position_uColor.vert.patch"
"ccShader_UI_Gray.frag.patch"
)
sha1sums=(
'f510ae35c078d602d53f0c203be971d6fa4efdd3'
'2cff669a51b66d513824be811688aa9da553e400'
'353bdefe07bdb6eb7f53aff20d20e83b488c1c05'
'49b7919fc38803c1dd2f5b1d47fb0c75fde1fec6'
'bcad039c11e29d4cbae9e371cb428d52f2eb15ff'
'281f4c79226a94bf5d1152ccfc7f2d2bb71a2c87'
'2c6801bae13956394ddcd94080861aac8a25be99'
'0d70b91142ceece19d90a620c707cb5f86f45d32'
'49838c03951aa76524fb651dcb78834393a17682'
'de5b8e9c89ead0ecffce6bc1450adf06e5c7e218'
'7ffd26e2235ef54c854b079a0f8b3cd697d8c0d1'
'f02f01ec38f0e1a5eb71078a612628c2e11a1413'
'49eeda555783089778035ed124e6759abdea1b62'
'c7fe0a570aebe7d4eda2fb263246823265642395'
'd45e1c0b739087f9f82d9b1f871403764e4530e4'
'356bca989f7861cff720ecd3a53f52fd1a0315af'
'fa45ba55634b3af6fae6a1ad6a24abb51343f68b'
'7ecd7bf3504f7b90bdaaee4994a44d102884e585'
'91e32c7333705620803b058d9c5efd04d84e17ab'
'6dbe3874af5295ccf48c9340be9426ef2e5e3760'
'3e8c0f635f853d56901f625375d02c13458da087'
'92d4fe63b27e5cf90ca1ce44cc25ede1ba94d234'
'fca5767e100a3af23eb65f731c93f415d69dcb05'
'4d971dd9f306f1ffad5f6203ecb8b1074543f926'
'32fe66982514e9e3b5743c31673990d0d5c39d4f'
'e08916384e815c551fb06c409ecb8a796b0eaf2d'
'f09d34eba8ee67eb4a003829b6a3e5c7abcdd682'
'c16f73e553d373aa5a6c64bc2a7a64273ca073c6'
'52c7eb7fd0bb5c436578d6ba11359b0dd5f54ff0'
'4b7925d294703e718e8627d807ed0f356b4828f0'
'a2ff2f92cf8a535e37b64278161fd1ce3d679588'
'c388ab06b5639d9fd5d179990cf03dabb470b356'
'1d7dc7ea26aa75750e883ec31fbbb1b9c54d6174'
'2a08b8532a42bb7fd647c3e01b803516430ad327'
'02e5f3695ead2d34d7ad4013b2246cddbfbed863'
'f83994a7da0311c193f3b3578ac59dc83d9f9700'
'4c1b8cd3779ffea607ffff6b59e272b938b6acd4'
'eae2679bc313b4368bfbf180f98985df71a9b3f9'
'6837a4bb47269a17bdb498072670abcd5f437388'
'4f93f13d4b8c6369fe97f94bed50e5d9649a7eda'
'64b951ec9c2453fca2348a8a2bde483ada4a11f7'
'43bbb35ed1e1c28f14a4ea333c463b87641e8238'
'399ffc785562ee9ce25fb4b3dadb96fcc70bcfc6'
'4d65c632745df2772f7c2c9507ba8bc228865c97'
'166a5e48711c6c8f329af275e4a6e0a0203052df'
'd8e81b49baec4fd9e04822e1c460dd43f85762bb'
'ea81b894221a8cf42bd6eecd1ced44fff27ad5f4'
'c8caec1e9626d222c67a7c883c8cb94101799956'
)


prepare() {
	cd "$srcdir"/$_appname-$pkgver
	chmod +x "download-deps.py"
	python2 "download-deps.py" -r yes
}


package() {
	install -d "$pkgdir/opt/$_appname"
	install -Dm644 "README" "$pkgdir/opt/$_appname/README"
	install -Dm755 "$_appname.sh" "$pkgdir/etc/profile.d/$_appname.sh"
	install -Dm755 "$_appname.csh" "$pkgdir/etc/profile.d/$_appname.csh"

	# Make sure COCOS2D_DEBUG spans libcocos2d correctly: https://github.com/cocos2d/cocos2d-x/pull/17033
	patch -s "$srcdir"/$_appname-$pkgver/templates/cpp-template-default/CMakeLists.txt CMakeLists.patch

	# Layer has been deprecated. Update the C++ templates: https://github.com/cocos2d/cocos2d-x/pull/17048
	patch -s "$srcdir"/$_appname-$pkgver/templates/cpp-template-default/Classes/HelloWorldScene.cpp HelloWorldScene.cpp.patch
	patch -s "$srcdir"/$_appname-$pkgver/templates/cpp-template-default/Classes/HelloWorldScene.h HelloWorldScene.h.patch

	# Allow Chipmunk's kinematic bodies to be moved: https://github.com/cocos2d/cocos2d-x/pull/17033
	patch -s "$srcdir"/$_appname-$pkgver/cocos/physics/CCPhysicsBody.cpp CCPhysicsBody.patch

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
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_Label_df.frag ccShader_Label_df.frag.patch
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_Label_df_glow.frag ccShader_Label_df_glow.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_Label_normal.frag ccShader_Label_normal.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_Label_outline.frag ccShader_Label_outline.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_Label.vert ccShader_Label.vert.patch
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionColor.frag ccShader_PositionColor.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionColorLengthTexture.frag ccShader_PositionColorLengthTexture.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionColorLengthTexture.vert ccShader_PositionColorLengthTexture.vert.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionColorTextureAsPointsize.vert ccShader_PositionColorTextureAsPointsize.vert.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionColor.vert ccShader_PositionColor.vert.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionTextureA8Color.frag ccShader_PositionTextureA8Color.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionTextureA8Color.vert ccShader_PositionTextureA8Color.vert.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionTextureColorAlphaTest.frag ccShader_PositionTextureColorAlphaTest.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionTextureColor.frag ccShader_PositionTextureColor.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionTextureColor_noMVP.frag ccShader_PositionTextureColor_noMVP.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionTextureColor_noMVP.vert ccShader_PositionTextureColor_noMVP.vert.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionTextureColor.vert ccShader_PositionTextureColor.vert.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionTexture.frag ccShader_PositionTexture.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionTexture_uColor.frag ccShader_PositionTexture_uColor.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionTexture_uColor.vert ccShader_PositionTexture_uColor.vert.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_PositionTexture.vert ccShader_PositionTexture.vert.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_Position_uColor.frag ccShader_Position_uColor.frag.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_Position_uColor.vert ccShader_Position_uColor.vert.patch 
	patch -s "$srcdir"/$_appname-$pkgver/cocos/renderer/ccShader_UI_Gray.frag ccShader_UI_Gray.frag.patch

	# Necessary libfmod symbolic link
	mkdir -p "$pkgdir/usr/lib"
	if [[ $CARCH == "x86_64" ]]; then
		ln -sf /opt/cocos2d-x/external/linux-specific/fmod/prebuilt/64-bit/libfmod.so "$pkgdir/usr/lib/libfmod.so.6"
		ln -sf /opt/cocos2d-x/external/linux-specific/fmod/prebuilt/64-bit/libfmodL.so "$pkgdir/usr/lib/libfmodL.so.6"
	else
		ln -sf /opt/cocos2d-x/external/linux-specific/fmod/prebuilt/32-bit/libfmod.so "$pkgdir/usr/lib32/libfmod.so.6"
		ln -sf /opt/cocos2d-x/external/linux-specific/fmod/prebuilt/32-bit/libfmodL.so "$pkgdir/usr/lib32/libfmodL.so.6"
	fi

	# Set sdkbox python interpreter to python2
	sed -e 's/python/python2/g' -i "$srcdir"/$_appname-$pkgver/tools/cocos2d-console/plugins/plugin_package/sdkbox

	# Fix permissions:
	chmod 755 "$srcdir"/$_appname-$pkgver/tools/cocos2d-console/bin/cocos
	chmod 755 "$srcdir"/$_appname-$pkgver/tools/cocos2d-console/plugins/plugin_package/sdkbox

	# Package source
	mv "$srcdir"/$_appname-$pkgver/* "$pkgdir/opt/$_appname"
}
