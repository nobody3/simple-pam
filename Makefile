all: bin/mypam.so bin/test.elf

clear:
	-rm bin/*

test: all
	bin/test.elf

bin/%.o-lib : src/%.c
	gcc -fPIC -fno-stack-protector -c $< -o $@

bin/%.so : bin/%.o-lib
	gcc -shared -fPIC $< -o $@

bin/%.elf : src/%.c
	g++ $< -o $@ -lpam -lpam_misc
