BASEDIR=$(dirname $0)
source "$BASEDIR/setting_root.sh" # which import $ICU_ROOT
# Your standalone toolchain root:
export NDK_STANDALONE_TOOLCHAIN_ROOT=/tmp/my-android-toolchain
export AR=$NDK_STANDALONE_TOOLCHAIN_ROOT/bin/i686-linux-android-ar
#export ANDROIDVER=21
export HOST_ICU=$PWD
export ICU_CROSS_BUILD=$ICU_ROOT/build-mac
export COMMONFLAGS="-I$NDK_STANDALONE_TOOLCHAIN_ROOT/sysroot/usr/include/ \
-O3 -DU_USING_ICU_NAMESPACE=1 \
-DU_HAVE_NL_LANGINFO_CODESET=0 -D__STDC_INT64__ -DU_TIMEZONE=0 \
-DUCONFIG_NO_LEGACY_CONVERSION=1 -DUCONFIG_NO_BREAK_ITERATION=1 \
-DUCONFIG_NO_COLLATION=0 -DUCONFIG_NO_FORMATTING=0 -DUCONFIG_NO_TRANSLITERATION=0 \
-DUCONFIG_NO_REGULAR_EXPRESSIONS=1"
export CFLAGS=$COMMONFLAGS
export CPPFLAGS=$COMMONFLAGS
export LDFLAGS="-lc -lstdc++"

export PATH=$PATH:$NDK_STANDALONE_TOOLCHAIN_ROOT/bin

sh $ICU_ROOT/icu/source/configure --with-cross-build=$ICU_CROSS_BUILD \
--enable-extras=yes --enable-strict=no --enable-static=yes --enable-shared=no \
--enable-tests=no --enable-samples=no --enable-dyload=no --enable-renaming=no \
--host=i686-linux-android --prefix=$PWD/icu_build --with-data-packaging=files
make -j4
