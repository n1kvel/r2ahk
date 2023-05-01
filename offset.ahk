global mcell
global b_ccell
global b_cweight
global b_mweight
global b_offset_1
global o_chp
global o_mhp
global o_cmp
global o_mmp
global o_exp
global o_nickname
global o_guild
global o_id_1
global o_checknpc_1
global o_id_2
global o_id_3
global o_weapon
global o_shield
global o_armor
global o_pet
global o_pstat_ar1
global o_pstat_ar2
global o_pstat_ar3
global o_pstat_ar4
global o_pstat_ar5
global o_pstat_ar6
global o_pstat_at1
global o_pstat_at2
global o_pstat_at3
global o_pstat_at4
global o_pstat_at5
global o_pstat_at6
global o_buff_paralysis
global o_buff_antiinvis
global o_pspeed
global o_prange
global o_paspeed
global o_pastat
global o_pangle
global o_moverange
global o_transparent_1
global o_typeinvis
global o_infoinvis
global o_moveposx
global o_moveposy
global o_moveposz
global o_move
global o_posxs
global o_posys
global o_poszs
global o_attacktype_1
global o_attacktype_2
global o_attacktype_3
global o_identifier
global o_identifier_target
global o_posx
global o_posy
global o_posz
global o_posrange
global o_outline
global o_modelsize_1
global o_modelsize_2
global o_transparent_2
global o_checknpc_2
global o_gravity
global o_targetinvis
global o_outline_color
global o_drop_id
global b_offset_2
global o_mouseobject
global o_icon
global o_mousedrop
global o_mouseinventory
global o_inventory_id
global b_offset_3
global o_fcam
global o_fcamfov
global o_fcamposx
global o_fcamposy
global o_fcamposz
global o_camposx
global o_camposy
global o_camposz
global o_camangle
global b_fov
global b_camrange_1
global b_camrange_2
		
offset_selection(server){
	if (server = "RevolGC"){
		mcell := 240
		b_ccell := 0x38200FC
		b_cweight = 0x3820120
		b_mweight = 0x3820124
		b_offset_1 := 0x377BD48
		o_chp := 0x40
		o_mhp = 0x28e4
		o_cmp = 0x44
		o_mmp = 0x28e8
		o_exp = 0x50
		o_nickname = 0x5a
		o_guild = 0x18
		o_id_1 = 0xc
		o_checknpc_1 = 0xbc
		o_id_2 = 0x2394
		o_id_3 = 0x2398
		o_weapon = 0x344
		o_shield = 0x348
		o_armor = 0x34c
		o_pet = 0x390
		o_pstat_ar1 = 0x394
		o_pstat_ar2 = 0x396
		o_pstat_ar3 = 0x398
		o_pstat_ar4 = 0x39a
		o_pstat_ar5 = 0x39c
		o_pstat_ar6 = 0x39e
		o_pstat_at1 = 0x3a0
		o_pstat_at2 = 0x3a2
		o_pstat_at3 = 0x3a4
		o_pstat_at4 = 0x3a6
		o_pstat_at5 = 0x3a8
		o_pstat_at6 = 0x3aa
		o_buff_paralysis =0x42c
		o_buff_antiinvis =0x65c
		o_pspeed = 0x233c
		o_prange = 0x2360
		o_paspeed = 0x2404
		o_pastat = 0x2314
		o_pangle = 0x2354
		o_moverange = 0x235c
		o_transparent_1 = 0x2364
		o_typeinvis = 0x23bc
		o_infoinvis = 0x23c8
		o_moveposx = 0x23dc
		o_moveposy = 0x23e0
		o_moveposz = 0x23e4
		o_move = 0x28a8
		o_posxs = 0x28b4
		o_posys = 0x28b8
		o_poszs = 0x28bc
		o_attacktype_1 = 0x28f0
		o_attacktype_2 = 0x28f4
		o_attacktype_3 = 0x28f8
		o_identifier = 0x98
		o_identifier_target = 0x9c
		o_posx = 0x48
		o_posy = 0x4c
		o_posz = 0x50
		o_posrange = 0x58
		o_outline = 0x2f6
		o_modelsize_1 = 0x308
		o_modelsize_2 = 0x348
		o_transparent_2 = 0x3e0
		o_checknpc_2 = 0x3e8
		o_gravity = 0x3f0
		o_targetinvis = 0x40c
		o_outline_color =0x418
		o_drop_id = 0x14
		b_offset_2 = 0x377BD54
		o_mouseobject = 0x516c
		o_icon = 0x1b320
		o_mousedrop = 0x34450
		o_mouseinventory = 0x34c54
		o_inventory_id = 0x8
		b_offset_3 = 0x377BD5C
		o_fcam = 0xc
		o_fcamfov = 0x48
		o_fcamposx = 0x9c
		o_fcamposy = 0xa0
		o_fcamposz = 0xa4
		o_camposx = 0xa8
		o_camposy = 0xac
		o_camposz = 0xb0
		o_camangle = 0x30
		b_fov = 0x34D5BBC
		b_camrange_1 = 0x34D5BC4
		b_camrange_2 = 0x34D33C4
	}
	if (server = "PN"){
		mcell := 240
		b_ccell := 0x38200FC
		b_cweight = 0x3820120
		b_mweight = 0x3820124
		b_offset_1 := 0x377BD48
		o_chp := 0x40
		o_mhp = 0x28e4
		o_cmp = 0x44
		o_mmp = 0x28e8
		o_exp = 0x50
		o_nickname = 0x5a
		o_guild = 0x18
		o_id_1 = 0xc
		o_checknpc_1 = 0xbc
		o_id_2 = 0x2394
		o_id_3 = 0x2398
		o_weapon = 0x344
		o_shield = 0x348
		o_armor = 0x34c
		o_pet = 0x390
		o_pstat_ar1 = 0x394
		o_pstat_ar2 = 0x396
		o_pstat_ar3 = 0x398
		o_pstat_ar4 = 0x39a
		o_pstat_ar5 = 0x39c
		o_pstat_ar6 = 0x39e
		o_pstat_at1 = 0x3a0
		o_pstat_at2 = 0x3a2
		o_pstat_at3 = 0x3a4
		o_pstat_at4 = 0x3a6
		o_pstat_at5 = 0x3a8
		o_pstat_at6 = 0x3aa
		o_buff_paralysis =0x42c
		o_buff_antiinvis =0x65c
		o_pspeed = 0x233c
		o_prange = 0x2360
		o_paspeed = 0x2404
		o_pastat = 0x2314
		o_pangle = 0x2354
		o_moverange = 0x235c
		o_transparent_1 = 0x2364
		o_typeinvis = 0x23bc
		o_infoinvis = 0x23c8
		o_moveposx = 0x23dc
		o_moveposy = 0x23e0
		o_moveposz = 0x23e4
		o_move = 0x28a8
		o_posxs = 0x28b4
		o_posys = 0x28b8
		o_poszs = 0x28bc
		o_attacktype_1 = 0x28f0
		o_attacktype_2 = 0x28f4
		o_attacktype_3 = 0x28f8
		o_identifier = 0x98
		o_identifier_target = 0x9c
		o_posx = 0x48
		o_posy = 0x4c
		o_posz = 0x50
		o_posrange = 0x58
		o_outline = 0x2f6
		o_modelsize_1 = 0x308
		o_modelsize_2 = 0x348
		o_transparent_2 = 0x3e0
		o_checknpc_2 = 0x3e8
		o_gravity = 0x3f0
		o_targetinvis = 0x40c
		o_outline_color =0x418
		o_drop_id = 0x14
		b_offset_2 = 0x377BD54
		o_mouseobject = 0x516c
		o_icon = 0x1b320
		o_mousedrop = 0x34450
		o_mouseinventory = 0x34c54
		o_inventory_id = 0x8
		b_offset_3 = 0x377BD5C
		o_fcam = 0xc
		o_fcamfov = 0x48
		o_fcamposx = 0x9c
		o_fcamposy = 0xa0
		o_fcamposz = 0xa4
		o_camposx = 0xa8
		o_camposy = 0xac
		o_camposz = 0xb0
		o_camangle = 0x30
		b_fov = 0x34D5BBC
		b_camrange_1 = 0x34D5BC4
		b_camrange_2 = 0x34D33C4
	}
	if (server = "Dispel"){
		mcell := 240
		b_ccell := 0x38200FC
		b_cweight = 0x3450A40
		b_mweight = 0x3450A44
		b_offset_1 := 0x33B2790
		o_chp := 0x40
		o_mhp = 0x2424
		o_cmp = 0x44
		o_mmp = 0x2428
		o_exp = 0x50
		o_nickname = 0x5a
		o_guild = 0x18
		o_id_1 = 0xc
		o_checknpc_1 = 0xb0
		o_id_2 = 0x1ed8
		o_id_3 = 0x1edc
		o_weapon = 0x33c
		o_shield = 0x340
		o_armor = 0x344
		o_pet = 0x388
		o_pstat_ar1 = 0x38c
		o_pstat_ar2 = 0x38e
		o_pstat_ar3 = 0x390
		o_pstat_ar4 = 0x392
		o_pstat_ar5 = 0x394
		o_pstat_ar6 = 0x396
		o_pstat_at1 = 0x398
		o_pstat_at2 = 0x39a
		o_pstat_at3 = 0x39c
		o_pstat_at4 = 0x39e
		o_pstat_at5 = 0x3a0
		o_pstat_at6 = 0x3a2
		o_buff_paralysis=0x410
		o_buff_antiinvis=0x640
		o_pspeed = 0x1e80
		o_prange = 0x1ea4
		o_paspeed = 0x1f48
		o_pastat = 0x1e58
		o_pangle = 0x1e98
		o_moverange = 0x1ea0
		o_transparent_1 = 0x1ea8
		o_typeinvis = 0x1f00
		o_infoinvis = 0x1f0c
		o_moveposx = 0x1f20
		o_moveposy = 0x1f24
		o_moveposz = 0x1f28
		o_move = 0x23e8
		o_posxs = 0x23f4
		o_posys = 0x23f8
		o_poszs = 0x23fc
		o_attacktype_1 = 0x2430
		o_attacktype_2 = 0x2434
		o_attacktype_3 = 0x2438
		o_identifier = 0x98
		o_identifier_target = 0x9c
		o_posx = 0x48
		o_posy = 0x4c
		o_posz = 0x50
		o_posrange = 0x58
		o_outline = 0x2f6
		o_modelsize_1 = 0x308
		o_modelsize_2 = 0x348
		o_transparent_2 = 0x3e0
		o_checknpc_2 = 0x3e8
		o_gravity = 0x3f0
		o_targetinvis = 0x40c
		o_outline_color = 0x418
		o_drop_id = 0x14
		b_offset_2 = 0x33B279C
		o_mouseobject = 0x516c
		o_icon = 0x19410
		o_mousedrop = 0x2fdc0
		o_mouseinventory = 0x304d4
		o_inventory_id = 0x8
		b_offset_3 = 0x33B27A4
		o_fcam = 0xc
		o_fcamfov = 0x48
		o_fcamposx = 0x9c
		o_fcamposy = 0xa0
		o_fcamposz = 0xa4
		o_camposx = 0xa8
		o_camposy = 0xac
		o_camposz = 0xb0
		o_camangle = 0x30
		b_fov = 0x314AA7C
		b_camrange_1 = 0x314AA84
		b_camrange_2 = 0x314AA90
	}
	if (server = "1602"){
		mcell := 160
		b_ccell := 0x19C6BE0
		b_cweight = 0x19C6C00
		b_mweight = 0x19C6C04
		b_offset_1 := 0x1992584
		o_chp := 0x40
		o_mhp = 0x2104
		o_cmp = 0x44
		o_mmp = 0x2108
		o_exp = 0x50
		o_nickname = 0x5a
		o_guild = 0x18
		o_id_1 = 0xc
		o_checknpc_1 =0xac
		o_id_2 = 0x1bb4
		o_id_3 = 0x1bb8
		o_weapon = 0x334
		o_shield = 0x338
		o_armor = 0x33c
		o_pet = 0x380
		o_pstat_ar1 = 0x384
		o_pstat_ar2 = 0x386
		o_pstat_ar3 = 0x388
		o_pstat_ar4 = 0x38a
		o_pstat_ar5 = 0x38c
		o_pstat_ar6 = 0x38e
		o_pstat_at1 = 0x390
		o_pstat_at2 = 0x392
		o_pstat_at3 = 0x394
		o_pstat_at4 = 0x396
		o_pstat_at5 = 0x398
		o_pstat_at6 = 0x39a
		o_buff_paralysis=0x40c
		o_buff_antiinvis=0x63c
		o_pspeed = 0x1b5c
		o_prange = 0x1b80
		o_paspeed = 0x1c24
		o_pastat = 0x1b34
		o_pangle = 0x1b74
		o_moverange = 0x1b7c
		o_transparent_1 = 0x1b84
		o_typeinvis = 0x1bdc
		o_infoinvis = 0x1be8
		o_moveposx = 0x1bfc
		o_moveposy = 0x1c00
		o_moveposz = 0x1c04
		o_move = 0x20C8
		o_posxs = 0x20d4
		o_posys = 0x20d8
		o_poszs = 0x20dc
		o_attacktype_1 = 0x2110
		o_attacktype_2 = 0x2114
		o_attacktype_3 = 0x2118
		o_identifier = 0x98
		o_identifier_target = 0x9c
		o_posx = 0x48
		o_posy = 0x4c
		o_posz = 0x50
		o_posrange = 0x58
		o_outline = 0x30d
		o_modelsize_1 = 0x31c
		o_modelsize_2 = 0x35c
		o_transparent_2 = 0x3fc
		o_checknpc_2 = 0x404
		o_gravity = 0x40c
		o_targetinvis = 0x428
		o_outline_color = 0x434
		o_drop_id = 0x14
		b_offset_2 = 0x1992590
		o_mouseobject = 0x516c
		o_icon = 0x19270
		o_mousedrop = 0x2f408
		o_mouseinventory = 0x2fd64
		o_inventory_id = 0x8
		b_offset_3 = 0x1992598
		o_fcam = 0xc
		o_fcamfov = 0x48
		o_fcamposx = 0x9c
		o_fcamposy = 0xa0
		o_fcamposz = 0xa4
		o_camposx = 0xa8
		o_camposy = 0xac
		o_camposz = 0xb0
		o_camangle = 0x30
		b_fov = 0x17A6B10
		b_camrange_1 = 0x17A6AF4
		b_camrange_2 = 0x17A6AF8
	}
	if (server = "Hazy"){
		mcell := 240
		b_ccell := 0x3359C9C
		b_cweight = 0x3359CC0
		b_mweight = 0x3359CC4
		b_offset_1 := 0x32BC048
		o_chp := 0x40
		o_mhp = 0x23b4
		o_cmp = 0x44
		o_mmp = 0x23b8
		o_exp = 0x50
		o_nickname = 0x5a
		o_guild = 0x18
		o_id_1 = 0xc
		o_checknpc_1 =0xb0
		o_id_2 = 0x1e68
		o_id_3 = 0x1e6c
		o_weapon = 0x33c
		o_shield = 0x340
		o_armor = 0x344
		o_pet = 0x388
		o_pstat_ar1 = 0x38c
		o_pstat_ar2 = 0x38e
		o_pstat_ar3 = 0x390
		o_pstat_ar4 = 0x392
		o_pstat_ar5 = 0x394
		o_pstat_ar6 = 0x396
		o_pstat_at1 = 0x398
		o_pstat_at2 = 0x39a
		o_pstat_at3 = 0x39c
		o_pstat_at4 = 0x39e
		o_pstat_at5 = 0x3a0
		o_pstat_at6 = 0x3a2
		o_buff_paralysis=0x410
		o_buff_antiinvis=0x640
		o_pspeed = 0x1e10
		o_prange = 0x1e34
		o_paspeed = 0x1ed8
		o_pastat = 0x1de8
		o_pangle = 0x1e28
		o_moverange = 0x1e30
		o_transparent_1 = 0x1e38
		o_typeinvis = 0x1e90
		o_infoinvis = 0x1e9c
		o_moveposx = 0x1eb0
		o_moveposy = 0x1eb4
		o_moveposz = 0x1eb8
		o_move = 0x2378
		o_posxs = 0x2384
		o_posys = 0x2388
		o_poszs = 0x238c
		o_attacktype_1 = 0x23c0
		o_attacktype_2 = 0x23c4
		o_attacktype_3 = 0x23c8
		o_identifier = 0x98
		o_identifier_target = 0x9c
		o_posx = 0x48
		o_posy = 0x4c
		o_posz = 0x50
		o_posrange = 0x58
		o_outline = 0x2f6
		o_modelsize_1 = 0x308
		o_modelsize_2 = 0x348
		o_transparent_2 = 0x3e0
		o_checknpc_2 = 0x3e8
		o_gravity = 0x3f0
		o_targetinvis = 0x40c
		o_outline_color = 0x418
		o_drop_id = 0x14
		b_offset_2 = 0x32BC054
		o_mouseobject = 0x516c
		o_icon = 0x19410
		o_mousedrop = 0x2fb38
		o_mouseinventory = 0x30544
		o_inventory_id = 0x8
		b_offset_3 = 0x32BC05C
		o_fcam = 0xc
		o_fcamfov = 0x48
		o_fcamposx = 0x9c
		o_fcamposy = 0xa0
		o_fcamposz = 0xa4
		o_camposx = 0xa8
		o_camposy = 0xac
		o_camposz = 0xb0
		o_camangle = 0x30
		b_fov = 0x30622DC
		b_camrange_1 = 0x30622E4
		b_camrange_2 = 0x30622F0
	}
}