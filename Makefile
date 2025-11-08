bindir=		~/bin
bin_SCRIPTS=	# empty
bin_SCRIPTS+=	tunnel-usbmuxd

PAGER?=	less
lint:
	shellcheck ${bin_SCRIPTS} | ${PAGER}

install:
	mkdir -p ${bindir}
	for f in ${bin_SCRIPTS}; do \
		ln -f "$${f}" ${bindir}"/$${f}"; \
		chmod +x ${bindir}"/$${f}"; \
	done
