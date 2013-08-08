class sauerbraten {

   if $::osfamily == 'windows' {
      fail("Microsoft Windows is not supported.")
   }


   # Free-for-all default set of maps (this is the same set that comes with the Sauerbraten
   # install bundle from their web site).
   $ffa_maps_default =
      'complex douze ot academy metl2 metl3 justice turbine hashi mbt2 fanatic_quake dock
       renegade curvy_castle nmp8 tartech aard3c skrdm1 bvdm_01 outpost park tumwalk industry
       injustice mbt10 curvedm kalking1 hog2 kffa fragplaza collusion duel8 alithia island
       frozen memento neondevastation alloy ruine DM_BS1 shinmei1 osiris sdm1 powerplant
       oasis metl4 ruby shindou dune gubo teahupoo rm5 depot masdm orbe torment legazzo fury
       mbt9 refuge shadowed dirtndust force killfactory moonlite castle_trap orion ogrosupply
       nucleus elegy shiva arbana simplicity pitch_black duel7 suburb roughinery stemple
       tejen pgdm deathtek hades corruption paradigm lostinspace sauerstruck phosgene
       neonpanic akaritori konkuri-to katrez_d oddworld guacamole wake5 frostbyte thor
       aqueducts ksauer1 kmap5 thetowers darkdeath wdcd'


   # Default set of CAPTURE and HOLD maps (not capture-the-flag...see below)
   $capture_maps_default =
      'urban_c nevil_c fb_capture collusion c_valley lostinspace fc3 face-capture nmp4 nmp8
       hallo tempest monastery alithia hades fc4 relic fc5 paradigm corruption asteroids
       ogrosupply reissen akroseum turbulence frostbyte c_egypt caribbean dust2 campo
       dirtndust damnation arabic spcr nucleus evilness subterra snapper_rocks kopenhagen
       asgard mbt12 cwcastle nitro suburb haste valhalla abbey venice mercury core_transfer
       hidden forge eternal_valley tortuga core_refuge infamy capture_night river_c
       serenity xenon nmp9 ph-capture killcore3 twinforts duomo donya'


   # CAPTURE-THE-FLAG, PROTECT and COLLECT default maps
   $ctf_maps_default =
      'hallo flagstone tempest siberia reissen tejen shipwreck authentic urban_c bt_falls
       valhalla garden mbt1 autumn akroseum face-capture dust2 mach2 evilness turbulence
       l_ctf twinforts berlin_wall mbt12 europium abbey redemption damnation forge campo
       nitro infamy catch22 subterra forgotten nucleus bad_moon snapper_rocks haste spcr
       asgard mill capture_night arbana hidden eternal_valley mercury kopenhagen tortuga
       mbt4 core_refuge core_transfer desecration recovery wdcd suburb xenon sacrifice'

   $sp_maps_default =
      'mpsp6a mpsp6b mpsp6c mpsp9a mpsp9b mpsp9c mpsp10 lost level9'
}

