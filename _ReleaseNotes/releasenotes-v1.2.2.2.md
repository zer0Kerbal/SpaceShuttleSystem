<!-- ReleaseLayout.md v1.2.2.2
SimpleConstruction! (SCON!)
created: 11 Aug 2018
updated: 23 Sep 2021 -->

[![SCON! Version][MOD:shld:stat]][MOD:forum]
[![KSP version][KSP:shld:stat]][KSP:url] [![License Expat-MIT][LICENSE:shld]][LICENSE:link]  
![CODE][CODE:shld:stat] ![KSP-AVC][AVC:shld] ![AVC .version files][AVCVLD:shld]  

***

# Version 4.0.9.9 - Tonka Jade

- 24 Aug 2021  
- Release for Kerbal Space Program [KSP 1.12.2] (because EL.version says so)  

## DO A CLEAN INSTALL: DELETE EXISTING THEN RE-INSTALL  

## WARNING: Only [Curseforge][CRSFG:url] version will include .dll’s

<b style="border:0.5px solid Tomato; background-color: lightgrey; color: #FF0000; text-align:center">Does not contain .dll's - download from <a href="https://www.curseforge.com/kerbal/ksp-mods/scrapyard">Curseforge</a> </b>

<b style="border:0.5px solid Tomato; background-color: lightgrey; color: #FF0000; text-align:center">DO A CLEAN INSTALL: DELETE EXISTING THEN RE-INSTALL</b>

<h3 style="border:0.5px solid Tomato; background-color: #bada55; color: #FF0000; text-align:center">
<p><b>DO A CLEAN INSTALL:</br> DELETE EXISTING THEN RE-INSTALL</b></p>
<p style="color: #000000">Does not contain .dll's - download from <a href="https://www.curseforge.com/kerbal/ksp-mods/scrapyard/files">Curseforge</a></p>

***

### Patch linting and file maintenance

- minor housekeeping  
- patch dusting (mostly removing construction dust (comments))  
- please note: ELControlReferenceSC is has gone away.

### Changed  

- ExtraplanetaryLaunchpads .dll to 6.8.3  
  
- ScienceLabs.cfg v1.0.2.0
  - adjusted RESOURCE patches (presume part doesn't have any)
  - tightened up patches  
  - @RESOURCE -> %RESOURCE  
- ISRU.cfg
  - tightened up patches  
  - thanks to @JadeofMaar  
  - Mono* to MonoProp  
  - FlowMode -> %FlowMode  
  - @RESOURCE -> %RESOURCE  
  - add tiny LF tank (fixes and closes #1)  
  - add tiny Oxidizer tank (fixes and closes #1)  
- Back end  
  - add auto JSON  
  - update EL.version to match  
  - update automation to latest version  
  - start working with yaclog-KSP (thank you cineboxandrew!)

### Updated

- Resources.cfg v1.0.1.5
- thank you @Tonka Crash
  - update 'ksparpicon'
  - added abbreviation and hsp to Rocketparts and Metal  
  - updated unitCost for RocketParts from 1.0 -> 1.5 to match CRP  
  - added patch to update RocketParts IF CRP installed  
  - AlternateResourcePanel/Icons location (which lead to pushing an update to ARP)  

### Added  

- Localization [en-us.cfg]
  - thank you @Tonka Crash  
  - added #SimpleConstruction_RocketParts_abbv = RP  
  - added #SimpleConstruction_Metal_abbv = MTL  

- GrapplingDevice.cfg v1.0.0.0

### Fixed  

- B9TankTypes.cfg v1.0.1.0
  - added header/footer
  - updated 'SCCombo/RocketParts/unitsPerVolume from 2 to 1 because it takes 50% of the tank, and 2 units per volume
- KPBS.cfg v1.0.1.0
  - added header/footer
- LaunchClamps.cfg  
  - add fix to all LaunchClamps  
  
### Removed  

- CrewedPods.cfg v1.0.1.0
  - removed/cleaned old comments  

### Patch linting and file maintenance

- minor housekeeping  
- patch dusting (mostly removing construction dust (comments)) 

### Status

- Bug
  - closed #4 Tank costs 
  - closes #12 Text issue with SMX - anything remaining isn't a Localization issue
  - closes #15 Drill patches need updating?
  - closes #16 Tanks ModuleCargoPart: packedVolume
  - updated #11 us-en.cfg should be complete
  
  - *** Possible future changes ***
  - ❓ ❔ seems high : ❓ ❔ 
    - [breakingForce = 50]
    - [breakingTorque = 50] seems high ???
    - [crashTolerance = 12]

***

> See [Full Changelog][MOD:clog] for full details of changes  
> See [Known Issues][MOD:issues] for known issues  

### Localization

- [x]  English
- [ ]  

See the [README in the Localization folder][LINK:localization] for instructions for adding or improving translations for languages other than English. [GitHub][MOD:issues] push is the best way to contribute.

***

### How to support this and other great mods by [`zer0Kerbal`][LINK:zer0Kerbal]  

[![Support][PAYPAL:img]][PAYPAL:url] [![Patreon][PATREON:img]][PATREON:url] [![Github Sponsor][GSPONS:img]][GSPONS:url] [![Buy zer0Kerbal a snack][BMCC:img]][BMCC:url] 

***

<div style="border:0.5px solid Tomato; background-color: lightgrey; color: #FF0000; text-align:center">
<p><b>*red box below is a link to forum post on how to get support*</p>  
<a href = "https://forum.kerbalspaceprogram.com/index.php?/topic/83212-*">
  <p><img src = "https://i.postimg.cc/vHP6zmrw/image.png" alt="How to get support"></p></a></div>

<p style="border:0.5px solid Tomato; background-color: lightgrey; color: #FF0000; text-align:center">Kerbal Space Program 1.12.2 — Unity 2019.2.2f1 — .NET Framework 4.7.2
</p>

![][HERO:0]

#### Be Kind: Lithobrake, not jakebrake! Keep your Module Manager up to date

***

<!-- links -->
[MOD:clog]: https://raw.githubusercontent.com/zer0Kerbal/SimpleConstruction/master/Changelog.cfg "Changelog"  
[MOD:known]: https://github.com/zer0Kerbal/SimpleConstruction/wiki/Known-Issues "Known Issues"  
[MOD:forum]: https://forum.kerbalspaceprogram.com/index.php?/topic/204752-* "SimpleConstruction!  on the forums"  
[MOD:issues]: https://github.com/zer0Kerbal/SimpleConstruction/issues "Issue Tracker"  
[MOD:license]: https://github.com/zer0Kerbal/SimpleConstruction/blob/master/LICENSE "Repo License"  
[LINK:localization]:  https://github.com/zer0Kerbal/SimpleConstruction/blob/master/GameData/SimpleConstruction/Localization/readme.md "Localization"

[MOD:shld:stat]: https://img.shields.io/badge/SimpleConstruction%20(QBUS)%20v-4.0.9.9-orange.svg?style=plastic "4.0.9.9"

[CODE:shld:stat]:  https://img.shields.io/badge/CODE-%3C.NET%203.5%3E%20%3CUnity%202017.1.3p1%3E%20%3CC%23%3E-blue?style=plastic&labelColor=black "Code"  

[Curseforge][CRSFG:url]: https://www.curseforge.com/kerbal/ksp-mods/SimpleConstruction/files "Curseforge"  

[KSP:url]: http://kerbalspaceprogram.com/ "Kerbal Space Program"
[KSP:shld:stat]: https://img.shields.io/badge/KSP-1.12.2-blue.svg?style=plastic&logo=data:image/webp;base64,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 "Kerbal Space Program"


[AVC:shld]:  https://img.shields.io/badge/AVC-supported-brightgreen.svg?style=plastic
[AVCVLD:shld]:    https://github.com/zer0Kerbal/SimpleConstruction/workflows/Validate%20AVC%20.version%20files/badge.svg

<!--- license -->
[LICENSE:link]: https://opensource.org/licenses/MIT "Expat-MIT"
[LICENSE:logo]: https://i.postimg.cc/bvjfsMP5/MIT-17x17.png "Expat-MIT"
[LICENSE:shld]:  https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/zer0Kerbal/SimpleConstruction/master/json/license.json&logoColor=white&logo=data:image/svg+xml;base64,PHN2ZyAgIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgICB4bWxuczpjYz0iaHR0cDovL2NyZWF0aXZlY29tbW9ucy5vcmcvbnMjIiAgIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyIgICB4bWxuczpzdmc9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiAgIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgICB4bWxuczpzb2RpcG9kaT0iaHR0cDovL3NvZGlwb2RpLnNvdXJjZWZvcmdlLm5ldC9EVEQvc29kaXBvZGktMC5kdGQiICAgeG1sbnM6aW5rc2NhcGU9Imh0dHA6Ly93d3cuaW5rc2NhcGUub3JnL25hbWVzcGFjZXMvaW5rc2NhcGUiICAgd2lkdGg9IjI1NiIgICBoZWlnaHQ9IjI1NiIgICBpZD0ic3ZnMiIgICB2ZXJzaW9uPSIxLjEiICAgaW5rc2NhcGU6dmVyc2lvbj0iMC40NyByMjI1ODMiICAgc29kaXBvZGk6ZG9jbmFtZT0ibGljZW5zZXMtbWl0LnN2ZyI+ICA8ZGVmcyAgICAgaWQ9ImRlZnM0Ij4gICAgPGlua3NjYXBlOnBlcnNwZWN0aXZlICAgICAgIHNvZGlwb2RpOnR5cGU9Imlua3NjYXBlOnBlcnNwM2QiICAgICAgIGlua3NjYXBlOnZwX3g9IjAgOiA1MjYuMTgxMDkgOiAxIiAgICAgICBpbmtzY2FwZTp2cF95PSIwIDogMTAwMCA6IDAiICAgICAgIGlua3NjYXBlOnZwX3o9Ijc0NC4wOTQ0OCA6IDUyNi4xODEwOSA6IDEiICAgICAgIGlua3NjYXBlOnBlcnNwM2Qtb3JpZ2luPSIzNzIuMDQ3MjQgOiAzNTAuNzg3MzkgOiAxIiAgICAgICBpZD0icGVyc3BlY3RpdmUxMCIgLz4gICAgPGlua3NjYXBlOnBlcnNwZWN0aXZlICAgICAgIGlkPSJwZXJzcGVjdGl2ZTI4ODQiICAgICAgIGlua3NjYXBlOnBlcnNwM2Qtb3JpZ2luPSIwLjUgOiAwLjMzMzMzMzMzIDogMSIgICAgICAgaW5rc2NhcGU6dnBfej0iMSA6IDAuNSA6IDEiICAgICAgIGlua3NjYXBlOnZwX3k9IjAgOiAxMDAwIDogMCIgICAgICAgaW5rc2NhcGU6dnBfeD0iMCA6IDAuNSA6IDEiICAgICAgIHNvZGlwb2RpOnR5cGU9Imlua3NjYXBlOnBlcnNwM2QiIC8+ICA8L2RlZnM+ICA8c29kaXBvZGk6bmFtZWR2aWV3ICAgICBpZD0iYmFzZSIgICAgIHBhZ2Vjb2xvcj0iI2ZmZmZmZiIgICAgIGJvcmRlcmNvbG9yPSIjNjY2NjY2IiAgICAgYm9yZGVyb3BhY2l0eT0iMS4wIiAgICAgaW5rc2NhcGU6cGFnZW9wYWNpdHk9IjAuMCIgICAgIGlua3NjYXBlOnBhZ2VzaGFkb3c9IjIiICAgICBpbmtzY2FwZTp6b29tPSIwLjk4OTk0OTQ5IiAgICAgaW5rc2NhcGU6Y3g9IjEzMy40NzU2MSIgICAgIGlua3NjYXBlOmN5PSIxMTUuMDYyMTciICAgICBpbmtzY2FwZTpkb2N1bWVudC11bml0cz0icHgiICAgICBpbmtzY2FwZTpjdXJyZW50LWxheWVyPSJsYXllcjEiICAgICBzaG93Z3JpZD0iZmFsc2UiICAgICBpbmtzY2FwZTp3aW5kb3ctd2lkdGg9Ijg3NiIgICAgIGlua3NjYXBlOndpbmRvdy1oZWlnaHQ9IjY4NCIgICAgIGlua3NjYXBlOndpbmRvdy14PSI3IiAgICAgaW5rc2NhcGU6d2luZG93LXk9IjI5OSIgICAgIGlua3NjYXBlOndpbmRvdy1tYXhpbWl6ZWQ9IjAiIC8+ICA8bWV0YWRhdGEgICAgIGlkPSJtZXRhZGF0YTciPiAgICA8cmRmOlJERj4gICAgICA8Y2M6V29yayAgICAgICAgIHJkZjphYm91dD0iIj4gICAgICAgIDxkYzpmb3JtYXQ+aW1hZ2Uvc3ZnK3htbDwvZGM6Zm9ybWF0PiAgICAgICAgPGRjOnR5cGUgICAgICAgICAgIHJkZjpyZXNvdXJjZT0iaHR0cDovL3B1cmwub3JnL2RjL2RjbWl0eXBlL1N0aWxsSW1hZ2UiIC8+ICAgICAgICA8ZGM6dGl0bGU+PC9kYzp0aXRsZT4gICAgICA8L2NjOldvcms+ICAgIDwvcmRmOlJERj4gIDwvbWV0YWRhdGE+ICA8ZyAgICAgaW5rc2NhcGU6bGFiZWw9IkxheWVyIDEiICAgICBpbmtzY2FwZTpncm91cG1vZGU9ImxheWVyIiAgICAgaWQ9ImxheWVyMSIgICAgIHRyYW5zZm9ybT0idHJhbnNsYXRlKDAsLTc5Ni4zNjIxOCkiPiAgICA8cGF0aCAgICAgICBzb2RpcG9kaTp0eXBlPSJhcmMiICAgICAgIHN0eWxlPSJmaWxsOiNmZmZmZmY7ZmlsbC1vcGFjaXR5OjE7ZmlsbC1ydWxlOm5vbnplcm87c3Ryb2tlOiMwMDAwMDA7c3Ryb2tlLXdpZHRoOjE1LjM0OTE3MTY0O3N0cm9rZS1saW5lY2FwOnJvdW5kO3N0cm9rZS1taXRlcmxpbWl0OjQ7c3Ryb2tlLW9wYWNpdHk6MTtzdHJva2UtZGFzaGFycmF5Om5vbmUiICAgICAgIGlkPSJwYXRoMzY4NSIgICAgICAgc29kaXBvZGk6Y3g9IjEzMi4zMjk5OSIgICAgICAgc29kaXBvZGk6Y3k9IjEzNC43ODE2OSIgICAgICAgc29kaXBvZGk6cng9IjExMy4xMzcwOCIgICAgICAgc29kaXBvZGk6cnk9IjEwOS4wOTY0NyIgICAgICAgZD0ibSAyNDUuNDY3MDYsMTM0Ljc4MTY5IGEgMTEzLjEzNzA4LDEwOS4wOTY0NyAwIDEgMSAwLC0wLjAwMiIgICAgICAgdHJhbnNmb3JtPSJtYXRyaXgoMS4wNTcyMjg1LDAsMCwxLjA5MzAyMjcsLTEyLjA0MTI5MSw3NzcuNTQ3ODIpIiAgICAgICBzb2RpcG9kaTpzdGFydD0iMCIgICAgICAgc29kaXBvZGk6ZW5kPSI2LjI4MzE2NzkiICAgICAgIHNvZGlwb2RpOm9wZW49InRydWUiIC8+ICAgIDx0ZXh0ICAgICAgIHhtbDpzcGFjZT0icHJlc2VydmUiICAgICAgIHN0eWxlPSJmb250LXNpemU6Ni44OTQ2NjU3MnB4O2ZvbnQtc3R5bGU6bm9ybWFsO2ZvbnQtdmFyaWFudDpub3JtYWw7Zm9udC13ZWlnaHQ6bm9ybWFsO2ZvbnQtc3RyZXRjaDpub3JtYWw7bGluZS1oZWlnaHQ6MTI1JTtmaWxsOiMwMDAwMDA7ZmlsbC1vcGFjaXR5OjE7c3Ryb2tlOm5vbmU7Zm9udC1mYW1pbHk6QXJpYWw7LWlua3NjYXBlLWZvbnQtc3BlY2lmaWNhdGlvbjpBcmlhbCIgICAgICAgeD0iMzQuNDA5NzU2IiAgICAgICB5PSI4NjkuMDYxMDQiICAgICAgIGlkPSJ0ZXh0MzcxMCIgICAgICAgc29kaXBvZGk6bGluZXNwYWNpbmc9IjEyNSUiICAgICAgIHRyYW5zZm9ybT0ic2NhbGUoMC44OTA4MDUxLDEuMTIyNTgpIj48dHNwYW4gICAgICAgICBzb2RpcG9kaTpyb2xlPSJsaW5lIiAgICAgICAgIGlkPSJ0c3BhbjM3MTIiICAgICAgICAgeD0iMzQuNDA5NzU2IiAgICAgICAgIHk9Ijg2OS4wNjEwNCIgICAgICAgICBzdHlsZT0iZm9udC1zaXplOjEyNC4xMDM5NzMzOXB4O2ZvbnQtc3R5bGU6bm9ybWFsO2ZvbnQtdmFyaWFudDpub3JtYWw7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LXN0cmV0Y2g6bm9ybWFsO3RleHQtYWxpZ246c3RhcnQ7bGluZS1oZWlnaHQ6MTI1JTt3cml0aW5nLW1vZGU6bHItdGI7dGV4dC1hbmNob3I6c3RhcnQ7Zm9udC1mYW1pbHk6QXJpYWw7LWlua3NjYXBlLWZvbnQtc3BlY2lmaWNhdGlvbjpBcmlhbCBCb2xkIj5NSVQ8L3RzcGFuPjwvdGV4dD4gIDwvZz48L3N2Zz4= "Expat-MIT"

<!-- financial support -->
[PAYPAL:img]: https://img.shields.io/badge/Buy%20me%20some%20-LFO-00457C?style=for-the-badge&logo=paypal&labelColor=FFDD00 "PayPal"
[PAYPAL:url]: https://www.paypal.com/donate?hosted_button_id=R9ACWD7VREBCY "PayPal"

[PATREON:img]: https://img.shields.io/badge/Patreon%20-be%20a%20Patron-FF424D?style=for-the-badge&logo=patreon "Patreon"
[PATREON:url]: https://www.patreon.com/bePatron?u=23390503 "Patreon"

[GSPONS:img]: https://img.shields.io/badge/Github%20-Sponsor-EA4AAA?style=for-the-badge&logo=githubsponsors "Github Sponsors"
[GSPONS:url]: https://github.com/sponsors/zer0Kerbal "Github Sponsors"

[BMCC:img]: https://img.shields.io/badge/Buy%20Me%20a%20-Snack!-FFDD00?style=for-the-badge&logo=buymeacoffee "Buy Me A Snack"
[BMCC:url]: https://buymeacoffee.com/zer0Kerbal "Buy Me A Snack"

<!--
GPLv2 BY
zer0Kerbal
-->  
