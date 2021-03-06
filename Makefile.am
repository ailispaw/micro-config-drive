SUBDIRS = . tests

ACLOCAL_AMFLAGS=-I m4

AM_CPPFLAGS = -I $(top_srcdir)/src -I $(top_srcdir)/src/interpreters -I $(top_srcdir)/src/datasources
AM_CFLAGS = \
        -fstack-protector -Wall -pedantic \
        -Wstrict-prototypes -Wundef -fno-common \
        -Werror-implicit-function-declaration \
        -Wformat -Wformat-security -Werror=format-security \
        -Wconversion -Wunused-variable -Wunreachable-code \
        -Wall -W -std=gnu99

EXTRA_DIST = \
	LICENSE \
	COPYING

DISTCHECK_CONFIGURE_FLAGS = --enable-debug

dist_man_MANS = \
	docs/ucd.1 \
	docs/cloud-config.5

bin_PROGRAMS = \
	ucd \
	ucd-aws

ucd_SOURCES = \
	src/ccmodules.h \
	src/ccmodules/groups.c \
	src/ccmodules/ssh_authorized_keys.c \
	src/ccmodules/users.c \
	src/ccmodules/write_files.c \
	src/ccmodules/hostname.c \
	src/ccmodules/runcmd.c \
	src/ccmodules/envar.c \
	src/ccmodules/fbootcmd.c \
	src/datasources.h \
	src/datasources/openstack.c \
	src/datasources/openstack.h \
	src/debug.h \
	src/default_user.h \
	src/handlers.h \
	src/interpreters.h \
	src/interpreters/cloud_config.c \
	src/interpreters/cloud_config.h \
	src/interpreters/shell_script.c \
	src/json.c \
	src/json.h \
	src/lib.c \
	src/lib.h \
	src/main.c \
	src/userdata.c \
	src/userdata.h \
	src/disk.c \
	src/disk.h \
	src/async_task.c \
	src/async_task.h

ucd_aws_SOURCES = \
	src/ucd-aws.c

if ENABLE_WERROR
AM_CFLAGS += -Werror
endif
if DEBUG
AM_CFLAGS += -ggdb3 -O0
ucd_SOURCES += src/debug.c
endif

ucd_CFLAGS = $(AM_CFLAGS) $(GLIB_CFLAGS) $(YAML_CFLAGS) $(JSON_GLIB_CFLAGS) $(PARTED_CFLAGS) $(BLKID_CFLAGS)
ucd_LDADD = $(GLIB_LIBS) $(YAML_LIBS) $(JSON_GLIB_LIBS) $(PARTED_LIBS) $(BLKID_LIBS)

ucd_aws_CFLAGS = $(AM_CFLAGS)
