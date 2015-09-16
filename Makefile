all: bin/mypam.so bin/test.elf

install: all
	install bin/mypam.so /lib/security/mypam.so
	install bin/test.elf /usr/local/bin/pam-test

clear:
	-rm bin/*

bin/%.o-lib : src/%.c
	gcc -fPIC -fno-stack-protector -c $< -o $@

bin/%.so : bin/%.o-lib
	gcc -shared -fPIC $< -o $@

bin/%.elf : src/%.c
	g++ $< -o $@ -lpam -lpam_misc

