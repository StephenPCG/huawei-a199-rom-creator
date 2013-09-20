libext4_utils_src_files := \
    make_ext4fs.c \
    ext4fixup.c \
    ext4_utils.c \
    allocate.c \
    contents.c \
    extent.c \
    indirect.c \
    uuid.c \
    sha1.c \
    wipe.c

libext4_utils_src_obj := $(libext4_utils_src_files:.c=.o)

ext2simg_src_files := \
	ext2simg.c

ext2simg_src_obj := $(ext2simg_src_files:.c=.o)

make_ext4fs_src_files := \
	make_ext4fs_main.c

make_ext4fs_src_obj := $(make_ext4fs_src_files:.c=.o)

all: ext2simg make_ext4fs simg2img simg2simg img2simg

%.o: %.c
	gcc -I. -Ilibsparse/include -DANDROID -c $<

libsparse/libsparse.a:
	$(MAKE) -C libsparse

simg2img: libsparse/libsparse.a
	ln -s libsparse/simg2img .

simg2simg: libsparse/libsparse.a
	ln -s libsparse/simg2simg .

img2simg: libsparse/libsparse.a
	ln -s libsparse/img2simg .

ext2simg: $(libext4_utils_src_obj) $(ext2simg_src_obj) libsparse/libsparse.a
	gcc $^ -o $@ -Llibsparse -lsparse -lz

make_ext4fs: $(libext4_utils_src_obj) $(make_ext4fs_src_obj) libsparse/libsparse.a
	gcc $^ -o $@ -Llibsparse -lsparse -lz

.PHONY: clean clobber
clean:
	rm -rf *.o ext2simg make_ext4fs simg2img
clobber: clean
	$(MAKE) -C libsparse clean
