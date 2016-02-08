#!/bin/bash
case "$1" in
	version)
		echo "go version go1.6 linux/amd64"
		exit 0
		;;
esac
export CGO_ENABLED=1
export PATH=/opt/go-cross/osx/bin:/opt/go-cross/ndk-x86/bin:/opt/go-cross/ndk-arm64/bin:/opt/go-cross/ndk-arm/bin:$PATH
export GOOS=${GOOS-linux}
export GOARCH=${GOARCH-amd64}
export CGO_LDFLAGS="-L/opt/go-cross/lib/$GOOS-$GOARCH"
export CGO_CFLAGS="-I/opt/go-cross/include/$GOOS-$GOARCH"
case "$GOOS" in
	windows)
		case "$GOARCH" in
			amd64)
				export CC=x86_64-w64-mingw32-gcc 
				export CXX=x86_64-w64-mingw32-g++ 
				export CGO_LDFLAGS="-Wl,--allow-multiple-definition -L/opt/go-cross/lib/$GOOS-$GOARCH"
				;;
			386)
				export CC=i686-w64-mingw32-gcc 
				export CXX=i686-w64-mingw32-g++ 
				export CGO_LDFLAGS="-Wl,--allow-multiple-definition -L/opt/go-cross/lib/$GOOS-$GOARCH"
				;;
		esac
		;;
	darwin)
		case "$GOARCH" in
			amd64)
				export CC=o64-clang 
				export CXX=o64-clang++ 
				;;
			386)
				export CC=o32-clang 
				export CXX=o32-clang++ 
				;;
		esac
		;;
	linux)
		case "$GOARCH" in
			amd64)
				export CC=x86_64-unknown-linux-gnu-gcc 
				export CXX=x86_64-unknown-linux-gnu-g++ 
				;;
			386)
				export CC="x86_64-unknown-linux-gnu-gcc -m32 -march=i686"
				export CXX="x86_64-unknown-linux-gnu-g++ -m32 -march=i686"
				;;
		esac
		;;
	android)
		case "$GOARCH" in
			386)
				export CC=i686-linux-android-gcc 
				export CXX=i686-linux-android-gcc++ 
				;;
			arm)
				export CC=arm-linux-androideabi-gcc 
				export CXX=arm-linux-androideabi-gcc++ 
				;;
			arm64)
				export CC=aarch64-linux-android-gcc 
				export CXX=aarch64-linux-android-gcc++ 
				;;
		esac
		;;
esac
exec /usr/bin/real-go "$@"
