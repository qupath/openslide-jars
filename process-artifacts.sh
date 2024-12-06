mkdir -p build
pushd build

mkdir -p darwin-aarch64 darwin-x86-64 linux-x86-64 win32-x86-64 linux-aarch64 licenses
cp ../artifacts/linux-x86_64/libopenslide.so linux-x86-64
cp ../artifacts/linux-aarch64/libopenslide.so linux-aarch64
cp ../artifacts/macos-arm64-x86_64/libopenslide.dylib darwin-aarch64
cp ../artifacts/macos-arm64-x86_64/libopenslide.dylib darwin-x86-64
cp ../artifacts/windows-x64/libopenslide*.dll win32-x86-64/openslide.dll
cp -r ../downloads/openslide-bin-*-linux-x86_64/licenses/* licenses
cp -r ../downloads/openslide-bin-*-macos-arm64-x86_64/licenses/* licenses
cp -r ../downloads/openslide-bin-*-windows-x64/licenses/* licenses

jar cvf openslide-natives-darwin-aarch64.jar darwin-aarch64 licenses
jar cvf openslide-natives-darwin-x86-64.jar darwin-x86-64 licenses
jar cvf openslide-natives-linux-x86-64.jar linux-x86-64 licenses
jar cvf openslide-natives-linux-aarch64.jar linux-aarch64 licenses
jar cvf openslide-natives-win32-x86-64.jar win32-x86-64 licenses
jar cvf openslide-natives.jar linux-x86-64 linux-aarch64 darwin-x86-64 darwin-aarch64 win32-x86-64 licenses

popd
