# N64.pak — credits and source

This is **[josegonzalez/minui-n64-pak](https://github.com/josegonzalez/minui-n64-pak)** by
Jose Diaz-Gonzalez (MIT, see `LICENSE`): a MinUI pak wrapping the standalone
[mupen64plus](https://mupen64plus.org/) N64 emulator, with an in-game menu (save slots,
options, controls, shortcuts), the Rice and GLideN64 video plugins, and per-game settings.
It was written for the TrimUI Brick / Smart Pro, which share the Zero 28's Allwinner A133P.

The `zero28` build here adds MagicX Mini Zero 28 support, proposed upstream in
[josegonzalez/minui-n64-pak#126](https://github.com/josegonzalez/minui-n64-pak/pull/126):
the core rotates its output onto the portrait-native 480x640 panel, a pad mapping for the
Zero 28's button numbering, and bundled `libsamplerate`.

## Exact source

Built with `make clone patch dist-zero28` from
[arniebradfo/minui-n64-pak@3059b5f](https://github.com/arniebradfo/minui-n64-pak/tree/3059b5f3e654e02185f99508904cd9c97a71df02)
(branch `magicx-zero28`), which pins and patches:

| Component | Version | License |
|---|---|---|
| [mupen64plus-core](https://github.com/mupen64plus/mupen64plus-core), -ui-console, -audio-sdl, -input-sdl, -rsp-hle, -video-rice | 2.6.0 | GPL-2.0 |
| [GLideN64](https://github.com/gonetz/GLideN64) | c8ef81c7 | GPL-2.0 |
| [zlib](https://github.com/madler/zlib) | 1.3.2 | zlib |
| [bzip2](https://sourceware.org/bzip2/) | 1.0.8 | bzip2 |
| [7-Zip](https://www.7-zip.org/) `7zzs` | 26.00 | LGPL-2.1 (see `zero28/7zzs.LICENSE`) |
| `libpng12`, `libsamplerate`, `libz` | from the LoveRetro tg5040/tg5050 toolchain sysroots | libpng / BSD-2-Clause / zlib |

The patches applied to each component are in that repository's `patches/shared/`.

## Using it

Put N64 ROMs (`.z64`, `.n64`, `.v64`, or zipped) in `Roms/Nintendo 64 (N64)/`.

- Left stick: N64 stick. Right stick: C-buttons (X and Y also send C-Left and C-Down).
- L2 or R2: Z. **Menu**: quick menu (save/load slots, options, video plugin, quit).
- Rice is the default video plugin; GLideN64 is more accurate and heavier
  (Menu → Options → Video Plugin).

For detailed logs, create an empty file `.userdata/zero28/N64-mupen64plus/debug` on the
card; logs go to `.userdata/zero28/logs/`.
