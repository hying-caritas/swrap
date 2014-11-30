
prefix = /usr
bin_dir = ${prefix}/bin
cmd_dir = ${prefix}/lib/swrap
doc_dir = ${prefix}/share/doc/swrap

cmds = bash emacs screen rlwrap

all:

install:
	install -d ${bin_dir}
	install -m 0755 swrap ${bin_dir}
	install -m 0755 sscreen ${bin_dir}
	install -m 0755 semacs ${bin_dir}
	install -d ${cmd_dir}
	for cmd in ${cmds}; do \
		install -m 0644 $$cmd ${cmd_dir}; \
	done
	install -d ${doc_dir}
	find . -type f -name '.bash_history' | xargs rm -f
	cp -r example ${doc_dir}
	install -m 0644 README ${doc_dir}

distclean:
	find . -name '*~' | xargs rm -f
	find . -type f -name '.bash_history' | xargs rm -f
