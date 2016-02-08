#!/bin/bash
case "$1" in
	version)
		echo "go version go1.6 linux/amd64"
		exit 0
		;;
esac
export CGO_ENABLED=1
export PATH=/opt/go-cross/osx/bin:/opt/go-cross/ndk-x86/bin:/opt/go-cross/ndk-arm64/bin:/opt/go-cross/ndk-arm/bin:$PATH
case "$GOOS" in
	windows)
		case "$GOARCH" in
			amd64)
				export CC="x86_64-w64-mingw32-gcc -I/opt/go-cross/include/$GOOS-$GOARCH -L/opt/go-cross/lib/$GOOS-$GOARCH" 
				export CXX="x86_64-w64-mingw32-g++ -I/opt/go-cross/include/$GOOS-$GOARCH -L/opt/go-cross/lib/$GOOS-$GOARCH"
				;;
			386)
				export CC="i686-w64-mingw32-gcc -I/opt/go-cross/include/$GOOS-$GOARCH -L/opt/go-cross/lib/$GOOS-$GOARCH"
				export CXX="i686-w64-mingw32-g++ -I/opt/go-cross/include/$GOOS-$GOARCH -L/opt/go-cross/lib/$GOOS-$GOARCH"
				;;
		esac
		;;
	darwin)
		case "$GOARCH" in
			amd64)
				export CC="o64-clang -I/opt/go-cross/include/$GOOS-$GOARCH -L/opt/go-cross/lib/$GOOS-$GOARCH"
				export CXX="o64-clang++ -I/opt/go-cross/include/$GOOS-$GOARCH -L/opt/go-cross/lib/$GOOS-$GOARCH"
				;;
			386)
				export CC="o32-clang -I/opt/go-cross/include/$GOOS-$GOARCH -L/opt/go-cross/lib/$GOOS-$GOARCH"
				export CXX="o32-clang++ -I/opt/go-cross/include/$GOOS-$GOARCH -L/opt/go-cross/lib/$GOOS-$GOARCH"
				;;
		esac
		;;
	linux)
		case "$GOARCH" in
			amd64)
				export CC="x86_64-unknown-linux-gnu-gcc -I/opt/go-cross/include/$GOOS-$GOARCH -L/opt/go-cross/lib/$GOOS-$GOARCH"
				export CXX="x86_64-unknown-linux-gnu-g++ -I/opt/go-cross/include/$GOOS-$GOARCH -L/opt/go-cross/lib/$GOOS-$GOARCH"
				;;
			386)
				export CC="x86_64-unknown-linux-gnu-gcc -m32 -march=i686 -I/opt/go-cross/include/$GOOS-$GOARCH -L/opt/go-cross/lib/$GOOS-$GOARCH"
				export CXX="x86_64-unknown-linux-gnu-g++ -m32 -march=i686 -I/opt/go-cross/include/$GOOS-$GOARCH -L/opt/go-cross/lib/$GOOS-$GOARCH"
				;;
		esac
		;;
	android)
		case "$GOARCH" in
			386)
				export CC="i686-linux-android-gcc -I/opt/go-cross/include/$GOOS-$GOARCH -L/opt/go-cross/lib/$GOOS-$GOARCH"
				export CXX="i686-linux-android-gcc++ -I/opt/go-cross/include/$GOOS-$GOARCH -L/opt/go-cross/lib/$GOOS-$GOARCH"
				;;
			arm)
				export CC="arm-linux-androideabi-gcc -I/opt/go-cross/include/$GOOS-$GOARCH -L/opt/go-cross/lib/$GOOS-$GOARCH"
				export CXX="arm-linux-androideabi-gcc++ -I/opt/go-cross/include/$GOOS-$GOARCH -L/opt/go-cross/lib/$GOOS-$GOARCH"
				;;
			arm64)
				export CC="aarch64-linux-android-gcc -I/opt/go-cross/include/$GOOS-$GOARCH -L/opt/go-cross/lib/$GOOS-$GOARCH"
				export CXX="aarch64-linux-android-gcc++ -I/opt/go-cross/include/$GOOS-$GOARCH -L/opt/go-cross/lib/$GOOS-$GOARCH"
				;;
		esac
		;;
esac
exec /usr/bin/real-go "$@"
