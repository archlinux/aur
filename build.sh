set -e

# Generate the stdlib modules.cpp file
rm -rf lute/std/src/generated
mkdir -p lute/std/src/generated

cp ./tools/templates/std_impl.cpp ./lute/std/src/generated/modules.cpp
cp ./tools/templates/std_header.h ./lute/std/src/generated/modules.h

# Generate the clicommands modules.cpp file
rm -rf lute/cli/generated
mkdir -p lute/cli/generated

cp ./tools/templates/cli_impl.cpp ./lute/cli/generated/commands.cpp
cp ./tools/templates/cli_header.h ./lute/cli/generated/commands.h

## Configure bootstrap lute - lute stdlib
BUILD_PATH=build/debug
EXE_PATH=lute/cli/lute
OUT_BINARY=./build/bootstrapped-lute

rm -rf build && mkdir build
cmake -G=Ninja -B $BUILD_PATH -DCMAKE_BUILD_TYPE=Debug

# Compile bootstrapping lute
ninja -C $BUILD_PATH $EXE_PATH
echo ""
echo "Successfully built the bootstrapped lute - std"

# Use bootstrapped lute to build lute with standard libraries included
BOOTSTRAPPED_LUTE=./$BUILD_PATH/$EXE_PATH

mv $BOOTSTRAPPED_LUTE $OUT_BINARY
$OUT_BINARY tools/luthier.luau build --clean lute
