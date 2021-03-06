#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.68])
AC_INIT([micro-config-drive],[27],[ailis@paw.zone])
AM_INIT_AUTOMAKE([foreign -Wall -Wno-portability silent-rules subdir-objects color-tests no-dist-gzip dist-xz])
AC_CONFIG_SRCDIR([src/main.c])
AC_CONFIG_FILES([Makefile
		tests/Makefile])
AC_CONFIG_HEADERS([config.h])

LT_INIT
AC_CONFIG_MACRO_DIR([m4])

# Checks for programs.
AC_PROG_CC
AM_PROG_CC_C_O
AC_PROG_INSTALL
AC_PROG_MKDIR_P

# Add definitions
AC_DEFINE_UNQUOTED([SYSCONFDIR], ["$sysconfdir"], [Path to system configuration directory])

# Add options
AC_ARG_ENABLE(debug, AS_HELP_STRING([--enable-debug], [enable debug mode @<:@default=no@:>@]),
	      [], [enable_debug=no])
AS_IF([test "x$enable_debug" = "xyes"],
	[AC_DEFINE([DEBUG], [1], [Debugging mode enabled])],
	[AC_DEFINE([NDEBUG], [1], [Debugging and assertions disabled])])
AM_CONDITIONAL([DEBUG], [test x$enable_debug = x"yes"])

# Enable -Werror for harder flags.
AC_ARG_ENABLE(werror, AS_HELP_STRING([--enable-werror], [enable Werror @<:@default=no@:>@]),
	      [], [enable_werror=no])
AM_CONDITIONAL([ENABLE_WERROR], [test x$enable_werror = x"yes"])

AC_ARG_ENABLE(tests, AS_HELP_STRING([--disable-tests], [do not build unit tests @<:@default=no@:>@]),
	      [], [disable_tests=no])
AS_IF([test x"$disable_tests" = "xno"],
	[AC_SUBST([BUILD_TESTS], [1])],
	[AC_SUBST([BUILD_TESTS], [0])])
AM_CONDITIONAL([BUILD_TESTS], [test x$disable_tests = x"no"])

# Checks for libraries.
PKG_CHECK_MODULES([GLIB], [glib-2.0 >= 2.24.1])
PKG_CHECK_MODULES([YAML], [yaml-0.1 >= 0.1.4])
PKG_CHECK_MODULES([JSON_GLIB], [json-glib-1.0])
PKG_CHECK_MODULES([PARTED], [libparted >= 3.1])
PKG_CHECK_MODULES([BLKID], [blkid >= 2.25.0])

AS_IF([test $BUILD_TESTS = 1],
[PKG_CHECK_MODULES([CHECK], [check >= 0.9.14])]
)

# Checks for header files.
AC_CHECK_HEADERS([errno.h])
AC_CHECK_HEADERS([getopt.h])
AC_CHECK_HEADERS([glib.h])
AC_CHECK_HEADERS([stdarg.h])
AC_CHECK_HEADERS([stdbool.h])
AC_CHECK_HEADERS([stdio.h])
AC_CHECK_HEADERS([string.h])
AC_CHECK_HEADERS([stdlib.h])
AC_CHECK_HEADERS([sys/types.h])
AC_CHECK_HEADERS([unistd.h])
AC_CHECK_HEADERS([libgen.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_CHECK_HEADER_STDBOOL

# Checks for commands
AC_PATH_PROG([RESIZE2FS], [resize2fs], [no], [$PATH:/sbin:/usr/sbin])
if test x"$RESIZE2FS" == x"no" ; then
   AC_MSG_ERROR([Please install resize2fs.])
fi
AC_SUBST(RESIZE2FS)
AC_DEFINE_UNQUOTED([RESIZEFS_PATH], ["$RESIZE2FS"], [Path to resize2fs binary])

AC_PATH_PROG([SHELL], [sh], [no], [$PATH:/sbin:/usr/sbin])
if test x"$SHELL" == x"no" ; then
   AC_MSG_ERROR([Please install sh.])
fi
AC_SUBST(SHELL)
AC_DEFINE_UNQUOTED([SHELL_PATH], ["$SHELL"], [Path to sh binary])

AC_PATH_PROG([HOSTNAME], [hostname], [no], [$PATH:/sbin:/usr/sbin])
if test x"$HOSTNAME" == x"no" ; then
   AC_MSG_ERROR([Please install hostname.])
fi
AC_SUBST(HOSTNAME)
AC_DEFINE_UNQUOTED([HOSTNAME_PATH], ["$HOSTNAME"], [Path to hostname binary])

AC_PATH_PROG([PASSWD], [passwd], [no], [$PATH:/sbin:/usr/sbin])
if test x"$PASSWD" == x"no" ; then
   AC_MSG_ERROR([Please install passwd.])
fi
AC_SUBST(PASSWD)
AC_DEFINE_UNQUOTED([PASSWD_PATH], ["$PASSWD"], [Path to passwd binary])

AC_PATH_PROG([GROUPADD], [groupadd], [no], [$PATH:/sbin:/usr/sbin])
if test x"$GROUPADD" == x"no" ; then
   AC_MSG_ERROR([Please install groupadd.])
fi
AC_SUBST(GROUPADD)
AC_DEFINE_UNQUOTED([GROUPADD_PATH], ["$GROUPADD"], [Path to groupadd binary])

AC_PATH_PROG([USERMOD], [usermod], [no], [$PATH:/sbin:/usr/sbin])
if test x"$USERMOD" == x"no" ; then
   AC_MSG_ERROR([Please install usermod.])
fi
AC_SUBST(USERMOD)
AC_DEFINE_UNQUOTED([USERMOD_PATH], ["$USERMOD"], [Path to usermod binary])

AC_PATH_PROG([USERADD], [useradd], [no], [$PATH:/sbin:/usr/sbin])
if test x"$USERADD" == x"no" ; then
   AC_MSG_ERROR([Please install useradd.])
fi
AC_SUBST(USERADD)
AC_DEFINE_UNQUOTED([USERADD_PATH], ["$USERADD"], [Path to useradd binary])

# Options
AC_ARG_WITH([datadir],[AC_HELP_STRING([--with-datadir=DIR],
	[Default data directory (/var/lib/cloud)])], [datadir=${withval}],[datadir=/var/lib/cloud])
AC_SUBST([DATADIR], ["${datadir}"], [Default data directory])
AC_DEFINE_UNQUOTED([DATADIR_PATH], ["$DATADIR"], [Default data directory])

# Checks for library functions.

AC_OUTPUT
