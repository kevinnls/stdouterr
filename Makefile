.PHONY: all builddir configure compile clean test
build: prebuild configure compile

INSTALL = install
BUILD_DIR ?= build/
PREFIX ?= /usr/local/
DESTDIR ?= ${PREFIX}



SRC_DIR = src/
DOCS_DIR = docs/

BIN = stdouterr
MAN = ${BIN}.${man_category}
man_category = 1
CC_ARGS = "-I${SRC_DIR}lib"
bindir = ${DESTDIR}bin/
mandir = ${DESTDIR}share/man/${man_lang?:man_lang/}man${man_category}/

configure:
	@echo nothing to configure
prebuild: clean
	@mkdir ${BUILD_DIR}
clean:
	@rm -rf ${BUILD_DIR}
compile:
	$(CC) -o${BUILD_DIR}${BIN} ${SRC_DIR}main.c

preinstall:
	mkdir -p ${bindir}
	mkdir -p ${mandir}
install: preinstall
	$(INSTALL) ${BUILD_DIR}${BIN} ${bindir}${BIN}
	$(INSTALL) -m644 ${DOCS_DIR}${MAN} ${mandir}${MAN}
uninstall:
	rm ${bindir}${BIN}
	rm ${mandir}${MAN}

test:
	test/default.sh
test-run:
	test/stdouterr
