
//{{BLOCK(instrscn)

//======================================================================
//
//	instrscn, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 44 tiles (t|f reduced) not compressed
//	+ regular map (flat), not compressed, 32x32 
//	Total size: 512 + 1408 + 2048 = 3968
//
//	Time-stamp: 2020-11-04, 22:37:43
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRSCN_H
#define GRIT_INSTRSCN_H

#define instrscnTilesLen 1408
extern const unsigned short instrscnTiles[704];

#define instrscnMapLen 2048
extern const unsigned short instrscnMap[1024];

#define instrscnPalLen 512
extern const unsigned short instrscnPal[256];

#endif // GRIT_INSTRSCN_H

//}}BLOCK(instrscn)
