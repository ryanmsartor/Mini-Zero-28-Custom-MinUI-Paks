# PSP.pak for the MagicX Mini Zero 28

This is **[ben16w/minui-psp](https://github.com/ben16w/minui-psp)** by ben16w (MIT, see
`LICENSE`): a MinUI pak wrapping the standalone [PPSSPP](https://www.ppsspp.org/) PSP
emulator, as built by [PPSSPP-spruce](https://github.com/spruceUI/PPSSPP-spruce). It was
written for the TrimUI Brick / Smart Pro, which share the Zero 28's Allwinner A133P and
PowerVR GE8300. Its own documentation is in `README.minui-psp.md`.

This build adds MagicX Mini Zero 28 support:
- **Display:** PPSSPP rotates its output onto the portrait-mounted 480x640 panel.
- **In-game menu:** a MinUI-style menu on Menu, from
  [mohammadsyuhada/nx-redux](https://github.com/mohammadsyuhada/nx-redux).
- **Controls:** a pad mapping for the Zero 28's button numbering.
- **Power:** a power-button handler that follows MinUI's own Zero 28 sleep.
- **Volume:** your MinUI volume is restored after launch.

The Zero 28 changes were written by Claude (Anthropic's Claude Opus 5.5) in Claude Code, and
tested on a Zero 28 by [arniebradfo](https://github.com/arniebradfo).

## Where the code lives

The Zero 28 changes are proposed upstream in three pull requests. Each links the others:

- **[ben16w/minui-psp#88](https://github.com/ben16w/minui-psp/pull/88)**: the pak (`launch.sh`,
  `zero28/powerd.c`, `zero28/overlay/`).
- **[ben16w/PPSSPP-spruce#3](https://github.com/ben16w/PPSSPP-spruce/pull/3)**: the PPSSPP
  build (display rotation, the in-game menu).
- **[spruceUI/PPSSPP-spruce#5](https://github.com/spruceUI/PPSSPP-spruce/pull/5)**: only the
  rotation fix, offered to spruceUI.

Whatever happens to those pull requests (merged, declined or closed), their pages on GitHub
keep the full diffs, commits and discussion, even if the forks they came from are later
deleted. So they're the place to find, rebuild or continue this code. Once the ben16w PRs
are merged, later builds can come straight from ben16w/minui-psp's releases.

## Exact source

Built with `build_psp_pak.sh` from:

| Repository | Commit | Also reachable as |
|---|---|---|
| [arniebradfo/PPSSPP-spruce](https://github.com/arniebradfo/PPSSPP-spruce/tree/magicx-zero28) (`magicx-zero28`) | [`43a3e25`](https://github.com/arniebradfo/PPSSPP-spruce/tree/43a3e25e0c8664d8555fc2cdc902b9042d884e9d) | [ben16w/PPSSPP-spruce#3](https://github.com/ben16w/PPSSPP-spruce/pull/3/commits/43a3e25e0c8664d8555fc2cdc902b9042d884e9d) |
| [arniebradfo/minui-psp](https://github.com/arniebradfo/minui-psp/tree/magicx-zero28) (`magicx-zero28`) | [`9f2c8f9`](https://github.com/arniebradfo/minui-psp/tree/9f2c8f9c79efb7d2de096adb5f02736439833819) | [ben16w/minui-psp#88](https://github.com/ben16w/minui-psp/pull/88/commits/9f2c8f9c79efb7d2de096adb5f02736439833819) |

`PPSSPP/PPSSPPSDL_zero28` is PPSSPP-spruce's PowerVR target (`build-pvr.sh`, the same as
`PPSSPPSDL_TrimUI`), cross-compiled against the TrimUI SmartPro SDK.
`bin/zero28-powerd` is `zero28/powerd.c` from minui-psp, built with the LoveRetro tg5040
toolchain.

| Component | Version | License |
|---|---|---|
| [PPSSPP](https://github.com/hrydgard/ppsspp) (`PPSSPP/PPSSPPSDL_zero28`, `PPSSPP/assets/`) | v1.20.3, with PPSSPP-spruce's patches | GPL-2.0-or-later (see `PPSSPP/LICENSE.TXT`) |
| nx-redux emulator overlay, built into `PPSSPPSDL_zero28`; `zero28/overlay/` | v1.1.1 | GPL-3.0 |
| [cJSON](https://github.com/DaveGamble/cJSON), built into `PPSSPPSDL_zero28` | vendored with nx-redux | MIT |
| minui-psp (`launch.sh`, `bin/zero28-powerd`, `PPSSPP/.config/`) | the commit above | MIT (see `LICENSE`) |
| `bin/setalpha` | PPSSPP-spruce's `sdk-toolchains` release (source: `tools/pvr/setalpha.c` there) | from PPSSPP-spruce |

With the nx-redux overlay built in, `PPSSPPSDL_zero28` is GPL-3.0 as a whole. The
SDL2_ttf and SDL2_image it links are MOSS's own, in `/usr/magicx/lib`.

## Using it

Put PSP games (`.iso`, `.cso`) in `Roms/PlayStation Portable (PSP)/`.

- **Face buttons:** laid out like a PSP. Bottom (B) is Cross, right (A) is Circle, left (Y)
  is Square and top (X) is Triangle. L1/R1 are L/R. R2 swaps the d-pad and the analog stick.
- **Menu:** the in-game menu: Continue, Save State, Load State, Options, PPSSPP Menu
  (PPSSPP's own menu, e.g. for control mapping) and Quit.
- **Power:** click to sleep and click again to wake. Holding it for a second powers off,
  without saving, so make a save state first.
- **Saves:** game saves go to `Saves/PSP/`, and save states to `.userdata/shared/PSP-ppsspp/`.
- **Upside-down picture:** put `270` in `.userdata/zero28/PSP-ppsspp/rotation`.
- **Logs:** the log is `.userdata/zero28/logs/PSP.txt`. For a traced one, create an empty
  `.userdata/zero28/PSP-ppsspp/debug`.

## Credits

- [ben16w](https://github.com/ben16w): [minui-psp](https://github.com/ben16w/minui-psp), which this pak is, and [MinUI Power Control](https://github.com/ben16w/minui-power-control), which `zero28-powerd` stands in for here.
- The [spruceUI](https://github.com/spruceUI) team: [PPSSPP-spruce](https://github.com/spruceUI/PPSSPP-spruce), whose PowerVR build and Miyoo A30 rotation patch this uses, and [spruceOS](https://github.com/spruceUI/spruceOS), whose Zero 28 config confirmed the rotation and pad mapping.
- [mohammadsyuhada](https://github.com/mohammadsyuhada): [nx-redux](https://github.com/mohammadsyuhada/nx-redux)'s emulator overlay and its PPSSPP integration are the in-game menu.
- [Henrik Rydgård](https://github.com/hrydgard) and contributors: [PPSSPP](https://github.com/hrydgard/ppsspp).
- [Shaun Inman](https://github.com/shauninman): [MinUI](https://github.com/shauninman/MinUI) and [MOSS](https://github.com/shauninman/Moss-zero28). The sleep and power-off follow MinUI's Zero 28 platform code.
- [josegonzalez](https://github.com/josegonzalez): [minui-n64-pak](https://github.com/josegonzalez/minui-n64-pak), whose `EMU_PAD` format the menu uses and whose pak repositories minui-psp is based on.
- [Dave Gamble](https://github.com/DaveGamble): [cJSON](https://github.com/DaveGamble/cJSON).
- [ryanmsartor](https://github.com/ryanmsartor): this collection of Zero 28 paks.
