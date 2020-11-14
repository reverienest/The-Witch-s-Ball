
//{{BLOCK(startscn)

//======================================================================
//
//	startscn, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 8 tiles (t|f reduced) not compressed
//	+ regular map (flat), not compressed, 32x32 
//	Total size: 512 + 256 + 2048 = 2816
//
//	Time-stamp: 2020-11-04, 22:38:11
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STARTSCN_H
#define GRIT_STARTSCN_H

#define startscnTilesLen 256
extern const unsigned short startscnTiles[128];

#define startscnMapLen 2048
extern const unsigned short startscnMap[1024];

#define startscnPalLen 512
extern const unsigned short startscnPal[256];

#endif // GRIT_STARTSCN_H

//}}BLOCK(startscn)
