#!/bin/bash

cwd=$(pwd)

djinni \
  --java-out $cwd/java \
  --java-package com.example.jnigenpackage \
  --java-cpp-exception DbxException \
  --ident-java-field mFooBar\
\
  --cpp-out $cwd/cpp \
\
  --jni-out $cwd/jni \
  --ident-jni-class NativeFooBar \
\
  --objc-out $cwd/objc \
  --objc-type-prefix DB \
\
  --objcpp-out $cwd/objcpp \
\
  --idl $1

