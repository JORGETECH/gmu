# Generated Gmu config
SDLFE_WITHOUT_SDL_GFX=1
CC=mipsel-linux-gcc
SDL_CFLAGS=-I/opt/rs97tools/mipsel-RetroFW-linux-uclibc/sysroot/usr/include/SDL -D_GNU_SOURCE=1 -D_REENTRANT
SDL_LIB=-L/opt/rs97tools/mipsel-RetroFW-linux-uclibc/sysroot/usr/lib -lSDL -lpthread
CFLAGS= -I/opt/rs97tools/mipsel-RetroFW-linux-uclibc/sysroot/usr/include $(SDL_CFLAGS) -fsigned-char -D_REENTRANT -DUSE_MEMORY_H  -DFILE_HW_H="\"hw_dingux.h\""
LFLAGS=   -Wl,-export-dynamic
LFLAGS_CORE=
LIBS_CORE= -ldl
DECODERS_TO_BUILD= decoders/opus.so decoders/mpg123.so decoders/flac.so decoders/speex.so decoders/wavpack.so decoders/modplug.so decoders/vorbis.so
FRONTENDS_TO_BUILD= frontends/sdl.so frontends/log.so
TARGET=dingux
TOOLS_TO_BUILD= gmu.bin

DEC_opus_CFLAGS=-I/opt/rs97tools/mipsel-RetroFW-linux-uclibc/sysroot/usr/include/opus

DISTFILES          = \
                     $(BINARY) frontends decoders themes \
                     libs.dingux \
                     gmu.png README.txt COPYING \
                     htdocs \
                     gmu.dge gmuinput.dingux.conf \
