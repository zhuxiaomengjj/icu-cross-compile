# Build icu for android and iOS from Mac
This document aim to record how to cross compile icu for android and iOS from Mac(host)
## Download [icu source][1], place it with in this directory with name 'icu'.
[1]: http://site.icu-project.org/download

Directory tree like:
<pre>
  icu-55_1/
  |-- icu/
  |   |-- as_is/
  |   |-- packaging/
  |   `-- source/
  `-- scripts/
      |-- android/
      `-- ios/
</pre> 

`icu-55_1` is our root dir, we name it `$ICU_ROOT` in bash files , `icu` is the original icu source dir(we download from internetand extract here). `scripts` dir stores our bash scripts.

## Build the host part
1. cd $ICU_ROOT
2. mkdir build-mac
3. ../scripts/build_icu_mac.sh

## Build for android
For example, we build for armeabi:
##### create standalone tool chain

```bash
$NDK/build/tools/make-standalone-toolchain.sh --platform=android-14 \
--install-dir=/tmp/my-android-toolchain \
--toolchain=arm-linux-androideabi-4.9 --stl=gnustl
```

##### build
1. cd $ICU_ROOT
2. mkdir -p build-android/armeabi && cd build-android/armeabi
3. ../../scripts/android/build_android_armeabi.sh

The similar process for armv7a x86 

## Build for iOS
1. cd $ICU_ROOT
2. mkdir -p build-ios && cd build-ios
3. ../../scripts/ios/build.sh

It will compile all targets libraries then  package them into one library set which
reside in build-ios/build-universal

Now the directory tree will like:
<pre>
  icu-55_1/
  |-- build-android/
  |   |-- armeabi/
  |   |-- armv7a/
  |   `-- x86/
  |-- build-ios/
  |   |-- build-arm64/
  |   |-- build-armv7/
  |   |-- build-armv7s/
  |   |-- build-i386/
  |   |-- build-universal/
  |   `-- build-x86_64/
  |-- build-mac/
  |-- icu/
  |   |-- as_is/
  |   |-- packaging/
  |   `-- source/
  `-- scripts/
      |-- android/
      `-- ios/
</pre>
