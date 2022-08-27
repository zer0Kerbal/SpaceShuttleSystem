---
permalink: /ManualInstallation.html
title: Manual Installation
description: the flat-pack Kiea instructions, written in Kerbalese, unusally present
tags: installation,directions,page,kerbal,ksp,zer0Kerbal,zedK
---

<!-- ManualInstallation.md v1.1.8.1
Space Shuttle System (SSS)
created: 01 Oct 2019
updated: 29 Jul 2022 -->

<!-- based upon work by Lisias -->

# Space Shuttle System (SSS)

[Home](./index.md)

Space Shuttle System is a high quality, high fidelity Space Shuttle mod for Kerbal Space Program

## Installation Instructions

### Using CurseForge/OverWolf app or CKAN

You should be all good! (check for latest version on CurseForge)

### If Downloaded from CurseForge/OverWolf manual download

To install, place the `DECQ` folder inside your Kerbal Space Program's GameData folder:

* **REMOVE ANY OLD VERSIONS OF THE PRODUCT BEFORE INSTALLING**
  * Delete `<KSP_ROOT>/GameData/DECQ/SpaceShuttleSystem`
* Extract the package's `DECQ` folder into your KSP's GameData folder as follows:
  * `<PACKAGE>/DECQ` --> `<KSP_ROOT>/GameData`
    * Overwrite any preexisting folder/file(s).
  * you should end up with `<KSP_ROOT>/GameData/DECQ/SpaceShuttleSystem`

### If Downloaded from SpaceDock / GitHub / other

To install, place the `GameData` folder inside your Kerbal Space Program folder:

* **REMOVE ANY OLD VERSIONS OF THE PRODUCT BEFORE INSTALLING**
  * Delete `<KSP_ROOT>/GameData/DECQ/SpaceShuttleSystem`
* Extract the package's `GameData` folder into your KSP's root folder as follows:
  * `<PACKAGE>/GameData` --> `<KSP_ROOT>`
    * Overwrite any preexisting file.
  * you should end up with `<KSP_ROOT>/GameData/DECQ/SpaceShuttleSystem`

## The following file layout must be present after installation

```markdown
<KSP_ROOT>
  + [GameData]
    + [DECQ]
      + [SpaceShuttleSystem]
        + [Agencies]
          ...
        + [Compatibility]
          ...
        + [Config]
          ...
        + [Contracts]
          ...
        + [Flags]
          ...
        + [Localization]
          ...
        + [Parts]
          ...
        * #.#.#.#.htm
        * Attributions.htm
        * changelog.md
        * GPL-2.0.txt
          ManualInstallation.htm
        * readme.htm
        * SpaceShuttleSystem.version
        ...
      ...
    * [Module Manager][mm] or [Module Manager /L][mml]
    * ModuleManager.ConfigCache
  * KSP.log
  ...
```

### Dependencies

* [SimpleConstruction! (SCON!)][SCON]
* *either*
  * [Module Manager][mm]
  * [Module Manager /L][mml]

[SCON]: https://forum.kerbalspaceprogram.com/index.php?/topic/191424-* "SimpleConstruction! (SCON!)"
[mm]: https://forum.kerbalspaceprogram.com/index.php?/topic/50533-*/ "Module Manager"
[mml]: https://github.com/net-lisias-ksp/ModuleManager "Module Manager /L"
