#!/bin/sh

touch ChangeLog
mv INSTALL INSTALL.autogen.bak
autoreconf -f -i
mv INSTALL.autogen.bak INSTALL
rm ChangeLog

RANLIB=pnacl-ranlib AR=pnacl-ar CCLD=`pwd`/pnacl-fake-ld CC=pnacl-clang lib_cv_va_copy=yes lib_cv___va_copy=yes lib_cv_va_val_copy=yes ./configure --host=nacl "$@"

make
