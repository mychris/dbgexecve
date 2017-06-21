
PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man

CPPFLAGS = -DNDEBUG
CFLAGS = -std=c99 -pedantic -O2 \
	-Wall -Wextra -Werror \
	-Wno-deprecated-declarations -Wconversion -Wshadow \
	-Wunreachable-code
LDFLAGS = -static

CC = gcc
SHELL = /bin/sh

