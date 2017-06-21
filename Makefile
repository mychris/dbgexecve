include config.mk

SRC = dbgexecve.c
PROG = dbgexecve

BINDIR := ${DESTDIR}${PREFIX}/bin
MANDIR := ${DESTDIR}${MANPREFIX}/man1

all: ${PROG} ${PROG}.1.gz README.txt

${PROG}: ${SRC} config.mk
	${CC} ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} ${SRC} -o $@

${PROG}.1.gz: ${PROG}.1
	sed 's/VERSION/${VERSION}/g' ${PROG}.1 | gzip -c - >| $@

README.txt: ${PROG}.1.gz
	gzip -d -c ${PROG}.1.gz | groff -k -Tutf8 -m man | col -b -x >| $@

install: all
	mkdir -p ${BINDIR}
	cp -f ${PROG} ${BINDIR}
	chmod 755 ${BINDIR}/${PROG}
	mkdir -p ${MANDIR}
	cp -f ${PROG}.1.gz ${MANDIR}
	chmod 644 ${MANDIR}/${PROG}.1.gz

uninstall:
	rm -f ${BINDIR}/${PROG} ${MANDIR}/${PROG}.1.gz

clean:
	rm -f ${PROG} ${PROG}.1.*

.PHONY: all clean install uninstall
