
//{{BLOCK(winscn)

//======================================================================
//
//	winscn, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 9 tiles (t|f reduced) not compressed
//	+ regular map (flat), not compressed, 32x32 
//	Total size: 512 + 288 + 2048 = 2848
//
//	Time-stamp: 2020-11-04, 22:37:33
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINSCN_H
#define GRIT_WINSCN_H

#define winscnTilesLen 288
extern const unsigned short winscnTiles[144];

#define winscnMapLen 2048
extern const unsigned short winscnMap[1024];

#define winscnPalLen 512
extern const unsigned short winscnPal[256];

#endif // GRIT_WINSCN_H

//}}BLOCK(winscn)
