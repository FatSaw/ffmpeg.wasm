#!/bin/bash

set -euo pipefail

CONF_FLAGS=(

  --disable-indevs
  --disable-outdevs

  --disable-network

  --disable-iconv
  --disable-bsfs

  --disable-videotoolbox
  --disable-audiotoolbox

  --disable-muxers
  --enable-muxer=ogg

  --disable-encoders
  --enable-encoder=vorbis

  --disable-demuxers
  --enable-demuxer=image2
  --enable-demuxer=aac
  --enable-demuxer=ac3
  --enable-demuxer=aiff
  --enable-demuxer=ape
  --enable-demuxer=asf
  --enable-demuxer=au
  --enable-demuxer=avi
  --enable-demuxer=flac
  --enable-demuxer=flv
  --enable-demuxer=matroska
  --enable-demuxer=mov
  --enable-demuxer=m4v
  --enable-demuxer=mp3
  --enable-demuxer=mpc
  --enable-demuxer=mpc8
  --enable-demuxer=ogg
  --enable-demuxer=pcm_alaw
  --enable-demuxer=pcm_mulaw
  --enable-demuxer=pcm_f64be
  --enable-demuxer=pcm_f64le
  --enable-demuxer=pcm_f32be
  --enable-demuxer=pcm_f32le
  --enable-demuxer=pcm_s32be
  --enable-demuxer=pcm_s32le
  --enable-demuxer=pcm_s24be
  --enable-demuxer=pcm_s24le
  --enable-demuxer=pcm_s16be
  --enable-demuxer=pcm_s16le
  --enable-demuxer=pcm_s8
  --enable-demuxer=pcm_u32be
  --enable-demuxer=pcm_u32le
  --enable-demuxer=pcm_u24be
  --enable-demuxer=pcm_u24le
  --enable-demuxer=pcm_u16be
  --enable-demuxer=pcm_u16le
  --enable-demuxer=pcm_u8
  --enable-demuxer=rm
  --enable-demuxer=shorten
  --enable-demuxer=tak
  --enable-demuxer=tta
  --enable-demuxer=wav
  --enable-demuxer=wv
  --enable-demuxer=xwma
  --enable-demuxer=dsf

  --disable-decoders
  --enable-decoder=aac
  --enable-decoder=aac_latm
  --enable-decoder=ac3
  --enable-decoder=alac
  --enable-decoder=als
  --enable-decoder=ape
  --enable-decoder=atrac1
  --enable-decoder=atrac3
  --enable-decoder=eac3
  --enable-decoder=flac
  --enable-decoder=gsm
  --enable-decoder=gsm_ms
  --enable-decoder=mp1
  --enable-decoder=mp1float
  --enable-decoder=mp2
  --enable-decoder=mp2float
  --enable-decoder=mp3
  --enable-decoder=mp3adu
  --enable-decoder=mp3adufloat
  --enable-decoder=mp3float
  --enable-decoder=mp3on4
  --enable-decoder=mp3on4float
  --enable-decoder=mpc7
  --enable-decoder=mpc8
  --enable-decoder=opus
  --enable-decoder=ra_144
  --enable-decoder=ra_288
  --enable-decoder=ralf
  --enable-decoder=shorten
  --enable-decoder=tak
  --enable-decoder=tta
  --enable-decoder=vorbis
  --enable-decoder=wavpack
  --enable-decoder=wmalossless
  --enable-decoder=wmapro
  --enable-decoder=wmav1
  --enable-decoder=wmav2
  --enable-decoder=wmavoice
  --enable-decoder=pcm_alaw
  --enable-decoder=pcm_bluray
  --enable-decoder=pcm_dvd
  --enable-decoder=pcm_f32be
  --enable-decoder=pcm_f32le
  --enable-decoder=pcm_f64be
  --enable-decoder=pcm_f64le
  --enable-decoder=pcm_lxf
  --enable-decoder=pcm_mulaw
  --enable-decoder=pcm_s8
  --enable-decoder=pcm_s8_planar
  --enable-decoder=pcm_s16be
  --enable-decoder=pcm_s16be_planar
  --enable-decoder=pcm_s16le
  --enable-decoder=pcm_s16le_planar
  --enable-decoder=pcm_s24be
  --enable-decoder=pcm_s24daud
  --enable-decoder=pcm_s24le
  --enable-decoder=pcm_s24le_planar
  --enable-decoder=pcm_s32be
  --enable-decoder=pcm_s32le
  --enable-decoder=pcm_s32le_planar
  --enable-decoder=pcm_u8
  --enable-decoder=pcm_u16be
  --enable-decoder=pcm_u16le
  --enable-decoder=pcm_u24be
  --enable-decoder=pcm_u24le
  --enable-decoder=pcm_u32be
  --enable-decoder=pcm_u32le
  --enable-decoder=dsd_lsbf
  --enable-decoder=dsd_msbf
  --enable-decoder=dsd_lsbf_planar
  --enable-decoder=dsd_msbf_planar

  --disable-parsers
  --enable-parser=aac
  --enable-parser=aac_latm
  --enable-parser=ac3
  --enable-parser=cook
  --enable-parser=dca
  --enable-parser=flac
  --enable-parser=gsm
  --enable-parser=mpegaudio
  --enable-parser=tak
  --enable-parser=vorbis

  --disable-filters
  --enable-filter=aresample
  --enable-filter=atrim
  --enable-filter=aformat
  --enable-filter=acopy
  --enable-filter=anull

  --target-os=none              # disable target specific configs
  --arch=x86_32                 # use x86_32 arch
  --enable-cross-compile        # use cross compile configs
  --disable-asm                 # disable asm
  --disable-stripping           # disable stripping as it won't work
  --disable-programs            # disable ffmpeg, ffprobe and ffplay build
  --disable-doc                 # disable doc build
  --disable-debug               # disable debug mode
  --disable-runtime-cpudetect   # disable cpu detection
  --disable-autodetect          # disable env auto detect

  # assign toolchains and extra flags
  --nm=emnm
  --ar=emar
  --ranlib=emranlib
  --cc=emcc
  --cxx=em++
  --objcc=emcc
  --dep-cc=emcc
  --extra-cflags="$CFLAGS"
  --extra-cxxflags="$CXXFLAGS"

  # disable thread when FFMPEG_ST is NOT defined
  ${FFMPEG_ST:+ --disable-pthreads --disable-w32threads --disable-os2threads}
)

emconfigure ./configure "${CONF_FLAGS[@]}" $@
emmake make -j
