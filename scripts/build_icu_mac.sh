#mkdir -p build-mac
#cd build-mac
export CFLAGS="-O3 -DU_USING_ICU_NAMESPACE=1 \
-DU_HAVE_NL_LANGINFO_CODESET=0 -D__STDC_INT64__ -DU_TIMEZONE=0 \
-DUCONFIG_NO_LEGACY_CONVERSION=1 -DUCONFIG_NO_BREAK_ITERATION=1 \
-DUCONFIG_NO_COLLATION=0 -DUCONFIG_NO_FORMATTING=0 -DUCONFIG_NO_TRANSLITERATION=0 \
-DUCONFIG_NO_REGULAR_EXPRESSIONS=1"
export CPPFLAGS=$CFLAGS

sh ../icu/source/runConfigureICU MacOSX --prefix=$PWD/icu_build --enable-extras=yes \
--enable-strict=no --enable-static --enable-shared=no --enable-tests=yes --disable-renaming \
--enable-samples=no --enable-dyload=no --with-data-packaging=files

make -j4
make install

