BASEDIR=$(dirname $0)

$BASEDIR/configure_i386.sh
mkdir -p build-i386 && pushd build-i386 && gnumake && popd


$BASEDIR/configure_x86_64.sh
mkdir -p build-x86_64 && pushd build-x86_64 && gnumake && popd


$BASEDIR/configure_armv7.sh
mkdir -p build-armv7 && pushd build-armv7 && gnumake && popd

$BASEDIR/configure_armv7s.sh
mkdir -p build-armv7s && pushd build-armv7s && gnumake && popd

$BASEDIR/configure_arm64.sh
mkdir -p build-arm64 && pushd build-arm64 && gnumake && popd

echo "Combining i386, x86 64, armv7, armv7s, and arm64 libraries."

$BASEDIR/make_universal.sh
