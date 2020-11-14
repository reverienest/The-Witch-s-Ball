
//{{BLOCK(gamescn)

//======================================================================
//
//	gamescn, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 9 tiles (t|f reduced) not compressed
//	+ regular map (flat), not compressed, 32x32 
//	Total size: 512 + 288 + 2048 = 2848
//
//	Time-stamp: 2020-11-04, 23:41:45
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMESCN_H
#define GRIT_GAMESCN_H

#define gamescnTilesLen 288
extern const unsigned short gamescnTiles[144];

#define gamescnMapLen 2048
extern const unsigned short gamescnMap[1024];

#define gamescnPalLen 512
extern const unsigned short gamescnPal[256];

#endif // GRIT_GAMESCN_H

//}}BLOCK(gamescn)
