"ROCKVIL for
			A MIND FOREVER VOYAGING
	     (c) 1985 by Infocom, Inc.  All Rights Reserved."

<ROOM ROCKVIL-CENTRE
      (LOC ROOMS)
      (DESC "Rockvil Centre")
      (NORTH TO HALLEY-AND-PARK)
      (NE TO CENTRE-AND-KENNEDY)
      (EAST TO MAIN-AND-KENNEDY)
      (SE PER DUNBARS-ENTER-F)
      (SOUTH TO ELM-AND-PARK)
      (SW SORRY "There's no entrance to City Hall in that direction.")
      (WEST PER CITY-HALL-ENTER-F)
      (NW SORRY "There's no entrance to City Hall in that direction.")
      (FLAGS STREETBIT OUTSIDEBIT NARTICLEBIT)
      (GLOBAL CITY-HALL-OBJECT DUNBARS-OBJECT PEOPLE)
      (ACTION ROCKVILLE-CENTRE-F)>

<ROUTINE ROCKVILLE-CENTRE-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "The name of this plaza tells it all. The ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "well-maintained">)
		      (<EQUAL? ,SYEAR 2051 2061>
		       <TELL "aging">)
		      (T
		       <SCORE 11> ;"1 point"
		       <TELL "crumbling">)>
		<TELL
" portico of City Hall stretches along the west side of the plaza, and
Dunbar's lies on the southeast corner. Park Street leads north and south.
Main Street and Centre Street both begin here, leading eastward and
northeastward, respectively.">)>>

<ROUTINE DUNBARS-ENTER-F ()
	 <COND (<OR <G? ,STIME 1260>
		    <L? ,STIME 600>>
		<CLOSED-PRINT "Dunbar's">
		<RFALSE>)
	       (<EQUAL? ,SYEAR 2071>
		<SCORE 122> ;"1 point"
		<TELL
"A security guard stops you at the doorway, scrutinizing you with a haughty
sneer. \"Do you have an appointment?\"">
		<COND (<YES?>
		       <TELL CR "\"">
		       <REPEAT ()
			       <TELL "The name on that appointment?\"" CR CR>
		       	       <PRINTI ">">
		       	       <READ ,P-INBUF ,P-LEXV>
			       <COND (<ZERO? <GETB ,P-LEXV ,P-LEXWORDS>>
			     	      <TELL "\"Sorry, I missed that. ">
				      <AGAIN>)>
			       <RETURN>>
		       <TELL
"\"I'm sorry, sir. There's no appointment in that name.\"">)
		      (T
		       <TELL
"\"Next time, please call for an appointment beforehand.\"">)>
		<TELL
" The guard leads you firmly away from the building before leaving." CR>
		<RFALSE>)
	       (T
		,DUNBARS)>>

<ROOM DUNBARS
      (LOC ROOMS)
      (DESC "Dunbar's")
      (NW TO ROCKVIL-CENTRE)
      (OUT TO ROCKVIL-CENTRE)
      (FLAGS NARTICLEBIT)
      (GLOBAL DUNBARS-OBJECT PEOPLE)
      (ACTION DUNBARS-F)>

<ROUTINE DUNBARS-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<MOVE ,SPEAR-CARRIER ,HERE>
		<PUTP ,SPEAR-CARRIER ,P?SDESC "clerk">)
	       (<EQUAL? .RARG ,M-LOOK>
		<TELL "You have entered a">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "n upscale">)
		      (<EQUAL? ,SYEAR 2051>
		       <TELL " swank">)
		      (<EQUAL? ,SYEAR 2061>
		       <TELL " very swank">)>
		<TELL " department store, ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "crowded despite its rather steep prices">)
		      (<EQUAL? ,SYEAR 2051>
		       <TELL "an elegant boutique with a wealthy clientele">)
		      (T
		       <TELL "catering exclusively to the wealthy elite">)>
		<COND (<EQUAL? ,SYEAR 2061>
		       <TELL
". Racks in this part of the store are filled with plainer garments">)
		      (T
		       <TELL
". Racks all around you are stocked with the latest fashions">)>
		<TELL ". The exit to the street is northwest.">)
	       (<EQUAL? .RARG ,M-END>
		<CLOSING-TIME 1260 "the store" "a guard" ,ROCKVIL-CENTRE>)>>

<OBJECT DUNBARS-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "Dunbar's")
	(SYNONYM DUNBAR\'S DUNBARS STORE SHOP BOUTIQUE)
	(ADJECTIVE VENERABLE DEPARTMEN DEPT SWANK ELEGANT UPSCALE)
	(FLAGS NARTICLEBIT)
	(ACTION DUNBARS-OBJECT-F)>

<ROUTINE DUNBARS-OBJECT-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,HERE ,DUNBARS>
		       <TELL ,LOOK-AROUND CR>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?SE>)>)
	       (<VERB? DISEMBARK LEAVE>
		<COND (<EQUAL? ,HERE ,ROCKVIL-CENTRE>
		       <TELL ,LOOK-AROUND CR>)
		      (T
		       <DO-WALK ,P?NW>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,DUNBARS>
		       <V-LOOK>)
		      (T
		       <TELL
"Dunbar's, a venerable shop, specializes in fashions for both sexes." CR>)>)>>

<OBJECT RACKS
	(LOC DUNBARS)
	(DESC "racks of fashionable clothes")
	(SYNONYM RACK RACKS FASHION FASHIONS)
	(ADJECTIVE FASHIONABLE)
	(FLAGS NDESCBIT NARTICLEBIT PLURALBIT)
	(ACTION RACKS-F)>

<ROUTINE RACKS-F ()
	 <COND (<VERB? EXAMINE>
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL
"The clothes are diverse and fashionable, and quite steeply priced." CR>)
		      (<EQUAL? ,SYEAR 2051>
		       <TELL
"The clothes are quite stylish, and virtually all
out of your price range." CR>)
		      (T
		       <TELL
"The clothes in the few racks near you are mostly in the drab browns and
olives worn by the lower classes. Over in the restricted areas of the store,
you can spot racks laden with stylish clothes in the violets and golds
favored by Churchmen and other landowners." CR>)>)>> 

<OBJECT CLOTHES
	(LOC GLOBAL-OBJECTS)
	(DESC "clothes")
	(SYNONYM CLOTHES CLOTHING GARMENT GARMENTS PANTS SHIRT SHIRTS)
	(ADJECTIVE MY PAIR PAIRS FASHIONABLE DRAB BROWN OLIVE STYLISH
		   VIOLET GOLD)
	(FLAGS NARTICLEBIT TRYTAKEBIT NDESCBIT PLURALBIT)
	(ACTION CLOTHES-F)>

<ROUTINE CLOTHES-F ("AUX" GARMENT)
	 <COND (<VERB? BUY>
		<COND (<EQUAL? ,HERE ,DUNBARS>
		       <COND (<OR <NOT <FSET? ,SWEATER ,TRYTAKEBIT>>
				  <NOT <IN? ,SCARF ,LOCAL-GLOBALS>>>
			      <CLOTHES-BUDGET>)
			     (T
			      <COND (<EQUAL? ,SYEAR 2041>
				     <SET GARMENT ,SWEATER>
				     <TELL
"You look through many racks, finding nothing you like, and finally select
a brightly colored myalon sweater that fits you perfectly">)
				    (T
				     <SET GARMENT ,VEST>
				     <TELL
"After wincing at the prices, you pick out a thin, imitation wool vest">)>
			      <COND (<TOO-POOR 120 .GARMENT>
				     <RTRUE>)>
			      <COND (<EQUAL? ,SYEAR 2041>
				     <MOVE ,SWEATER ,PLAYER>
				     <FCLEAR ,SWEATER ,NDESCBIT>
				     <FCLEAR ,SWEATER ,TRYTAKEBIT>)
				    (T
				     <MOVE ,VEST ,PLAYER>
				     <FCLEAR ,VEST ,NDESCBIT>
				     <FCLEAR ,VEST ,TRYTAKEBIT>)>
			      <TELL
". A clerk removes the anti-theft tag from the garment">
			      <DEBIT 120>
			      <TELL "." CR>)>)
		      (<EQUAL? ,HERE ,HEIMAN-VILLAGE ,ROCKVIL-MALL>
		       <COND (<OR <L? ,STIME 480>
				  <G? ,STIME 1380>>
			      <TELL "Every store is closed for the night." CR>
			      <RTRUE>)
			     (<OR <NOT <FSET? ,SWEATER ,TRYTAKEBIT>>
				  <NOT <FSET? ,VEST ,TRYTAKEBIT>>
				  <NOT <IN? ,SCARF ,LOCAL-GLOBALS>>>
			      <CLOTHES-BUDGET>
			      <RTRUE>)>
		       <PUTP ,SPEAR-CARRIER ,P?SDESC "clerk">
		       <TELL
"You enter a clothing store, but they have little that suits your taste. You
finally pick out a conservative male scarf">
		       <COND (<TOO-POOR 39 ,SCARF>
			      <TELL CR "You meekly leave the store." CR>
			      <RTRUE>)>
		       <MOVE ,SCARF ,PLAYER>
		       <DEBIT 39>
		       <TELL "." CR>)
		      (T
		       <CANT-BUY ,CLOTHES>)>)
	       (<VERB? TAKE WEAR>
		<COND (<AND <EQUAL? ,HERE ,DUNBARS>
		     	    <FSET? ,CLOTHES ,TRYTAKEBIT>>
		       <TELL "You haven't paid for them." CR>)
		      (T
		       <TELL "You're already wearing your clothes!" CR>)>)
	       (<VERB? REMOVE TAKE-OFF ;DROP> ;"DROP is handled by IDROP"
		<COND (<IN-APARTMENT?>
		       <TELL
"You remove your clothes for a minute, but there's a bit of a chill in
the air, so you decide to put them back on." CR>)
		      (T
		       <TELL
"You'd be arrested if you removed your clothes in public!" CR>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,DUNBARS>
		       <PERFORM ,V?EXAMINE ,RACKS>
		       <RTRUE>)
		      (T
		       <PERFORM ,V?EXAMINE ,ME>
		       <RTRUE>)>)>>

<OBJECT SWEATER
	(LOC DUNBARS)
	(DESC "sweater")
	(SYNONYM SWEATER SWEATERS)
	(ADJECTIVE BRIGHTLY COLORED MYALON MY)
	(SIZE 10)
	(FLAGS TAKEBIT WEARBIT TRYTAKEBIT NDESCBIT)
	(ACTION SWEATER-F)>

<ROUTINE SWEATER-F ()
	 <COND (<VERB? BUY>
		<PERFORM ,V?BUY ,CLOTHES>
		<RTRUE>)
	       (<AND <VERB? TAKE>
		     <FSET? ,SWEATER ,TRYTAKEBIT>>
		<PERFORM ,V?TAKE ,CLOTHES>
		<RTRUE>)
	       (<AND <VERB? EXAMINE>
		     <NOT <FSET? ,SWEATER ,TRYTAKEBIT>>>
		<TELL
"It is a bright and colorful sweater, made of myalon." CR>)>>

<OBJECT VEST
	(LOC DUNBARS)
	(DESC "vest")
	(SYNONYM VEST VESTS)
	(ADJECTIVE THIN IMITATION WOOL)
	(SIZE 10)
	(FLAGS TAKEBIT WEARBIT TRYTAKEBIT NDESCBIT)
	(ACTION VEST-F)>

<ROUTINE VEST-F ()
	 <COND (<VERB? BUY>
		<PERFORM ,V?BUY ,CLOTHES>
		<RTRUE>)
	       (<AND <VERB? TAKE>
		     <FSET? ,VEST ,TRYTAKEBIT>>
		<PERFORM ,V?TAKE ,CLOTHES>
		<RTRUE>)
	       (<AND <VERB? EXAMINE>
		     <NOT <FSET? ,VEST ,TRYTAKEBIT>>>
		<TELL "The vest is of thin imitation wool." CR>)>>

<OBJECT SCARF
	(LOC LOCAL-GLOBALS)
	(DESC "scarf")
	(SYNONYM SCARF)
	(ADJECTIVE CONSERVATIVE MALE)
	(FLAGS TAKEBIT WEARBIT)
	(ACTION SCARF-F)>

<ROUTINE SCARF-F ()
	 <COND (<VERB? BUY>
		<PERFORM ,V?BUY ,CLOTHES>
		<RTRUE>)
	       (<VERB? EXAMINE>
		<TELL "The scarf is simple and conservatively styled." CR>)>>

<ROOM CITY-HALL
      (LOC ROOMS)
      (DESC "City Hall")
      (EAST TO ROCKVIL-CENTRE)
      (OUT TO ROCKVIL-CENTRE)
      (FLAGS NARTICLEBIT)
      (GLOBAL CITY-HALL-OBJECT)
      (ACTION CITY-HALL-F)>

<ROUTINE CITY-HALL-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"The city's seat of government is an old concrete-slab building dating back to
the late twentieth century. ">
		<COND (<EQUAL? ,SYEAR 2071>
		       <SCORE 11> ;"1 point"
		       <TELL
"The interior is decrepit; it looks as though no maintenance has
been performed here for years. ">)>
		<TELL "The only exit is east.">)
	       (<EQUAL? .RARG ,M-END>
		<CLOSING-TIME 1080 "the building" "a guard" ,ROCKVIL-CENTRE>)>>

<ROUTINE CITY-HALL-ENTER-F ()
	 <COND (<AND <G? ,STIME 600>
		     <L? ,STIME 1080>>
		,CITY-HALL)
	       (T
		<CLOSED-PRINT "City Hall">
		<RFALSE>)>>

<OBJECT CITY-HALL-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "City Hall")
	(SYNONYM HALL)
	(ADJECTIVE CITY)
	(FLAGS NARTICLEBIT)
	(ACTION CITY-HALL-OBJECT-F)>

<ROUTINE CITY-HALL-OBJECT-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,HERE ,CITY-HALL>
		       <TELL ,LOOK-AROUND CR>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?WEST>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,ROCKVIL-CENTRE>
		       <TELL ,LOOK-AROUND CR>)
		      (T
		       <DO-WALK ,P?WEST>)>)>>

<OBJECT BENCH
	(LOC CITY-HALL)
	(DESC "bench")
	(SYNONYM BENCH)
	(FLAGS NDESCBIT VEHBIT CONTBIT FURNITUREBIT SEARCHBIT)
	(ACTION BENCH-F)>

<ROUTINE BENCH-F ;("OPTIONAL" RARG) ()
	 <COND ;(.RARG
		<RFALSE>)
	       ;(<VERB? OPEN CLOSE>
		<TELL "Huh?" CR>)
	       (<AND <VERB? EXAMINE>
		     <IN? ,GOVERNMENT-OFFICIAL ,HERE>>
		<TELL "A ">
		<PRINTD ,GOVERNMENT-OFFICIAL>
		<TELL " is sitting on the bench." CR>)>>

<OBJECT GOVERNMENT-OFFICIAL
	(LOC LOCAL-GLOBALS)
	(DESC "government official")
	(LDESC
"A government official is sitting on a bench in the center of the lobby,
eating a snack.")
	(SYNONYM OFFICIAL)
	(ADJECTIVE GOVERNMENT GOVT)
	(FLAGS ACTORBIT)
	(GENERIC GENERIC-OFFICIAL-F)
	(ACTION GOVERNMENT-OFFICIAL-F)>

<ROUTINE GOVERNMENT-OFFICIAL-F ()
	 <COND (<OR <VERB? TELL>
		    <EQUAL? ,GOVERNMENT-OFFICIAL ,WINNER>>
		<SETG PRSO ,GOVERNMENT-OFFICIAL>
		<MOVE ,OFFICIAL-SNACK ,LOCAL-GLOBALS>
		<BRIEF-CHAT>
		<COND (<EQUAL? ,SYEAR 2041>
		       <COND (,RECORDING
		       	      <PUT ,RECORDING-TABLE 2 1>)>
		       <TELL
"cheerily comments on how well things in the city are running, and how
rewarding his job has been lately" ,OFFICIAL-LEAVES CR>)
		      (T
		       <SCORE 136> ;"2 points"
		       <TELL
"grumpily complains that most of his department has been laid off as city
services are cut back. Suddenly he notices the time, looks frightened,
and rushes away." CR>)> 
		<CLEAR-BUF>)
	       ;(<AND <VERB? ASK-ABOUT>
		     <PRSO? ,GOVERNMENT-OFFICIAL>>
		<PERFORM ,V?TELL ,PRSO>
		<RTRUE>)
	       (<VERB? SIT-NEXT-TO>
		<PERFORM ,V?SIT ,BENCH>
		<RTRUE>)>>

<OBJECT OFFICIAL-SNACK
	(LOC LOCAL-GLOBALS)
	(DESC "snack")
	(SYNONYM SNACK CUPCAKE DONUT DOUGHNUT CAKE)
	(ADJECTIVE CUP LARGE)
	(FLAGS NDESCBIT)
	(ACTION SNACK-F)>

<ROUTINE SNACK-F ()
	 <COND (<VERB? EXAMINE>
	        <TELL
,IT-LOOKS-LIKE " some kind of large donut or cupcake." CR>)
	       (<VERB? TAKE EAT>
		<TELL "It's not yours." CR>)>>

<ROOM MAIN-AND-KENNEDY
      (LOC ROOMS)
      (DESC "Main & Kennedy")
      (NORTH TO CENTRE-AND-KENNEDY)
      (NE PER OFFICE-BUILDING-ENTER-F)
      (EAST TO MAIN-AND-RIVER)
      (SE PER OFFICE-BUILDING-ENTER-F)
      (SOUTH TO ELM-AND-KENNEDY)
      (SW PER KENNEDY-PARK-ENTER-F)
      (WEST TO ROCKVIL-CENTRE)
      (NW PER SKYBUS-TERMINAL-ENTER-F)
      (FLAGS STREETBIT OUTSIDEBIT NARTICLEBIT)
      (GLOBAL SKYBUS-TERMINAL-OBJECT PARK-OBJECT GLASS TOWNHOUSE PEOPLE
       	      CONSTRUCTION-OBJECT GATE)
      (ACTION MAIN-AND-KENNEDY-F)>

<ROUTINE MAIN-AND-KENNEDY-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is the heart of the downtown area, flanked by classical glass-and-steel
skyscrapers. The skybus terminal ">
		<COND (<EQUAL? ,SYEAR 2071>
		       <SCORE 12> ;"2 points"
		       <TELL
"on the northwest corner has been closed for several years, following an
unprofitable experiment to sell the skybus system to a private company">)
		      (T
		       <TELL "is on the northwest corner">)>
		<TELL ". To the southwest is an entrance to ">
		<COND (<EQUAL? ,SYEAR 2061>
		       <TELL "a ">
		       <PRINTD ,CONSTRUCTION-OBJECT>)
		      (<EQUAL? ,SYEAR 2071>
		       <TELL "luxury townhouses">)
		      (T
		       <TELL "Kennedy Park">)>
		<TELL "." CR CR>
		<PERFORM ,V?EXAMINE ,INFOTECH-BUILDING>
		<TELL CR ,SILICORP-DESCRIPTION
" From this intersection, Main Street runs east and west, and Kennedy
Street can take you north or south.">)>>

<GLOBAL SILICORP-DESCRIPTION
"The high-rise building on the southeast corner is the Silicorp Building,
a tall office tower.">

<OBJECT SILICORP-BUILDING
	(LOC MAIN-AND-KENNEDY)
	(DESC "Silicorp Building")
	(SYNONYM BUILDING BLDG HIGH-RISE TOWER SKYSCRAPER)
	(ADJECTIVE TALL OFFICE SILICORP)
	(FLAGS NDESCBIT)
	(ACTION SILICORP-BUILDING-F)>

<ROUTINE SILICORP-BUILDING-F ()
	 <COND (<AND <VERB? THROUGH WALK-TO>
		     <EQUAL? ,HERE ,MAIN-AND-KENNEDY>>
		<DO-WALK ,P?SE>)
	       (<VERB? DISEMBARK LEAVE>
		<TELL ,LOOK-AROUND CR>)
	       (<VERB? EXAMINE>
		<TELL ,SILICORP-DESCRIPTION CR>)>>

<OBJECT INFOTECH-BUILDING
	(LOC MAIN-AND-KENNEDY)
	(DESC "InfoTech Building")
	(SYNONYM BUILDING BLDG LANDMARK TOWER SKYSCRAPER)
	(ADJECTIVE INFOTECH INFO TECH TALL OFFICE FAMOUS)
	(FLAGS NDESCBIT VOWELBIT)
	(ACTION INFOTECH-BUILDING-F)>

<ROUTINE INFOTECH-BUILDING-F ()
	 <COND (<AND <VERB? THROUGH WALK-TO>
		     <EQUAL? ,HERE ,MAIN-AND-KENNEDY>>
		<DO-WALK ,P?NE>)
	       (<VERB? DISEMBARK LEAVE>
		<TELL ,LOOK-AROUND CR>)
	       (<VERB? EXAMINE>
		<TELL
"The skyscraper on the northeast corner is one of Rockvil's most famous
landmarks, the ">
		<PRINTD ,INFOTECH-BUILDING>
		<TELL
". This 130-story office tower is the tallest building in the city and the ">
		<COND (<EQUAL? ,SYEAR 2061>
		       <TELL "fifth">)
		      (<EQUAL? ,SYEAR 2071>
		       <TELL "third">)
		      (T
		       <TELL "sixth">)>
		<TELL " tallest in the world." CR>)>>

<ROUTINE SKYBUS-TERMINAL-ENTER-F ()
	 <COND (<EQUAL? ,SYEAR 2071>
		<SCORE 12> ;"2 points"
		<TELL ,BOARDED-OVER CR>
	        <RFALSE>)
	       (T
		,SKYBUS-TERMINAL)>>

<ROOM SKYBUS-TERMINAL
      (LOC ROOMS)
      (DESC "Skybus Terminal")
      (DOWN PER TUBES-ENTER-F)
      (NW SORRY "The gates are all closed.")
      (SE TO MAIN-AND-KENNEDY)
      (OUT TO MAIN-AND-KENNEDY)
      (FLAGS ONBIT)
      (GLOBAL SKYBUS-TERMINAL-OBJECT GATE STAIRS TUBE-STATION
       	      BOARDING-PLATFORM)
      (ACTION SKYBUS-TERMINAL-F)>

<ROUTINE SKYBUS-TERMINAL-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL
"This is part of the Commuter Skybus System (CSS), built during the 2010's by
the now-defunct Federal Energy Independence Agency. ">)
		      (<EQUAL? ,SYEAR 2061>
		       <SCORE 123> ;"1 point"
		       <TELL
"This station, built long ago by government funds, looks run-down
and in need of repair. ">)>
		<TELL
"Skybuses depart from this terminal for many suburban points. The ">
		<PRINTD ,BOARDING-PLATFORM>
		<TELL
"s lie to the northwest, and the exit to the street is southeast. A stairway
leads downward.">)>>

<OBJECT BOARDING-PLATFORM
	(LOC LOCAL-GLOBALS)
	(DESC "boarding platform")
	(SYNONYM PLATFORM)
	(ADJECTIVE BOARDING)
	(ACTION BOARDING-PLATFORM-F)>

<ROUTINE BOARDING-PLATFORM-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,SKYBUS-TERMINAL>
		       <DO-WALK ,P?NW>)
		      (<FSET? ,HERE ,TUBEBIT>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXIT LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,SKYBUS-TERMINAL>
		       <TELL ,LOOK-AROUND CR>)
		      (T
		       <V-WALK-AROUND>)>)>>

<OBJECT SKYBUS
	(LOC SKYBUS-TERMINAL)
	(DESC "skybus")
	(SYNONYM SKYBUS)
	(FLAGS NDESCBIT)
	(ACTION SKYBUS-F)>

<ROUTINE SKYBUS-F ()
	 <COND (<VERB? THROUGH>
		<DO-WALK ,P?NW>)
	       (<VERB? WAIT-FOR EXAMINE FIND>
		<TELL
"You'd have to be on the skybus boarding platforms for that!" CR>)
	       (<NOT <MOBY-VERB?>>
		<CANT-SEE ,SKYBUS>)>>

<OBJECT SKYBUS-TERMINAL-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "terminal")
	(SYNONYM TERMINAL STATION)
	(ADJECTIVE SKYBUS RUN-DOWN)
	(ACTION SKYBUS-TERMINAL-OBJECT-F)>

<ROUTINE SKYBUS-TERMINAL-OBJECT-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,HERE ,SKYBUS-TERMINAL>
		       <TELL ,LOOK-AROUND CR>)
		      (<EQUAL? ,HERE ,MAIN-AND-KENNEDY>
		       <DO-WALK ,P?NW>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?UP>)>)
	       (<VERB? DISEMBARK LEAVE>
		<COND (<EQUAL? ,HERE ,SKYBUS-TERMINAL>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)>>

<OBJECT TOWNHOUSE
	(LOC LOCAL-GLOBALS)
	(DESC "townhouse")
	(SYNONYM TOWNHOUSE COMPLEX CLUSTER)
	(ADJECTIVE LUXURY HIGH-SECURITY)
	(ACTION TOWNHOUSE-F)>

<ROUTINE TOWNHOUSE-F ()
	 <COND (<AND <NOT <EQUAL? ,SYEAR 2071>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,TOWNHOUSE>)
	       (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,MAIN-AND-KENNEDY>
		       <DO-WALK ,P?SW>)
		      (<EQUAL? ,HERE ,ELM-AND-KENNEDY>
		       <DO-WALK ,P?NW>)
		      (<EQUAL? ,HERE ,ELM-AND-PARK>
		       <DO-WALK ,P?NE>)>)>>

<ROUTINE KENNEDY-PARK-ENTER-F ()
	 <COND (<EQUAL? ,SYEAR 2071>
		<TELL "The entrances to the townhouses are all locked." CR>
		<RFALSE>)
	       (T
		,KENNEDY-PARK)>>

<ROOM KENNEDY-PARK
      (LOC ROOMS)
      (SDESC "")
      (NORTH SORRY "There's no exit on that side of the park.")
      (NE TO MAIN-AND-KENNEDY)
      (EAST SORRY "There's no exit on that side of the park.")
      (SE TO ELM-AND-KENNEDY)
      (SOUTH SORRY "There's no exit on that side of the park.")
      (SW TO ELM-AND-PARK)
      (WEST SORRY "There's no exit on that side of the park.")
      (NW SORRY "There's no exit on that side of the park.")
      (FLAGS OUTSIDEBIT PARKBIT)
      (GLOBAL PEOPLE GATE GLOBAL-SIGN WATER PARK-OBJECT CONSTRUCTION-OBJECT)
      (ACTION KENNEDY-PARK-F)>

<ROUTINE KENNEDY-PARK-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<COND (<EQUAL? ,SYEAR 2041 2051>
		       <FSET ,KENNEDY-PARK ,NARTICLEBIT>
		       <PUTP ,KENNEDY-PARK ,P?SDESC "Kennedy Park">)
		      (T
		       <FCLEAR ,KENNEDY-PARK ,NARTICLEBIT>
		       <PUTP ,KENNEDY-PARK ,P?SDESC "Construction Site">)>)
	       (<EQUAL? .RARG ,M-LOOK>
		<COND (<EQUAL? ,SYEAR 2061>
		       <SCORE 13> ;"2 points"
		       <TELL
"There is a construction project in progress here:" CR>
		       <PERFORM ,V?READ ,GLOBAL-SIGN>
		       <TELL
"The project is still in the early stages, with trees being torn up on one end
of the site, and digging for the foundation going on at the other end.">)
		      (T
		       <TELL
"This is a small, downtown park with gates leading northeast, southeast, and
southwest. There is a sprawling, free-form waterpool surrounding a statue
of John F. Kennedy in the center of the park.">)>)>>

<OBJECT WATERPOOL
	(LOC LOCAL-GLOBALS)
	(DESC "waterpool")
	(SYNONYM WATERPOOL POOL FOUNTAIN)
	(ADJECTIVE SPRAWLING FREE-FORM WATER)
	(FLAGS NDESCBIT)
	(ACTION WATERPOOL-F)>

<ROUTINE WATERPOOL-F ()
	 <COND (<VERB? THROUGH BOARD SWIM>
		<TELL "Swimming in public fountains is illegal." CR>)
	       (<VERB? LOOK-INSIDE EXAMINE>
		<TELL
"You look into the waters of the pool, hoping to find some coins, or
perhaps an unusual fish. However, you discover nothing of interest." CR>)>>

<OBJECT STATUE
	(LOC LOCAL-GLOBALS)
	(DESC "statue")
	(SYNONYM STATUE KENNEDY JOHN JFK)
	(ADJECTIVE JOHN FITZGERAL)
	(FLAGS NDESCBIT)
	(ACTION STATUE-F)>

<ROUTINE STATUE-F ()
	 <COND (<VERB? READ>
		<PERFORM ,V?READ ,PLAQUE>
		<RTRUE>)
	       (<VERB? EXAMINE>
		<TELL
"There is a small bronze plaque at the base of the statue." CR>)>>

<OBJECT PLAQUE
	(LOC LOCAL-GLOBALS)
	(DESC "plaque")
	(SYNONYM PLAQUE)
	(ADJECTIVE SMALL BRONZE)
	(FLAGS NDESCBIT READBIT)
	(TEXT
"       John Fitzgerald Kennedy|
              1917-1963")>

<ROOM ELM-AND-PARK
      (LOC ROOMS)
      (DESC "Elm & Park")
      (NORTH TO ROCKVIL-CENTRE)
      (NE PER KENNEDY-PARK-ENTER-F)
      (EAST TO ELM-AND-KENNEDY)
      (SE TO POST-OFFICE)
      (SOUTH TO SOUTHWAY-AND-PARK)
      (SW TO POLICE-STATION)
      (WEST TO ELM-AND-UNIVERSITY)
      (NW PER COURTHOUSE-ENTER-F)
      (GLOBAL COURTHOUSE-OBJECT PARK-OBJECT POST-OFFICE-OBJECT TOWNHOUSE
       	      CONSTRUCTION-OBJECT GATE POLICE-STATION-OBJECT PEOPLE)
      (FLAGS STREETBIT OUTSIDEBIT NARTICLEBIT)
      (ACTION ELM-AND-PARK-F)>

<ROUTINE ELM-AND-PARK-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is the intersection of the north-south Park Street and the
east-west Elm Street. A ">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL "cluster of townhouses">)
		      (<EQUAL? ,SYEAR 2061>
		       <PRINTD ,CONSTRUCTION-OBJECT>)
		      (T
		       <TELL "park entrance">)>
		<TELL
" is on the northeast corner, and large, old-fashioned edifices occupy
the other three corners of the intersection.">)>>

<ROUTINE COURTHOUSE-ENTER-F ()
	 <COND (<OR <G? ,STIME 990>
		    <L? ,STIME 570>>
		<CLOSED-PRINT "The courthouse">
		<RFALSE>)
	       (T
		,COURTHOUSE)>>

<ROOM COURTHOUSE
      (LOC ROOMS)
      (DESC "Courthouse")
      (SE TO ELM-AND-PARK)
      (OUT TO ELM-AND-PARK)
      (FLAGS ONBIT)
      (GLOBAL COURTHOUSE-OBJECT WOMAN PEOPLE)
      (ACTION COURTHOUSE-F)>

<ROUTINE COURTHOUSE-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "The ">
		<PRINTD ,COURTHOUSE-OBJECT>
		<TELL
" is of the same vintage as the other governmental buildings in the area,
dating from around 1990 or so. An exit leads southeast.">
		<COND (<AND <G? ,STIME 570>
			   <L? ,STIME 1080>>
		       <TELL CR CR "The court is in session. ">
		       <COND (<EQUAL? ,SYEAR 2041>
			      <TELL "A woman is being tried for petty theft">)
			     (<EQUAL? ,SYEAR 2051>
			      <SCORE 14> ;"2 points"
			      <TELL
"Two men face the death penalty for attempted rape">)
			     (<EQUAL? ,SYEAR 2061>
			      <SCORE 15> ;"5 points"
			      <TELL
"An Asian-American juvenile has just been handed a life sentence for
violating the Uniform Morality Code">)
			     (<EQUAL? ,SYEAR 2071>
			      <SCORE 16> ;"8 points"
			      <TELL
"Twenty pathetic, emaciated people are being tattooed for upcoming Execution
Matches for cheating on their Food Allowance">)>
		       <TELL ".">)>)
	       (<EQUAL? .RARG ,M-END>
		<SHOP-CLOSES 990 "courthouse" "A bailiff" ,ELM-AND-PARK>)>>

<OBJECT COURTHOUSE-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "courthouse")
	(SYNONYM COURTHOUSE HOUSE)
	(ADJECTIVE COURT)
	(ACTION COURTHOUSE-OBJECT-F)>

<ROUTINE COURTHOUSE-OBJECT-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,HERE ,COURTHOUSE>
		       <TELL ,LOOK-AROUND CR>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?NW>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,COURTHOUSE>
		       <DO-WALK ,P?SE>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,COURTHOUSE>>
		<V-LOOK>)>>

<OBJECT POLICE-STATION-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "police station")
	(SYNONYM STATION HEADQUARTERS HQ)
	(ADJECTIVE POLICE)
	(ACTION POLICE-STATION-OBJECT-F)>

<ROUTINE POLICE-STATION-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,ELM-AND-PARK>
		       <DO-WALK ,P?SW>)
		      (<GLOBAL-IN? ,POLICE-STATION-OBJECT ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,POLICE-STATION>
		       <DO-WALK ,P?NE>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,POLICE-STATION>>
		<V-LOOK>)>>

<ROOM POLICE-STATION
      (LOC ROOMS)
      (DESC "Police Station")
      (NE TO ELM-AND-PARK)
      (EAST SORRY "You're not allowed into the cell area.")
      (OUT TO ELM-AND-PARK)
      (FLAGS ONBIT)
      (GLOBAL JAIL-OBJECT POLICE-STATION-OBJECT DESK PEOPLE)
      (ACTION POLICE-STATION-F)>

<ROUTINE POLICE-STATION-F (RARG)
	 <COND ;(<EQUAL? .RARG ,M-ENTER>
		<MOVE ,SPEAR-CARRIER ,HERE>
		<PUTP ,SPEAR-CARRIER ,P?SDESC "desk officer">
		<RFALSE>)
	       (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is the headquarters for all the city's precinct stations. The building
is at least " N <- ,SYEAR 1966> " years old">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL ", but has obviously been recently renovated">)
		      (<EQUAL? ,SYEAR 2061 2071>
		       <TELL ", and is obviously ">
		       <COND (<EQUAL? ,SYEAR 2071>
			      <TELL "badly ">)>
		       <TELL "in need of renovation">)>
		<TELL ". Behind the reception desk, ">
		<COND (<EQUAL? ,SYEAR 2041 2051>
		       <TELL "crowded ">)
		      (<EQUAL? ,SYEAR 2071>
		       <TELL "empty ">)>
		<TELL
"jail cells are visible. The desk officer looks at you expectantly.
The only exit is northeast.">)>>

<OBJECT POLICEMAN
	(LOC POLICE-STATION)
	(DESC "police officer")
	(SYNONYM OFFICER POLICE POLICEMAN POLICEMEN COP COPS)
	(ADJECTIVE POLICE DESK)
	(FLAGS ACTORBIT NDESCBIT)
	(ACTION POLICEMAN-F)>

<ROUTINE POLICEMAN-F ()
	 <COND (<EQUAL? ,POLICEMAN ,WINNER>
		<TELL "\"Unless you've got a crime to report, scram.\"" CR>
		<CLEAR-BUF>)
	       (<AND <VERB? TELL-ABOUT>
		     <PRSI? ,CRIME ,CRIMINAL>>
		<TELL
"The officer recites a rapid sing-song about the various forms and
official channels and procedures and personnel required for the
reporting of a crime." CR>)>>

<ROUTINE I-JAIL ()
	 <SCORE 17> ;"10 points!"
	 <JIGS-UP
"After many anxious minutes, the door is yanked open, and you are dragged
before a judge, his bench draped with the banner of a Church Holyman. Your
head spins as the proceedings speed past around you. Suddenly you realize
that the judge is addressing you.|
|
\"...a sin against God, Churchmen, and your fellow animals.\" He addresses the
arresting officers. \"He's too old for the Matches. Just take him out back.\"
Seconds later you are in an alley, your face grinding into broken glass as one
of the policemen pounds you again and again and again and again with his
massive club. Finally, bleeding and barely conscious, you hear the second cop,
speaking from a great distance, say \"enough fun -- let's finish it.\" He
draws his biogun.">>

<ROOM JAIL-CELL
      (LOC ROOMS)
      (DESC "Jail Cell")
      (LDESC
"You are in a featureless, grimy jail cell. A heavy metal door forms
the eastern wall of the cell.")
      (EAST SORRY "The metal door is locked, of course.")
      (OUT SORRY "The metal door is locked, of course.")
      (FLAGS ONBIT)
      (GLOBAL JAIL-OBJECT UNOPENABLE-DOOR)>

<OBJECT BLANKET
	(LOC JAIL-CELL)
	(DESC "blanket")
	(FDESC "A ratty, bug-infested blanket is the only furnishing.")
	(SYNONYM BLANKET)
	(ADJECTIVE RATTY TORN BUG-INFESTED)
	(FLAGS TAKEBIT)
	(SIZE 15)
	(ACTION BLANKET-F)>

<ROUTINE BLANKET-F ()
	 <COND (<AND <VERB? PUT-ON>
		     <PRSI? ,ME>>
		<PERFORM ,V?BOARD ,BLANKET>
		<RTRUE>)
	       (<VERB? EXAMINE>
		<TELL "The blanket is torn and crawling with bugs." CR>)
	       (<VERB? BOARD LIE-DOWN CLIMB-ON WEAR>
		<TELL
"You change your mind when some particularly wiggly
bugs crawl onto you." CR>)>>

<ROOM POST-OFFICE
      (LOC ROOMS)
      (DESC "Post Office")
      (NW TO ELM-AND-PARK)
      (OUT TO ELM-AND-PARK)
      (FLAGS ONBIT)
      (GLOBAL GLOBAL-SIGN GLOBAL-WINDOW POST-OFFICE-OBJECT COUNTER PEOPLE)
      (ACTION POST-OFFICE-F)>

<ROUTINE POST-OFFICE-F (RARG)
	 <COND (<AND <EQUAL? .RARG ,M-ENTER>
		     <EQUAL? ,SYEAR 2061 2071>>
		<QUEUE I-POST-OFFICE -1>)
	       (<EQUAL? .RARG ,M-LOOK>
		<TELL "This is an old ">
		<PRINTD ,POST-OFFICE-OBJECT>
		<TELL
", probably built back in the days when \"mail\" usually meant letters
and packages delivered by human messengers. ">
		<COND (<EQUAL? ,SYEAR 2041 2051>
		       <COND (<AND <G? ,STIME 480>
				   <L? ,STIME 1020>>
			      <TELL "A ">
		       	      <COND (<EQUAL? ,SYEAR 2041>
			      	     <TELL "couple">)
			     	    (T
			      	     <TELL "line">)>
			      <TELL " of people are waiting at the counter">)
			     (T
			      <TELL
"The windows are all closed for the night">)>)
		      (<OR <AND <EQUAL? ,SYEAR 2061>
				<G? ,STIME 600>
				<L? ,STIME 960>>
			   <AND <EQUAL? ,SYEAR 2071>
				<G? ,STIME 900>
				<L? ,STIME 960>>>
		       <SCORE 124> ;"1 point"
		       <TELL
"A long queue of people with resigned expressions are waiting at
the solitary open window">)
		      (T
		       <TELL
"The windows along the counter are all closed. One bears a crude,
handwritten sign that reads \"Open daily, ">
		       <COND (<EQUAL? ,SYEAR 2061>
			      <TELL "10a">)
			     (T
			      <TELL "3p">)>
		       <TELL "m to 4pm\"">)>
		<TELL ". A doorway leads out to the northwest.">)>> 

<OBJECT POST-OFFICE-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "post office")
	(SYNONYM OFFICE)
	(ADJECTIVE POST)
	(ACTION POST-OFFICE-OBJECT-F)>

<ROUTINE POST-OFFICE-OBJECT-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,HERE ,POST-OFFICE>
		       <TELL ,LOOK-AROUND CR>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?SE>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,POST-OFFICE>
		       <TELL ,LOOK-AROUND CR>)
		      (T
		       <DO-WALK ,P?NW>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,POST-OFFICE>>
		<V-LOOK>)>>

<ROOM SOUTHWAY-AND-PARK
      (LOC ROOMS)
      (DESC "Southway & Park")
      (NORTH TO ELM-AND-PARK)
      (NE TO HOSPITAL-ANNEX)
      (EAST TO SOUTHWAY-AND-KENNEDY)
      (SE TO ROW-HOUSES)
      (SOUTH PER FOODVILLE-ENTER-F)
      (SW TO SOUTHWAY-UNDERPASS)
      (WEST TO PARKVIEW-APARTMENTS)
      (NW PER MAIN-LIBRARY-ENTER-F)
      (FLAGS STREETBIT OUTSIDEBIT NARTICLEBIT)
      (GLOBAL GLOBAL-SIGN GLOBAL-WINDOW SUPERMARKET MAIN-LIBRARY-OBJECT PEOPLE
       	      HOSPITAL-OBJECT ANNEX-OBJECT NOTE PARKVIEW-APARTMENTS-OBJECT)
      (ACTION SOUTHWAY-AND-PARK-F)>

<ROUTINE SOUTHWAY-AND-PARK-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<MOVE ,CARD-CATALOG-CARD ,LOCAL-GLOBALS>
		<FCLEAR ,PARKVIEW-DOOR ,OPENBIT>)
	       (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Southway bends sharply at this intersection, leading east and southwest.
Park Street begins here and heads north. There are ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "new ">)
		      (T
		       <TELL "aging ">)>
		<TELL "buildings on the northeast and western corners, and ">
		<COND (<NOT <EQUAL? ,SYEAR 2041>>
		       <TELL "even ">)>
		<TELL
"older-looking buildings to the northwest and southeast">
		<GROCERY-STORE-DESC>
		<TELL ", spans the southern side of the street.">)>>

<ROUTINE GROCERY-STORE-DESC ()
	 <TELL ". A grocery store, its ">
	 <COND (<EQUAL? ,SYEAR 2041>
		<TELL "brightly lit window heaped with food">)
	       (<EQUAL? ,SYEAR 2051>
		<TELL "window filled with food">)
	       (<EQUAL? ,SYEAR 2061>
		<SCORE 18> ;"1 point"
		<TELL "dimly-lit windows revealing sparse stacks of cans">)
	       (T
		<SCORE 19> ;"4 points"
		<TELL
"grimy windows barely transparent enough to reveal a large sign
reading \"Rations for ">
		<COND (<EQUAL? <MOD ,SDATE 3> 0>
		       <TELL "1's, 2's and 3's">)
		      (<EQUAL? <MOD ,SDATE 3> 1>
		       <TELL "4's, 5's and 6's">)
		      (T
		       <TELL "7's, 8's, 9's and 10's">)>
		<TELL " today\"">)>>

<ROUTINE MAIN-LIBRARY-ENTER-F ()
	 <COND (<OR <AND <EQUAL? ,SYEAR 2041 2051>
			 <G? ,STIME 510>
			 <L? ,STIME 1320>>
		    <AND <EQUAL? ,SYEAR 2061>
			 <G? ,STIME 600>
			 <L? ,STIME 1260>>
		    <AND <EQUAL? ,SYEAR 2071>
			 <G? ,STIME 750>
			 <L? ,STIME 990>>>
		,MAIN-LIBRARY)
	       (T
		<CLOSED-PRINT "The library">
		<RFALSE>)>>

<OBJECT MAIN-LIBRARY-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "library")
	(SYNONYM LIBRARY BRANCH SYSTEM)
	(ADJECTIVE MAIN ROCKVIL PUBLIC LIBRARY)
	(ACTION MAIN-LIBRARY-OBJECT-F)>

<ROUTINE MAIN-LIBRARY-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,MAIN-LIBRARY>
		       <TELL ,LOOK-AROUND CR>)
		      (<GLOBAL-IN? ,MAIN-LIBRARY-OBJECT ,HERE>
		       <DO-WALK ,P?NW>)
		      (<NOT ,SIMULATING>
		       <PERFORM ,V?THROUGH ,LIBRARY-MODE>
		       <RTRUE>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,MAIN-LIBRARY>
		       <DO-WALK ,P?SE>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,MAIN-LIBRARY>>
		<V-LOOK>)
	       (<AND <VERB? SMELL>
		     <EQUAL? ,HERE ,MAIN-LIBRARY>
		     <EQUAL? ,SYEAR 2071>>
		<TELL
"The library is filled with a stale odor: the smell of decaying books." CR>)>>

<ROOM MAIN-LIBRARY
      (LOC ROOMS)
      (DESC "Main Library")
      (SE TO SOUTHWAY-AND-PARK)
      (OUT TO SOUTHWAY-AND-PARK)
      (FLAGS ONBIT)
      (GLOBAL MAIN-LIBRARY-OBJECT PEOPLE)
      (ACTION MAIN-LIBRARY-F)>

<ROUTINE MAIN-LIBRARY-F (RARG "AUX" TIME)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<MOVE ,SPEAR-CARRIER ,HERE>
      		<MOVE ,BOOKS ,HERE>
		<MOVE ,CARD-CATALOG-CARD ,GLOBAL-OBJECTS>
		<PUTP ,SPEAR-CARRIER ,P?SDESC "librarian">)
	       (<EQUAL? .RARG ,M-LOOK>
	        <TELL
"This is the main branch of the Rockvil Public Library system, ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "crowded but quiet">)
		      (<EQUAL? ,SYEAR 2051 2061>
		       <TELL "not too crowded and very quiet">)
		      (T
		       <TELL
"deserted, dusty, and silent as a tomb. The smell of decaying, rotting
books is overpowering. The only thing in sight that doesn't seem hoary
with age is a list hanging on one wall">)>
		<TELL ". The librarian is standing near the ">
		<PRINTD ,CARD-CATALOG>
		<TELL ". The only exit is southeast.">)
	       (<EQUAL? .RARG ,M-END>
		<COND (<EQUAL? ,SYEAR 2071>
		       <SET TIME 990>)
		      (<EQUAL? ,SYEAR 2061>
		       <SET TIME 1260>)
		      (T
		       <SET TIME 1320>)>
		<SHOP-CLOSES
		 .TIME "library" "The librarian" ,SOUTHWAY-AND-PARK>)>>

<OBJECT BANNED-TITLES-LIST
	(LOC LOCAL-GLOBALS)
	(DESC "list of titles")
	(SYNONYM LIST TITLES TAPES PROGRAMS)
	(ADJECTIVE BANNED LATEST COMPREHENSIVE)
	(FLAGS NDESCBIT READBIT)
	(ACTION BANNED-TITLES-LIST-F)>

<ROUTINE BANNED-TITLES-LIST-F ()
	 <COND (<VERB? READ EXAMINE>
		<SCORE 121> ;"6 points"
		<TELL
"It's the latest comprehensive list of banned books, tapes, and programs,
issued by the Morality Bureau of the government. The list is huge but some
of the titles jump out at you: Thoreau's \"Walden,\" Kafka's \"The Trial,\"
Orwell's \"Animal Farm,\" Kennedy's \"Profiles in Courage,\" Bernstein's
\"Mass,\" Schell's \"Fate of the Earth,\" Maribendu's \"Weep, My Child,\"
and Hathaway's \"Inner Workings of the Church.\" Even Rav's book, \"A Child's
Vision,\" is on the list." CR>)>>

<OBJECT CARD-CATALOG
	(LOC MAIN-LIBRARY)
	(DESC "card catalog")
	(SYNONYM CATALOG FILE)
	(ADJECTIVE CARD COMPUTERI)
	(FLAGS NDESCBIT)
	(ACTION CARD-CATALOG-F)>

<ROUTINE CARD-CATALOG-F ()
	 <COND (<VERB? OPEN>
		<TELL
"\"Card catalog\" is an anachronistic term -- this isn't an old-fashioned
catalog with drawers of cards; it's computerized." CR>)
	       (<VERB? EXAMINE>
		<TELL "Pretty typical computerized ">
		<PRINTD ,CARD-CATALOG>
		<TELL " for locating titles." CR>)
	       (<VERB? READ>
		<TELL
"It would take days to read all the entries in the catalog." CR>)>>

<OBJECT CARD-CATALOG-CARD
	(LOC LOCAL-GLOBALS)
	(DESC "card")
	(SYNONYM CARD)
	(ACTION CARD-CATALOG-CARD-F)>

<ROUTINE CARD-CATALOG-CARD-F ()
	 <PERFORM ,V?OPEN ,CARD-CATALOG>
	 <RTRUE>>

<OBJECT LIBRARY-ACCOUNT
	(LOC LOCAL-GLOBALS)
	(DESC "library account")
	(SYNONYM ACCOUNT)
	(ADJECTIVE LIBRARY)
	(ACTION LIBRARY-ACCOUNT-F)>

<ROUTINE LIBRARY-ACCOUNT-F ()
	 <COND (<AND <VERB? ASK-FOR>
		     <PRSO? ,SPEAR-CARRIER>
		     <EQUAL? ,HERE ,MAIN-LIBRARY>>
		<TELL
"The librarian has you fill out several forms. After filing them, she whispers
that your card should arrive in the mail within ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "a month">)
		      (<EQUAL? ,SYEAR 2071>
		       <TELL "a year">)
		      (T
		       <TELL "several months">)>
		<TELL "." CR>)>>

<ROOM FOODVILLE-1
      (LOC ROOMS)
      (DESC "Foodville")
      (NORTH TO SOUTHWAY-AND-PARK)
      (SW TO SKYCAR-LOT-1)
      (FLAGS ONBIT)
      (GLOBAL SUPERMARKET CARLOT SHELVES)
      (ACTION FOODVILLE-1-F)>

<ROUTINE FOODVILLE-1-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<COND (<EQUAL? ,SYEAR 2071>
		       <SETG CLERK-WAITING <>>
		       <QUEUE I-FOODVILLE 1>)>
		<MOVE ,SPEAR-CARRIER ,HERE>
		<PUTP ,SPEAR-CARRIER ,P?SDESC "clerk">)
	       (<EQUAL? .RARG ,M-LOOK>
		<FOODVILLE-DESC>
		<TELL "north, and the exit to the car lot is southwest.">)
	       (<EQUAL? .RARG ,M-END>
		<FOODVILLE-CLOSES>)>>

<ROUTINE FOODVILLE-ENTER-F ("AUX" (X T))
	 <COND (<AND <EQUAL? ,SYEAR 2041 2051>
		     <OR <G? ,STIME 1320>
			 <L? ,STIME 480>>>
		<SET X <>>)
	       (<AND <EQUAL? ,SYEAR 2061>
		     <OR <G? ,STIME 1140>
			 <L? ,STIME 600>>>
		<SET X <>>)
	       (<AND <EQUAL? ,SYEAR 2071>
		     <OR <G? ,STIME 960>
			 <L? ,STIME 700>>>
		<SET X <>>)>
	 <COND (.X
		<COND (<EQUAL? ,HERE ,MAIN-AND-WICKER>
		       ,FOODVILLE-2)
		      (T
		       ,FOODVILLE-1)>)
	       (<EQUAL? ,SYEAR 2071>
		<TELL
"According to a note on the door, the Foodville is only open from 11:30am
until 4:00 in the afternoon." CR>
		<RFALSE>)
	       (T
		<CLOSED-PRINT "The Foodville">
		<RFALSE>)>>

<ROUTINE FOODVILLE-DESC ()
	 <TELL "This is a large ">
	 <PRINTD ,SUPERMARKET>
	 <TELL ", ">
	 <COND (<EQUAL? ,SYEAR 2041>
		<TELL
"brightly lit and stocked with aisle after aisle of slickly packaged food">)
	       (<EQUAL? ,SYEAR 2051>
		<TELL "reasonably clean and well-stocked with food">)
	       (<EQUAL? ,SYEAR 2061>
	        <SCORE 18> ;"1 point"
	        <TELL
"and it is beginning to show its age. The shelves are sparsely filled
with plain, badly labelled tins">)
	       (T
	        <SCORE 19> ;"4 points"
		<TELL
"and it is literally crumbling. The shelves are empty, and the
interior is uniformly filthy">)>
	 <TELL ". The exit to the street is ">>

<ROUTINE FOODVILLE-CLOSES ("AUX" TIME NEW-LOC)
	 <COND (<EQUAL? ,SYEAR 2041 2051>
		<SET TIME 1320>)
	       (<EQUAL? ,SYEAR 2061>
		<SET TIME 1140>)
	       (<EQUAL? ,SYEAR 2071>
		<SET TIME 960>)
	       (T ;"never close in 2081"
		<SET TIME 1500>)>
	 <COND (<EQUAL? ,HERE ,FOODVILLE-1>
		<SET NEW-LOC ,SOUTHWAY-AND-PARK>)
	       (T
		<SET NEW-LOC ,MAIN-AND-WICKER>)>
	 <CLOSING-TIME .TIME "the store" "a clerk" .NEW-LOC>>

<OBJECT NOTE
	(LOC LOCAL-GLOBALS)
	(DESC "note")
	(SYNONYM NOTE)
	(FLAGS READBIT)
	(TEXT "\"Hours: 11:30am - 4:00pm.\"")
	(ACTION NOTE-F)>

<ROUTINE NOTE-F ()
	 <COND (<AND <NOT <EQUAL? ,SYEAR 2071>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,NOTE>)>>

<OBJECT SUPERMARKET
	(LOC LOCAL-GLOBALS)
	(DESC "supermarket")
	(SYNONYM FOODVILLE SUPERMARK STORE GROCERY MARKET)
	(ADJECTIVE GROCERY FOOD)
	(ACTION SUPERMARKET-F)>

<ROUTINE SUPERMARKET-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,HERE ,FOODVILLE-1 ,FOODVILLE-2>
		       <TELL ,LOOK-AROUND CR>)
		      (<EQUAL? ,HERE ,SOUTHWAY-AND-PARK>
		       <DO-WALK ,P?SOUTH>)
		      (<EQUAL? ,HERE ,MAIN-AND-WICKER>
		       <DO-WALK ,P?SW>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?NE>)>)
	       (<VERB? DISEMBARK LEAVE>
		<COND (<EQUAL? ,HERE ,FOODVILLE-1>
		       <V-WALK-AROUND>)
		      (<EQUAL? ,HERE ,FOODVILLE-2>
		       <DO-WALK ,P?NW>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,FOODVILLE-1 ,FOODVILLE-2>
		       <V-LOOK>)
		      (<EQUAL? ,SYEAR 2081>
		       <PERFORM ,V?EXAMINE ,BUILDING>
		       <RTRUE>)>)
	       (<AND <VERB? SMELL>
		     <EQUAL? ,SYEAR 2081>>
		<TELL "A nauseating, rancid odor hangs in the air." CR>)
	       (<AND <VERB? WASH>
		     <EQUAL? ,SYEAR 2071 2081>>
		<PERFORM ,V?WASH ,GLOBAL-ROOM>
		<RTRUE>)>>

<OBJECT SOY-PATTY
	(LOC LOCAL-GLOBALS)
	(DESC "soy patty")
	(SYNONYM PATTY PACKAGE FOOD)
	(ADJECTIVE SOY SMELLY)
	(FLAGS TAKEBIT)
	(GENERIC GENERIC-FOOD-F)
	(ACTION SOY-PATTY-F)>

<ROUTINE SOY-PATTY-F ()
	 <COND (<VERB? EAT>
		<MOVE ,SOY-PATTY ,LOCAL-GLOBALS>
		<TELL
"About the only good thing to say is that it was filling." CR>)
	       (<VERB? EXAMINE>
		<SCORE 126> ;"2 points"
		<TELL
"Dehydrated soy patties such as these are about the only things that have
been available from ration centers for months. This one looks even more dry
and tasteless than usual." CR>)
	       (<VERB? BUY>
		<COND (<AND <EQUAL? ,HERE ,FOODVILLE-1 ,FOODVILLE-2>
			    <EQUAL? ,SYEAR 2071>>
		       <TELL
"You can't buy one; you could use your ration card, though..." CR>)
		      (T
		       <CANT-BUY ,SOY-PATTY>)>)>>

<GLOBAL CLERK-WAITING <>>

<ROUTINE I-FOODVILLE ()
	 <COND (<NOT <EQUAL? ,HERE ,FOODVILLE-1 ,FOODVILLE-2>>
		<SETG CLERK-WAITING <>>
		<RFALSE>)>
	 <COND (,CLERK-WAITING
		<TELL CR
"The clerk says, \"Listen, joker. I don't have all day.\" He motions to
a bouncer, who grabs you roughly by the collar and tosses you out on
the street." CR CR>
		<COND (<EQUAL? ,HERE ,FOODVILLE-1>
		       <GOTO ,SOUTHWAY-AND-PARK>)
		      (T
		       <GOTO ,MAIN-AND-WICKER>)>)
	       (T
		<SETG CLERK-WAITING T>
		<QUEUE I-FOODVILLE 2>
		<TELL CR "A bored clerk asks for your ">
		<PRINTD ,RATION-CARD>
		<TELL "." CR>)>>

<ROOM SOUTHWAY-UNDERPASS
      (LOC ROOMS)
      (DESC "Southway Underpass")
      (NORTH SORRY "There's no entrance to the firehouse in that direction.")
      (NE TO SOUTHWAY-AND-PARK)
      (EAST TO SKYCAR-LOT-1)
      (SE TO SKYCAR-LOT-1)
      (SOUTH TO SKYCAR-LOT-1)
      (SW PER SUBURBS-ENTER-F)
      (WEST SORRY "There's no entrance to the firehouse in that direction.")
      (NW TO FIREHOUSE)
      (FLAGS STREETBIT ONBIT)
      (GLOBAL HIGHWAY FIREHOUSE-OBJECT CARLOT PEOPLE)
      (ACTION SOUTHWAY-UNDERPASS-F)>

<ROUTINE SOUTHWAY-UNDERPASS-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "Here, Southway passes under the old ">
		<PRINTD ,HIGHWAY>
		<TELL ". A ">
		<PRINTD ,FIREHOUSE-OBJECT>
		<TELL
" sits off to the northwest in the shadow of the elevated highway. A car lot
lies to the southeast. Southway continues northeast into the city">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL
", but is blocked to the southwest by the collapse of part of the highway.">)
		      (T
		       <TELL " and southwest into the suburbs.">)>)>>

<ROOM FIREHOUSE
      (LOC ROOMS)
      (DESC "Firehouse")
      (SE TO SOUTHWAY-UNDERPASS)
      (OUT TO SOUTHWAY-UNDERPASS)
      (FLAGS ONBIT)
      (GLOBAL FIREHOUSE-OBJECT)
      (ACTION FIREHOUSE-F)>

<ROUTINE FIREHOUSE-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "This is an old ">
		<PRINTD ,FIREHOUSE-OBJECT>
		<TELL ", ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "but it is equipped with the latest models of ">)
		      (<EQUAL? ,SYEAR 2051 2061>
		       <TELL "equipped with some aging ">)
		      (T
		       <SCORE 127> ;"2 points"
		       <TELL "equipped with a single dilapidated ">)>
		<COND (<EQUAL? ,SYEAR 2071>
		       <PRINTD ,FIRECOPTER>)
		      (T
		       <TELL "firetrucks and ">
		       <PRINTD ,FIRECOPTER>
		       <TELL "s">)>
		<TELL ". Southway lies to the southeast.">)>>

<OBJECT FIREHOUSE-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "fire station")
	(SYNONYM FIREHOUSE HOUSE STATION)
	(ADJECTIVE FIRE OLD)
	(ACTION FIREHOUSE-OBJECT-F)>

<ROUTINE FIREHOUSE-OBJECT-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,HERE ,FIREHOUSE>
		       <TELL ,LOOK-AROUND CR>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?NW>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,FIREHOUSE>
		       <DO-WALK ,P?SE>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)>>

<OBJECT FIRETRUCK
	(LOC LOCAL-GLOBALS)
	(DESC "firetruck")
	(SYNONYM FIRETRUCK TRUCK)
	(ADJECTIVE FIRE YELLOW)
	(FLAGS VEHBIT NDESCBIT)
	(ACTION FIRETRUCK-F)>

<OBJECT FIRECOPTER
	(LOC FIREHOUSE)
	(DESC "firecopter")
	(SYNONYM FIRECOPTE COPTER)
	(ADJECTIVE FIRE YELLOW)
	(FLAGS VEHBIT NDESCBIT)
	(ACTION FIRETRUCK-F)>

<ROUTINE FIRETRUCK-F ;("OPTIONAL" RARG) ()
	 <COND ;(.RARG
		<RFALSE>)
	       ;(<VERB? OPEN CLOSE>
		<TELL "Huh?" CR>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL "It's">)
		      (T
		       <TELL "They're">)>
		<TELL " bright yellow, like most firefighting vehicles">
		<COND (<EQUAL? ,SYEAR 2061 2071>
		       <TELL
", but the metal is rusting through in many points">)>
		<TELL "." CR>)
	       (<VERB? BOARD THROUGH>
		<TELL
"A firefighter sees you and yells, \"Hey, gettaway from there,\" and escorts
you out of the firehouse." CR CR>
		<GOTO ,SOUTHWAY-UNDERPASS>)>>

<ROOM SKYCAR-LOT-1
      (LOC ROOMS)
      (DESC "Skycar Lot")
      (LDESC
"This is a car lot for the Foodville to the northeast. The exit is northwest.
An industrial park is visible beyond the fence that borders the rear of
the lot to the south and east.")
      (NORTH SORRY "There's a tall fence in the way.")
      (NE PER FOODVILLE-ENTER-F)
      (EAST SORRY "There's a tall fence in the way.")
      (SE SORRY "There's a tall fence in the way.")
      (SOUTH SORRY "There's a tall fence in the way.")
      (SW SORRY "There's a tall fence in the way.")
      (WEST SORRY "There's a tall fence in the way.")
      (NW TO SOUTHWAY-UNDERPASS)
      (FLAGS OUTSIDEBIT)
      (GLOBAL FENCE SUPERMARKET CARLOT INDUSTRIAL-PARK-OBJECT NOTE)>

<ROOM ELM-AND-UNIVERSITY
      (LOC ROOMS)
      (DESC "Elm & University")
      (NORTH SORRY "There's no entrance to the campus in that direction.")
      (NE SORRY "There's no entrance to the campus in that direction.")
      (EAST TO ELM-AND-PARK)
      (SE SORRY
       "There's no entrance to the apartment block in that direction.")
      (SOUTH TO UNIVERSITY-HEIGHTS)
      (SW SORRY
       "There's no entrance to the apartment complex in that direction.")
      (WEST TO ELM-UNDERPASS)
      (NW TO ROCKVIL-UNIVERSITY)
      (DOWN PER TUBES-ENTER-F)
      (FLAGS STREETBIT OUTSIDEBIT NARTICLEBIT)
      (GLOBAL CAMPUS STAIRS UNIVERSITY-HEIGHTS-OBJECT TUBE-STATION PEOPLE)
      (ACTION ELM-AND-UNIVERSITY-F)>

<ROUTINE ELM-AND-UNIVERSITY-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"University Avenue forks off to the northwest, meandering into the campus
which spans the north side of Elm Street here. A tall apartment complex
is on the south side of the street. The top of some steps indicate ">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL "a former">)
		      (T
		       <TELL "an">)>
		<TELL " entrance to the Tubes.">)>>

<OBJECT UNIVERSITY-HEIGHTS-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "University Heights")
	(SYNONYM HEIGHTS COMPLEX)
	(ADJECTIVE TALL APARTMENT UNIVERSIT)
	(FLAGS VOWELBIT NARTICLEBIT)
	(ACTION UNIVERSITY-HEIGHTS-OBJECT-F)>

<ROUTINE UNIVERSITY-HEIGHTS-OBJECT-F ()
	 <COND (<AND <VERB? WALK-TO THROUGH>
		     <GLOBAL-IN? ,UNIVERSITY-HEIGHTS-OBJECT ,HERE>>
		<DO-WALK ,P?SOUTH>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,ELM-AND-UNIVERSITY>
		       <TELL ,LOOK-AROUND CR>)
		      (T
		       <DO-WALK ,P?NORTH>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,UNIVERSITY-HEIGHTS>
		       <V-LOOK>)
		      (T
		       <PRINTD ,UNIVERSITY-HEIGHTS>
		       <TELL " is a tall apartment complex." CR>)>)>>

<ROOM UNIVERSITY-HEIGHTS
      (LOC ROOMS)
      (DESC "University Heights")
      (IN PER INNER-LOBBY-ENTER-F)
      (OUT TO ELM-AND-UNIVERSITY)
      (NORTH TO ELM-AND-UNIVERSITY)
      (SOUTH PER INNER-LOBBY-ENTER-F)
      (FLAGS NARTICLEBIT)
      (GLOBAL UNOPENABLE-DOOR MAILBOXES PICTUREPHONE GRAFFITI GLASS
       	      UNIVERSITY-HEIGHTS-OBJECT)
      (ACTION UNIVERSITY-HEIGHTS-F)>

<ROUTINE UNIVERSITY-HEIGHTS-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<MOVE ,BUZZERS ,HERE>)
	       (<EQUAL? .RARG ,M-LOOK>
		<DESCRIBE-APARTMENT-VESTIBULE "south" "north">)>>

<ROOM ELM-UNDERPASS
      (LOC ROOMS)
      (DESC "Elm Underpass")
      (NORTH PER EZZIS-BAR-ENTER-F)
      (NE SORRY "There's no entrance to the bar in that direction.")
      (EAST TO ELM-AND-UNIVERSITY)
      (SE SORRY "There's no entrance to the restaurant in that direction.")
      (SOUTH PER ROYS-PAGODA-ENTER-F)
      (SW SORRY "There's no entrance to the restaurant in that direction.")
      (WEST PER SUBURBS-ENTER-F)
      (NW SORRY "There's no entrance to the bar in that direction.")
      (FLAGS STREETBIT ONBIT)
      (GLOBAL PEOPLE GRAFFITI GLOBAL-WINDOW HIGHWAY RESTAURANT-OBJECT
       	      BAR-OBJECT)
      (ACTION ELM-UNDERPASS-F)>

<ROUTINE ELM-UNDERPASS-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Elm Street passes under an elevated roadway, a relic of the last century's ">
		<PRINTD ,HIGHWAY>
		<TELL
" system. A Chinese restaurant fills the space under the highway to the
south, and a bar is nestled under the roadway north of here. Elm leads
eastward, to downtown, and westward toward the suburbs.">
		<COND (<EQUAL? ,SYEAR 2071>
		       <SCORE 20> ;"2 points"
		       <TELL CR CR "An ">
		       <PRINTD ,ROY>
		       <TELL
", perhaps Roy himself, is scrubbing graffiti off the window of the
restaurant. The graffiti reads \"Chinks Get Lost\".">)>)>>

<OBJECT ROY
	(DESC "old Chinese man")
	(SYNONYM CHINAMAN MAN ROY)
	(ADJECTIVE OLD CHINESE)
	(FLAGS NDESCBIT ACTORBIT)
	(ACTION ROY-F)>

<ROUTINE ROY-F ()
	 <COND (<EQUAL? ,ROY ,WINNER>
		<SCORE 20> ;"2 points"
		<TELL
"\"No time for talking, sorry.\" He shakes his head sadly. \"Is a dishonor.
Three times this year already they break my window. Now this.\"" CR>
		<CLEAR-BUF>)>>

<ROUTINE ROYS-PAGODA-ENTER-F ()
	 <COND (<AND <OR <G? ,STIME 1200>
			 <L? ,STIME 420>>
		     <NOT <EQUAL? ,SYEAR 2041>>>
		<OF-COURSE ,RESTAURANT-OBJECT>
		<RFALSE>)
	       (T
		,ROYS-PAGODA)>>

<ROOM ROYS-PAGODA
      (LOC ROOMS)
      (DESC "Roy's Pagoda")
      (NORTH TO ELM-UNDERPASS)
      (OUT TO ELM-UNDERPASS)
      (FLAGS NARTICLEBIT)
      (GLOBAL RESTAURANT-OBJECT MENU PEOPLE GLOBAL-TABLE)
      (ACTION ROYS-PAGODA-F)>

<ROUTINE ROYS-PAGODA-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<MOVE ,SPEAR-CARRIER ,HERE>
		<PUTP ,SPEAR-CARRIER ,P?SDESC "waiter">
		<MOVE ,RESTAURANT-TABLE ,HERE>
		<MOVE ,CHAIR ,HERE>)
	       (<EQUAL? .RARG ,M-LOOK>
		<TELL "This is a small Chinese restaurant, ">
		<COND (<EQUAL? ,SYEAR 2071 2061>
		       <TELL "with a scattering of patrons">)
		      (T
		       <TELL "crowded with students">)>
		<TELL ". There is an exit to the north.">)
	       (<AND <EQUAL? .RARG ,M-END>
		     <NOT <EQUAL? ,SYEAR 2041>>
		     <G? ,STIME 1200>>
		<TELL CR
"A waiter, pointing frantically at the clock, urges you politely but
insistently through the door." CR CR>
		<GOTO ,ELM-UNDERPASS>)>>

<ROUTINE EZZIS-BAR-ENTER-F ()
	 <COND (<AND <OR <G? ,STIME 1200>
			 <L? ,STIME 420>>
		     <NOT <EQUAL? ,SYEAR 2041>>>
		<OF-COURSE ,BAR-OBJECT>
		<RFALSE>)
	       (T
		,EZZIS-BAR)>>

<ROOM EZZIS-BAR
      (LOC ROOMS)
      (DESC "Ezzi's Bar")
      (SOUTH PER EZZIS-BAR-EXIT-F)
      (OUT PER EZZIS-BAR-EXIT-F)
      (FLAGS NARTICLEBIT)
      (GLOBAL BAR-OBJECT COUNTER PEOPLE)
      (ACTION EZZIS-BAR-F)>

<ROUTINE EZZIS-BAR-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<MOVE ,SPEAR-CARRIER ,HERE>
		<PUTP ,SPEAR-CARRIER ,P?SDESC "bartender">
		<MOVE ,BEER ,LOCAL-GLOBALS>
		<MOVE ,BAR-STOOL ,HERE>)
	       (<EQUAL? .RARG ,M-LOOK>
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL
"This club, which has clearly seen better days, is almost empty">)
		      (T
		       <TELL "This noisy lounge ">
		       <COND (<EQUAL? ,SYEAR 2061>
			      <TELL "was once">)
			     (T
			      <TELL "is">)>
		       <TELL
" a favorite hangout for students from the nearby college">)>
		<TELL ,STOOL-DESC "The only exit is south.">)
	       (<EQUAL? .RARG ,M-END>
		<CURFEW-CLOSE ,ELM-UNDERPASS>)>>

<ROUTINE EZZIS-BAR-EXIT-F ()
	 <COND (<HELD? ,BEER>
		<TELL ,BARTENDER-YELLS CR>
		<RFALSE>)
	       (T
		,ELM-UNDERPASS)>>

<ROOM ROCKVIL-UNIVERSITY
      (LOC ROOMS)
      (DESC "Rockvil University")
      (NORTH TO HALLEY-AND-UNIVERSITY)
      (NE PER STUDENT-UNION-ENTER-F)
      (EAST SORRY "There's a tall fence in the way.")
      (SE PER LECTURE-HALL-ENTER-F)
      (SOUTH TO ELM-AND-UNIVERSITY)
      (SW SORRY "There's no entrance to the dorm in that direction.")
      (WEST PER DORM-ENTER-F)
      (NW SORRY "There's no entrance to the dorm in that direction.")
      (FLAGS STREETBIT OUTSIDEBIT NARTICLEBIT)
      (GLOBAL FENCE DORM-OBJECT STUDENT-UNION-OBJECT LECTURE-HALL-OBJECT
	      CAMPUS PEOPLE)
      (ACTION ROCKVIL-UNIVERSITY-F)>

<ROUTINE STUDENT-UNION-ENTER-F ()
	 <COND (<EQUAL? ,SYEAR 2071>
		<SCORE 63> ;"2 points"
		<TELL ,BOARDED-OVER CR>
		<RFALSE>)
	       (T
	        ,STUDENT-UNION)>>

<ROUTINE LECTURE-HALL-ENTER-F ()
	 <COND (<EQUAL? ,SYEAR 2071>
		<SCORE 63> ;"2 points"
		<TELL ,BOARDED-OVER CR>
		<RFALSE>)
	       (T
		,LECTURE-HALL)>>

<ROUTINE DORM-ENTER-F ()
	 <COND (<EQUAL? ,SYEAR 2071>
		<TELL
"Some of the boards over the entrance have been pried away, and you could
probably squeeze through. However, you hesitate, because it's so dangerous
to enter deserted buildings these days. Do you still want to enter?">
		<COND (<YES?>
		       <SCORE 21> ;"5 points"
		       <JIGS-UP
"|
Dorm|
As you stand in the lobby, waiting for your eyes to adjust to the dim
lighting, some pathetic squatters jump you. Taking no chances, lest you
get away and rat to the Church Police, they slit your throat.">)>
		<RFALSE>)
	       (T
		,DORM)>>

<ROUTINE ROCKVIL-UNIVERSITY-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "You are on University Avenue in the center of a ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "bustling">)
		      (<EQUAL? ,SYEAR 2051>
		       <TELL "crowded but calm">)
		      (<EQUAL? ,SYEAR 2061>
		       <TELL "nearly deserted">)
		      (T
		       <SCORE 63> ;"2 points"
		       <TELL "closed">)>
		<TELL " urban campus. ">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL
"Closed, boarded buildings lie to the west, northeast, and southeast">)
		      (T
		       <TELL
"There is a dormitory complex on the western side of the road, and other
buildings to the northeast and southeast">)>
		<TELL ". The street continues north and south.">)>>

<OBJECT CAMPUS
	(LOC LOCAL-GLOBALS)
	(DESC "campus")
	(SYNONYM CAMPUS UNIVERSIT)
	(ADJECTIVE ROCKVIL UNIVERSIT BUSTLING QUIET NEARLY DESERTED
	 	   URBAN CLOSED)
	(ACTION CAMPUS-F)>

<ROUTINE CAMPUS-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,HERE ,ELM-AND-UNIVERSITY ,LECTURE-HALL>
		       <DO-WALK ,P?NW>)
		      (<EQUAL? ,HERE ,DORM>
		       <DO-WALK ,P?EAST>)
		      (<EQUAL? ,HERE ,HALLEY-AND-UNIVERSITY>
		       <DO-WALK ,P?SOUTH>)
		      (<EQUAL? ,HERE ,STUDENT-UNION>
		       <DO-WALK ,P?SW>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,ROCKVIL-UNIVERSITY>
		       <TELL ,LOOK-AROUND CR>)
		      (<EQUAL? ,HERE ,DORM ,STUDENT-UNION ,LECTURE-HALL>
		       <TELL
"There's no way to leave the campus from here." CR>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)>>

<ROOM DORM
      (LOC ROOMS)
      (DESC "Dorm")
      (EAST TO ROCKVIL-UNIVERSITY)
      (OUT TO ROCKVIL-UNIVERSITY)
      (IN SORRY
"That would be impolite; the lounge is reserved for dorm residents.")
      (FLAGS ONBIT)
      (GLOBAL DORM-OBJECT CAMPUS CONVERSATION MUSIC)
      (ACTION DORM-F)>

<ROUTINE DORM-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You have entered one building in the dormitory complex, the very same
dorm where you once lived for several terms when you were a student at
the University. Many doors open onto a nearby lounge. ">
		<COND (<EQUAL? ,SYEAR 2061>
		       <TELL "The building is silent as a tomb">)
		      (T
		       <TELL "Loud music filters through the walls">
		       <COND (<NOT ,DORM-RAID-FLAG>
			      <TELL
", and the odor of mindex hangs in the air">)>)>
		<TELL ". The street lies to the east.">)
	       (<AND <EQUAL? .RARG ,M-END>
		     <EQUAL? ,SYEAR 2051>
		     <NOT ,DORM-RAID-FLAG>>
		<SCORE 23> ;"1 point"
		<SETG DORM-RAID-FLAG T>
		<SETG ELAPSED-TIME 10>
		<TELL CR
"Suddenly, the front door slams open, and dozens of uniformed officers burst
into the building. They force their way into room after room, and through the
nearby doorways you can see the police ransacking every room. Several students
are hustled outside into a waiting police van. A higher-ranking officer passes
by, and you can hear him saying something about \"confiscated drugs\" and
\"arrest will make a good example.\" A few minutes later, the raid is over,
and the dorm is buzzing with subdued ">
		<PRINTD ,CONVERSATION>
		<TELL "s." CR>)>>

<OBJECT DORM-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "dormitory")
	(SYNONYM DORM DORMITORY COMPLEX)
	(ADJECTIVE DORM DORMITORY)
	(ACTION DORM-OBJECT-F)>

<ROUTINE DORM-OBJECT-F ()
	<COND (<VERB? THROUGH WALK-TO>
	       <COND (<EQUAL? ,HERE ,DORM>
		      <TELL ,LOOK-AROUND CR>)
		     (<GLOBAL-IN? ,PRSO ,HERE>
		      <DO-WALK ,P?WEST>)>)
	      (<VERB? DISEMBARK LEAVE>
	       <COND (<EQUAL? ,HERE ,DORM>
		      <DO-WALK ,P?EAST>)
		     (T
		      <TELL ,LOOK-AROUND CR>)>)
	      (<AND <VERB? SMELL>
		    <EQUAL? ,SYEAR 2041 2051>>
	       <PERFORM ,V?SMELL ,MINDEX>
	       <RTRUE>)
	      (<VERB? EXAMINE>
	       <COND (<EQUAL? ,HERE ,DORM>
		      <V-LOOK>)
		     (<EQUAL? ,SYEAR 2071>
		      <DO-WALK ,P?WEST>)>)>>

<GLOBAL DORM-RAID-FLAG <>>

<OBJECT LOUNGE
	(LOC DORM)
	(DESC "lounge")
	(SYNONYM LOUNGE)
	(FLAGS NDESCBIT)
	(ACTION LOUNGE-F)>

<ROUTINE LOUNGE-F ()
	 <COND (<AND <VERB? THROUGH WALK-TO>
		     <EQUAL? ,HERE ,DORM>>
		<DO-WALK ,P?IN>)
	       (<AND <VERB? SMELL>
		     <EQUAL? ,SYEAR 2041 2051>>
		<PERFORM ,V?SMELL ,MINDEX>
		<RTRUE>)>>

<OBJECT LECTURE-HALL-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "lecture hall")
	(SYNONYM HALL)
	(ADJECTIVE LECTURE)
	(ACTION LECTURE-HALL-OBJECT-F)>

<ROUTINE LECTURE-HALL-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,ROCKVIL-UNIVERSITY>
		       <DO-WALK ,P?SE>)
		      (<GLOBAL-IN? ,LECTURE-HALL-OBJECT ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,LECTURE-HALL>
		       <DO-WALK ,P?NW>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,LECTURE-HALL>
		       <V-LOOK>)
		      (<EQUAL? ,SYEAR 2071>
		       <DO-WALK ,P?SE>)>)>>

<ROOM LECTURE-HALL
      (LOC ROOMS)
      (DESC "Lecture Hall")
      (NW TO ROCKVIL-UNIVERSITY)
      (OUT TO ROCKVIL-UNIVERSITY)
      (FLAGS ONBIT)
      (GLOBAL CAMPUS LECTURE-HALL-OBJECT)
      (ACTION LECTURE-HALL-F)>

<ROUTINE LECTURE-HALL-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<MOVE ,SEAT ,HERE>)
	       (<EQUAL? .RARG ,M-LOOK>
      		<TELL "This is a ">
		<COND (<EQUAL? ,SYEAR 2061>
		       <TELL "decaying ">)>
		<TELL
"lecture hall with several hundred seats, surrounded by several
smaller classrooms and professors' offices. An exit leads northwest.">)>>

<OBJECT CLASSROOMS
	(LOC LECTURE-HALL)
	(DESC "classroom")
	(SYNONYM CLASSROOM ROOM ROOMS)
	(ADJECTIVE SMALL SMALLER CLASS)
	(FLAGS NDESCBIT)
	(ACTION LECTURE-HALL-ITEM-F)>

<OBJECT PROFESSOR-OFFICES
	(LOC LECTURE-HALL)
	(DESC "office")
	(SYNONYM OFFICE OFFICES)
	(ADJECTIVE PROFESSOR PROF PROF\'S)
	(FLAGS NDESCBIT VOWELBIT)
	(ACTION LECTURE-HALL-ITEM-F)>

<ROUTINE LECTURE-HALL-ITEM-F ()
	 <COND (<AND <VERB? THROUGH WALK-TO>
		     <EQUAL? ,HERE ,LECTURE-HALL>>
		<TELL
"Those areas are restricted to University personnel." CR>)>>

<OBJECT STUDENT-UNION-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "student union")
	(SYNONYM UNION CENTER)
	(ADJECTIVE STUDENT WIDE SPRAWLING)
	(ACTION STUDENT-UNION-OBJECT-F)>

<ROUTINE STUDENT-UNION-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,STUDENT-UNION>
		       <TELL ,LOOK-AROUND CR>)
		      (<GLOBAL-IN? ,STUDENT-UNION-OBJECT ,HERE>
		       <DO-WALK ,P?NE>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,STUDENT-UNION>
		       <DO-WALK ,P?SW>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,STUDENT-UNION>
		       <V-LOOK>)
		      (<EQUAL? ,SYEAR 2071>
		       <DO-WALK ,P?NE>)>)>>

<ROOM STUDENT-UNION
      (LOC ROOMS)
      (DESC "Student Union")
      (LDESC
"You are standing in the lobby of a wide sprawling building containing a
cafeteria, a bookstore, an auditorium, and offices for student activities.
The street is southwest of here.")
      (SW TO ROCKVIL-UNIVERSITY)
      (OUT TO ROCKVIL-UNIVERSITY)
      (FLAGS ONBIT)
      (GLOBAL CAMPUS STUDENT-UNION-OBJECT)>

<OBJECT UNIVERSITY-CAFETERIA
	(LOC STUDENT-UNION)
	(DESC "cafeteria")
	(SYNONYM CAFETERIA CAFE)
	(FLAGS NDESCBIT)
	(ACTION STUDENT-UNION-ITEM-F)>

<OBJECT SCHOOL-BOOKSTORE
	(LOC STUDENT-UNION)
	(DESC "bookstore")
	(SYNONYM STORE BOOKSTORE SHOP BOOKSHOP)
	(ADJECTIVE BOOK)
	(FLAGS NDESCBIT)
	(ACTION STUDENT-UNION-ITEM-F)>

<OBJECT AUDITORIUM
	(LOC STUDENT-UNION)
	(DESC "auditorium")
	(SYNONYM AUDITORIUM)
	(ADJECTIVE KRESGE)
	(FLAGS NDESCBIT)
	(ACTION STUDENT-UNION-ITEM-F)>

<OBJECT FOURTH-FLOOR
	(LOC STUDENT-UNION)
	(DESC "activity offices")
	(SYNONYM OFFICE OFFICES)
	(ADJECTIVE STUDENT ACTIVITY ACTIVITIE)
	(FLAGS NDESCBIT VOWELBIT NARTICLEBIT PLURALBIT)
	(ACTION STUDENT-UNION-ITEM-F)>

<ROUTINE STUDENT-UNION-ITEM-F ()
	 <COND (<AND <VERB? THROUGH WALK-TO>
		     <EQUAL? ,HERE ,STUDENT-UNION>>
		<TELL "That area is restricted to student use." CR>)>>

<ROOM ELM-AND-KENNEDY
      (LOC ROOMS)
      (DESC "Elm & Kennedy")
      (NORTH TO MAIN-AND-KENNEDY)
      (NE PER STOCK-EXCHANGE-ENTER-F)
      (EAST TO ELM-AND-RIVER)
      (SE PER ROCKVIL-MALL-ENTER-F)
      (SOUTH TO SOUTHWAY-AND-KENNEDY)
      (SW TO HOSPITAL)
      (WEST TO ELM-AND-PARK)
      (NW PER KENNEDY-PARK-ENTER-F)
      (FLAGS STREETBIT OUTSIDEBIT NARTICLEBIT)
      (GLOBAL STOCK-EXCHANGE-OBJECT MALL-OBJECT PARK-OBJECT HOSPITAL-OBJECT
	      CONSTRUCTION-OBJECT GATE TOWNHOUSE PEOPLE)
      (ACTION ELM-AND-KENNEDY-F)>

<ROUTINE ELM-AND-KENNEDY-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is an intersection with streets heading in the four cardinal
directions. There is a">
		<COND (<EQUAL? ,SYEAR 2061>
		       <TELL "n entrance to a ">
		       <PRINTD ,CONSTRUCTION-OBJECT>)
		      (<EQUAL? ,SYEAR 2071>
		       <TELL " complex of high-security townhouses">)
		      (T
		       <TELL " park entrance">)>
		<TELL
" on the northwest corner and a hospital on the southwest corner. To the
southeast lies a shopping mall, and a large, old building with an impressive
facade can be entered to the northeast.">)>>

<ROOM HOSPITAL
      (LOC ROOMS)
      (DESC "Hospital")
      (NE TO ELM-AND-KENNEDY)
      (SW TO HOSPITAL-ANNEX)
      (FLAGS ONBIT)
      (GLOBAL HOSPITAL-OBJECT ANNEX-OBJECT HALLWAY DESK)
      (ACTION HOSPITAL-F)>

<ROUTINE HOSPITAL-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<MOVE ,SPEAR-CARRIER ,HERE>
		<PUTP ,SPEAR-CARRIER ,P?SDESC "nurse">)
	       (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Rockvil General Hospital is an old but prestigious facility">
		<COND (<EQUAL? ,SYEAR 2061>
		       <SCORE 24> ;"1 point"
		       <TELL
", catering almost exclusively to wealthy patients">)
		      (<EQUAL? ,SYEAR 2071>
		       <SCORE 25> ;"3 points"
		       <TELL
", which was the center of some brief rioting last year when two injured serfs
died at the Admitting Entrance after being refused entry for class reasons">)>
		<TELL
". A nurse sits at the admitting desk. The exit is northeast, and a hallway
leads southwest to the annex.">)>>

<OBJECT HOSPITAL-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "hospital")
	(SYNONYM HOSPITAL FACILITY)
	(ADJECTIVE ROCKVIL GENERAL OLD PRESTIGIOUS)
	(ACTION HOSPITAL-OBJECT-F)>

<ROUTINE HOSPITAL-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,HOSPITAL>
		       <TELL ,LOOK-AROUND CR>)
		      (<EQUAL? ,HERE ,ELM-AND-KENNEDY>
		       <DO-WALK ,P?SW>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?NE>)>)
	       (<VERB? DISEMBARK LEAVE>
		<COND (<EQUAL? ,HERE ,HOSPITAL ,HOSPITAL-ANNEX>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,HOSPITAL ,HOSPITAL-ANNEX>>
		<V-LOOK>)>>

<OBJECT ANNEX-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "annex")
	(SYNONYM ANNEX WING)
	(ADJECTIVE HOSPITAL NEW MODERN FAIRLY WELL MAINTAINED WELL-MAINTAINED)
	(ACTION ANNEX-OBJECT-F)>

<ROUTINE ANNEX-OBJECT-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,HERE ,HOSPITAL>
		       <DO-WALK ,P?SW>)
		      (<EQUAL? ,HERE ,HOSPITAL-ANNEX>
		       <TELL ,LOOK-AROUND CR>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?NE>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,HOSPITAL-ANNEX>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,HOSPITAL-ANNEX>>
		<V-LOOK>)>>

<ROOM HOSPITAL-ANNEX
      (LOC ROOMS)
      (DESC "Hospital Annex")
      (NE TO HOSPITAL)
      (SW TO SOUTHWAY-AND-PARK)
      (FLAGS ONBIT)
      (GLOBAL HOSPITAL-OBJECT ANNEX-OBJECT HALLWAY)
      (ACTION HOSPITAL-ANNEX-F)>

<ROUTINE HOSPITAL-ANNEX-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "This is a ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "new, modern">)
		      (<EQUAL? ,SYEAR 2051>
		       <TELL "fairly modern">)
		      (T
		       <TELL "well-maintained">)>
		<TELL
" wing of Rockvil General Hospital. The street lies to the southwest,
and a breezeway leads northeast into the old building.">)>>

<ROOM SOUTHWAY-AND-KENNEDY
      (LOC ROOMS)
      (DESC "Southway & Kennedy")
      (NORTH TO ELM-AND-KENNEDY)
      (NE TO SKYCAR-LOT-2)
      (EAST TO SOUTHWAY-AND-RIVER)
      (SE TO ROW-HOUSES)
      (SOUTH TO ROW-HOUSES)
      (SW TO ROW-HOUSES)
      (WEST TO SOUTHWAY-AND-PARK)
      (NW PER CONSTRUCTION-SITE-1-ENTER-F)
      (FLAGS STREETBIT OUTSIDEBIT NARTICLEBIT)
      (GLOBAL FENCE CARLOT CONSTRUCTION-OBJECT PEOPLE)
      (ACTION SOUTHWAY-AND-KENNEDY-F)>

<ROUTINE SOUTHWAY-AND-KENNEDY-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Kennedy Street, from the north, ends here in a \"T\" with
Southway. On the northwest corner is a">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "n opening in a temporary wooden fence">)
		      (T
		       <TELL
" tall, ugly office tower. The words \"First Continent Bank Building\"
hang in large metal letters over the entrance">)>
		<TELL
", and a car lot fills the northeast corner. A row of
old brick triple-deckers, ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "recently">)
		      (T
		       <TELL "once">)>
		<TELL
" renovated, lines the southern side of the street.">)>>

<ROUTINE CONSTRUCTION-SITE-1-ENTER-F ()
	 <COND (<EQUAL? ,SYEAR 2041>
		,CONSTRUCTION-SITE-1)
	       (T
		<OFFICE-BUILDING-ENTER-F>
		<RFALSE>)>>

<ROOM CONSTRUCTION-SITE-1
      (LOC ROOMS)
      (DESC "Construction Site")
      (SE TO SOUTHWAY-AND-KENNEDY)
      (OUT TO SOUTHWAY-AND-KENNEDY)
      (FLAGS OUTSIDEBIT)
      (GLOBAL GLOBAL-SIGN FENCE CONSTRUCTION-OBJECT)
      (ACTION CONSTRUCTION-SITE-1-F)>

<ROUTINE CONSTRUCTION-SITE-1-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "A high-rise building is under construction here. ">
		<COND (<EQUAL? ,LIGHT-LEVEL 3>
		       <TELL "The chopping of blades is deafening as ">
		       <PRINTD ,DERRICOPTERS>
		       <TELL "s lift bundles of ">
		       <PRINTD ,BEAMS>
		       <TELL " to the top of the structure. ">)>
		<TELL "A sign reads:" CR>
		<PERFORM ,V?READ ,GLOBAL-SIGN>
		<TELL "An opening in the perimeter fence leads southeast.">)>>

<OBJECT DERRICOPTERS
	(LOC CONSTRUCTION-SITE-1)
	(DESC "derricopter")
	(SYNONYM DERRICOPT)
	(FLAGS NDESCBIT)
	(ACTION DERRICOPTERS-F)>

<ROUTINE DERRICOPTERS-F ()
	 <COND (<VERB? EXAMINE>
		<COND (<EQUAL? ,LIGHT-LEVEL 3>
		       <TELL "These are huge ">
		       <PRINTD ,DERRICOPTERS>
		       <TELL
"s, befitting a construction project of this size." CR>)
		      (T
		       <TELL "The ">
		       <PRINTD ,DERRICOPTERS>
		       <TELL "s lie idle at the edge of the site." CR>)>)
	       (<AND <VERB? LISTEN>
		     <EQUAL? ,LIGHT-LEVEL 3>>
		<TELL "The ">
		<PRINTD ,DERRICOPTERS>
		<TELL "s are deafeningly loud." CR>)>>

<OBJECT BEAMS
	(LOC CONSTRUCTION-SITE-1)
	(DESC "plastalloy beams")
	(SYNONYM BEAM BEAMS BUNDLE BUNDLES)
	(ADJECTIVE PLASTALLO)
	(FLAGS NARTICLEBIT PLURALBIT NDESCBIT)>

<ROOM ROW-HOUSES
      (LOC ROOMS)
      (DESC "Row Houses")
      (LDESC
"You are standing just inside the front door of a row of renovated old brick
three-story apartments. The inner door leads south, and Southway is just
outside to the north.")
      (NORTH TO SOUTHWAY-AND-KENNEDY)
      (NE TO SOUTHWAY-AND-RIVER)
      (SOUTH PER INNER-LOBBY-ENTER-F)
      (NW TO SOUTHWAY-AND-PARK)
      (IN PER INNER-LOBBY-ENTER-F)
      (OUT TO SOUTHWAY-AND-KENNEDY)
      (FLAGS ONBIT)
      (GLOBAL UNOPENABLE-DOOR)>

<ROOM SOUTHWAY-AND-RIVER
      (LOC ROOMS)
      (DESC "Southway & River")
      (NORTH TO ELM-AND-RIVER)
      (NE PER NO-ENTRY-TO-HEIMAN-WORLD-F)
      (EAST TO CONSTRUCTION-SITE-2)
      (SE PER NO-ENTRY-TO-HEIMAN-WORLD-F)
      (SOUTH TO BEND)
      (SW TO ROW-HOUSES)
      (WEST TO SOUTHWAY-AND-KENNEDY)
      (NW TO SKYCAR-LOT-2)
      (FLAGS STREETBIT OUTSIDEBIT NARTICLEBIT)
      (GLOBAL FENCE RIVER RIVER-BANK CONSTRUCTION-OBJECT HEIMAN-WORLD-OBJECT
       	      PEOPLE)
      (SCENE 34)
      (ACTION SOUTHWAY-AND-RIVER-F)>

<ROUTINE SOUTHWAY-AND-RIVER-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Here at River Street, Southway ends its long trip from the western suburbs.
South of here, the street bends toward the river. To the southwest are some
brick houses, and a car lot occupies the northwest corner. All along the east
side of the street ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "is a huge ">
		       <PRINTD ,CONSTRUCTION-OBJECT>
		       <TELL ".">)
		      (T
		       <TELL "is the featureless, cliff-like facade of ">
		       <PRINTD ,HEIMAN-WORLD-OBJECT>
		       <TELL ".">
		       <COND (<EQUAL? ,SYEAR 2061 2071>
			      <SCORE 26> ;"3 points"
			      <TELL
" Little, if anything, has been done to restore the top
several floors, gutted by fire about ">
			      <COND (<EQUAL? ,SYEAR 2061>
				     <TELL "five">)
				    (T
				     <TELL "fifteen">)>
			      <TELL " years ago.|
|
That fire, which cost several thousand lives, revealed a severe deficiency
of built-in fire control systems, but the courts threw out all suits since
the building was built after the deregulation of the construction industry
in '38, and the developer never falsely represented the building's safety
systems.">)>)>)
	       (<AND <EQUAL? .RARG ,M-END>
		     <EQUAL? ,SYEAR 2071>
		     <L? <GETP ,SOUTHWAY-AND-RIVER ,P?SCENE> 101>>
		<COND (<PROB <GETP ,SOUTHWAY-AND-RIVER ,P?SCENE>>
		       <PUTP ,SOUTHWAY-AND-RIVER ,P?SCENE 101>
		       <SCORE 27> ;"7 points"
		       <TELL CR
"In an alley between two buildings, you spot two Church policemen shooting
an old woman with silenced guns. They drag her out of view." CR>)
		      (T
		       <PUTP ,SOUTHWAY-AND-RIVER ,P?SCENE
			     <+ <GETP ,SOUTHWAY-AND-RIVER ,P?SCENE> 33>>
		       <RFALSE>)>)>>

<ROOM SKYCAR-LOT-2
      (LOC ROOMS)
      (DESC "Skycar Lot")
      (LDESC
"This large car lot serves Rockvil Mall, which lies to the north. There
are exits from the lot to the southeast and southwest.")
      (NORTH PER ROCKVIL-MALL-ENTER-F)
      (NE SORRY "There's a tall fence in the way.")
      (EAST SORRY "There's a tall fence in the way.")
      (SE TO SOUTHWAY-AND-RIVER)
      (SOUTH SORRY "There's a tall fence in the way.")
      (SW TO SOUTHWAY-AND-KENNEDY)
      (WEST SORRY "There's a tall fence in the way.")
      (NW SORRY "There's a tall fence in the way.")
      (FLAGS OUTSIDEBIT)
      (GLOBAL FENCE MALL-OBJECT CARLOT)>

<ROOM CONSTRUCTION-SITE-2
      (LOC ROOMS)
      (SDESC "")
      (WEST TO SOUTHWAY-AND-RIVER)
      (SW TO BEND)
      (FLAGS OUTSIDEBIT)
      (GLOBAL GLOBAL-SIGN CONSTRUCTION-OBJECT HEIMAN-WORLD-OBJECT FENCE)
      (ACTION CONSTRUCTION-SITE-2-F)>

<ROUTINE CONSTRUCTION-SITE-2-F (RARG)
	<COND (<EQUAL? .RARG ,M-ENTER>
	       <COND (<EQUAL? ,SYEAR 2041>
		      <PUTP ,CONSTRUCTION-SITE-2 ,P?SDESC "Construction Site">
		      <FCLEAR ,CONSTRUCTION-SITE-2 ,NARTICLEBIT>)
		     (T
		      <FSET ,CONSTRUCTION-SITE-2 ,NARTICLEBIT>
		      <PUTP ,CONSTRUCTION-SITE-2 ,P?SDESC "Heiman World">)>)
	      (<EQUAL? .RARG ,M-LOOK>
	       <COND (<EQUAL? ,SYEAR 2041>
		      <TELL
"The work in this huge site is still in the foundation
phase. A sign reads:" CR>
		      <PERFORM ,V?READ ,GLOBAL-SIGN>
		      <TELL
"You can leave the site to the west or southwest.">)
		     (<EQUAL? ,SYEAR 2051>
		      <TELL
"This is the second of developer Salvador Heiman's \"cities within a city.\"
Rumors say that it wasn't built as well as the older ">
		      <PRINTD ,HEIMAN-VILLAGE>
		      <TELL
" next door, and indeed, it already shows some minor cracks from settling.
Exits from the vast lobby lead west and southwest.">)
		     (<EQUAL? ,SYEAR 2061>
		      <SCORE 28> ;"1 point"
		      <TELL
"This is a run-down Indoor City. The second of its kind, it was completed
in 2042. The only lighting in the lobby comes from the tall entrance doors
to the west and southwest.">)
		     (T
		      <SCORE 29> ;"3 points"
		      <TELL
"This old Indoor City has become exactly what its critics predicted it would
become: a vast indoor slum. You would be well advised to use the exits that
lie to the west and southwest.">)>)>>		      

<ROUTINE ROCKVIL-MALL-ENTER-F ()
	 <COND (<OR <AND <EQUAL? ,SYEAR 2041 2051 2061>
			 <G? ,STIME 480>
			 <L? ,STIME 1320>>
		    <AND <EQUAL? ,SYEAR 2071>
			 <G? ,STIME 720>
			 <L? ,STIME 1080>>>
		,ROCKVIL-MALL)
	       (T
		<CLOSED-PRINT "The Mall">
		<RFALSE>)>>

<ROOM ROCKVIL-MALL
      (LOC ROOMS)
      (DESC "Rockvil Mall")
      (NE TO ELM-AND-RIVER)
      (EAST PER JOYBOOTH-ENTER-F)
      (SOUTH TO SKYCAR-LOT-2)
      (NW TO ELM-AND-KENNEDY)
      (IN PER JOYBOOTH-ENTER-F)
      (GLOBAL JOYBOOTH-OBJECT MALL-OBJECT CARLOT STORE-OBJECT PEOPLE)
      (ACTION ROCKVIL-MALL-F)>

<ROUTINE ROCKVIL-MALL-F (RARG "AUX" TIME)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "This">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL " busy">)
		      (<EQUAL? ,SYEAR 2071>
		       <TELL " deserted">)>
		<TELL
" shopping mall is a renovated computer factory. There are many stores">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL
", most of them closed, and stark joybooths marked with the symbol of the
Church form a row along the eastern side of the mall">)
		      (<EQUAL? ,SYEAR 2041>
		       <TELL
", and Dizzard Joybooths line the eastern side of the mall">)>
		<TELL
". There are exits to the northwest, northeast, and south.">)
	       (<EQUAL? .RARG ,M-END>
		<COND (<EQUAL? ,SYEAR 2071>
		       <SET TIME 1080>)
		      (T
		       <SET TIME 1320>)>
		<CLOSING-TIME .TIME "the mall" "a guard" ,ELM-AND-KENNEDY>)>>

<OBJECT MALL-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "mall")
	(SYNONYM MALL)
	(ADJECTIVE BUSY DESERTED SHOPPING ROCKVIL)
	(ACTION MALL-OBJECT-F)>

<ROUTINE MALL-OBJECT-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,HERE ,ROCKVIL-MALL>
		       <TELL ,LOOK-AROUND CR>)
		      (<EQUAL? ,HERE ,ELM-AND-KENNEDY>
		       <DO-WALK ,P?SE>)
		      (<EQUAL? ,HERE ,ELM-AND-RIVER>
		       <DO-WALK ,P?SW>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?NORTH>)>)
	       (<VERB? DISEMBARK LEAVE>
		<COND (<EQUAL? ,HERE ,ROCKVIL-MALL>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)>>

<ROUTINE JOYBOOTH-ENTER-F ()
	 <COND (<EQUAL? ,SYEAR 2041 2071>
		,JOYBOOTH)
	       (T
		<COND (<EQUAL? ,SYEAR 2051>
		       <SCORE 30> ;"1 point"
		       <TELL
"You remember vaguely that the eastern side of the Mall once contained many
joybooths, but of course they were banned years ago. ">)>
		<TELL "There's nothing in that direction ">
		<COND (<EQUAL? ,SYEAR 2051>
		       <TELL "now ">)>
		<TELL "-- just a featureless wall." CR>
		<RFALSE>)>>

<GLOBAL JOYBOOTH-USED <>>

<ROOM JOYBOOTH
	(LOC ROOMS)
	(DESC "Joybooth")
	(OUT PER JOYBOOTH-EXIT-F)
	(WEST PER JOYBOOTH-EXIT-F)
	(FLAGS ONBIT)
	(GLOBAL JOYBOOTH-OBJECT SLOT)
	(ACTION JOYBOOTH-F)>

<ROUTINE JOYBOOTH-F (RARG "AUX" TIME)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<MOVE ,SEAT ,HERE>)
	       (<EQUAL? .RARG ,M-LOOK>
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL
"You are in a Dizzard-brand joybooth, the most expensive but generally
considered the most well-programmed line of booths">)
		      (T
		       <TELL
"You are in one of the new, free, Church-sponsored joybooths">)>
		<TELL
". The room is small, barely a meter across, with gray carpeted walls, ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "a slot for ">
		       <PRINTD ,CREDIT-CARD>
		       <TELL "s">)
		      (T
		       <TELL "a ">
		       <PRINTD ,JOYBOOTH-BUTTON>)>
		<TELL ", a headset, and a plain, built-in seat.">)
	       (<EQUAL? .RARG ,M-END>
		<COND (<EQUAL? ,SYEAR 2071>
		       <SET TIME 1080>)
		      (T
		       <SET TIME 1320>)>
		<CLOSING-TIME .TIME "the mall" "a guard" ,ELM-AND-KENNEDY>)>>

<ROUTINE JOYBOOTH-EXIT-F ()
	 <COND (<FSET? ,HEADSET ,WORNBIT>
		<TELL "You'll have to remove the headset first." CR>
		<SETG P-IT-OBJECT ,HEADSET>
		<RFALSE>)
	       (T
		,ROCKVIL-MALL)>>

<OBJECT JOYBOOTH-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "joybooth")
	(SYNONYM JOYBOOTH JOYBOOTHS BOOTH BOOTHS)
	(ADJECTIVE JOY DIZZARD)
	(ACTION JOYBOOTH-OBJECT-F)>

<ROUTINE JOYBOOTH-OBJECT-F ()
	 <COND (<AND <EQUAL? ,SYEAR 2051 2061>
		     <NOT <VERB? THROUGH WALK-TO>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,JOYBOOTH-OBJECT>)
	       (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,HERE ,JOYBOOTH>
		       <TELL ,LOOK-AROUND CR>)
		      (<GLOBAL-IN? ,JOYBOOTH-OBJECT ,HERE>
		       <DO-WALK ,P?EAST>)>)
	       (<VERB? DISEMBARK LEAVE>
		<COND (<EQUAL? ,HERE ,ROCKVIL-MALL>
		       <TELL ,LOOK-AROUND CR>)
		      (T
		       <DO-WALK ,P?WEST>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,JOYBOOTH>
		       <V-LOOK>)
		      (<EQUAL? ,SYEAR 2071>
		       <TELL
"The booths are emblazoned with the symbol of the Church." CR>)>)>>

<OBJECT JOYBOOTH-BUTTON
	(LOC LOCAL-GLOBALS)
	(DESC "red button")
	(SYNONYM BUTTON)
	(ADJECTIVE RED)
	(FLAGS NDESCBIT)
	(ACTION JOYBOOTH-BUTTON-F)>

<ROUTINE JOYBOOTH-BUTTON-F ()
	 <COND (<VERB? PUSH>
		<COND (<QUEUED? ,I-JOYBOOTH-RECHARGE>
		       <TELL
"A light flashes for a moment: \"Recharging. Unit not in operation.\"" CR>)
		      (<FSET? ,HEADSET ,WORNBIT>
		       <SCORE 31> ;"3 points"
		       <SETG ELAPSED-TIME 30>
		       <QUEUE I-JOYBOOTH-RECHARGE 60>
		       <COND (<EQUAL? ,SEAT <LOC ,PLAYER>>
			      <FSET ,SEAT ,ONBIT>)>
		       <TELL
"The walls of the joybooth recede, and you find yourself in an arena, garbed
in magnificent gladiator's armor. In one hand you hold a long whip, in the
other a mace. The ground around you is literally soggy with blood.|
|
You barely notice as the headset probes into the recesses of your mind,
uncovering hidden thoughts, nurturing certain emotions. An unclad, unwashed
barbarian suddenly stumbles into the arena before you, and at once your
mind is filled with unthinking hatred toward this...this thing, this animal.|
|
The roar of the mob pierces your hatred, the roar of thousands, screaming
for their hero. You can hear many things in those screams; the screams of
women lusting for your manhood, the screams of men jealous of your power,
the screams of everyone for the blood of the barbarian animal|
|
as adrenalin surges through your chest as the creature picks up a battered
sword and shield from the ground. In a flash, the battle begins, and like most
animals, the creature has amazing strength. His blows land on your armor, but
you shake them off like a true hero. Summoning an inner strength, drawing upon
your anger for this filthy beast, you sink the spikes of the mace deep into
the creature's flesh. The bellowing of the crowd becomes deafening, shaking
the ground, resounding through the arena, pounding you, pounding|
|
the blood pounding in your ears, your breath short and excited, you slowly
notice the tiny booth around you. Although disappointed that the fantasy has
ended, you feel somehow refreshed, emotionally nourished; the rare taste of
victory in a life of defeat." CR>
		       <RTRUE>)
		      (T
		       <TELL "Nothing happens." CR>)>)>>

<ROUTINE I-JOYBOOTH-RECHARGE ()
	 <RFALSE>>

<OBJECT HEADSET
	(LOC JOYBOOTH)
	(DESC "headset")
	(SYNONYM HEADSET HEADPHONE SET)
	(ADJECTIVE HEAD)
	(FLAGS NDESCBIT WEARBIT)
	(ACTION HEADSET-F)>

<ROUTINE HEADSET-F ()
	 <COND (<VERB? TAKE>
		<PERFORM ,V?WEAR ,HEADSET>
		<RTRUE>)
	       (<AND <VERB? PUT-ON>
		     <PRSI? ,HEAD>>
		<PERFORM ,V?WEAR ,HEADSET>
		<RTRUE>)>>

<ROOM ELM-AND-RIVER
      (LOC ROOMS)
      (DESC "Elm & River")
      (NORTH TO MAIN-AND-RIVER)
      (NE TO HEIMAN-VILLAGE)
      (EAST TO HEIMAN-VILLAGE)
      (SE TO HEIMAN-VILLAGE)
      (SOUTH TO SOUTHWAY-AND-RIVER)
      (SW PER ROCKVIL-MALL-ENTER-F)
      (WEST TO ELM-AND-KENNEDY)
      (NW PER STOCK-EXCHANGE-ENTER-F)
      (DOWN PER TUBES-ENTER-F)
      (FLAGS STREETBIT OUTSIDEBIT NARTICLEBIT)
      (GLOBAL STAIRS STOCK-EXCHANGE-OBJECT MALL-OBJECT HEIMAN-VILLAGE-OBJECT
       	      TUBE-STATION PEOPLE)
      (ACTION ELM-AND-RIVER-F)>

<ROUTINE ELM-AND-RIVER-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Elm Street begins here and crosses the downtown area to the west. Along
the eastern side of River Street stands the vast ">
		<PRINTD ,HEIMAN-VILLAGE>
		<TELL " building. You can enter ">
		<PRINTD ,ROCKVIL-MALL>
		<TELL " to the southwest, or the old ">
		<PRINTD ,STOCK-EXCHANGE>
		<TELL " building to the northwest. ">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL "A former Tube entrance occupies">)
		      (T
		       <TELL "An entrance to a ">
		       <PRINTD ,TUBE-STATION>
		       <TELL " graces">)>
		<TELL " one corner of the intersection.">)>>

<ROUTINE STOCK-EXCHANGE-ENTER-F ()
	 <COND (<OR <AND <EQUAL? ,SYEAR 2041>
			 <G? ,STIME 360>
			 <L? ,STIME 1320>>
		    <AND <EQUAL? ,SYEAR 2051 2061 2071>
			 <G? ,STIME 420>
			 <L? ,STIME 1320>>>
		,STOCK-EXCHANGE)
	       (T
		<CLOSED-PRINT "The stock exchange building">
		<RFALSE>)>>

<ROOM STOCK-EXCHANGE
      (LOC ROOMS)
      (DESC "Stock Exchange")
      (LDESC
"This aging, impressive structure was once the economic center for the
quad-state region (the Dakotas, Wyoming and Montana). However, in this day
and age of decentralization made possible by electronic communications, the
activity here is reduced in both quantity and importance. Much of the building
has been converted to office space. Wide steel portals lead southeast and
southwest.")
      (SE TO ELM-AND-RIVER)
      (SW TO ELM-AND-KENNEDY)
      (FLAGS ONBIT)
      (GLOBAL STOCK-EXCHANGE-OBJECT)
      (ACTION STOCK-EXCHANGE-F)>

<ROUTINE STOCK-EXCHANGE-F (RARG)
	 <COND (<EQUAL? .RARG ,M-END>
		<CLOSING-TIME 1320 "the stock exchange building"
			      "a guard" ,ELM-AND-KENNEDY>)>>

<OBJECT STOCK-EXCHANGE-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "Stock Exchange")
	(SYNONYM EXCHANGE BUILDING BLDG)
	(ADJECTIVE STOCK EXCHANGE AGING IMPRESSIV OLD)
	(ACTION STOCK-EXCHANGE-OBJECT-F)>

<ROUTINE STOCK-EXCHANGE-OBJECT-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,HERE ,STOCK-EXCHANGE>
		       <TELL ,LOOK-AROUND CR>)
		      (<EQUAL? ,HERE ,ELM-AND-RIVER>
		       <DO-WALK ,P?NW>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?NE>)>)
	       (<VERB? DISEMBARK LEAVE>
		<COND (<EQUAL? ,HERE ,STOCK-EXCHANGE>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,STOCK-EXCHANGE>>
		<V-LOOK>)>>

<ROOM MAIN-AND-RIVER
      (LOC ROOMS)
      (DESC "Main & River")
      (NORTH TO MIDLAND-AND-RIVER)
      (NE TO HEALTH-CENTER)
      (EAST TO MAIN-AND-CHURCH)
      (SE TO HEIMAN-VILLAGE)
      (SOUTH TO ELM-AND-RIVER)
      (SW PER OFFICE-BUILDING-ENTER-F)
      (WEST TO MAIN-AND-KENNEDY)
      (NW PER APARTMENT-ENTER-F)
      (FLAGS STREETBIT OUTSIDEBIT NARTICLEBIT)
      (GLOBAL GLOBAL-SIGN GLASS HEALTH-CENTER-OBJECT HEIMAN-VILLAGE-OBJECT
	      PEOPLE)
      (SCENE 0)
      (ACTION MAIN-AND-RIVER-F)>

<ROUTINE MAIN-AND-RIVER-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is a typical four-way intersection between Main and River Streets. An
entranceway through the massive walls of ">
		<PRINTD ,HEIMAN-VILLAGE>
		<TELL " fills the southeast corner of the street, and a ">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL "former ">)>
		<TELL "health care facility occupies the northeast corner.|
|
To the southwest is 80 River Street, a ">
	       <COND (<EQUAL? ,SYEAR 2041>
		      <TELL "brand new">)
		     (<EQUAL? ,SYEAR 2051>
		      <TELL "fairly modern">)
		     (T
		      <TELL "forties-style">)>
	       <TELL " plastalloy and glass ">
	       <PRINTD ,CHUN-BUILDING>
	       <COND (<EQUAL? ,SYEAR 2041>
		      <TELL
", with many floors still unoccupied according to
the billboard over the entrance">)>
	       <TELL
". The fourth corner, the northwest, is the site of Perez
Towers, a luxury apartment building.">)
	       (<AND <EQUAL? .RARG ,M-END>
		     <EQUAL? ,SYEAR 2051>
		     <L? <GETP ,MAIN-AND-RIVER ,P?SCENE> 101>>
		<COND (<PROB <GETP ,MAIN-AND-RIVER ,P?SCENE>>
		       <PUTP ,MAIN-AND-RIVER ,P?SCENE 101>
		       <SCORE 33> ;"1 point"
		       <TELL CR
"Several BSF officers trot out of a nearby building and climb
into an unmarked BSF van which drives away." CR>)
		      (T
		       <PUTP ,MAIN-AND-RIVER ,P?SCENE
			     <+ <GETP ,MAIN-AND-RIVER ,P?SCENE> 50>>
		       <RFALSE>)>)>>

<OBJECT PEREZ-TOWERS
	(LOC MAIN-AND-RIVER)
	(DESC "Perez Towers")
	(SYNONYM TOWERS TOWER BUILDING BLDG)
	(ADJECTIVE PEREZ LUXURY APARTMENT)
	(FLAGS NARTICLEBIT NDESCBIT)
	(ACTION PEREZ-TOWERS-F)>

<ROUTINE PEREZ-TOWERS-F ()
	 <COND (<AND <VERB? THROUGH WALK-TO>
		     <EQUAL? ,HERE ,MAIN-AND-RIVER>>
		<DO-WALK ,P?NW>)
	       (<VERB? EXAMINE>
		<PRINTD ,PEREZ-TOWERS>
		<TELL " is a luxury apartment building." CR>)>>

<GLOBAL DESCRIBE-VILLAGE <>>

<ROOM HEIMAN-VILLAGE
      (LOC ROOMS)
      (DESC "Heiman Village")
      (EAST TO CHURCH-STREET-PARK)
      (WEST TO ELM-AND-RIVER)
      (NW TO MAIN-AND-RIVER)
      (FLAGS NARTICLEBIT)
      (GLOBAL PARK-OBJECT SCHOOL-OBJECT CHURCH-STREET-CITY-OBJECT
       	      HEIMAN-VILLAGE-OBJECT STORE-OBJECT PEOPLE)
      (ACTION HEIMAN-VILLAGE-F)>

<ROUTINE HEIMAN-VILLAGE-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL
"This massive complex is a revolutionary and controversial concept in urban
development, the \"city within a city.\" Apartments of every size, schools,
offices, stores, and city services, all can be found under this one gigantic
roof. Exits from the Village lead northwest, west, and east.">
		       <COND (<NOT ,DESCRIBE-VILLAGE>
			      <SETG DESCRIBE-VILLAGE T>
			      <TELL CR CR
"Proponents of this type of city-microcosm say that it makes the desirable
urban lifestyle available to the middle class, saves energy and commuting
time, and shields people from the crime and pollution of the city streets.|
|
Critics call it an urban cocoon, creating a sterile, isolated
environment and eliminating the need to deal with the urban problems
which make isolation so desirable." CR CR>
			      <PRINTD ,HEIMAN-VILLAGE>
			      <TELL
", in the few years it has been open, has proved to be a tremendous commercial
success, and more communities of the type are being planned.">)>)
		      (<EQUAL? ,SYEAR 2051>
		       <TELL
"This is a landmark in urban development, the first and most famous Indoor
City. It has been extremely popular, allowing the middle class an opportunity
to live in the city. Indoor Cities are being planned in many locations.
You can leave the lobby of ">
		       <PRINTD ,HEIMAN-VILLAGE>
		       <TELL " to the east, west, or northwest.">)
		      (<EQUAL? ,SYEAR 2061>
		       <SCORE 28> ;"1 point"
		       <TELL
"This oldest of the Indoor Cities looks typically ill-maintained. The
only lighting in the lobby comes from the tall entrance doors to the
east, west and northwest.">)
		      (T
		       <SCORE 29> ;"3 points"
		       <TELL
"The oldest Indoor City has succumbed to the fate its critics foresaw: a
roofed-in urban ghetto for masses of faceless serfs. You would be well
advised to use the exits that lie to the east, west, or northwest.">)>)>>

<OBJECT HEIMAN-VILLAGE-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "Heiman Village")
	(SYNONYM VILLAGE CITY BUILDING BLDG WALLS COMPLEX MICROCOSM COCOON
		 GHETTO LANDMARK IC)
	(ADJECTIVE HEIMAN OLDER FIRST VAST MASSIVE VILLAGE URBAN INDOOR
	 	   REVOLUTIONARY CONTROVERSIAL STERILE ISOLATED POPULAR
		   MOST FAMOUS ILL-MAINTAINED EXTREMELY ROOFED-IN)
	(ACTION HEIMAN-VILLAGE-OBJECT-F)>

<ROUTINE HEIMAN-VILLAGE-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,HEIMAN-VILLAGE>
		       <TELL ,LOOK-AROUND CR>)
		      (<EQUAL? ,HERE ,CHURCH-STREET-PARK>
		       <DO-WALK ,P?WEST>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?EAST>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,HEIMAN-VILLAGE>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,HEIMAN-VILLAGE>>
		<V-LOOK>)>>

<OBJECT HEIMAN-WORLD-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "Heiman World")
	(SYNONYM WORLD SLUM CITY IC)
	(ADJECTIVE HEIMAN RUN-DOWN SECOND VAST INDOOR)
	(ACTION HEIMAN-WORLD-OBJECT-F)>

<ROUTINE HEIMAN-WORLD-OBJECT-F ()
	 <COND (<AND <EQUAL? ,SYEAR 2041>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,HEIMAN-WORLD-OBJECT>)
	       (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,SOUTHWAY-AND-RIVER>
		       <DO-WALK ,P?EAST>)
		      (<EQUAL? ,HERE ,BEND>
		       <DO-WALK ,P?NE>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,CONSTRUCTION-SITE-2>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,CONSTRUCTION-SITE-2>>
		<V-LOOK>)>>

<OBJECT CHURCH-STREET-CITY-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "Church Street City")
	(SYNONYM CITY STRUCTURE IC)
	(ADJECTIVE CHURCH STREET INDOOR FAIRLY RECENT LOW-QUALITY LOW QUALITY)
	(ACTION CHURCH-STREET-CITY-OBJECT-F)>

<ROUTINE CHURCH-STREET-CITY-OBJECT-F ()
	 <COND (<AND <EQUAL? ,SYEAR 2041 2051>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,CHURCH-STREET-CITY-OBJECT>)
	       (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,MAIN-AND-CHURCH>
		       <DO-WALK ,P?SOUTH>)
		      (<EQUAL? ,HERE ,HEIMAN-VILLAGE>
		       <DO-WALK ,P?EAST>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? DISEMBARK LEAVE>
		<COND (<EQUAL? ,HERE ,CHURCH-STREET-PARK>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,CHURCH-STREET-PARK>>
		<V-LOOK>)>>

<ROOM CHURCH-STREET-PARK
      (LOC ROOMS)
      (SDESC "")
      (NORTH TO MAIN-AND-CHURCH)
      (NE PER CHURCH-STREET-PARK-EXIT-F)
      (EAST PER CHURCH-STREET-PARK-EXIT-F)
      (SE PER CHURCH-STREET-PARK-EXIT-F)
      (SOUTH PER CHURCH-STREET-PARK-EXIT-F)
      (SW PER CHURCH-STREET-PARK-EXIT-F)
      (WEST TO HEIMAN-VILLAGE)
      (NW PER CHURCH-STREET-PARK-EXIT-F)
      (FLAGS NARTICLEBIT)
      (GLOBAL GRAFFITI TUNNEL PARK-OBJECT CHURCH-STREET-CITY-OBJECT FENCE
       	      HEIMAN-VILLAGE-OBJECT RAILROAD-TRACKS PEOPLE)
      (ACTION CHURCH-STREET-PARK-F)>

<ROUTINE CHURCH-STREET-PARK-EXIT-F ()
	 <COND (<EQUAL? ,SYEAR 2041 2051>
		<COND (<PRSO? ,P?SOUTH>
		       <TELL "The tracks are fenced off." CR>)
		      (T
		       <TELL "There's no exit on that side of the park." CR>)>)
	       (T
		<TELL "There's no exit from the lobby in that direction." CR>)>
	 <RFALSE>>

<ROUTINE CHURCH-STREET-PARK-F (RARG)
      <COND (<EQUAL? .RARG ,M-ENTER>
	     <COND (<EQUAL? ,SYEAR 2041 2051>
		    <PUTP ,CHURCH-STREET-PARK ,P?SDESC "Church Street Park">)
		   (T
		    <PUTP ,CHURCH-STREET-PARK ,P?SDESC "Church Street City">)>)
	    (<EQUAL? .RARG ,M-LOOK>
	     <COND (<EQUAL? ,SYEAR 2041 2051>
		    <TELL 
"This is the oldest existing park in the city, and has not been well kept
up. " ,FOUNTAIN-DESC " The park has a reputation for being very unsafe after
dark, due to the proximity to the poor section of town just across the tracks
to the south. Church Street begins at the entrance to the park and leads
north, and a side entrance to ">
		    <PRINTD ,HEIMAN-VILLAGE>
		    <TELL " forms the western boundary of the park.">)
		   (T
		    <SCORE 34> ;"1 point"
		    <TELL
"This Indoor City is a fairly recent one, and almost by definition, therefore,
a fairly low-quality structure. A tunnel leads west toward ">
		    <PRINTD ,HEIMAN-VILLAGE>
		    <TELL
", and the main entrance to this IC is from the north.">)>)>>

<OBJECT FOUNTAIN
	(LOC LOCAL-GLOBALS)
        (DESC "dried-up fountain")
	(SYNONYM FOUNTAIN)
	(ADJECTIVE ORNATE DRIED-UP DIRTY)
	(FLAGS NDESCBIT)
	(ACTION FOUNTAIN-F)>

<ROUTINE FOUNTAIN-F ()
	 <COND (<VERB? EXAMINE>
		<TELL ,FOUNTAIN-DESC CR>)>>

<ROOM MAIN-AND-CHURCH
      (LOC ROOMS)
      (DESC "Main & Church")
      (NORTH TO CHURCH-ENTRANCE)
      (NE TO CEMETERY)
      (EAST TO MAIN-AND-WICKER)
      (SE TO CHURCH-STREET-APARTMENTS)
      (SOUTH TO CHURCH-STREET-PARK)
      (SW PER CONSTRUCTION-SITE-3-ENTER-F)
      (WEST TO MAIN-AND-RIVER)
      (NW PER CONSTRUCTION-SITE-4-ENTER-F)
      (FLAGS STREETBIT OUTSIDEBIT NARTICLEBIT)
      (GLOBAL CEMETERY-OBJECT PARK-OBJECT CONSTRUCTION-OBJECT GATE PEOPLE
       	      CHURCH-STREET-CITY-OBJECT)
      (SCENE 50)
      (ACTION MAIN-AND-CHURCH-F)>

<ROUTINE MAIN-AND-CHURCH-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are at the corner of bustling Main Street and quiet
Church Street. There ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "is construction in progress">)
		      (T
		       <TELL "are nondescript buildings">)>
		<TELL
" on the northwestern and southwestern corners. A conventional apartment
building occupies the southeast corner, and an entrance to Midland Cemetery
forms the fourth corner. ">
		<COND (<EQUAL? ,SYEAR 2041 2051>
		       <TELL
"Some greenery is visible down Church Street to the south.">)
		      (T
		       <TELL
"A particularly blockish Indoor City towers over
Church Street south of here.">)>)
	       (<AND <EQUAL? .RARG ,M-END>
		     <EQUAL? ,SYEAR 2071>
		     <L? <GETP ,MAIN-AND-CHURCH ,P?SCENE> 101>>
		<COND (<PROB <GETP ,MAIN-AND-CHURCH ,P?SCENE>>
		       <PUTP ,MAIN-AND-CHURCH ,P?SCENE 101>
		       <SCORE 35> ;"6 points"
		       <TELL CR
"You hear shots from a nearby building. Seconds later, Security Police carry
a bleeding man out of the building and into a waiting skyvan. A woman runs out
of the building, screaming. One of the officers kicks her in the stomach and
clubs her across the skull as she falls. Nonchalantly, the policeman climbs
into the skyvan, which rises away." CR>)
		      (T
		       <PUTP ,MAIN-AND-CHURCH ,P?SCENE
			     <+ <GETP ,MAIN-AND-CHURCH ,P?SCENE> 50>>
		       <RFALSE>)>)>>

<ROUTINE CONSTRUCTION-SITE-3-ENTER-F ()
	 <COND (<EQUAL? ,SYEAR 2041>
		,CONSTRUCTION-SITE-3)
	       (T
		<OFFICE-BUILDING-ENTER-F>
		<RFALSE>)>>

<ROUTINE CONSTRUCTION-SITE-4-ENTER-F ()
	 <COND (<EQUAL? ,SYEAR 2041>
		,CONSTRUCTION-SITE-4)
	       (T
		<APARTMENT-ENTER-F>
		<RFALSE>)>>

<ROOM CHURCH-STREET-APARTMENTS
      (LOC ROOMS)
      (DESC "Church Street Apartments")
      (IN PER INNER-LOBBY-ENTER-F)
      (OUT TO MAIN-AND-CHURCH)
      (NW TO MAIN-AND-CHURCH)
      (SE PER INNER-LOBBY-ENTER-F)
      (FLAGS ONBIT)
      (GLOBAL UNOPENABLE-DOOR MAILBOXES PICTUREPHONE GRAFFITI GLASS)
      (ACTION CHURCH-STREET-APARTMENTS-F)>

<ROUTINE CHURCH-STREET-APARTMENTS-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<MOVE ,BUZZERS ,HERE>)
	       (<EQUAL? .RARG ,M-LOOK>
		<DESCRIBE-APARTMENT-VESTIBULE "southeast" "northwest">)>>

<ROOM CONSTRUCTION-SITE-3
      (LOC ROOMS)
      (SDESC "Construction Site")
      (LDESC
"The Johnson Federal Building, which closed last year when the offices of
the few remaining Federal agencies were transferred to City Hall, is being
renovated as an office building with commercial space on the ground floor.
You can leave the site to the northeast.")
      (NE TO MAIN-AND-CHURCH)
      (OUT TO MAIN-AND-CHURCH)
      (FLAGS OUTSIDEBIT)
      (GLOBAL CONSTRUCTION-OBJECT)>

<ROOM CONSTRUCTION-SITE-4
      (LOC ROOMS)
      (SDESC "Construction Site")
      (LDESC
"A conventional city apartment block is nearing completion here. There are
openings in the southeast and northeast corners of the perimeter fence.")
      (SE TO MAIN-AND-CHURCH)
      (NE TO CHURCH-ENTRANCE)
      (FLAGS OUTSIDEBIT)
      (GLOBAL FENCE CONSTRUCTION-OBJECT)>

<ROUTINE I-HUNGER ()
	 <COND (,HUNGER-WARNING
		<SCORE 40> ;"3 points"
		<CRLF>
		<JIGS-UP "You finally succumb to the ravages of hunger.">)
	       (T
		<SCORE 40> ;"3 points"
		<SETG HUNGER-WARNING T>
		<QUEUE I-HUNGER 47>
		<TELL CR
"Hunger overwhelms you for a moment. Your head clears, but your
stomach still aches from days without food." CR>)>>

<GLOBAL HUNGER-WARNING <>>

<ROOM MAIN-AND-WICKER
      (LOC ROOMS)
      (DESC "Main & Wicker")
      (NORTH TO CEMETERY)
      (NE SORRY "There's no entrance to the cemetery in that direction.")
      (EAST TO MAIN-STREET-BRIDGE)
      (SE PER THE-COACHMAN-ENTER-F)
      (SOUTH TO WICKER-AND-PIER)
      (SW PER FOODVILLE-ENTER-F)
      (WEST PER MAIN-AND-CHURCH-ENTER-F)
      (NW SORRY "There's no entrance to the cemetery in that direction.")
      (FLAGS STREETBIT OUTSIDEBIT NARTICLEBIT)
      (GLOBAL CEMETERY-OBJECT GLOBAL-SIGN GLOBAL-WINDOW RAILROAD-BRIDGE GATE
       	      WATER RIVER SUPERMARKET RESTAURANT-OBJECT STREET-BRIDGE GLASS
	      RAILROAD-TRACKS SMOKE NOTE RIVER-BANK PEOPLE)
      (SCENE 25)
      (ACTION MAIN-AND-WICKER-F)>

<ROUTINE MAIN-AND-WICKER-F (RARG)
	 <COND (<AND <EQUAL? .RARG ,M-ENTER>
		     <IN? ,UNSHAVEN-MAN ,MAIN-AND-WICKER>>
		<MOVE ,UNSHAVEN-MAN ,LOCAL-GLOBALS>
		<COND (<NOT <HELD? ,BORDELLO-AD>>
		       <MOVE ,BORDELLO-AD ,LOCAL-GLOBALS>)>)
	       (<EQUAL? .RARG ,M-LOOK>
		<COND (<EQUAL? ,SYEAR 2081>
		       <SCORE 36> ;"8 points"
		       <TELL
"The street runs from west to east, where a bridge is visible. A crude sign is
posted just west of here. Another road leads south into a different section of
town, where smoke billows upward from scattered fires. Buildings all along the
street look typically looted and deserted; a grocery store, its large plate
glass window shattered, is on the southwest corner. On the southeast corner is
the burnt-out shell of a building, and an overgrown cemetery lies to the north.
As usual, all the telephone poles have been chopped down for firewood.">)
		      (T
		       <TELL
"Wicker Drive, which begins here, heads south under a railroad
bridge. Main Street leads west toward the center of the city and
east across a bridge over the river">
		       <GROCERY-STORE-DESC>
		       <TELL
", occupies the southwest corner and a restaurant stands amid a
large car lot on the southeast corner. There is an entrance to
the cemetery to the north.">)>)
	       (<AND <EQUAL? .RARG ,M-END>
		     <EQUAL? ,SYEAR 2051>
		     <EQUAL? ,LIGHT-LEVEL 3>
		     <NOT <EQUAL? ,L-HERE ,MAIN-AND-WICKER>>
		     <L? <GETP ,MAIN-AND-WICKER ,P?SCENE> 101>>
		<COND (<PROB <GETP ,MAIN-AND-WICKER ,P?SCENE>>
		       <PUTP ,MAIN-AND-WICKER ,P?SCENE 101>
		       <MOVE ,UNSHAVEN-MAN ,HERE>
		       <MOVE ,BORDELLO-AD ,UNSHAVEN-MAN>
		       <TELL CR "An ">
		       <PRINTD ,UNSHAVEN-MAN>
		       <TELL " looks bored as he hands out cheaply-printed ">
		       <PRINTD ,BORDELLO-AD>
		       <TELL "s." CR>)
		      (T
		       <PUTP ,MAIN-AND-WICKER ,P?SCENE
			     <+ <GETP ,MAIN-AND-WICKER ,P?SCENE> 25>>
		       <RFALSE>)>)>>

<OBJECT UNSHAVEN-MAN
	(LOC LOCAL-GLOBALS)
	(DESC "unshaven man")
	(LDESC
"There is an unshaven man here, handing out photocopied ads.")
	(SYNONYM MAN)
	(ADJECTIVE BORED UNSHAVEN)
	(FLAGS ACTORBIT VOWELBIT OPENBIT CONTBIT SEARCHBIT)
	(ACTION UNSHAVEN-MAN-F)>

<ROUTINE UNSHAVEN-MAN-F ()
	 <COND (<EQUAL? ,UNSHAVEN-MAN ,WINNER>
		<COND (<OR <AND <VERB? GIVE>
			    	<PRSO? ,BORDELLO-AD>>
			   <AND <VERB? SGIVE>
				<PRSI? ,BORDELLO-AD>>>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?TAKE ,BORDELLO-AD>)
		      (T
		       <TELL "He replies with a few monosyllabic grunts." CR>)>
		<CLEAR-BUF>)
	       (<AND <VERB? ASK-FOR>
		     <PRSI? ,BORDELLO-AD>>
		<PERFORM ,V?TAKE ,BORDELLO-AD>
		<RTRUE>)>>

<OBJECT BORDELLO-AD
	(LOC LOCAL-GLOBALS)
	(DESC "strip joint advertisement")
	(SYNONYM AD ADS FLYERS LEAFLETS ADVERTISE FLYER PHOTOCOPI
	 	 PHOTOCOPY LEAFLET)
	(ADJECTIVE STRIP JOINT BORDELLO CHEAP CHEAP-LOOKING PHOTOCOPI)
	(FLAGS READBIT TAKEBIT NDESCBIT TRYTAKEBIT)
	(SIZE 2)
	(ACTION BORDELLO-AD-F)>

<ROUTINE BORDELLO-AD-F ()
	 <COND (<AND <VERB? TAKE>
		     <FSET? ,BORDELLO-AD ,TRYTAKEBIT>>
		<FCLEAR ,BORDELLO-AD ,TRYTAKEBIT>
		<FCLEAR ,BORDELLO-AD ,NDESCBIT>
		<MOVE ,UNSHAVEN-MAN ,LOCAL-GLOBALS>
		<MOVE ,BORDELLO-AD ,PLAYER>
		<SETG FOLLOW-FLAG 9>
		<QUEUE I-UNFOLLOW 2>
		<PUTP ,SPEAR-CARRIER ,P?SDESC "man">
		<TELL "You take the last photocopy from the ">
		<PRINTD ,UNSHAVEN-MAN>
		<TELL " and glance at it. When you look up, he is gone." CR>)
	       (<AND <VERB? READ EXAMINE>
		     <FSET? ,BORDELLO-AD ,TRYTAKEBIT>>
		<TELL "You'll have to take one of the ads first." CR>)
	       (<VERB? READ EXAMINE>
		<SCORE 37> ;"1 point"
		<TELL
"   GIRLS!  GIRLS!  GIRLS!|
|
Mona's Pleasure Parlor has it all!!|
   * Massage Parlor|
   * Topless Club|
   * Escort Agency|
   * Bordello|
   * XXX Videos|
   * Accessory Shop and more!|
In Eastbank, on the corner of River|
and Franklin." CR>)>>

<OBJECT RAILROAD-TRACKS
	(LOC LOCAL-GLOBALS)
	(DESC "train tracks")
	(SYNONYM SET PAIR TRACK TRACKS)
	(ADJECTIVE RAILROAD RR TRAIN TUBE SUBWAY RUSTING OVERGROWN)
	(FLAGS NARTICLEBIT PLURALBIT)
	(ACTION RAILROAD-TRACKS-F)>

<ROUTINE RAILROAD-TRACKS-F ()
	 <COND (<AND <EQUAL? ,HERE ,CHURCH-STREET-PARK>
		     <EQUAL? ,SYEAR 2061 2071>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,RAILROAD-TRACKS>)
	       (<AND <EQUAL? ,HERE ,WAREHOUSE-1>
		     <EQUAL? ,SYEAR 2041 2051>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,RAILROAD-TRACKS>)
	       (<VERB? CROSS>
		<COND (<EQUAL? ,HERE ,WICKER-AND-PIER>
		       <DO-WALK ,P?NE>)
		      (<EQUAL? ,HERE ,MAIN-AND-WICKER ,CHURCH-STREET-PARK>
		       <DO-WALK ,P?SOUTH>)
		      (<EQUAL? ,HERE ,BEND>
		       <DO-WALK ,P?SE>)
		      (<EQUAL? ,HERE ,WICKER-AND-RIVER>
		       <DO-WALK ,P?NW>)
		      (<EQUAL? ,HERE ,WAREHOUSE-1>
		       <DO-WALK ,P?WEST>)
		      (T
		       <TELL "That would be dangerous and foolhardy." CR>)>)>>

<OBJECT RAILROAD-BRIDGE
	(LOC LOCAL-GLOBALS)
	(DESC "railroad bridge")
	(SYNONYM BRIDGE TRESTLE)
	(ADJECTIVE OLD UNUSED RAIL RAILROAD RR)
	(ACTION RAILROAD-BRIDGE-F)>

<ROUTINE RAILROAD-BRIDGE-F ()
	 <COND (<VERB? CROSS WALK-UNDER>
		<COND (<EQUAL? ,HERE ,MAIN-AND-WICKER>
		       <DO-WALK ,P?SOUTH>)
		      (<EQUAL? ,HERE ,BEND>
		       <DO-WALK ,P?SE>)
		      (<EQUAL? ,HERE ,WICKER-AND-RIVER>
		       <DO-WALK ,P?NW>)
		      (T
		       <DO-WALK ,P?NW>)>)>>

<OBJECT STREET-BRIDGE
	(LOC LOCAL-GLOBALS)
	(DESC "street bridge")
	(SYNONYM BRIDGE)
	(ADJECTIVE MAIN RIVER RIVER-BANK STREET RUSTED NEGLECTED ONCE-PROUD)
	(ACTION STREET-BRIDGE-F)>

<ROUTINE STREET-BRIDGE-F ()
	 <COND (<VERB? DISEMBARK LEAVE>
		<COND (<EQUAL? ,HERE ,RIVER-STREET-BRIDGE ,MAIN-STREET-BRIDGE>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? THROUGH WALK-TO CROSS>
		<COND (<EQUAL? ,HERE ,RIVER-STREET-BRIDGE ,MAIN-STREET-BRIDGE>
		       <COND (<VERB? CROSS>
			      <V-WALK-AROUND>)
			     (T
			      <TELL ,LOOK-AROUND CR>)>)
		      (<EQUAL? ,HERE ,MAIN-AND-WICKER>
		       <DO-WALK ,P?EAST>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?SE>)>)
	       (<VERB? LOOK-UNDER>
		<TELL "The Little Missouri flows under the bridge." CR>)>>

<ROUTINE MAIN-AND-CHURCH-ENTER-F ()
	 <COND (<EQUAL? ,SYEAR 2081>
		<SCORE 38> ;"6 points"
		<JIGS-UP
"As you pass the sign, three men armed with knives leap out of a doorway
and neatly slit your throat. As you lose consciousness, you feel them going
through your pockets.">
		<RFALSE>)
	       (T
		,MAIN-AND-CHURCH)>>

<ROOM FOODVILLE-2
      (LOC ROOMS)
      (DESC "Foodville")
      (NE TO MAIN-AND-WICKER)
      (OUT TO MAIN-AND-WICKER)
      (FLAGS ONBIT)
      (GLOBAL SUPERMARKET GLASS SHELVES)
      (ACTION FOODVILLE-2-F)>

<ROUTINE FOODVILLE-2-F (RARG)
	 <COND (<AND <EQUAL? .RARG ,M-ENTER>
		     <NOT <EQUAL? ,SYEAR 2081>>>
		<COND (<EQUAL? ,SYEAR 2071>
		       <SETG CLERK-WAITING <>>
		       <QUEUE I-FOODVILLE 1>)>
		<MOVE ,SPEAR-CARRIER ,HERE>
		<PUTP ,SPEAR-CARRIER ,P?SDESC "clerk">)
	       (<EQUAL? .RARG ,M-LOOK>
		<COND (<EQUAL? ,SYEAR 2081>
		       <SCORE 39> ;"3 points"
		       <TELL
"This grocery has been thoroughly looted; the shelves are all bare. The floor
is strewn with broken glass, and a rancid odor pervades the store. The only
exit leads back out to the street corner northeast of here.">)
		      (T
		       <FOODVILLE-DESC>
		       <TELL "northeast.">)>)
	       (<EQUAL? .RARG ,M-END>
		<FOODVILLE-CLOSES>)>>

<OBJECT MOLD
	(LOC LOCAL-GLOBALS)
	(DESC "pile of mold")
	(FDESC
"A disgusting pile of mold toward the rear indicates where some
soy patties were once stored.")
	(SYNONYM PILE MOLD)
	(ADJECTIVE DISGUSTIN PUTRID PUTRID-SMELLING)
	(FLAGS TRYTAKEBIT TAKEBIT)
	(ACTION MOLD-F)>

<ROUTINE MOLD-F ()
	 <COND (<VERB? EAT>
		<SCORE 40> ;"2 points"
		<TELL
"Because of your half-crazed state, perhaps brought on by several days without
food, you seriously consider eating the mold. In a lucid moment, though, you
realize how disgusting and dangerous that would be." CR>)
	       (<VERB? SMELL>
		<TELL
"You have just discovered the source of the rancid odor." CR>)
	       (<AND <VERB? TAKE>
		     <FSET? ,MOLD ,TRYTAKEBIT>>
		<FCLEAR ,MOLD ,TRYTAKEBIT>
		<FSET ,MOLD ,TOUCHBIT>
		<MOVE ,MOLD ,PLAYER>
		<TELL "You scoop up the putrid-smelling mold." CR>)>>

<ROUTINE THE-COACHMAN-ENTER-F ()
	 <COND (<AND <OR <G? ,STIME 1200>
			 <L? ,STIME 420>>
		     <NOT <EQUAL? ,SYEAR 2041>>>
		<OF-COURSE ,RESTAURANT-OBJECT>
		<RFALSE>)
	       (T
		,THE-COACHMAN)>>

<ROOM THE-COACHMAN
      (LOC ROOMS)
      (DESC "The Coachman")
      (NW TO MAIN-AND-WICKER)
      (OUT TO MAIN-AND-WICKER)
      (FLAGS NARTICLEBIT)
      (GLOBAL RESTAURANT-OBJECT MENU PEOPLE)
      (ACTION THE-COACHMAN-F)>

<ROUTINE THE-COACHMAN-F (RARG)
	 <COND (<AND <EQUAL? .RARG ,M-ENTER>
		     <NOT <EQUAL? ,SYEAR 2081>>>
		<SETG MEAL-STATUS 1>
		<SETG MAITRE-COUNTER 0>
		<SETG WAITER-COUNTER 0>
		<MOVE ,SPEAR-CARRIER ,HERE>
		<DISABLE <INT I-MEAL>>
		<MOVE ,RESTAURANT-TABLE ,HERE>
		<MOVE ,CHAIR ,HERE>
		<COND (<IN? ,CREDIT-CARD ,SPEAR-CARRIER>
		       <MOVE ,CREDIT-CARD ,LOCAL-GLOBALS>)>
		<PUTP ,SPEAR-CARRIER ,P?SDESC "maitre d'">)
	       (<EQUAL? .RARG ,M-LOOK>
		<COND (<EQUAL? ,SYEAR 2081>
		       <SCORE 41> ;"3 points"
		       <TELL
"This burned-out shell of a building was once a famous restaurant back
in the civilized days. The ">
		       <PRINTD ,TIMBERS>
		       <TELL " shiver as you walk through the ashes.">)
		      (T
		       <TELL "You are in a large, well-known restaurant">
		       <COND (<EQUAL? ,SYEAR 2071>
			      <SCORE 42> ;"score 3"
			      <TELL
", opulent in the extreme, and known to be restricted to the highest
ecclesiastics of the Church">)
			     (<EQUAL? ,SYEAR 2061>
			      <SCORE 43> ;"score 1"
			      <TELL ", a favorite of wealthy Churchmen">)>
		       <TELL
". The car lot and street lie to the northwest.">)>)
	       (<AND <EQUAL? .RARG ,M-END>
		     <EQUAL? ,SYEAR 2071>>
		<TELL CR
"The maitre d' spots you, and gestures a velvet-swathed arm toward
a bouncer waiting in the shadows. \"Throw this animal back out on
the street,\" he sniffs. The bouncer grabs your collar, and shoves
you through the doorway." CR CR>
		<GOTO ,MAIN-AND-WICKER>)
	       (<AND <EQUAL? .RARG ,M-END>
		     <EQUAL? ,SYEAR 2081>
		     <PROB 50>>
		<CRLF>
		<PERFORM ,V?MOVE ,TIMBERS>
		<RTRUE>)
	       (<AND <EQUAL? .RARG ,M-END>
		     <NOT <EQUAL? ,SYEAR 2081>>>
		<COND (<RESTAURANT-CLOSES ,MAIN-AND-WICKER>
		       <RTRUE>)
		      (<PARTY-OF-ONE>
		       <RTRUE>)>)>>

<OBJECT TIMBERS
	(LOC LOCAL-GLOBALS)
	(DESC "blackened timbers")
	(SYNONYM TIMBER TIMBERS BEAM BEAMS)
	(ADJECTIVE BLACKENED BURNED)
	(FLAGS NDESCBIT)
	(ACTION TIMBERS-F)>

<ROUTINE TIMBERS-F ()
	 <COND (<VERB? MOVE TOUCH>
		<JIGS-UP
"The entire roof suddenly shudders. Amidst screams of splintering wood and
billows of ash and dust, it collapses upon you.">)>>

<OBJECT RESTAURANT-TABLE
	(LOC LOCAL-GLOBALS)
	(DESC "table")
	(SYNONYM TABLE)
	(FLAGS VEHBIT SURFACEBIT OPENBIT NDESCBIT)
	(ACTION RESTAURANT-TABLE-F)>

<ROUTINE RESTAURANT-TABLE-F ;("OPTIONAL" RARG) ()
	 <COND ;(.RARG
		<RFALSE>)
	       ;(<VERB? OPEN CLOSE>
		<TELL "Huh?" CR>)
	       (<VERB? BOARD SIT>
		<COND (<EQUAL? ,RESTAURANT-TABLE <LOC ,PLAYER>>
		       <TELL ,LOOK-AROUND CR>)
		      (<EQUAL? ,HERE ,ROYS-PAGODA>
		       <RFALSE>)
		      (<G? ,MEAL-STATUS 2>
		       <MOVE ,PLAYER ,RESTAURANT-TABLE>
		       <TELL "You resume your seat." CR>)
		      (T
		       <TELL
"You'll have to wait for the maitre d' to seat you." CR>)>)>>

<OBJECT MENU
	(LOC LOCAL-GLOBALS)
	(DESC "menu")
	(SYNONYM MENU MENUBOARD BOARD)
	(ADJECTIVE MENU)
	(FLAGS READBIT)
	(ACTION MENU-F)>

<ROUTINE MENU-F ()
	 <COND (<EQUAL? ,HERE ,BURGER-MEISTER>
		<COND (<AND <EQUAL? ,SYEAR 2071>
			    <NOT <MOBY-VERB?>>>
		       <CANT-SEE ,MENU>)
		      (<VERB? READ EXAMINE>
		       <TELL "The menuboard lists ">
		       <FAST-FOOD-MENU>
		       <TELL "." CR>)>)
	       (<VERB? READ EXAMINE ASK-NO-ONE-FOR>
		<PERFORM ,V?BUY ,MEAL>
		<RTRUE>)>>

<ROUTINE FAST-FOOD-MENU ()
	 <COND (<EQUAL? ,SYEAR 2061>
		<SCORE 73> ;"2 points"
		<TELL
"soy and kelp burgers, a variety of algae products, and beer. All beef dishes
on the menuboard have been crudely covered over">)
	       (T
		<TELL
"beef burgers, less-expensive kelp burgers and soy burgers, and beer">)>>

<OBJECT MEAL
	(LOC GLOBAL-OBJECTS)
	(DESC "food")
	(SYNONYM FOOD MEAL LUNCH DINNER BREAKFAST SNACK BURGER HAMBURGER
	 	 BEEFBURGE SOYBURGER KELPBURGE TINS)
	(ADJECTIVE SOY KELP BEEF PLAIN BADLY LABELLED)
	(GENERIC GENERIC-FOOD-F)
	(FLAGS NARTICLEBIT)
	(ACTION MEAL-F)>

<ROUTINE MEAL-F ()
	 <COND (<AND <EQUAL? ,SYEAR 2081>
		     <VERB? EXAMINE TAKE>
		     <EQUAL? ,HERE ,FOODVILLE-2>>
		<CANT-SEE ,MEAL>)
	       (<VERB? BUY>
		<COND (<EQUAL? ,HERE ,SIMONS ,THE-COACHMAN>
		       <COND (<EQUAL? ,SYEAR 2081>
			      <TELL ,LOOK-AROUND CR>)
			     (<NOT <EQUAL? <LOC ,PLAYER> ,RESTAURANT-TABLE>>
			      <TELL
"You'll have to wait until you're seated." CR>)
			     (<EQUAL? ,MEAL-STATUS 3>
			      <I-MEAL>)
			     (T
			      <TELL "You've already ">
			      <COND (<EQUAL? ,MEAL-STATUS 6>
				     <TELL "eaten">)
				    (T
				     <TELL "ordered">)>
			      <TELL "." CR>)>)
		      (<EQUAL? ,HERE ,ROYS-PAGODA>
		       <SETG ELAPSED-TIME 22>
		       <COND (,RECORDING
			      <PUT ,RECORDING-TABLE 0 1>)>
		       <TELL
"You order a bowl of Hot and Sour soup and some assorted appetizers.
The food arrives promptly, steaming hot, delicately spiced, delicious.
Afterward, your check arrives with a typical fortune cookie and a plate
of lychee nuts. The fortune reads: \"">
		       <COND (<EQUAL? ,SYEAR 2041>
			      <TELL "Prosperity does not equal happiness">)
			     (<EQUAL? ,SYEAR 2051>
			      <TELL "Today's leak is tomorrow's flood">)
			     (<EQUAL? ,SYEAR 2061>
			      <TELL "Buddha welcomes even the poorest man">)
			     (T
			      <TELL "It is always darkest before dawn">)>
		       <TELL ".\" You pay with your ">
		       <PRINTD ,CREDIT-CARD>
		       <COND (<L? ,CREDIT 30>
			      <TELL
", but the waiter returns a minute later with your card and says, \"Sorry,
not enough balance to pay for meal. You pay next time you come.\"" CR>
			      <RTRUE>)>
		       <DEBIT 30>
		       <TELL "." CR>)
		      (<AND <EQUAL? ,HERE ,BURGER-MEISTER>
			    <NOT <EQUAL? ,SYEAR 2071>>>
		       <SETG ELAPSED-TIME 12>
		       <COND (,RECORDING
			      <PUT ,RECORDING-TABLE 0 1>)>
		       <COND (<EQUAL? ,SYEAR 2041>
			      <TELL
"The line you picked moves quickly, putting you in a cheerful mood,
and you decide to splurge and buy a beef burger.">)
			     (T
			      <TELL
"Your line moves slowly. The person in front of you orders a quarter-pound
soyburger, and it looks halfway decent, so when you reach the counter you
decide to order one also.">)>
		       <TELL " It arrives a moment later">
		       <COND (<TOO-POOR 20 ,MEAL>
			      <RTRUE>)
			     (T
			      <DEBIT 20>
			      <MOVE ,PLAYER ,GLOBAL-TABLE>
			      <TELL
". You sit down at one of the tiny tables to devour it. It's ">
			      <COND (<EQUAL? ,SYEAR 2061>
				     <TELL "edible">)
				    (T
				     <TELL "juicy and delicious">)>
			      <TELL "." CR>)>)
		      (<EQUAL? ,HERE ,FOODVILLE-1 ,FOODVILLE-2>
		       <COND (<FSET? ,GROCERIES ,TOUCHBIT>
			      <TELL
"You've already bought enough groceries to last the week." CR>)
			     (<EQUAL? ,SYEAR 2041 2051>
			      <MOVE ,SPEAR-CARRIER ,HERE>
			      <PUTP ,SPEAR-CARRIER ,P?SDESC "cashier">
			      <SETG ELAPSED-TIME 12>
			      <TELL
"You wander down the aisles, filling the small cart with various items.
You select the shortest checkout line">
			      <COND (<TOO-POOR 73 ,MEAL>
				     <RTRUE>)>
			      <MOVE ,GROCERIES ,PLAYER>
		       	      <FSET ,GROCERIES ,TOUCHBIT>
			      <SETG P-IT-OBJECT ,GROCERIES>
		       	      <DEBIT 73>
			      <TELL
". A clerk bags your groceries and hands you the bag." CR>)
			     (<EQUAL? ,SYEAR 2061>
			      <TELL
"You wander down the aisles, but the food is so sparse and unappetizing
that you decide not to buy anything." CR>)
			     (<EQUAL? ,SYEAR 2071>
			      <TELL
"You can only get food these days using your ration card." CR>)
			     (T
			      <CANT-SEE ,MEAL>)>)  
		      (T
		       <TELL "You can't get a meal here!" CR>)>)
	       (<VERB? WAIT-FOR>
		<COND (<IN? ,CREDIT-CARD ,SPEAR-CARRIER>
		       <V-WAIT 30>)
		      (<EQUAL? ,HERE ,THE-COACHMAN ,SIMONS>
		       <PERFORM ,V?BUY ,MEAL>
		       <RTRUE>)
		      (T
		       <PERFORM ,V?WAIT-FOR ,GOLD> ;"...quite a while."
		       <RTRUE>)>)
	       (<VERB? TAKE EAT>
		<COND (<OR <EQUAL? ,HERE ,FOODVILLE-1 ,FOODVILLE-2>
			   <EQUAL? ,HERE ,BURGER-MEISTER ,ROYS-PAGODA>>
		       <TELL "You can't take food you haven't paid for!" CR>)
		      (<EQUAL? ,HERE ,SIMONS ,THE-COACHMAN>
		       <COND (<EQUAL? ,MEAL-STATUS 6>
		       	      <PERFORM ,V?BUY ,MEAL>
		       	      <RTRUE>)
		      	     (<EQUAL? ,MEAL-STATUS 4 5>
		       	      <TELL "It hasn't arrived yet." CR>)
		      	     (T
		       	      <TELL "You haven't ordered yet." CR>)>)
		      (T
		       <CANT-SEE ,MEAL>)>)
	       (<AND <VERB? EXAMINE>
		     <IN-RESTAURANT?>>
		<TELL "The food is prepared in another room." CR>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,CAFETERIA>>
		<TELL "You can't see much from this high vantage point." CR>)
	       (<AND <NOT <EQUAL? ,HERE ,FOODVILLE-1 ,FOODVILLE-2>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,MEAL>)
	       (<AND <EQUAL? ,SYEAR 2071>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,MEAL>)
	       (<VERB? WAIT-FOR>
		<COND (<EQUAL? ,HERE ,THE-COACHMAN ,SIMONS>
		       <COND (<IN? ,CREDIT-CARD ,SPEAR-CARRIER>
			      <V-WAIT 20>)
			     (T
			      <PERFORM ,V?READ ,MENU>
			      <RTRUE>)>)
		      (T ;"...WAITING QUITE A WHILE, not IT'S RIGHT HERE!"
		       <PERFORM ,V?WAIT-FOR ,FORTZMAN>
		       <RTRUE>)>)>>

<GLOBAL WAITER-COUNTER 0>

<GLOBAL MAITRE-COUNTER 0>

<GLOBAL MEAL-STATUS 0>
;"1 = entered restaurant, maitre d' is still asking
  2 = maitre d' has given up until the rest of your party arrives
  3 = you've been seated but haven't ordered yet
  4 = you've ordered, and the waiter is still waiting for your credit card
  5 = the waiter has your credit card, but the food hasn't arrived yet
  6 = you've finished your meal"

<ROUTINE I-MEAL ("AUX" OLD-WINNER)
	 <COND (<NOT <EQUAL? ,HERE ,THE-COACHMAN ,SIMONS>>
		<RFALSE>)>
	 <COND (<IN? ,CREDIT-CARD ,SPEAR-CARRIER>
		<MOVE ,CREDIT-CARD ,PLAYER>
		<COND (<L? ,CREDIT 65>
		       <TELL CR
"The waiter returns with your card, informing you that you have insufficient
funds to cover the meal. He escorts you out of the restaurant." CR CR>
		       <SET OLD-WINNER ,WINNER>
		       <SETG WINNER ,PLAYER>
		       <DO-WALK ,P?OUT>
		       <SETG WINNER .OLD-WINNER>)
		      (T
		       <COND (,RECORDING
			      <PUT ,RECORDING-TABLE 0 1>)>
		       <SETG MEAL-STATUS 6>
		       <INCREMENT-TIME 12>
		       <TELL CR "The waiter places ">
		       <COND (<EQUAL? ,SYEAR 2041>
			      <TELL
"your soybean salad on the table. A generous portion, and
quite tasty; you quickly devour it">)
			     (T
			      <TELL
"your kelp fillet in front of you. You eat the entire dish, and while it
was tasty, you still feel that it wasn't worth the price">)>
		       <DEBIT 65>
		       <TELL "." CR>)>)
	       (<EQUAL? ,MEAL-STATUS 4>
		<SETG WAITER-COUNTER <+ ,WAITER-COUNTER 1>>
		<QUEUE I-MEAL 1>
		<COND (<EQUAL? ,WAITER-COUNTER 4>
		       <TELL CR
"The waiter clears his throat. \"If you're unable to produce your credit
card, I'd be glad to ask the maitre d' over here to assist you.\"" CR>)
		      (<EQUAL? ,WAITER-COUNTER 6>
		       <TELL CR
"The waiter, looking quite annoyed, leaves the tableside. A moment later,
the maitre d' arrives and shows you out of the restaurant." CR CR>
		       <SET OLD-WINNER ,WINNER>
		       <SETG WINNER ,PLAYER>
		       <DO-WALK ,P?OUT>
		       <SETG WINNER .OLD-WINNER>
		       <RFATAL>)
		      (T
		       <SETG P-IT-OBJECT ,SPEAR-CARRIER>
		       <TELL CR
"The waiter is standing at your table, waiting for your ">
		       <PRINTD ,CREDIT-CARD>
		       <TELL "." CR>)>)
	       (<EQUAL? <LOC ,PLAYER> ,RESTAURANT-TABLE>
		<SETG P-IT-OBJECT ,SPEAR-CARRIER>
		<SETG MEAL-STATUS 4>
		<TELL CR "The waiter hands you a ">
		<COND (<L? ,STIME 690>
		       <TELL "breakfast">)
		      (<G? ,STIME 960>
		       <TELL "dinner">)
		      (T
		       <TELL "lunch">)>
		<TELL
" menu, and after perusing the meat prices you settle on a">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL " nice, reasonably priced soybean salad">)
		      (T
		       <TELL
"n overpriced kelp fillet, the cheapest item on the menu">)>
		<TELL
". The waiter jots down your order, and reminds you of the
restaurant's policy of payment in advance." CR>
		<QUEUE I-MEAL 1>)
	       (T
		<QUEUE I-MEAL 1>
		<RFALSE>)>>

<ROUTINE PARTY-OF-ONE ()
	 <COND (<EQUAL? ,MEAL-STATUS 1>
		<CRLF>
		<COND (<G? ,MAITRE-COUNTER 8>
		       <TELL
"\"I'm afraid you'll have to leave,\" says the maitre d'. \"There's
no loitering here.\" He escorts you to the door." CR CR>
		       <DO-WALK ,P?OUT>)
		      (T
		       <SETG MAITRE-COUNTER <+ ,MAITRE-COUNTER 1>>
		       <TELL "\"Party of one?\" sniffs the maitre d'." CR>)>)>>

<OBJECT GROCERIES
	(LOC LOCAL-GLOBALS)
	(DESC "bag of groceries")
	(SYNONYM BAG GROCERIES FOOD)
	(FLAGS TAKEBIT)
	(SIZE 35)
	(GENERIC GENERIC-FOOD-F)
	(ACTION GROCERIES-F)>

<ROUTINE GROCERIES-F ()
	 <COND (<VERB? LOOK-INSIDE EXAMINE>
		<TELL "Just a bagful of typical groceries." CR>)
	       (<VERB? OPEN>
		<TELL "The bag is open." CR>)
	       (<VERB? EAT>
		<COND (<IN-APARTMENT?>
		       <MOVE ,GROCERIES ,LOCAL-GLOBALS>
		       <TELL
"You select one item, a small bag of potato snacks, and eat that. You ">
		       <COND (<NOT <EQUAL? ,HERE ,KITCHEN>>
			      <SETG HERE ,KITCHEN>
			      <MOVE ,PLAYER ,KITCHEN>
			      <TELL "go to the kitchen and ">)>
		       <TELL "put the rest of the groceries away." CR>)
		      (T
		       <TELL
"Better to wait until you get home and use the groceries for dinner." CR>)>)
	       (<AND <VERB? PUT>
		     <PRSI? ,KITCHEN-OBJECT>>
		<PERFORM ,V?PUT-AWAY ,GROCERIES>
		<RTRUE>)
	       (<VERB? PUT-AWAY>
		<COND (<IN-APARTMENT?>
		       <TELL "You ">
		       <COND (<NOT <EQUAL? ,HERE ,KITCHEN>>
			      <MOVE ,PLAYER ,KITCHEN>
			      <SETG HERE ,KITCHEN>
			      <TELL "enter the kitchen and ">)>
		       <MOVE ,GROCERIES ,LOCAL-GLOBALS>
		       <TELL "put the groceries neatly away." CR>)
		      (T
		       <TELL "Wait until you get home." CR>)>)
	       (<AND <VERB? PUT>
		     <PRSI? ,GROCERIES>>
		<TELL "The bag is full; besides, that's a dumb place to keep">
		<ARTICLE ,PRSO>
		<TELL "." CR>)
	       (<VERB? BUY>
		<PERFORM ,V?BUY ,MEAL>
		<RTRUE>)>>

<ROOM MAIN-STREET-BRIDGE
      (LOC ROOMS)
      (DESC "Main Street Bridge")
      (NORTH PER RIVER-ENTER-F)
      (NE PER RIVER-ENTER-F)
      (EAST PER MAIN-STREET-BRIDGE-EXIT-F)
      (SE PER RIVER-ENTER-F)
      (SOUTH PER RIVER-ENTER-F)
      (SW PER RIVER-ENTER-F)
      (WEST TO MAIN-AND-WICKER)
      (NW PER RIVER-ENTER-F)
      (FLAGS OUTSIDEBIT)
      (GLOBAL STREET-BRIDGE RIVER RIVER-BANK WATER)
      (ACTION MAIN-STREET-BRIDGE-F)>

<ROUTINE MAIN-STREET-BRIDGE-F (RARG)
	 <COND (<AND <EQUAL? .RARG ,M-ENTER>
		     <EQUAL? ,SYEAR 2081>>
		<QUEUE I-WILD-DOGS -1>)
	       (<EQUAL? .RARG ,M-LOOK>
		<COND (<EQUAL? ,SYEAR 2081>
		       <SCORE 44> ;"2 points"
		       <TELL
"This once-proud bridge is now rusted and neglected. To the west, the road
enters the city. An intersection is visible in that direction.">)
		      (T
		       <TELL
"You have reached the center of the bridge which carries Main Street across
the river. Westward brings you back into the city, and east of here are the
wealthier suburbs of the east bank.">
		       <RIVER-FIRE "south">)>)>>

<ROUTINE MAIN-STREET-BRIDGE-EXIT-F ()
	 <COND (<EQUAL? ,SYEAR 2081>
		<DISABLE <INT I-WILD-DOGS>>
		<SCORE 45> ;"3 points"
		<JIGS-UP
"Within seconds, a pack of wild dogs surrounds you and begins
tearing you to shreds!">)
	       (T
		<SUBURBS-ENTER-F>)>
	 <RFALSE>>

<OBJECT SACK
	(LOC LOCAL-GLOBALS)
	(DESC "sack")
	(LDESC "A blood-soaked sack is lying at the edge of the bridge.")
	(SYNONYM SACK)
	(ADJECTIVE BLOOD-SOAKED)
	(FLAGS TAKEBIT CONTBIT SEARCHBIT)
	(CAPACITY 20)
	(ACTION SACK-F)>

<ROUTINE SACK-F ()
	 <COND (<VERB? EXAMINE>
		<SCORE 46> ;"2 points"
		<TELL
"The sack is soaked with blood and shows traces of the wild fruits that grow
beyond the city. Judging by how the sack has been clawed to pieces, it would
seem that the owner was killed by wild animals rather than humans." CR>)>>

<GLOBAL WILD-DOG-COUNTER 0>

<OBJECT BARKING
	(LOC LOCAL-GLOBALS)
	(DESC "barking")
	(SYNONYM BARKING)
	(ADJECTIVE DISTANT)
	(FLAGS NDESCBIT NARTICLEBIT)
	(ACTION BARKING-F)>

<ROUTINE BARKING-F ()
	 <COND (<VERB? LISTEN>
		<TELL
"The barking is off to the east. It seems to be getting louder." CR>)>>

<ROOM CEMETERY
      (LOC ROOMS)
      (DESC "Cemetery")
      (NORTH SORRY "There is no gate in that direction.")
      (NE PER RIVER-ENTER-F)
      (EAST PER RIVER-ENTER-F)
      (SE PER RIVER-ENTER-F)
      (SOUTH TO MAIN-AND-WICKER)
      (SW TO MAIN-AND-CHURCH)
      (WEST TO CHURCH-ENTRANCE)
      (NW TO MIDLAND-AND-CHURCH)
      (FLAGS OUTSIDEBIT)
      (GLOBAL GRAFFITI WATER RIVER CEMETERY-OBJECT CONSTRUCTION-OBJECT GATE
       	      RIVER-BANK)
      (ACTION CEMETERY-F)>

<ROUTINE CEMETERY-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<COND (<EQUAL? ,SYEAR 2081>
		       <SCORE 47> ;"4 points"
		       <TELL
"Once a lovely old cemetery, the land is now overgrown and the ">
		       <PRINTD ,HEADSTONES>
		       <TELL
" toppled and vandalized. Snarled bushes and trees provide countless hiding
places for thieves and cutthroats.">)
		      (T
		       <TELL
"Midland Cemetery occupies one of the nicest pieces of land in the city,
atop the rolling bluffs of the west bank. The cemetery dates back to the
time of the original St. Michael's building, and some of the gravestones
are two hundred years old. ">
		       <COND (<EQUAL? ,SYEAR 2071>
			      <SCORE 48> ;"4 points"
			      <TELL
"Many of the stones have been etched with ugly graffiti, like \"PAP,\"
a derogatory term for Catholics, and \"JEEBOO,\" an epithet for any
nonmember of the Church. Near the main gate of the cemetery, to the
west, the land has been bulldozed but is now overgrown with weeds,
indicating a construction project that was begun but then abandoned. O">)
			     (T
			      <TELL
"The main gate of the cemetery is west of here, and o">)>
		       <TELL
"ther gates lie to the south, southwest, and northwest.">)>)
	       (<AND <EQUAL? .RARG ,M-END>
		     <EQUAL? ,SYEAR 2081>>
		<TELL CR
"With a rustle of leaves, someone leaps out of concealment. You barely
catch a glimpse of a grizzled man wearing a torn imi-denim outfit before
a fist cracks you across the face, and you pass out as you begin rolling
down the hillside. ">
		<COND (<FSET? ,CEMETERY ,ONBIT>
		       <JIGS-UP "This time, you fail to recover.">)
		      (T
		       <TELL "Sometime later, you come to..." CR CR>
		       <FSET ,CEMETERY ,ONBIT>
		       <SETG MUGGED T>
		       <ROB ,PLAYER ,LOCAL-GLOBALS>
		       <INCREMENT-TIME 23>
		       <GOTO ,MAIN-AND-WICKER>)>)>>

<OBJECT CEMETERY-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "cemetery")
	(SYNONYM CEMETERY GRAVEYARD)
	(ADJECTIVE MIDLAND)
	(ACTION CEMETERY-OBJECT-F)>

<ROUTINE CEMETERY-OBJECT-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,HERE ,CEMETERY>
		       <TELL ,LOOK-AROUND CR>)
		      (<EQUAL? ,HERE ,MAIN-AND-WICKER>
		       <DO-WALK ,P?NORTH>)
		      (<EQUAL? ,HERE ,MAIN-AND-CHURCH>
		       <DO-WALK ,P?NE>)
		      (<EQUAL? ,HERE ,CHURCH-ENTRANCE>
		       <DO-WALK ,P?EAST>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?SE>)>)
	       (<VERB? DISEMBARK LEAVE>
		<COND (<EQUAL? ,HERE ,CEMETERY>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,CEMETERY>
		       <V-LOOK>)
		      (T
		       <FROM-HERE>)>)>>      

<OBJECT HEADSTONES
	(LOC CEMETERY)
	(DESC "headstones")
	(SYNONYM HEADSTONE GRAVESTON TOMBSTONE STONE STONES)
	(ADJECTIVE HEAD GRAVE TOMB TOPPLED VANDALIZE)
	(FLAGS READBIT NDESCBIT NARTICLEBIT)
	(ACTION HEADSTONES-F)>

<ROUTINE HEADSTONES-F ()
	 <COND (<VERB? EXAMINE READ>
		<COND (<EQUAL? ,SYEAR 2071>
		       <PERFORM ,V?READ ,GRAFFITI>
		       <RTRUE>)
		      (<EQUAL? ,SYEAR 2081>
		       <TELL
"Virtually all the stones have been broken and toppled." CR>)
		      (T
		       <TELL
"The stones bear the usual epitaphs, names, and dates. Some of the stones
are dated from the middle of the nineteenth century." CR>)>)>> 

<ROOM CHURCH-ENTRANCE
      (LOC ROOMS)
      (SDESC "")
      (NORTH TO MIDLAND-AND-CHURCH)
      (NE SORRY "There's no entrance to the cemetery in that direction.")
      (EAST TO CEMETERY)
      (SE SORRY "There's no entrance to the cemetery in that direction.")
      (SOUTH TO MAIN-AND-CHURCH)
      (SW PER CONSTRUCTION-SITE-4-ENTER-F)
      (WEST PER ST-MICHAELS-ENTER-F)
      (NW PER CONSTRUCTION-SITE-5-ENTER-F)
      (IN PER ST-MICHAELS-ENTER-F)
      (FLAGS STREETBIT OUTSIDEBIT)
      (GLOBAL GRAFFITI CEMETERY-OBJECT VACANT-LOT CONSTRUCTION-OBJECT PEOPLE
       	      CHURCH-OBJECT RECTORY-OBJECT GATE)
      (ACTION CHURCH-ENTRANCE-F)>

<ROUTINE CHURCH-ENTRANCE-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<COND (<EQUAL? ,SYEAR 2071>
		       <PUTP ,CHURCH-ENTRANCE ,P?SDESC "Street by Vacant Lot">)
		      (T
		       <PUTP ,CHURCH-ENTRANCE ,P?SDESC "Church Entrance">)>)
	       (<EQUAL? .RARG ,M-LOOK>
		<TELL "You are on Church Street, just east of">
		<ST-MICHAELS-DESC>
		<TELL " The street continues north and south">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL ", and ">
		       <PRINTD ,CONSTRUCTION-OBJECT>
		       <TELL "s lie to the northwest and southwest">)
		      (<EQUAL? ,SYEAR 2051>
		       <TELL
". Another church building, probably a rectory, lies to the northwest, and
an ordinary high-rise apartment is southwest of here">)
		      (<EQUAL? ,SYEAR 2061>
		       <TELL
". Another church building to the northwest is also closed. Southwest of
here is an indistinguishable apartment block">)
		      (T
		       <TELL
". To the northwest is a ruined structure of some type, and to the
southwest is a luxury apartment tower">)>
		<TELL
". The main entrance to Midland Cemetery is east of here.">)>>

<ROUTINE ST-MICHAELS-DESC ()
	 <TELL " a large">
	 <COND (<EQUAL? ,SYEAR 2061>
		<SCORE 49> ;"2 points"
		<TELL
" church with boarded doors and windows. Anti-Catholic
graffiti defaces the facade.">)
	       (<EQUAL? ,SYEAR 2071>
		<TELL " vacant lot.">)
	       (T
		<TELL
", opulent church displaying the architecture of the twentieth century.">)>>

<ROUTINE ST-MICHAELS-ENTER-F ()
	 <COND (<EQUAL? ,SYEAR 2061>
		<SCORE 49> ;"2 points"
		<TELL ,BOARDED-OVER CR>
		<RFALSE>)
	       (T
		,ST-MICHAELS)>>

<ROUTINE CONSTRUCTION-SITE-5-ENTER-F ()
	 <COND (<EQUAL? ,SYEAR 2061>
		<TELL
"The building is closed, its doorways and windows boarded over." CR>
		<RFALSE>)
	       (T
		,CONSTRUCTION-SITE-5)>>

<ROOM ST-MICHAELS
      (LOC ROOMS)
      (SDESC "")
      (EAST TO CHURCH-ENTRANCE)
      (OUT TO CHURCH-ENTRANCE)
      (FLAGS ONBIT)
      (GLOBAL VACANT-LOT CHURCH-OBJECT)
      (ACTION ST-MICHAELS-F)>

<ROUTINE ST-MICHAELS-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<MOVE ,CHURCH-OFFICIAL ,LOCAL-GLOBALS>
		<COND (<EQUAL? ,SYEAR 2071>
		       <MOVE ,RUSTY-CROSS ,HERE>
		       <FCLEAR ,ST-MICHAELS ,NARTICLEBIT>
		       <PUTP ,ST-MICHAELS ,P?SDESC "Vacant Lot">)
		      (T
		       <FSET ,ST-MICHAELS ,NARTICLEBIT>
		       <PUTP ,ST-MICHAELS ,P?SDESC "St. Michael's">)>)
	       (<EQUAL? .RARG ,M-LOOK>
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL
"You are in a large, vacant lot, strewn with rubble. The only way out of the
lot is a small opening in the rubble to the east.">)
		      (T
		       <TELL
"This is a large church with an obviously wealthy congregation.
Although this building is over a century old, it is not the original
St. Michael's, but is built on the site of the even older original
church. The way out is to the east.">)>)
	       (<EQUAL? .RARG ,M-END>
		<ELDER-MOVE>)>>

<OBJECT RUSTY-CROSS
	(DESC "rusty cross")
	(FDESC
"Lying amidst the debris is a rusty metal object of some kind.")
	(SYNONYM CROSS OBJECT)
	(ADJECTIVE RUSTY RUSTING METAL)
	(FLAGS TRYTAKEBIT TAKEBIT)
	(ACTION RUSTY-CROSS-F)>

<ROUTINE RUSTY-CROSS-F ()
	 <COND (<AND <VERB? TAKE>
		     <FSET? ,RUSTY-CROSS ,TRYTAKEBIT>>
		<FCLEAR ,RUSTY-CROSS ,TRYTAKEBIT>
		<FSET ,RUSTY-CROSS ,TOUCHBIT>
		<MOVE ,RUSTY-CROSS ,PLAYER>
		<TELL
"You pick up the metal object. " ,IT-LOOKS-LIKE " an old, rusting cross." CR>)
	       (<VERB? EXAMINE>
		<TELL
"The cross is ornamental, of the sort once worn by priests. It has rusted
to the point of fragility." CR>)>>

<ROOM CONSTRUCTION-SITE-5
      (LOC ROOMS)
      (SDESC "")
      (NE TO MIDLAND-AND-CHURCH)
      (SE TO CHURCH-ENTRANCE)
      (FLAGS OUTSIDEBIT)
      (GLOBAL GLASS RECTORY-OBJECT CONSTRUCTION-OBJECT)
      (ACTION CONSTRUCTION-SITE-5-F)>

<ROUTINE CONSTRUCTION-SITE-5-F (RARG)
	<COND (<EQUAL? .RARG ,M-ENTER>
	       <COND (<EQUAL? ,SYEAR 2041>
		      <PUTP ,CONSTRUCTION-SITE-5 ,P?SDESC "Construction Site">)
		     (<EQUAL? ,SYEAR 2051>
		      <PUTP ,CONSTRUCTION-SITE-5 ,P?SDESC "Rectory">)
		     (T
		      <PUTP ,CONSTRUCTION-SITE-5 ,P?SDESC "Ruined Building">)>)
	      (<EQUAL? .RARG ,M-LOOK>
	       <COND (<EQUAL? ,SYEAR 2041>
		      <TELL
"An old building, possibly a rectory owned by the church to the
south, is being renovated">)
		     (<EQUAL? ,SYEAR 2071>
		      <TELL
"Barely discernible through the ash and broken glass are signs that this
was once a church building of some kind">)
		     (T
		      <TELL "This is part of the St. Michael's complex">)>
	       <TELL
". You can leave to either the northeast or southeast.">)>>

<OBJECT RECTORY-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "rectory")
	(SYNONYM RECTORY PARSONAGE PASTORAGE BUILDING)
	(ADJECTIVE OLD CHURCH)
	(ACTION RECTORY-OBJECT-F)>

<ROUTINE RECTORY-OBJECT-F ()
	 <COND (<AND <EQUAL? ,SYEAR 2041 2071>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,RECTORY-OBJECT>)
	       (<VERB? WALK-TO DISEMBARK>
		<COND (<EQUAL? ,HERE ,CONSTRUCTION-SITE-5>
		       <TELL ,LOOK-AROUND CR>)
		      (<EQUAL? ,HERE ,CHURCH-ENTRANCE>
		       <DO-WALK ,P?NW>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?SW>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,CONSTRUCTION-SITE-5>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,CONSTRUCTION-SITE-5>>
		<V-LOOK>)>>

<ROOM MIDLAND-AND-CHURCH
      (LOC ROOMS)
      (DESC "Midland & Church")
      (NORTH SORRY "There's no entrance to the railroad yard from here.")
      (NE SORRY "There's no entrance to the railroad yard from here.")
      (EAST TO CEMETERY)
      (SE TO CEMETERY)
      (SOUTH TO CHURCH-ENTRANCE)
      (SW PER CONSTRUCTION-SITE-5-ENTER-F)
      (WEST TO MIDLAND-AND-RIVER)
      (NW SORRY "There's no entrance to the railroad yard from here.")
      (FLAGS STREETBIT OUTSIDEBIT NARTICLEBIT)
      (GLOBAL CEMETERY-OBJECT RAILROAD-YARD CONSTRUCTION-OBJECT PEOPLE
	      RECTORY-OBJECT GATE)
      (ACTION MIDLAND-AND-CHURCH-F)>

<ROUTINE MIDLAND-AND-CHURCH-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "Church Street, from the south, ends at this corner. A">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL " ">
		       <PRINTD ,RAILROAD-YARD>
		       <TELL ", no longer used but part of the ">
		       <PRINTD ,RAILROAD-MUSEUM>
		       <TELL ",">)
		      (T
		       <TELL "n abandoned ">
		       <PRINTD ,RAILROAD-YARD>)>
		<TELL " spans the northern side of Midland. There is ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "construction">)
		      (<EQUAL? ,SYEAR 2051>
		       <TELL "a church rectory">)
		      (<EQUAL? ,SYEAR 2061>
		       <TELL "a closed church building">)
		      (T
		       <TELL "a wreck of a building">)>
		<TELL
" on the southwest corner, and to the southeast is an entrance to
Midland Cemetery. Midland Avenue heads eastward into the cemetery.">)>>

<OBJECT HEALTH-CENTER-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "health center")
	(SYNONYM CENTER HMO FACILITY)
	(ADJECTIVE HEALTH ANDERSON)
	(ACTION HEALTH-CENTER-OBJECT-F)>

<ROUTINE HEALTH-CENTER-OBJECT-F ()
	 <COND (<EQUAL? ,SYEAR 2071>
		<CANT-SEE ,HEALTH-CENTER-OBJECT>)
	       (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,HERE ,HEALTH-CENTER>
		       <TELL ,LOOK-AROUND CR>)
		      (<EQUAL? ,HERE ,MAIN-AND-RIVER>
		       <DO-WALK ,P?NE>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?SOUTH>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,HEALTH-CENTER>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,HEALTH-CENTER>>
		<V-LOOK>)>>

<ROOM HEALTH-CENTER
      (LOC ROOMS)
      (SDESC "")
      (NORTH TO SKYCAR-LOT-3)
      (SW TO MAIN-AND-RIVER)
      (FLAGS ONBIT)
      (GLOBAL CARLOT HEALTH-CENTER-OBJECT)
      (ACTION HEALTH-CENTER-F)>

<ROUTINE HEALTH-CENTER-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<COND (<EQUAL? ,SYEAR 2071>
		       <PUTP ,HEALTH-CENTER ,P?SDESC "Serf Housing">)
		      (T
		       <PUTP ,HEALTH-CENTER ,P?SDESC "Health Center">)>)
	       (<EQUAL? .RARG ,M-LOOK>
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL
"The Anderson Health Center is one of the country's oldest and most
reputable private health maintenance organizations. A directory in the lobby
directs members to various departments on the many floors of the center">)
		      (<EQUAL? ,SYEAR 2051>
		       <SCORE 50> ;"1 point"
		       <TELL
"The Anderson Health Care center is a respected, member-owned HMO which
has consistently refused to follow the trend of providing inferior health
care to those unable to afford the best procedures">)
		      (<EQUAL? ,SYEAR 2061>
		       <SCORE 51> ;"2 points"
		       <TELL
"This once-superb medical facility has fallen upon hard times, as its wealthy
members have abandoned it in favor of better facilities, and the remaining,
poorer members were unable to maintain the previous levels of health care">)
		      (T
		       <SCORE 52> ;"4 points"
		       <TELL
"This building once housed the Anderson Health Care Center, which was among
the last facilities to continue offering medical care to serfs. After finally
succumbing to financial realities, the structure has now become an overcrowded,
unsanitary home-of-last-resort for the poorest of the poor">)>
		<TELL
". There are exits southwest, to the street, and north, to a">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL "n abandoned">)>
		<TELL " car lot.">)>>

<OBJECT ANDERSON-DIRECTORY
	(LOC LOCAL-GLOBALS)
	(DESC "directory")
	(SYNONYM DIRECTORY)
	(FLAGS NDESCBIT)
	(ACTION ANDERSON-DIRECTORY-F)>

<ROUTINE ANDERSON-DIRECTORY-F ()
	 <COND (<VERB? READ EXAMINE>
		<TELL
"The directory merely tells which floor the various departments of the ">
		<PRINTD ,HEALTH-CENTER-OBJECT>
		<TELL " are located on." CR>)>>

<ROOM SKYCAR-LOT-3
      (LOC ROOMS)
      (DESC "Skycar Lot")
      (NORTH SORRY "There's a tall fence in the way.")
      (NE SORRY "There's a tall fence in the way.")
      (EAST SORRY "There's a tall fence in the way.")
      (SE SORRY "There's a tall fence in the way.")
      (SOUTH TO HEALTH-CENTER)
      (SW SORRY "There's a tall fence in the way.")
      (WEST SORRY "There's a tall fence in the way.")
      (NW TO MIDLAND-AND-RIVER)
      (FLAGS OUTSIDEBIT)
      (GLOBAL FENCE CARLOT HEALTH-CENTER-OBJECT)
      (ACTION SKYCAR-LOT-3-F)>

<ROUTINE SKYCAR-LOT-3-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "This is a">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL "n abandoned">)>
		<TELL " multistory car lot ">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL "that was once used ">)>
		<TELL "for the Anderson Health Center ">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL "that once occupied the building ">)>
		<TELL
"that can be entered to the south. The exit to the street is northwest.">)>>

<ROOM MIDLAND-AND-RIVER
      (LOC ROOMS)
      (DESC "Midland & River")
      (NORTH TO BODANSKI-SQUARE)
      (NE PER TRAIN-STATION-ENTER-F)
      (EAST TO MIDLAND-AND-CHURCH)
      (SE TO SKYCAR-LOT-3)
      (SOUTH TO MAIN-AND-RIVER)
      (SW SORRY "There's no entrance to the skyscraper in that direction.")
      (WEST PER OFFICE-BUILDING-ENTER-F)
      (NW SORRY "There's no entrance to the skyscraper in that direction.")
      (FLAGS STREETBIT OUTSIDEBIT NARTICLEBIT)
      (GLOBAL GLASS CARLOT CHURCH-OBJECT TRAIN-STATION-OBJECT PEOPLE)
      (ACTION MIDLAND-AND-RIVER-F)>

<ROUTINE MIDLAND-AND-RIVER-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Eastbound Midland Avenue forms a \"T\" with River Street at this
intersection. To the northeast is a">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "n old but magnificently preserved structure">)
		      (T
		       <TELL
" graceful structure of marble and glass, bearing the
black radar dish symbol of the ">
		       <TELL "Church">
		       <COND (<EQUAL? ,SYEAR 2051>
			      <TELL " of God's Word">)>)>
		<TELL
". " ,ALI-BUILDING-DESC ", and a car lot occupies the southeast corner.">)>>

<OBJECT ALI-BUILDING
	(LOC MIDLAND-AND-RIVER)
	(DESC "ALI Building")
	(SYNONYM BUILDING BLDG HQ HEADQUARTERS SKYSCRAPER GROUP)
	(ADJECTIVE ALI AMERICAN LIFE INSURANCE FAIRLY TYPICAL
	 	   TWENTY-FIRST CENTURY)
	(FLAGS NDESCBIT VOWELBIT)
	(ACTION ALI-BUILDING-F)>

<ROUTINE ALI-BUILDING-F ()
	 <COND (<VERB? EXAMINE>
		<TELL ,ALI-BUILDING-DESC "." CR>)>>

<GLOBAL ALI-BUILDING-DESC
"The ALI Building, headquarters of the American Life Insurance group and
a fairly typical twenty-first century skyscraper, extends along the western
side of the street">

<ROUTINE TRAIN-STATION-ENTER-F ()
	 <COND (<OR <AND <EQUAL? ,SYEAR 2041>
			 <G? ,STIME 660>
			 <L? ,STIME 1260>>
		    <EQUAL? ,SYEAR 2051 2061 2071>>
		,TRAIN-STATION)
	       (T
		<CLOSED-PRINT "The station">
		<RFALSE>)>>

<OBJECT TRAIN-STATION-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "train station")
	(SYNONYM STATION LANDMARK)
	(ADJECTIVE TRAIN OLD NORTH CENTRAL FORMER MAGNIFICE RESTORED
	 	   NATIONAL NATL)
	(ACTION TRAIN-STATION-OBJECT-F)>

<ROUTINE TRAIN-STATION-OBJECT-F ()
	 <COND (<AND <NOT <EQUAL? ,SYEAR 2041>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,TRAIN-STATION-OBJECT>)
	       (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,BODANSKI-SQUARE>
		       <DO-WALK ,P?SE>)
		      (<EQUAL? ,HERE ,MIDLAND-AND-RIVER>
		       <DO-WALK ,P?NE>)
		      (<GLOBAL-IN? ,TRAIN-STATION-OBJECT ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,TRAIN-STATION>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,TRAIN-STATION>
		       <V-LOOK>)
		      (T
		       <TELL "The ">
		       <PRINTD ,TRAIN-STATION-OBJECT>
		       <TELL
" is a magnificently preserved national landmark." CR>)>)>>

<ROOM TRAIN-STATION
      (LOC ROOMS)
      (SDESC "")
      (EAST PER TRAIN-STATION-EXIT-F)
      (NW TO BODANSKI-SQUARE)
      (SW TO MIDLAND-AND-RIVER)
      (FLAGS ONBIT)
      (GLOBAL CHURCH-OBJECT TRAIN-STATION-OBJECT PEOPLE)
      (ACTION TRAIN-STATION-F)>

<ROUTINE TRAIN-STATION-EXIT-F ()
	 <COND (<EQUAL? ,SYEAR 2041>
		<TELL ,NO-TICKET CR>)
	       (T
		<TELL
"Only high Church officials are allowed into the inner areas." CR>)>
	 <RFALSE>>

<ROUTINE TRAIN-STATION-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<COND (<EQUAL? ,SYEAR 2041>
		       <COND (<FSET? ,TICKET ,NDESCBIT>
			      <MOVE ,TICKET ,HERE>)>
		       <PUTP ,TRAIN-STATION ,P?SDESC "Train Station">)
		      (T
		       <PUTP ,TRAIN-STATION ,P?SDESC "Church Lobby">)>)
	       (<EQUAL? .RARG ,M-LOOK>
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL
"The former North Central Station is a magnificent building from the earliest
part of the twentieth century. Unused for years, it has been restored as a
national landmark. The newsstands have been converted to souvenir stands, and
tourists stream through the station to buy tickets for a fifteen minute ride
on an authentic electric railroad train, which can be boarded to the east. You
can leave the station to the northwest or southwest.">)
		      (T
		       <TELL "The regional central headquarters of the Church">
		       <COND (<EQUAL? ,SYEAR 2051>
			      <SCORE 53> ;"2 points"
			      <TELL
" of God's Word, built on the site of an old ">
			      <PRINTD ,TRAIN-STATION-OBJECT>
			      <TELL ",">)>
		       <TELL
" is an architectural splendor; light spills down from above, giving the
illusion that the countenance of God is gazing down upon a visitor in full
force and fury. A huge image of a radar dish, symbol of the Church, hangs
above the inner sanctums to the east, and impressively tall arched doorways
lead out to the northwest and southwest.">)>)
	       (<AND <EQUAL? .RARG ,M-END>
		     <EQUAL? ,SYEAR 2041>>
		<CLOSING-TIME
		        1260 "the train station" "a guard" ,BODANSKI-SQUARE>)>>

<OBJECT SOUVENIR
	(LOC LOCAL-GLOBALS)
	(DESC "souvenir")
	(SYNONYM SOUVENIR SOUVENIRS TRINKET TRINKETS JUNK)
	(ADJECTIVE TYPICALLY CHEAP OVERPRICED OVER-PRICED TRAIN-RELATED)
	(FLAGS NDESCBIT)
	(ACTION SOUVENIR-F)>

<ROUTINE SOUVENIR-F ()
	 <COND (<VERB? BUY>
		<COND (<EQUAL? ,HERE ,TRAIN-STATION>
		       <TELL
"You know better than to waste your money on junk like that." CR>)
		      (T
		       <TELL "There aren't any souvenirs for sale here!" CR>)>)
	       (<VERB? EXAMINE>
		<TELL
"The souvenirs are typically cheap, overpriced, train-related trinkets." CR>)>>

<OBJECT PAMPHLET
	(LOC LOCAL-GLOBALS)
	(DESC "glossy pamphlet")
	(FDESC
"A wooden rack in the lobby, for the purpose of distributing literature
about the church, contains one pamphlet.")
	(SYNONYM LITERATUR PAMPHLET BOOKLET LEAFLET FLYER)
	(ADJECTIVE GLOSSY)
	(FLAGS TAKEBIT READBIT)
	(ACTION PAMPHLET-F)>

<ROUTINE PAMPHLET-F ()
	 <COND (<VERB? READ>
		<COND (<EQUAL? ,SYEAR 2051>
		       <SCORE 54> ;"1 point"
		       <TELL
"\"A BRIEF HISTORY OF THE CHURCH OF GOD'S WORD|
|
The Church of God's Word is the vision of a great man, a man named Ellis
Vincent. He alone, of all the scientists on the Mount who heard the signals,
recognized them for what they were, the Word of God.|
|
The Holy Prophet was ridiculed and persecuted for his beliefs, but he had the
strength that comes from knowing the Truth, and Followers began to hear those
Truths and flock around him. They grew in numbers and in strength, and when
the Evil Scientists of the Mount attempted to bar Vincent from the instruments
there, he and his Followers rose up and smote the Evil Scientists.|
|
And so it came to pass, in 2025, that the Temple was founded on the Mount,
and the Instrument of the Word was devoted entirely to listening to God's
Word. Vincent interpreted the Words for his Followers, who broadcast the
Message around the world, and branches of the Church appeared in many cities.|
|
When Vincent finally became very old, and God began to beckon his servant
to his side, he taught the wisest of his Followers how to interpret the
Word, so that the world would continue to understand the Word after he
was gone. These Followers became the High Priests of the Church, who to
this day continue to pass along God's Word.\"" CR>)
		      (<EQUAL? ,SYEAR 2061>
		       <SCORE 55> ;"2 points"
		       <TELL
"\"Hear and obey the Word of God.|
|
Ever since the brave crusade of the Holy Prophet Vincent against the evil
sinners of the Mount, the priests of the Church of God's Word have been
the sacred guardians of God's Mouth, passing along His Word as sent down
from the heavens.|
|
The Lord Most High has been growing angry at His flock -- angry that there are
some who do not heed His Word. He is sending a sign, a fiery star that will
soon burn in our nighttime skies, to warn us that all created in His image
must become brethren of His Church. The punishment for not doing so will be
swift and cruel, and directed not just against the sinners but against all of
mankind, such that all will suffer for the sins of the few.|
|
Our Father and Creator is demanding, but He is also generous and kind. When
the day arrives that all men have joined His Church and heed His Word, he
will bring down upon the Earth an epoch of such peace and beauty as the
world has not seen since Eden. The choice He gives us is simple: Turn away
and suffer, or Follow and live to see Heaven on Earth.\"" CR>)
		      (T
		       <SCORE 56> ;"5 points"
		       <TELL
"\"   --- New Pronouncements from The Mount ---|
|
Our Father in Heaven is pleased with the progress the Church is making
toward Purifying His flock, and assures the Faithful that the day of
deliverance is soon.|
|
He has instructed that new Worship Camps for the Unpure be opened in
every part of His favorite nation. He has instructed that these be
filled with more of the Beasts in Human Form, who have not joined the
Church, or who are not considered fit to join the Church, so that they
may be purified and sent to meet Him.|
|
He has instructed that only the officials of the Church may hold
governmental posts, in order to speed His work and facilitate the
dawning of the new Eden. He has, in his generosity, increased the
number of slaves a Churchman may own, from twenty-five to fifty.|
|
This is the Word of God; blessed be His name.\"" CR>)>)>>

<OBJECT PAMPHLET-RACK
	(LOC TRAIN-STATION)
	(DESC "rack")
	(SYNONYM RACK)
	(ADJECTIVE WOODEN)
	(FLAGS NDESCBIT)
	(ACTION RACK-F)>

<ROUTINE RACK-F ()
	 <COND (<AND <EQUAL? ,SYEAR 2041>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,PAMPHLET-RACK>)
	       (<AND <VERB? PUT>
		     <PRSI? ,PAMPHLET-RACK>>
		<COND (<PRSO? ,PAMPHLET>
		       <FCLEAR ,PAMPHLET ,TOUCHBIT>
		       <MOVE ,PAMPHLET ,HERE>
		       <TELL "Done." CR>)
		      (T
		       <TELL "The rack is for Church literature." CR>)>)
	       (<VERB? EXAMINE LOOK-INSIDE>
		<COND (<FSET? ,PAMPHLET ,TOUCHBIT>
		       <TELL "It's empty." CR>)
		      (T
		       <TELL <GETP ,PAMPHLET ,P?FDESC> CR>)>)>>

<ROOM CENTRE-AND-KENNEDY
      (LOC ROOMS)
      (DESC "Centre & Kennedy")
      (LDESC
"At this intersection, Centre Street cuts across Kennedy Street from
northeast to southwest. A tall hotel has entrances to the east and
southeast. The austere facade of Huang Hall rises to the west. Kennedy
Street continues north and south.")
      (NORTH TO PARK-ENTRANCE)
      (NE TO BODANSKI-SQUARE)
      (EAST TO VELDRAN-HOTEL)
      (SE TO VELDRAN-HOTEL)
      (SOUTH TO MAIN-AND-KENNEDY)
      (SW TO ROCKVIL-CENTRE)
      (WEST TO HUANG-HALL)
      (NW SORRY "There's no entrance to Huang Hall in that direction.")
      (FLAGS STREETBIT OUTSIDEBIT NARTICLEBIT)
      (SCENE 25)
      (GLOBAL HOTEL-OBJECT HUANG-HALL-OBJECT PEOPLE)
      (ACTION CENTRE-AND-KENNEDY-F)>

<ROUTINE CENTRE-AND-KENNEDY-F (RARG)
	 <COND (<AND <EQUAL? .RARG ,M-END>
		     <EQUAL? ,SYEAR 2071>
		     <EQUAL? ,LIGHT-LEVEL 3>
		     <L? <GETP ,CENTRE-AND-KENNEDY ,P?SCENE> 101>>
		<COND (<PROB <GETP ,CENTRE-AND-KENNEDY ,P?SCENE>>
		       <PUTP ,CENTRE-AND-KENNEDY ,P?SCENE 101>
		       <SCORE 57> ;"4 points"
		       <TELL CR
"Across the street, a beggar attempts to approach a wealthy couple, and
is beaten into unconsciousness by bodyguards." CR>)
		      (T
		       <PUTP ,CENTRE-AND-KENNEDY ,P?SCENE
			     <+ <GETP ,CENTRE-AND-KENNEDY ,P?SCENE> 25>>
		       <RFALSE>)>)>>

<ROOM VELDRAN-HOTEL
      (LOC ROOMS)
      (DESC "Veldran Hotel")
      (LDESC
"This high-rise luxury hotel is frequented by business travellers attending
conventions at Huang Hall across the street. The exit from the lobby is to
the northwest.")
      (WEST TO CENTRE-AND-KENNEDY)
      (NW TO CENTRE-AND-KENNEDY)
      (OUT TO CENTRE-AND-KENNEDY)
      (FLAGS ONBIT)
      (GLOBAL HOTEL-OBJECT)>

<OBJECT HUANG-HALL-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "Huang Hall")
	(SYNONYM HALL CENTER FACADE)
	(ADJECTIVE HUANG CONVENTION AUSTERE BOXY MULTI-PURPOSE PLAIN)
	(ACTION HUANG-HALL-OBJECT-F)>

<ROUTINE HUANG-HALL-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,CENTRE-AND-KENNEDY>
		       <DO-WALK ,P?WEST>)
		      (<EQUAL? ,HERE ,HALLEY-AND-PARK>
		       <DO-WALK ,P?EAST>)
		      (<EQUAL? ,HERE ,HALLEY-PARK-EAST>
		       <DO-WALK ,P?SOUTH>)
		      (<GLOBAL-IN? ,HUANG-HALL-OBJECT ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,HUANG-HALL>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,HUANG-HALL>
		       <V-LOOK>)
		      (T
		       <TELL
"The exterior of the hall is plain and boxy." CR>)>)>>

<ROOM HUANG-HALL
      (LOC ROOMS)
      (DESC "Huang Hall")
      (NORTH PER HALLEY-PARK-EAST-ENTER-F)
      (EAST TO CENTRE-AND-KENNEDY)
      (WEST TO HALLEY-AND-PARK)
      (FLAGS NARTICLEBIT)
      (GLOBAL PARK-OBJECT HUANG-HALL-OBJECT PEOPLE)
      (ACTION HUANG-HALL-F)>

<ROUTINE HUANG-HALL-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "This multipurpose hall ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL
"was built by a grant from the Huang Foundation, with the stipulation
that it be used primarily for artistic and cultural events. It is also">)
		      (T
		       <TELL "is">)>
		<TELL
" used for conventions, trade shows, and even an occasional sporting
event. The current activity seems to be ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "a publishers' convention">)
		      (<EQUAL? ,SYEAR 2051>
		       <SCORE 58> ;"1 point"
		       <TELL "a jewelry and fur show">)
		      (<EQUAL? ,SYEAR 2061>
		       <SCORE 59> ;"2 points"
		       <TELL
"the graduation festivities for the largest BSF Academy class ever">)
		      (T
		       <SCORE 60> ;"7 points"
		       <TELL
"preparations for the televised, annual Executioners Awards">)>
		<TELL ". You can exit to the ">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL "east or west.">)
		      (T
		       <TELL "north, east, or west.">)>)>>

<ROOM HALLEY-AND-PARK
      (LOC ROOMS)
      (DESC "Halley & Park")
      (NORTH SORRY "The tunnel isn't for pedestrian traffic.")
      (NE PER HALLEY-PARK-EAST-ENTER-F)
      (EAST TO HUANG-HALL)
      (SE SORRY "There's no entrance to Huang Hall in that direction.")
      (SOUTH TO ROCKVIL-CENTRE)
      (SW PER HALLEY-MUSEUM-ENTER-F)
      (WEST TO HALLEY-AND-UNIVERSITY)
      (NW PER HALLEY-PARK-WEST-ENTER-F)
      (FLAGS STREETBIT OUTSIDEBIT NARTICLEBIT)
      (GLOBAL TUNNEL MUSEUM-OBJECT PARK-OBJECT GATE HUANG-HALL-OBJECT
       	      HALLEY-ESTATES-OBJECT UNOPENABLE-DOOR PEOPLE)
      (ACTION HALLEY-AND-PARK-F)>

<ROUTINE HALLEY-AND-PARK-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are on Park Street, at the eastern terminus of Halley Drive. North
of here, Park Street descends into a tunnel under ">
		<COND (<EQUAL? ,SYEAR 2071>
		       <SCORE 61> ;"2 points"
		       <TELL "the estates that were once ">)> 
		<TELL "Halley Park. ">
		<COND (<NOT <EQUAL? ,SYEAR 2071>>
		       <TELL
"The park can be entered to the northeast or northwest. ">)>
		<PRINTD ,HALLEY-MUSEUM>
		<COND (<EQUAL? ,SYEAR 2061 2071>
		       <SCORE 62> ;"2 points"
		       <TELL
", once the city's pride but now closed for the last several years,">)>
		<TELL
" fronts the intersection to the southwest, and Huang Hall can be
entered to the east.">)>>

<ROUTINE HALLEY-MUSEUM-ENTER-F ()
	 <COND (<EQUAL? ,SYEAR 2071 2061>
		<SCORE 62> ;"2 points"
		<TELL ,BOARDED-OVER CR>
		<RFALSE>)
	       (<AND <G? ,STIME 600>
		     <L? ,STIME 1290>>
		,HALLEY-MUSEUM)
	       (T
		<CLOSED-PRINT "The museum">
		<RFALSE>)>>

<ROOM HALLEY-MUSEUM
      (LOC ROOMS)
      (DESC "Halley Museum")
      (NE TO HALLEY-AND-PARK)
      (OUT TO HALLEY-AND-PARK)
      (FLAGS ONBIT)
      (GLOBAL MUSEUM-OBJECT EXHIBITS PEOPLE)
      (ACTION HALLEY-MUSEUM-F)>

<ROUTINE HALLEY-MUSEUM-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "Nearly seventy-five">)
		      (T
		       <TELL "Nearly eighty-five">)>
		<TELL " years old, ">
		<PRINTD ,HALLEY-MUSEUM>
		<TELL
" is the pride of Rockvil. The museum specializes in classical art, but has
exhibits on science and engineering, natural and human history, and modern
art as well. The museum is">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL ", as usual, very">)
		      (<EQUAL? ,SYEAR 2051>
		       <SCORE 129> ;"1 point"
		       <TELL " not very">)>
		<TELL " crowded. The street lies to the northeast.">)
	       (<EQUAL? .RARG ,M-END>
		<CLOSING-TIME 1290 "the museum" "a guard" ,HALLEY-AND-PARK>)>>

<ROOM HALLEY-AND-UNIVERSITY
      (LOC ROOMS)
      (DESC "Halley & University")
      (NORTH PER HALLEY-PARK-WEST-ENTER-F)
      (NE PER NO-ENTRANCE-TO-PARK-F)
      (EAST TO HALLEY-AND-PARK)
      (SE SORRY "There's no entrance to the campus in that direction.")
      (SOUTH TO ROCKVIL-UNIVERSITY)
      (SW SORRY "There's no entrance to the campus in that direction.")
      (WEST TO INTERCHANGE)
      (NW PER NO-ENTRANCE-TO-PARK-F)
      (FLAGS STREETBIT OUTSIDEBIT NARTICLEBIT)
      (GLOBAL HIGHWAY CAMPUS PARK-OBJECT GATE HALLEY-ESTATES-OBJECT PEOPLE
       	      INTERCHANGE-OBJECT)
      (SCENE 100)
      (ACTION HALLEY-AND-UNIVERSITY-F)>

<ROUTINE HALLEY-AND-UNIVERSITY-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"University Avenue begins here, winding southwards into the ">
		<COND (<EQUAL? ,SYEAR 2071>
		       <SCORE 63> ;"2 points"
		       <TELL "grounds of what was once ">
		       <PRINTD ,ROCKVIL-UNIVERSITY>)
		      (T
		       <TELL "college">)>
		<TELL ". Along the north side of the street is ">
		<COND (<EQUAL? ,SYEAR 2071>
		       <SCORE 62> ;"2 points"
		       <TELL
"a high brick wall forming the perimeter of the estates that were built when
Halley Park was carved up a few years ago">)
		      (T
		       <TELL "Halley Park">)>
		<TELL ". Just to the west is the highway entrance.">)
	       (<AND <EQUAL? .RARG ,M-END>
		     <EQUAL? ,SYEAR 2051>
		     <EQUAL? <GETP ,HALLEY-AND-UNIVERSITY ,P?SCENE> 100>>
		<PUTP ,HALLEY-AND-UNIVERSITY ,P?SCENE 101>
		<MOVE ,CHURCH-SKYCOPTER ,HERE>
		<QUEUE I-CHURCH-SKYCOPTER <+ ,ELAPSED-TIME 1>>
		<SCORE 64> ;"1 point"
		<TELL CR
"A skycopter, with a loudspeaker disguised as a radar dish hanging below it,
drifts slowly by overhead, announcing some sort of prayer meeting." CR>)>>

<OBJECT CHURCH-SKYCOPTER
	(LOC LOCAL-GLOBALS)
	(DESC "skycopter")
	(LDESC
"The skycopter is droning slowing away, repeating its announcement.")
	(SYNONYM SKYCOPTER ANNOUNCEM LOUDSPEAK SPEAKER COPTER)
	(ADJECTIVE SKY)
	(ACTION CHURCH-SKYCOPTER-F)>

<ROUTINE CHURCH-SKYCOPTER-F ()
	 <COND (<VERB? LISTEN>
		<MOVE ,CHURCH-SKYCOPTER ,LOCAL-GLOBALS>
		<DISABLE <INT I-CHURCH-SKYCOPTER>>
		<SCORE 64> ;"1 point"
		<TELL
"\"The Church of God's Word invites you to a prayer meeting tonight at...\" The
skycopter drifts out of range before you can hear the time or location." CR>)
	       (<VERB? EXAMINE>
		<TELL
"Suspended from the skycopter is a speaker modelled to resemble the
symbol of the Church." CR>)>>

<ROUTINE I-CHURCH-SKYCOPTER ()
	 <TELL "The skycopter, heading away, disappears from view." CR>
	 <MOVE ,CHURCH-SKYCOPTER ,LOCAL-GLOBALS>
	 <RFALSE>>

<ROOM INTERCHANGE
      (LOC ROOMS)
      (DESC "Interchange")
      (LDESC
"This is a huge cloverleaf interchange which once carried traffic on and off
the interstate. The highway lies north, south and west of here, and Halley
Drive runs off to the east.")
      (NORTH SORRY
"The highway's not a safe place to walk. Even in this day and age, it's still
used occasionally for ground freight.")
      (WEST SORRY
"The highway's not a safe place to walk. Even in this day and age, it's still
used occasionally for ground freight.")
      (SOUTH SORRY
"The highway's not a safe place to walk. Even in this day and age, it's still
used occasionally for ground freight.")
      (EAST TO HALLEY-AND-UNIVERSITY)
      (FLAGS STREETBIT OUTSIDEBIT)
      (GLOBAL HIGHWAY INTERCHANGE-OBJECT)>

<OBJECT INTERCHANGE-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "interchange")
	(SYNONYM INTERCHANGE CLOVERLEAF)
	(ADJECTIVE HUGE CLOVERLEAF)
	(FLAGS VOWELBIT)
	(ACTION INTERCHANGE-OBJECT-F)>

<ROUTINE INTERCHANGE-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,INTERCHANGE>
		       <TELL ,LOOK-AROUND CR>)
		      (<GLOBAL-IN? ,INTERCHANGE-OBJECT ,HERE>
		       <DO-WALK ,P?WEST>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,INTERCHANGE>
		       <DO-WALK ,P?EAST>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,INTERCHANGE>>
		<V-LOOK>)>>

<ROUTINE NO-ENTRANCE-TO-PARK-F ()
	 <TELL "There's no entrance to the ">
	 <COND (<EQUAL? ,SYEAR 2071>
		<TELL "estates">)
	       (T
		<TELL "park">)>
	 <TELL " in that direction." CR>
	 <RFALSE>>

<ROUTINE HALLEY-PARK-EAST-ENTER-F ()
	 <COND (<EQUAL? ,SYEAR 2071>
		<COND (<EQUAL? ,HERE ,HUANG-HALL ,AQUARIUM>
		       <TELL ,CANT-GO CR>)
		      (T
		       <SCORE 65> ;"3 points"
		       <TELL ,SHOT-ON-SIGHT CR>)>
		<RFALSE>)
	       (T
		,HALLEY-PARK-EAST)>>

<ROUTINE HALLEY-PARK-WEST-ENTER-F ()
	 <COND (<EQUAL? ,SYEAR 2071>
		<SCORE 65> ;"3 points"
		<TELL ,SHOT-ON-SIGHT CR>
		<RFALSE>)
	       (T
		,HALLEY-PARK-WEST)>>

<ROOM HALLEY-PARK-WEST
      (LOC ROOMS)
      (DESC "Halley Park West")
      (NORTH TO SKYCAR-LOT-4)
      (NE SORRY "There's no exit from the park in that direction.")
      (EAST PER HALLEY-PARK-EAST-ENTER-F)
      (SE TO HALLEY-AND-PARK)
      (SOUTH TO HALLEY-AND-UNIVERSITY)
      (SW SORRY "There's no exit from the park in that direction.")
      (WEST TO ZOO)
      (NW TO ZOO)
      (DOWN PER TUBES-ENTER-F)
      (FLAGS PARKBIT OUTSIDEBIT NARTICLEBIT)
      (GLOBAL PEOPLE STAIRS ZOO-OBJECT PARK-OBJECT WATER CARLOT TUBE-STATION)
      (ACTION HALLEY-PARK-WEST-F)>

<ROUTINE HALLEY-PARK-WEST-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is the western half of Halley Park, bordered on the north by a car lot,
on the northwest and west by the zoo, and on the south by Halley Drive. A ">
		<COND (<EQUAL? ,SYEAR 2061>
		       <SCORE 66> ;"1 point"
		       <TELL "dried-up pond bed">)
		      (T
		       <TELL "small duck pond">)>
		<TELL
" fills the center of the park. Near the zoo entrance is an entrance
leading down to the Tubes.">)>>

<OBJECT DUCKS
	(LOC HALLEY-PARK-WEST)
	(DESC "mallard duck")
	(SYNONYM DUCK DUCKS MALLARD MALLARDS)
	(ADJECTIVE MALLARD COMMON)
	(FLAGS NDESCBIT TRYTAKEBIT)
	(ACTION DUCKS-F)>

<ROUTINE DUCKS-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The ducks are some common variety, probably mallards." CR>)
	       (<VERB? TAKE KICK>
		<TELL "The ducks scatter, quacking noisily." CR>)>>

<OBJECT DUCK-POND
	(LOC HALLEY-PARK-WEST)
	(DESC "duck pond")
	(SYNONYM POND BED)
	(ADJECTIVE SMALL DUCK DRIED-OUT)
	(FLAGS NDESCBIT)
	(GENERIC GENERIC-BED-F)
	(ACTION DUCK-POND-F)>

<ROUTINE DUCK-POND-F ()
	 <COND (<VERB? EXAMINE>
		<COND (<EQUAL? ,SYEAR 2061>
		       <SCORE 66> ;"1 point"
		       <TELL "It is dry and filled with debris." CR>)
		      (T
		       <COND (<EQUAL? ,SYEAR 2041>
			      <TELL "Many">)
			     (T
			      <TELL "A few">)>
		       <TELL
" ducks are swimming around in the waters of the pond." CR>)>)
	       (<VERB? LOOK-INSIDE>
		<COND (<EQUAL? ,SYEAR 2061>
		       <PERFORM ,V?EXAMINE ,DUCK-POND>
		       <RTRUE>)
		      (T
		       <TELL
"The water is pretty murky, so you can't see much." CR>)>)
	       (<AND <VERB? PUT THROW>
		     <PRSI? ,DUCK-POND>>
		<COND (<EQUAL? ,SYEAR 2061>
		       <PERFORM ,V?THROUGH ,DUCK-POND>
		       <RTRUE>)
		      (T
		       <MOVE ,PRSO ,LOCAL-GLOBALS>
		       <COND (<FSET? ,PRSO ,PLURALBIT>
			      <TELL "They sink">)
			     (T
			      <TELL "It sinks">)>
		       <TELL " into the depths of the pond." CR>)>)
	       (<VERB? BOARD THROUGH SWIM>
		<COND (<EQUAL? ,SYEAR 2061>
		       <TELL "The pond is just a dried-out patch!" CR>)
		      (T
		       <TELL "Swimming in public ponds is illegal." CR>)>)>>

<ROOM HALLEY-PARK-EAST
      (LOC ROOMS)
      (DESC "Halley Park East")
      (NORTH PER AQUARIUM-ENTER-F)
      (NE SORRY "There's no exit from the park in that direction.")
      (EAST TO PARK-ENTRANCE)
      (SE SORRY "There's no exit from the park in that direction.")
      (SOUTH TO HUANG-HALL)
      (SW TO HALLEY-AND-PARK)
      (WEST PER HALLEY-PARK-WEST-ENTER-F)
      (NW TO SKYCAR-LOT-4)
      (FLAGS OUTSIDEBIT PARKBIT NARTICLEBIT)
      (GLOBAL GRAFFITI PARK-OBJECT CARLOT AQUARIUM-OBJECT HUANG-HALL-OBJECT
	      PEOPLE)
      (ACTION HALLEY-PARK-EAST-F)>

<ROUTINE HALLEY-PARK-EAST-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<COND (<EQUAL? ,SYEAR 2061>
		       <SCORE 67> ;"1 point"
		       <TELL
"A pedestal in the center of the park, defaced with multicolored graffiti,
indicates where a now-missing statue once rose">)
		      (T
		       <TELL
"A statue of Francisco Halley, founder of Rockvil, rises in
the center of the park">)>
		<TELL
". To the north is the Aquarium and south of here is boxy Huang Hall. Other
exits from the park lead east, northwest, and southwest. The larger section
of Halley Park lies to the west.">)>>

<OBJECT HALLEY-STATUE
	(LOC HALLEY-PARK-EAST)
	(DESC "statue")
	(SYNONYM STATUE FRANCISCO HALLEY)
	(ADJECTIVE FRANCISCO HALLEY)
	(FLAGS NDESCBIT READBIT)
	(ACTION HALLEY-STATUE-F)>

<ROUTINE HALLEY-STATUE-F ()
	 <COND (<AND <EQUAL? ,SYEAR 2061>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,HALLEY-STATUE>)
	       (<VERB? WHO>
		<TELL
"Francisco Halley is considered the founder of Rockvil." CR>)
	       (<VERB? EXAMINE READ>
		<PERFORM ,V?READ ,PEDESTAL>
		<RTRUE>)>>

<OBJECT PEDESTAL
	(LOC HALLEY-PARK-EAST)
	(DESC "pedestal")
	(SYNONYM BASE PEDESTAL INSCRIPTI)
	(ADJECTIVE DEFACED INSCRIBED)
	(FLAGS NDESCBIT READBIT)
	(TEXT
"The pedestal is inscribed:|
|
        Rockvil's Founding Father:|
             Francisco Halley")>

<ROOM ZOO
      (LOC ROOMS)
      (DESC "Zoo")
      (NORTH TO ZOO-ENTRANCE)
      (NE SORRY "There's no exit from the zoo in that direction.")
      (EAST TO SKYCAR-LOT-4)
      (SE PER HALLEY-PARK-WEST-ENTER-F)
      (SOUTH PER HALLEY-PARK-WEST-ENTER-F)
      (SW SORRY "There's no exit from the zoo in that direction.")
      (WEST SORRY "There's no exit from the zoo in that direction.")
      (NW SORRY "There's no exit from the zoo in that direction.")
      (FLAGS OUTSIDEBIT)
      (GLOBAL HIGHWAY ZOO-OBJECT PARK-OBJECT CARLOT CHILDREN GATE ANIMAL
       	      HALLEY-ESTATES-OBJECT GLOBAL-SIGN PEOPLE)
      (ACTION ZOO-F)>

<ROUTINE ZOO-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"The Rockvil Zoological Garden is a moderately sized zoo,">
		<COND (<EQUAL? ,SYEAR 2041 2051>
		       <TELL
" but it is well-designed, featuring natural habitats">)>
		<TELL " nestled between ">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL "barren">)
		      (T
		       <TELL "grassy">)>
		<TELL " hills. The main entrance lies to the north">
		<COND (<EQUAL? ,SYEAR 2071>
		       <SCORE 68> ;"5 points"
		       <SETG P-IT-OBJECT ,BANNER>
		       <TELL
". Affluent estates, recently built on the site of Halley Park, form
the southeastern boundary of the zoo.|
|
Several of the nearby cages are empty, with cheaply-made \"EXTINCT\" signs
bolted over the animal names and descriptions.">
		       <COND (<AND <G? ,STIME 840>
				   <L? ,STIME 900>>
			      <SCORE 69> ;"4 points"
			      <TELL CR CR
"You can hear squeals of pain from the Monkey Cage, where the daily
torturing of the apes is going on for the amusement of zoo visitors.">)>)
		      (T
		       <TELL
", with other exits leading east and southeast. You can just make out the
old elevated interstate, forming the western border of the zoo.">)>)
	       (<AND <EQUAL? .RARG ,M-END>
		     <EQUAL? ,SYEAR 2061>
		     <NOT ,ZOO-FLAG>
		     <PROB 40>>
		<SETG ZOO-FLAG T>
		<SCORE 70> ;"2 points"
		<TELL CR
"At a nearby cage, a group of children are taunting, one might even
say torturing, a small animal, using rocks and pointy sticks." CR>)>>

<OBJECT CAGES
	(LOC ZOO)
	(DESC "cages")
	(SYNONYM CAGE CAGES)
	(FLAGS NDESCBIT NARTICLEBIT PLURALBIT)
	(ACTION CAGES-F)>

<ROUTINE CAGES-F ()
	 <COND (<AND <EQUAL? ,SYEAR 2041 2051>
		     <EQUAL? ,HERE ,ZOO>>
		<TELL "There are no cages here; only natural habitats." CR>)
	       (<VERB? THROUGH>
		<TELL "The cages are all locked, of course." CR>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,SYEAR 2071>>
		<TELL "Several of the cages are empty." CR>)
	       (<VERB? LOOK-INSIDE>
		<COND (<EQUAL? ,SYEAR 2071>
		       <PERFORM ,V?EXAMINE ,CAGES>
		       <RTRUE>)
		      (T
		       <PERFORM ,V?EXAMINE ,ANIMAL>
		       <RTRUE>)>)
	       (<VERB? OPEN UNLOCK>
		<TELL
"Surely you realize that such an action would wreak civic havoc! Fortunately,
the cages are securely bolted." CR>)>>

<OBJECT ANIMAL
	(LOC LOCAL-GLOBALS)
	(DESC "animal")
	(SYNONYM ANIMAL ANIMALS APE APES MONKEY MONKEYS APE APES)
	(ADJECTIVE SMALL WHIMPERING VARIOUS WILD)
	(FLAGS VOWELBIT)
	(ACTION ANIMAL-F)>

<ROUTINE ANIMAL-F ()
	 <COND (<AND <EQUAL? ,HERE ,ROCKVIL-STADIUM>
		     <NOT <EQUAL? ,SYEAR 2071>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,ANIMAL>)
	       (<VERB? TOUCH>
		<TELL
"You can't get close enough to the animals to pet them." CR>)
	       (<VERB? FEED>
		<TELL
"You pick up a few stray bits of popcorn off the ground and toss it into
several of the cages. ">
		<COND (<EQUAL? ,SYEAR 2041 2051>
		       <TELL
"The animals look well fed, however, and ignore the popcorn." CR>)
		      (T
		       <TELL
"The animals, which look starved, greedily wolf down the pitifully
few kernels." CR>)>)
	       (<AND <VERB? GIVE>
		     <FSET? ,PRSO ,EATBIT>>
		<PERFORM ,V?FEED ,ANIMAL>
		<RTRUE>)
	       (<VERB? EXAMINE>
		<TELL "The animals look ">
		<COND (<EQUAL? ,SYEAR 2061>
		       <TELL "thin and hungry">)
		      (<EQUAL? ,SYEAR 2071>
		       <SCORE 69> ;"4 points"
		       <TELL "starved and beaten, particularly the apes">)
		      (T
                       <COND (<EQUAL? ,SYEAR 2061>
			      <TELL "reasonably">)
			     (T
			      <TELL "happy and">)>
		       <TELL " well-fed">)>
		<TELL "." CR>)>>

<OBJECT ZOO-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "zoo")
	(SYNONYM ZOO GARDEN)
	(ADJECTIVE ROCKVIL ZOOLOGICA MODERATEL SIZED)
	(ACTION ZOO-OBJECT-F)>

<ROUTINE ZOO-OBJECT-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,HERE ,ZOO>
		       <TELL ,LOOK-AROUND CR>)
		      (<EQUAL? ,HERE ,ZOO-ENTRANCE>
		       <DO-WALK ,P?SOUTH>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?WEST>)>)
	       (<VERB? DISEMBARK LEAVE>
		<COND (<EQUAL? ,HERE ,ZOO>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,ZOO>
		       <V-LOOK>)
		      (T
		       <FROM-HERE>)>)>>

<GLOBAL ZOO-FLAG <>>

<OBJECT BANNER
	(LOC LOCAL-GLOBALS)
	(DESC "banner")
	(LDESC
"A banner is stretched across the central walkway of the zoo.")
	(SYNONYM BANNER)
	(FLAGS READBIT)
	(ACTION BANNER-F)>

<ROUTINE BANNER-F ()
	 <COND (<VERB? READ EXAMINE>
		<SCORE 69> ;"4 points"
		<TELL
"\"Monkey Torturing -- 2:00pm Daily at the Monkey Cage\"" CR>)>>

<ROOM SKYCAR-LOT-4
      (LOC ROOMS)
      (DESC "Skycar Lot")
      (NORTH SORRY "There's a tall fence in the way.")
      (NE TO AQUARIUM-AND-PARK)
      (EAST PER AQUARIUM-ENTER-F)
      (SE PER HALLEY-PARK-EAST-ENTER-F)
      (SOUTH PER HALLEY-PARK-WEST-ENTER-F)
      (SW SORRY "There's a tall fence in the way.")
      (WEST TO ZOO)
      (NW SORRY "There's a tall fence in the way.")
      (FLAGS OUTSIDEBIT)
      (GLOBAL FENCE ZOO-OBJECT PARK-OBJECT CARLOT GATE AQUARIUM-OBJECT
       	      HALLEY-ESTATES-OBJECT)
      (ACTION SKYCAR-LOT-4-F)>

<ROUTINE SKYCAR-LOT-4-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "This is a huge parking lot for ">
		<COND (<NOT <EQUAL? ,SYEAR 2071>>
		       <TELL "Halley Park to the south and southeast, ">)>
		<TELL
"the Aquarium to the east and the zoo to the west. The exit to the
street is northeast">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL
". To the south and southeast are gates leading into ">
		       <PRINTD ,HALLEY-ESTATES-OBJECT>)>
		<TELL ".">)>>

<ROOM AQUARIUM-AND-PARK
      (LOC ROOMS)
      (DESC "Aquarium & Park")
      (NORTH TO RIVER-AND-PARK)
      (NE PER BURGER-MEISTER-ENTER-F)
      (EAST TO AQUARIUM-AND-KENNEDY)
      (SE PER AQUARIUM-ENTER-F)
      (SOUTH SORRY "The tunnel isn't for pedestrian traffic.")
      (SW TO SKYCAR-LOT-4)
      (WEST TO ZOO-ENTRANCE)
      (NW TO SERVICE-STATION)
      (FLAGS STREETBIT OUTSIDEBIT NARTICLEBIT)
      (GLOBAL TUNNEL RESTAURANT-OBJECT BAR-OBJECT CARLOT AQUARIUM-OBJECT
      	      SERVICE-STATION-OBJECT PEOPLE)
      (ACTION AQUARIUM-AND-PARK-F)>

<ROUTINE AQUARIUM-AND-PARK-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"South of this intersection, Park Street descends into a tunnel under ">
		<COND (<EQUAL? ,SYEAR 2071>
		       <SCORE 61> ;"2 points"
		       <TELL "the Halley Park estates">)
		      (T
		       <TELL "Halley Park">)>
		<TELL
". The Aquarium can be entered on the southeast corner, and a skycar service
center occupies the northwest corner. To the southwest is a large car lot, and
to the northeast, amidst a small car lot, is a ">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL "dingy-looking bar.">)
		      (T
		       <TELL "fast food restaurant.">)>)>>

<ROUTINE AQUARIUM-ENTER-F ()
	 <COND (<OR <AND <EQUAL? ,SYEAR 2041>
			 <G? ,STIME 600>
			 <L? ,STIME 1320>>
		    <AND <EQUAL? ,SYEAR 2051>
			 <G? ,STIME 600>
			 <L? ,STIME 1200>>
		    <AND <EQUAL? ,SYEAR 2061>
			 <G? ,STIME 660>
			 <L? ,STIME 1080>>
		    <AND <EQUAL? ,SYEAR 2071>
			 <G? ,STIME 720>
			 <L? ,STIME 1020>>>
		,AQUARIUM)
	       (T
		<CLOSED-PRINT "The Aquarium">
		<RFALSE>)>>

<OBJECT AQUARIUM-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "Aquarium")
	(SYNONYM AQUARIUM)
	(ACTION AQUARIUM-OBJECT-F)>

<ROUTINE AQUARIUM-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,HALLEY-PARK-EAST>
		       <DO-WALK ,P?NORTH>)
		      (<EQUAL? ,HERE ,SKYCAR-LOT-4>
		       <DO-WALK ,P?EAST>)
		      (<EQUAL? ,HERE ,AQUARIUM-AND-PARK>
		       <DO-WALK ,P?SE>)
		      (<EQUAL? ,HERE ,AQUARIUM-AND-KENNEDY>
		       <DO-WALK ,P?SW>)
		      (<GLOBAL-IN? ,AQUARIUM-OBJECT ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,AQUARIUM>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,AQUARIUM>>
		<V-LOOK>)
	       (<AND <VERB? SMELL>
		     <EQUAL? ,SYEAR 2071>
		     <EQUAL? ,HERE ,AQUARIUM>>
		<SCORE 137> ;"2 points"
		<TELL ,AQUARIUM-SMELL CR>)>>

<ROOM AQUARIUM
      (LOC ROOMS)
      (DESC "Aquarium")
      (NE TO AQUARIUM-AND-KENNEDY)
      (SOUTH PER HALLEY-PARK-EAST-ENTER-F)
      (WEST TO SKYCAR-LOT-4)
      (NW TO AQUARIUM-AND-PARK)
      (UP PER RAMP-MOVEMENT-F)
      (DOWN PER RAMP-MOVEMENT-F)
      (FLAGS ONBIT)
      (GLOBAL EXHIBITS PARK-OBJECT CARLOT WATER AQUARIUM-OBJECT)
      (ACTION AQUARIUM-F)>

<ROUTINE AQUARIUM-F (RARG "AUX" TIME)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"A ramp winds around a huge central tank, and smaller
exhibits fill the outside walls. Exits lead ">
		<COND (<NOT <EQUAL? ,SYEAR 2071>>
		       <TELL "south, ">)>
		<TELL "west, northwest, and northeast.">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL " " ,AQUARIUM-SMELL>)>)
	       (<EQUAL? .RARG ,M-END>
		<COND (<EQUAL? ,SYEAR 2041>
		       <SET TIME 1320>)
		      (<EQUAL? ,SYEAR 2051>
		       <SET TIME 1200>)
		      (<EQUAL? ,SYEAR 2061>
		       <SET TIME 1080>)
		      (T
		       <SET TIME 1020>)>
		<CLOSING-TIME
		 .TIME "the Aquarium" "a guard" ,AQUARIUM-AND-KENNEDY>)>>

<ROUTINE RAMP-MOVEMENT-F ()
	 <TELL
"This brings you to a different part of the tank, although the view inside
is pretty much the same." CR>
	 <RFALSE>>

<OBJECT TANK
	(LOC AQUARIUM)
	(DESC "tank")
	(SYNONYM TANK)
	(ADJECTIVE LARGE CENTRAL)
	(FLAGS NDESCBIT TRANSBIT)
	(ACTION TANK-F)>

<ROUTINE TANK-F ()
	 <COND (<VERB? LOOK-INSIDE>
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "The water is crystal clear, sparkling with ">
		       <COND (<G? ,LIGHT-LEVEL 2>
			      <TELL "sun">)
			     (T
			      <TELL "artificial ">)>
		       <TELL
"light from the surface of the water several stories above you.
As you peer into the tank, a ">
		       <COND (<PROB 25>
			      <TELL "manta ray">)
			     (<PROB 50>
			      <TELL "sea turtle">)
			     (T
			      <TELL "large, graceful fish">)>
		       <TELL
" swims into view and then vanishes among the rocks and greenery
at the bottom of the tank." CR>)
		      (T
		       <SCORE 71> ;"1 point"
		       <TELL
"The water is murky and the walls of the tank need cleaning. You can only
make out vague shapes moving about inside the tank." CR>)>)
	       (<AND <VERB? WASH>
		     <NOT <EQUAL? ,SYEAR 2041>>>
		<TELL "You don't have the access or the equipment." CR>)
	       (<VERB? THROUGH BOARD SWIM>
		<TELL "There's no visible entrance to the tank." CR>)>>

<OBJECT FISH
	(LOC AQUARIUM)
	(DESC "fish")
	(SYNONYM FISH)
	(ADJECTIVE LARGE GRACEFUL)
	(FLAGS NDESCBIT)
	(ACTION FISH-F)>

<ROUTINE FISH-F ()
	 <COND (<VERB? EXAMINE>
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "The fish are large and graceful." CR>)
		      (T
		       <TELL
"Although the central tank is too murky to see into, you can see some fish in
the smaller side exhibits. They are small and of average appearance." CR>)>)
	       (<VERB? EAT TOUCH>
		<TELL "The fish are inside a tank." CR>)>>

<OBJECT TURTLE
	(LOC LOCAL-GLOBALS)
	(DESC "turtle")
	(SYNONYM TURTLE)
	(ADJECTIVE SEA)
	(FLAGS NDESCBIT)>

<OBJECT MANTA-RAY
	(LOC LOCAL-GLOBALS)
	(DESC "manta ray")
	(SYNONYM RAY)
	(ADJECTIVE MANTA)
	(FLAGS NDESCBIT)>

<OBJECT RAMP
	(LOC AQUARIUM)
	(DESC "ramp")
	(SYNONYM RAMP)
	(FLAGS NDESCBIT)
	(ACTION RAMP-F)>

<ROUTINE RAMP-F ()
	 <COND (<VERB? CLIMB-UP CLIMB-FOO CLIMB-DOWN>
		<DO-WALK ,P?UP>)>>

<OBJECT SERVICE-STATION-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "service station")
	(SYNONYM STATION CENTER)
	(ADJECTIVE UNUSUALLY LARGE SKYCAR SERVICE)
	(ACTION SERVICE-STATION-OBJECT-F)>

<ROUTINE SERVICE-STATION-OBJECT-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,HERE ,AQUARIUM-AND-PARK>
		       <DO-WALK ,P?NW>)
		      (<GLOBAL-IN? ,SERVICE-STATION-OBJECT ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,SERVICE-STATION>
		       <DO-WALK ,P?SE>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,SERVICE-STATION>
		       <V-LOOK>)
		      (T
		       <TELL "The ">
		       <PRINTD ,SERVICE-STATION-OBJECT>
		       <TELL
" is unusually large, especially for one so close to the city." CR>)>)>>

<ROOM SERVICE-STATION
      (LOC ROOMS)
      (DESC "Service Station")
      (LDESC
"This is an unusually large skycar service center, where people can bring
their cars for a quick battery replacement, scheduled maintenance, or minor
repairs. The exit to the street is southeast.")
      (SE TO AQUARIUM-AND-PARK)
      (OUT TO AQUARIUM-AND-PARK)
      (FLAGS ONBIT)
      (GLOBAL SERVICE-STATION-OBJECT)>

<ROUTINE BURGER-MEISTER-ENTER-F ()
	 <COND (<AND <OR <G? ,STIME 1200>
			 <L? ,STIME 420>>
		     <NOT <EQUAL? ,SYEAR 2041>>>
		<OF-COURSE ,BURGER-MEISTER>
		<RFALSE>)
	       (T
		,BURGER-MEISTER)>>

<ROOM BURGER-MEISTER
      (LOC ROOMS)
      (SDESC "")
      (SW PER BURGER-MEISTER-EXIT-F)
      (OUT PER BURGER-MEISTER-EXIT-F)
      (FLAGS ONBIT)
      (GLOBAL RESTAURANT-OBJECT BAR-OBJECT COUNTER SMOKE GLOBAL-TABLE MENU
       	      PEOPLE)
      (ACTION BURGER-MEISTER-F)>

<ROUTINE BURGER-MEISTER-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<COND (<EQUAL? ,SYEAR 2071>
		       <PUTP ,BURGER-MEISTER ,P?SDESC "Bar">)
		      (<EQUAL? ,SYEAR 2061>
		       <PUTP ,BURGER-MEISTER ,P?SDESC "Burgerworld">)
		      (T
		       <PUTP ,BURGER-MEISTER ,P?SDESC "Burger Meister">)>
		<MOVE ,SPEAR-CARRIER ,HERE>
		<PUTP ,SPEAR-CARRIER ,P?SDESC "bartender">
		<MOVE ,BEER ,LOCAL-GLOBALS>
		<MOVE ,BAR-STOOL ,HERE>)
	       (<EQUAL? .RARG ,M-LOOK>
		<COND (<EQUAL? ,SYEAR 2071>
		       <SCORE 72> ;"1 point"
		       <TELL
"You are in a seedy pub, filled with smoke and smelling of urine. A fast-food
counter has been converted into the bar" ,STOOL-DESC "The exit is southwest.">)
		      (T
		       <TELL "This is a fast food restaurant serving ">
		       <FAST-FOOD-MENU>
		       <TELL
". Stools provide ample seating. The only way out is southwest.">)>)
	       (<EQUAL? .RARG ,M-END>
		<CURFEW-CLOSE ,AQUARIUM-AND-PARK>)>>

<ROUTINE BURGER-MEISTER-EXIT-F ()
	 <COND (<HELD? ,BEER>
		<TELL ,BARTENDER-YELLS CR>
		<RFALSE>)
	       (T
		,AQUARIUM-AND-PARK)>>

<ROOM ZOO-ENTRANCE
      (LOC ROOMS)
      (DESC "Zoo Entrance")
      (LDESC
"You are on Aquarium Drive, where a road branches off to the south into the
zoo. To the west, the Drive passes under the old interstate. North of here is
the entrance to a stadium skycar lot.")
      (NORTH TO STADIUM-LOT-A)
      (NE SORRY "There's no entrance to the stadium lot in that direction.")
      (EAST TO AQUARIUM-AND-PARK)
      (SE SORRY "There's no entrance to the zoo in that direction.")
      (SOUTH TO ZOO)
      (SW SORRY "There's no entrance to the zoo in that direction.")
      (WEST TO AQUARIUM-UNDERPASS)
      (NW SORRY "There's no entrance to the stadium lot in that direction.")
      (IN TO ZOO)
      (FLAGS STREETBIT OUTSIDEBIT)
      (GLOBAL HIGHWAY PEOPLE ZOO-OBJECT)
      (SCENE 100)
      (ACTION ZOO-ENTRANCE-F)>

<ROUTINE ZOO-ENTRANCE-F (RARG)
	 <COND (<AND <EQUAL? ,SYEAR 2061>
		     <EQUAL? .RARG ,M-END>
		     <EQUAL? ,LIGHT-LEVEL 3>
		     <L? <GETP ,ZOO-ENTRANCE ,P?SCENE> 101>>
		<PUTP ,ZOO-ENTRANCE ,P?SCENE 101>
		<SCORE 74> ;"2 points"
		<TELL CR
"Down the block, you can see two youths, wearing Church of God's Word
pendants, harassing a middle-aged Hassidic Jew." CR>)>>

<ROOM AQUARIUM-UNDERPASS
      (LOC ROOMS)
      (DESC "Aquarium Underpass")
      (LDESC
"You are on Aquarium Drive where it passes under the old elevated highway
that runs through the city. To the east is the north side of town, and to
the west are the suburbs.")
      (EAST TO ZOO-ENTRANCE)
      (WEST PER SUBURBS-ENTER-F)
      (FLAGS STREETBIT ONBIT)
      (GLOBAL HIGHWAY PEOPLE)>

<ROOM STADIUM-LOT-A
      (LOC ROOMS)
      (DESC "Stadium Lot A")
      (NORTH TO ROCKVIL-STADIUM)
      (NE SORRY "There's a tall fence in the way.")
      (EAST SORRY "There's a tall fence in the way.")
      (SE SORRY "There's a tall fence in the way.") 
      (SOUTH TO ZOO-ENTRANCE)
      (SW SORRY "There's a tall fence in the way.")
      (WEST SORRY "There's a tall fence in the way.")
      (NW SORRY "There's a tall fence in the way.")
      (FLAGS OUTSIDEBIT NARTICLEBIT)
      (GLOBAL FENCE STADIUM-OBJECT)
      (ACTION STADIUM-LOT-A-F)>

<ROUTINE STADIUM-LOT-A-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<STADIUM-LOT-DESC "north" "south">)>>

<ROUTINE STADIUM-LOT-DESC (IN-DIR OUT-DIR)
	 <TELL
"This is a parking lot for Rockvil Municipal Stadium, which can be entered
to the " .IN-DIR ". You can leave the lot to the " .OUT-DIR ".">>

<ROOM RIVER-AND-PARK
      (LOC ROOMS)
      (DESC "River & Park")
      (LDESC
"River Street, off to the east, ends here at Park Street, which curves from
the south to the northwest. A stadium skycar lot is on the west side of Park,
and some sort of athletic field is to the southeast. All along the north side
of River Street is a vast expanse of placid water, Rockvil Reservoir.")
      (NORTH SORRY "The reservoir is fenced off.")
      (NE SORRY "The reservoir is fenced off.")
      (EAST TO RIVER-AND-KENNEDY)
      (SE TO ATHLETIC-FIELD)
      (SOUTH TO AQUARIUM-AND-PARK)
      (SW SORRY "There's no entrance to the stadium lot in that direction.")
      (WEST TO STADIUM-LOT-B)
      (NW TO WATER-TOWER)
      (FLAGS STREETBIT OUTSIDEBIT NARTICLEBIT)
      (GLOBAL FENCE WATER RESERVOIR FIELD PEOPLE)>

<ROOM STADIUM-LOT-B
      (LOC ROOMS)
      (DESC "Stadium Lot B")
      (NORTH SORRY "There's a tall fence in the way.")
      (NE SORRY "There's a tall fence in the way.")
      (EAST TO RIVER-AND-PARK)
      (SE SORRY "There's a tall fence in the way.")
      (SOUTH SORRY "There's a tall fence in the way.")
      (SW SORRY "There's a tall fence in the way.")
      (WEST TO ROCKVIL-STADIUM)
      (NW SORRY "There's a tall fence in the way.")
      (FLAGS OUTSIDEBIT NARTICLEBIT)
      (GLOBAL FENCE STADIUM-OBJECT)
      (ACTION STADIUM-LOT-B-F)>

<ROUTINE STADIUM-LOT-B-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<STADIUM-LOT-DESC "west" "east">)>>

<ROOM WATER-TOWER
      (LOC ROOMS)
      (DESC "Water Tower")
      (NORTH TO ROCKVIL-REFORMATORY)
      (NE SORRY "The reservoir is fenced off.")
      (EAST SORRY "The reservoir is fenced off.")
      (SE TO RIVER-AND-PARK)
      (SOUTH SORRY "There's no entrance to the stadium lot in that direction.")
      (SW TO STADIUM-LOT-C)
      (WEST TO PARK-UNDERPASS)
      (NW SORRY "There's no entrance to the prison in that direction.")
      (FLAGS STREETBIT OUTSIDEBIT)
      (GLOBAL HIGHWAY FENCE WATER RESERVOIR JAIL-OBJECT CARLOT PEOPLE)
      (ACTION WATER-TOWER-F)>

<ROUTINE WATER-TOWER-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Park Street splits for a block as it climbs Lincoln Hill
and passes around a ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "shiny">)
		      (<EQUAL? ,SYEAR 2061>
		       <SCORE 130> ;"1 point"
		       <TELL "corroding">)
		      (<EQUAL? ,SYEAR 2071>
		       <SCORE 131> ;"2 points"
		       <TELL "decrepit">)>
		<TELL " plastalloy ">
		<PRINTD ,WATER-TOWER-OBJECT>
		<TELL
". The road continues to curve, heading west toward the highway and southeast
toward the city. There's a breathtaking view of the reservoir from this
hilltop, stretching off to the east. To the southwest you can enter a stadium
parking lot. To the north is the ">
		<PRINTD ,ROCKVIL-REFORMATORY>
		<TELL ".">)>>

<OBJECT WATER-TOWER-OBJECT
	(LOC WATER-TOWER)
	(DESC "water tower")
	(SYNONYM TOWER TANK)
	(ADJECTIVE WATER SHINY CORRODING DECREPIT PLASTALLO)
	(FLAGS NDESCBIT)
	(ACTION WATER-TOWER-OBJECT-F)>

<ROUTINE WATER-TOWER-OBJECT-F ()
	 <COND (<VERB? THROUGH>
		<TELL "There's no visible entrance to the tower." CR>)
	       (<VERB? CLIMB-FOO CLIMB-UP>
		<TELL "There's no way to scale the tower." CR>)>>

<ROOM ROCKVIL-REFORMATORY
      (LOC ROOMS)
      (DESC "Rockvil Reformatory")
      (IN SORRY "You can't enter the prison without a pass.")
      (NORTH SORRY "You can't enter the prison without a pass.")
      (OUT TO WATER-TOWER)
      (SOUTH TO WATER-TOWER)
      (FLAGS ONBIT)
      (GLOBAL JAIL-OBJECT)
      (ACTION ROCKVIL-REFORMATORY-F)>

<ROUTINE ROCKVIL-REFORMATORY-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"The Park Street Prison was built during the twentieth century. It was
expanded, modernized, and renamed the ">
		<PRINTD ,ROCKVIL-REFORMATORY>
		<TELL " around ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "ten">)
		      (<EQUAL? ,SYEAR 2051>
		       <TELL "twenty">)
		      (<EQUAL? ,SYEAR 2061>
		       <TELL "thirty">)
		      (T
		       <TELL "forty">)>
		<TELL " years ago. ">
		<PERFORM ,V?EXAMINE ,WALLS>
		<TELL CR "From what you've heard, the prison is ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL
"overcrowded, because today's stricter law enforcement and mandatory
sentencing regulations are putting people into the penal system even
faster than the military draft can remove them">)
		      (<EQUAL? ,SYEAR 2051>
		       <SCORE 75> ;"1 point"
		       <TELL
"unbelievably overcrowded, with brutally unsanitary conditions">)
		      (<EQUAL? ,SYEAR 2061>
		       <SCORE 76> ;"3 points"
		       <TELL
"much less crowded than it used to be, now that the death penalty has
been extended to cover most crimes">)
		      (<EQUAL? ,SYEAR 2071>
		       <SCORE 77> ;"4 points"
		       <TELL
"almost completely unused these days, with most criminals going to
the execution matches. The few remaining prisoners are just important
Enemies of the Church, former Members who have fallen out of favor
with the Leadership">)>
		<TELL ". Park Street is south of here.">)>>

<OBJECT JAIL-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "prison")
	(SYNONYM JAIL PRISON CELL CELLS REFORMATO)
	(ADJECTIVE ROCKVIL JAIL RIVER STREET EMPTY CROWDED)
	(ACTION JAIL-OBJECT-F)>

<ROUTINE JAIL-OBJECT-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,HERE ,WATER-TOWER ,ROCKVIL-REFORMATORY>
		       <DO-WALK ,P?NORTH>)
		      (<EQUAL? ,HERE ,POLICE-STATION>
		       <DO-WALK ,P?EAST>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? DISEMBARK LEAVE>
		<COND (<EQUAL? ,HERE ,WATER-TOWER ,POLICE-STATION>
		       <TELL ,LOOK-AROUND CR>)
		      (<EQUAL? ,HERE ,ROCKVIL-REFORMATORY>
		       <DO-WALK ,P?SOUTH>)
		      (T
		       <DO-WALK ,P?OUT>)>)
	       (<AND <VERB? LOOK-INSIDE EXAMINE>
		     <EQUAL?,HERE ,POLICE-STATION>>
		<COND (<EQUAL? ,SYEAR 2061>
		       <TELL
"You can't tell much about the cells from here." CR>)
		      (T
		       <TELL "From here, the jail cells look pretty ">
		       <COND (<EQUAL? ,SYEAR 2071>
			      <TELL "empty">)
			     (T
			      <TELL "crowded">)>
		       <TELL "." CR>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,JAIL-CELL ,ROCKVIL-REFORMATORY>
		       <V-LOOK>)
		      (T
		       <FROM-HERE>)>)>>

<ROOM STADIUM-LOT-C
      (LOC ROOMS)
      (DESC "Stadium Lot C")
      (NORTH SORRY "There's a tall fence in the way.")
      (NE TO WATER-TOWER)
      (EAST SORRY "There's a tall fence in the way.")
      (SE SORRY "There's a tall fence in the way.")
      (SOUTH SORRY "There's a tall fence in the way.")
      (SW TO ROCKVIL-STADIUM)
      (WEST SORRY "There's a tall fence in the way.")
      (NW SORRY "There's a tall fence in the way.")
      (FLAGS OUTSIDEBIT NARTICLEBIT)
      (GLOBAL FENCE STADIUM-OBJECT)
      (ACTION STADIUM-LOT-C-F)>

<ROUTINE STADIUM-LOT-C-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<STADIUM-LOT-DESC "southwest" "northeast">)>>

<ROOM ROCKVIL-STADIUM
      (LOC ROOMS)
      (DESC "Rockvil Stadium")
      (NE TO STADIUM-LOT-C)
      (EAST TO STADIUM-LOT-B)
      (SOUTH TO STADIUM-LOT-A)
      (DOWN PER TUBES-ENTER-F)
      (FLAGS OUTSIDEBIT NARTICLEBIT)
      (GLOBAL STAIRS ANIMAL STADIUM-OBJECT TUBE-STATION FIELD PEOPLE)
      (ACTION ROCKVIL-STADIUM-F)>

<ROUTINE ROCKVIL-STADIUM-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<FSET ,STADIUM-STANDS ,FURNITUREBIT>)
	       (<EQUAL? .RARG ,M-LOOK>
		<COND (<AND <EQUAL? ,SYEAR 2061 2071>
			    <OR <G? ,STIME 1200>
				<L? ,STIME 480>>>
		       <TELL "The stadium is dark and deserted">)
		      (<EQUAL? ,SYEAR 2071>
		       <SCORE 79> ;"8 points"
		       <TELL
"The stadium is currently packed by crowds who've come for the weekly
Execution Matches. Convicted criminals are matched, or rather mismatched,
against laser-armed robotoids and various wild animals. The mobs in the
stands roar each time a convict is gored. The field is literally soaked
with blood, and there are numerous fistfights throughout the stands">)
		      (<EQUAL? ,SYEAR 2061>
		       <SCORE 78> ;"4 points"
		       <TELL
"Neither the Bobcats nor the Rockets are playing today; instead, the
stadium is being used for the public execution of criminals. Prisoners
stand in a dock while the announcer reads their crimes. They are then
led into a screened-off area where technicians administer the fatal
injection. The stands are sparsely filled">) 
		      (T
		       <TELL
"Rockvil Municipal Stadium is a multipurpose sporting event facility, home
of both baseball's Rockvil Bobcats and soccer's Rockvil Rockets">)>
		<TELL
". Stadium exits lie to the south, east, and northeast. A ">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL "closed ">)>
	        <PRINTD ,TUBE-STATION>
		<TELL " lies directly under the stadium.">)>>

<OBJECT STADIUM-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "stadium")
	(SYNONYM STADIUM PARK FACILITY)
	(ADJECTIVE ROCKVIL MUNICIPAL MONOLITHIC PLASTICRETE DARK DESERTED
	 	   MULTI-PURPOSE MULTI PURPOSE PACKED SPORTING SPORTS EVENT)
	(ACTION STADIUM-OBJECT-F)>

<ROUTINE STADIUM-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,ROCKVIL-STADIUM>
		       <TELL ,LOOK-AROUND CR>)
		      (<EQUAL? ,HERE ,STADIUM-LOT-A>
		       <DO-WALK ,P?NORTH>)
		      (<EQUAL? ,HERE ,STADIUM-LOT-B>
		       <DO-WALK ,P?WEST>)
		      (<EQUAL? ,HERE ,STADIUM-LOT-C>
		       <DO-WALK ,P?SW>)
		      (<GLOBAL-IN? ,STADIUM-OBJECT ,HERE>
		       <DO-WALK ,P?NORTH>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,ROCKVIL-STADIUM>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,ROCKVIL-STADIUM>
		       <V-LOOK>)
		      (<EQUAL? ,HERE ,TUBE-AT-STADIUM>
		       <TELL "You can't see the stadium from down here!" CR>)
		      (T
		       <TELL
"The stadium is a monolithic plasticrete park with tall,
narrow, arched entrances." CR>)>)
	       (<AND <VERB? BOARD SIT>
		     <EQUAL? ,HERE ,ROCKVIL-STADIUM>>
		<PERFORM ,V?SIT ,STADIUM-STANDS>
		<RTRUE>)>>

<OBJECT STADIUM-STANDS
	(LOC ROCKVIL-STADIUM)
	(DESC "the stands")
	(SYNONYM STANDS SEAT SEATS DECK BLEACHERS BLEACHER)
	(ADJECTIVE BLEACHER UPPER LOWER STADIUM)
	(FLAGS VEHBIT FURNITUREBIT NARTICLEBIT PLURALBIT NDESCBIT)>

<ROOM PARK-UNDERPASS
      (LOC ROOMS)
      (DESC "Park Underpass")
      (LDESC
"At this point, the old, rarely-used interstate crosses over Park Street.
The northern suburbs lie to the west, and east of here the street climbs
a hill toward a water tower.")
      (EAST TO WATER-TOWER)
      (WEST PER SUBURBS-ENTER-F)
      (FLAGS STREETBIT ONBIT)
      (GLOBAL HIGHWAY PEOPLE)>

<ROOM ATHLETIC-FIELD
      (LOC ROOMS)
      (DESC "Athletic Field")
      (NORTH SORRY "There's no opening in the fence in that direction.")
      (NE TO RIVER-AND-KENNEDY)
      (EAST SORRY "There's no opening in the fence in that direction.")
      (SE SORRY "There's no opening in the fence in that direction.")
      (SOUTH SORRY "There's no opening in the fence in that direction.")
      (SW SORRY "There's no opening in the fence in that direction.")
      (WEST SORRY "There's no opening in the fence in that direction.")
      (NW TO RIVER-AND-PARK)
      (FLAGS OUTSIDEBIT)
      (GLOBAL FENCE CHILDREN FIELD PEOPLE)
      (ACTION ATHLETIC-FIELD-F)>

<ROUTINE ATHLETIC-FIELD-F (RARG)
	 <COND (<AND <EQUAL? .RARG ,M-ENTER>
		     <EQUAL? ,SYEAR 2061 2071>
		     <EQUAL? ,LIGHT-LEVEL 3>>
		<QUEUE I-ATHLETIC-FIELD 1>)
	       (<EQUAL? .RARG ,M-LOOK>
		<TELL "This is an outdoor athletic field for ">
		<COND (<EQUAL? ,SYEAR 2061 2071>
		       <TELL "the Vincent School">)
		      (T
		       <TELL "Rockvil High School">)>
		<TELL
", with facilities for baseball and soccer, as well as track and field
events. Bleachers line one side of the field, and there are exits in the
fence to the northeast and northwest.">)>>

<OBJECT BLEACHERS
	(LOC ATHLETIC-FIELD)
	(DESC "bleachers")
	(SYNONYM BLEACHER BLEACHERS)
	(FLAGS NDESCBIT VEHBIT FURNITUREBIT)>

<GLOBAL STONING-FLAG <>>

<OBJECT STONES
	(LOC LOCAL-GLOBALS)
	(DESC "stone")
	(SYNONYM STONE STONES ROCK ROCKS)
	(FLAGS NDESCBIT TAKEBIT)
	(ACTION STONES-F)>

<ROUTINE STONES-F ()
	 <COND (<VERB? TAKE>
		<MOVE ,STONES ,PLAYER>
		<TELL "You pick up a stone." CR>)>>

<ROUTINE I-ATHLETIC-FIELD ()
	 <COND (<NOT <EQUAL? ,HERE ,ATHLETIC-FIELD>>
		<SETG STONING-FLAG <>>
		<RFALSE>)
	       (<EQUAL? ,SYEAR 2061>
		<SCORE 80> ;"2 points"
		<TELL CR
"Some of the schoolchildren notice the stranger who has wandered onto
their field, and begin laughing at you, plucking at your ratty clothing." CR>)
	       (<AND <EQUAL? ,SYEAR 2071>
		     <NOT ,STONING-FLAG>>
		<SETG STONING-FLAG T>
		<QUEUE I-ATHLETIC-FIELD 1>
		<TELL CR
"Several of the larger children gather around you menacingly. \"We don't allow
animals onto Church land, pops,\" one of them says, poking you sharply in the
chest with his fingers. Some of the others begin picking up stones." CR>)
	       (T
		<SCORE 81> ;"7 points"
		<JIGS-UP
"|
A circle of older children closes in on you with heavy rocks. In the
background, you can hear younger ones chanting a familiar rhyme: \"Pick
an apple, bake a pie, animals deserve to die.\" For a moment, the entire
field seems frozen in a tableau, then a volley of stones is unleashed.
One strikes you in the forehead...">)>>

<ROOM RIVER-AND-KENNEDY
      (LOC ROOMS)
      (DESC "River & Kennedy")
      (NORTH SORRY "The reservoir is fenced off.")
      (NE SORRY "The reservoir is fenced off.")
      (EAST TO AIRPORTWAY-AND-RIVER)
      (SE PER ROCKVIL-HIGH-ENTER-F)
      (SOUTH TO AQUARIUM-AND-KENNEDY)
      (SW TO ATHLETIC-FIELD)
      (WEST TO RIVER-AND-PARK)
      (NW SORRY "The reservoir is fenced off.")
      (FLAGS STREETBIT OUTSIDEBIT NARTICLEBIT)
      (GLOBAL FENCE WATER RESERVOIR SCHOOL-OBJECT FIELD PEOPLE)
      (ACTION RIVER-AND-KENNEDY-F)>

<ROUTINE RIVER-AND-KENNEDY-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"River Street, after paralleling Kennedy Street across the city, curves
westward and intersects it here. Kennedy ends at this point, since the
reservoir forms the northern border of River Street. ">
		<COND (<EQUAL? ,SYEAR 2061 2071>
		       <TELL "The Vincent">)
		      (T
		       <TELL "Rockvil High">)>
		<TELL
" School is on the southeast corner, and its athletic field is
southwest of here.">)>>

<ROUTINE ROCKVIL-HIGH-ENTER-F ()
	 <COND (<OR <L? ,STIME 420>
		    <G? ,STIME 1020>>
		<CLOSED-PRINT "The school">
		<RFALSE>)
	       (T
		,ROCKVIL-HIGH)>>

<ROOM ROCKVIL-HIGH
      (LOC ROOMS)
      (SDESC "")
      (EAST TO AIRPORTWAY-AND-RIVER)
      (NW TO RIVER-AND-KENNEDY)
      (FLAGS NARTICLEBIT)
      (GLOBAL SCHOOL-OBJECT)
      (ACTION ROCKVIL-HIGH-F)>

<ROUTINE ROCKVIL-HIGH-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<COND (<EQUAL? ,SYEAR 2041 2051>
		       <PUTP ,ROCKVIL-HIGH ,P?SDESC "Rockvil High">)
		      (T
		       <PUTP ,ROCKVIL-HIGH ,P?SDESC "The Vincent School">)>)
	       (<EQUAL? .RARG ,M-LOOK>
		<COND (<EQUAL? ,SYEAR 2041 2051>
		       <TELL
"The oldest secondary school in the city, Rockvil High School moved to
its current location and building approximately ">
		       <COND (<EQUAL? ,SYEAR 2041>
		       	      <TELL "thirty">)
			     (T
			      <TELL "forty">)>
		       <TELL " years ago">)
		      (T
		       <SCORE 82> ;"5 points"
		       <TELL
"The old Rockvil High building was purchased by the Church of God's Word
after the public school system shut down in 2058">)>
		<TELL
". The building has exits at its eastern and northwestern corners.">)
	       (<EQUAL? .RARG ,M-END>
		<SHOP-CLOSES
		 1020 "school building" "A janitor" ,RIVER-AND-KENNEDY>)>>

<ROOM AQUARIUM-AND-KENNEDY
      (LOC ROOMS)
      (DESC "Aquarium & Kennedy")
      (NORTH TO RIVER-AND-KENNEDY)
      (NE PER OFFICE-BUILDING-ENTER-F)
      (EAST TO AQUARIUM-AND-RIVER)
      (SE TO DENTAL-SCHOOL)
      (SOUTH TO PARK-ENTRANCE)
      (SW PER AQUARIUM-ENTER-F)
      (WEST TO AQUARIUM-AND-PARK)
      (NW PER BANK-ENTER-F)
      (FLAGS STREETBIT OUTSIDEBIT NARTICLEBIT)
      (GLOBAL BANK-OBJECT SCHOOL-OBJECT AQUARIUM-OBJECT PEOPLE)
      (ACTION AQUARIUM-AND-KENNEDY-F)>

<ROUTINE AQUARIUM-AND-KENNEDY-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are at a perpendicular intersection formed by the north-south Kennedy
Street and the east-west Aquarium Drive. " ,CHUN-DESC " On the other corners,
scanning clockwise, are a dental school, the Aquarium, and a bank.">)>>

<OBJECT CHUN-BUILDING
	(LOC AQUARIUM-AND-KENNEDY)
	(DESC "office building")
	(SYNONYM BUILDING BLDG)
	(ADJECTIVE CHUN SMALL OFFICE)
	(FLAGS VOWELBIT NDESCBIT)
	(ACTION CHUN-BUILDING-F)>

<ROUTINE CHUN-BUILDING-F ()
	 <COND (<AND <VERB? WALK-TO THROUGH>
		     <IN? ,CHUN-BUILDING ,HERE>>
		<DO-WALK ,P?NE>)
	       (<VERB? EXAMINE>
		<TELL ,CHUN-DESC CR>)>>

<ROUTINE BANK-ENTER-F ()
	 <COND (<AND <G? ,STIME 480>
		     <L? ,STIME 960>>
		,BANK)
	       (T
		<CLOSED-PRINT "The bank">
		<RFALSE>)>>

<ROOM BANK
      (LOC ROOMS)
      (DESC "Bank")
      (SE TO AQUARIUM-AND-KENNEDY)
      (OUT TO AQUARIUM-AND-KENNEDY)
      (FLAGS ONBIT)
      (GLOBAL BANK-OBJECT)
      (ACTION BANK-F)>

<ROUTINE BANK-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<MOVE ,SPEAR-CARRIER ,HERE>
		<PUTP ,SPEAR-CARRIER ,P?SDESC "teller">)
	       (<EQUAL? .RARG M-LOOK>
		<TELL "This is the main office of the First Continent Bank, ">
		<COND (<EQUAL? ,SYEAR 2071>
		       <SCORE 83> ;"3 points"
		       <TELL "a Church holding and the only">)
		      (<EQUAL? ,SYEAR 2061>
		       <SCORE 84> ;"2 points"
		       <TELL "the only">)
		      (T
		       <TELL "the largest">)>
		<TELL " bank in Rockvil">
		<COND (<EQUAL? ,SYEAR 2061>
		       <TELL ", following last year's forced merger">)>
		<TELL
". The front door is on the southeast wall, opposite the tellers.">)
	       (<EQUAL? .RARG ,M-END>
		<SHOP-CLOSES 960 "bank" "A guard" ,AQUARIUM-AND-KENNEDY>)>>

<OBJECT BANK-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "bank")
	(SYNONYM BANK)
	(ADJECTIVE FIRST CONTINENT)
	(ACTION BANK-OBJECT-F)>

<ROUTINE BANK-OBJECT-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,HERE ,BANK>
		       <TELL ,LOOK-AROUND CR>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?NW>)>)
	       (<VERB? DISEMBARK LEAVE>
		<COND (<EQUAL? ,HERE ,BANK>
		       <DO-WALK ,P?SE>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,BANK>
		       <V-LOOK>)
		      (T
		       <TELL
"It's the main branch of the First Continent Bank." CR>)>)>>

<ROOM DENTAL-SCHOOL
      (LOC ROOMS)
      (DESC "Dental School")
      (NW TO AQUARIUM-AND-KENNEDY)
      (OUT TO AQUARIUM-AND-KENNEDY)
      (FLAGS ONBIT)
      (GLOBAL SCHOOL-OBJECT)
      (ACTION DENTAL-SCHOOL-F)>

<ROUTINE DENTAL-SCHOOL-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "The Mortimer ">
		<PRINTD ,DENTAL-SCHOOL>
		<TELL " is a fairly small">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL ", fairly new">)>
		<TELL " school">
		<COND (<EQUAL? ,SYEAR 2041 2051>
		       <TELL
", but has been gaining an excellent reputation for dental training">)
		      (<EQUAL? ,SYEAR 2071>
		       <TELL
" with a fine reputation, and has remained amazingly unchanged by the
turmoil of the last few decades">)>
		<TELL ". The way out is to the northwest.">)>>

<ROOM PARK-ENTRANCE
      (LOC ROOMS)
      (SDESC "")
      (NORTH TO AQUARIUM-AND-KENNEDY)
      (NE SORRY "There's no entrance to the lot in that direction.")
      (EAST TO SKYCAR-LOT-5)
      (SE SORRY "There's no entrance to the lot in that direction.")
      (SOUTH TO CENTRE-AND-KENNEDY)
      (SW PER NO-ENTRANCE-TO-PARK-F)
      (WEST PER HALLEY-PARK-EAST-ENTER-F)
      (NW PER NO-ENTRANCE-TO-PARK-F)
      (IN PER HALLEY-PARK-EAST-ENTER-F)
      (FLAGS STREETBIT OUTSIDEBIT)
      (GLOBAL PARK-OBJECT CARLOT GATE HALLEY-ESTATES-OBJECT PEOPLE)
      (ACTION PARK-ENTRANCE-F)>

<ROUTINE PARK-ENTRANCE-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<COND (<EQUAL? ,SYEAR 2071>
		       <PUTP ,PARK-ENTRANCE ,P?SDESC
			     		    "Entrance to Halley Estates">)
		      (T
		       <PUTP ,PARK-ENTRANCE ,P?SDESC "Park Entrance">)>)
	       (<EQUAL? .RARG ,M-LOOK>
		<TELL "You are on Kennedy Street near an entrance to ">
		<COND (<EQUAL? ,SYEAR 2071>
		       <SCORE 61> ;"2 points"
		       <TELL
"the estates for the wealthy, built on what was formerly ">)>
		<TELL 
"Halley Park, to the west. On the east side of the street is a large">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL ", abandoned">)>
		<TELL
" car lot. Kennedy continues to the north and south.">)>>

<OBJECT HALLEY-ESTATES-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "Halley Estates")
	(SYNONYM ESTATE ESTATES)
	(ADJECTIVE HALLEY WEALTHY AFFLUENT)
	(FLAGS NARTICLEBIT)
	(ACTION HALLEY-ESTATES-OBJECT-F)>

<ROUTINE HALLEY-ESTATES-OBJECT-F ()
	 <COND (<AND <NOT <EQUAL? ,SYEAR 2071>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,HALLEY-ESTATES-OBJECT>)
	       (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,PARK-ENTRANCE>
		       <DO-WALK ,P?WEST>)
		      (<EQUAL? ,HERE ,HALLEY-AND-PARK>
		       <DO-WALK ,P?NW>)
		      (<EQUAL? ,HERE ,HALLEY-AND-UNIVERSITY>
		       <DO-WALK ,P?NORTH>)
		      (<GLOBAL-IN? ,HALLEY-ESTATES-OBJECT ,HERE>
		       <DO-WALK ,P?SOUTH>)>)
	       (<VERB? LEAVE DISEMBARK>
		<TELL ,LOOK-AROUND CR>)
	       (<VERB? EXAMINE>
		<TELL
"You can't see over the high brick wall that surrounds the estates." CR>)>>

<ROOM SKYCAR-LOT-5
      (LOC ROOMS)
      (DESC "Skycar Lot")
      (NORTH TO FIRST-METHODIST-CHURCH)
      (NE SORRY "There's a tall fence in the way.")
      (EAST TO BODANSKI-SQUARE)
      (SE SORRY "There's a tall fence in the way.")
      (SOUTH SORRY "There's a tall fence in the way.")
      (SW SORRY "There's a tall fence in the way.")
      (WEST TO PARK-ENTRANCE)
      (NW SORRY "There's a tall fence in the way.")
      (FLAGS OUTSIDEBIT)
      (GLOBAL FENCE VACANT-LOT CARLOT CHURCH-OBJECT)
      (ACTION SKYCAR-LOT-5-F)>

<ROUTINE SKYCAR-LOT-5-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "This parking lot is ">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL
"unused, and weeds are beginning to poke through the asphalt. You can reach">)
		      (T
		       <TELL
"owned by the First Methodist Church, although it is frequently rented to
organizations using nearby Huang Hall. The parking lot has exits to">)>
		<TELL " the street to the east and west. ">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL "A vacant lot is north of here.">)
		      (T
		       <TELL "You can enter the church to the north.">)>)>>

<ROOM FIRST-METHODIST-CHURCH
      (LOC ROOMS)
      (SDESC "")
      (NE TO AQUARIUM-AND-RIVER)
      (OUT TO AQUARIUM-AND-RIVER)
      (SOUTH TO SKYCAR-LOT-5)
      (FLAGS ONBIT)
      (GLOBAL VACANT-LOT CARLOT CHURCH-OBJECT)
      (ACTION FIRST-METHODIST-CHURCH-F)>

<ROUTINE FIRST-METHODIST-CHURCH-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<MOVE ,CHURCH-OFFICIAL ,LOCAL-GLOBALS>
		<COND (<EQUAL? ,SYEAR 2071>
		       <PUTP ,FIRST-METHODIST-CHURCH ,P?SDESC "Vacant Lot">)
		      (T
		       <PUTP ,FIRST-METHODIST-CHURCH ,P?SDESC
			     	  "First Methodist Church">)>)
	       (<EQUAL? .RARG ,M-LOOK>
		<COND (<EQUAL? ,SYEAR 2071>
		       <SCORE 85> ;"3 points"
		       <TELL
"This is a vacant lot where a Protestant church once stood, until it was
torched a few years ago by a mob of serfs aroused by a Church revival. You can
reach an overgrown car lot to the south, or the street to the northeast.">)
		      (T
		       <COND (<EQUAL? ,SYEAR 2041>
			      <TELL "This is a new building which">)
			     (T
			      <TELL "This building">)>
		       <TELL
" exhibits both the best and worst features of twenty-first century
neoclassical architecture. The congregation must ">
		       <COND (<EQUAL? ,SYEAR 2061>
			      <TELL "have once been">)
			     (T
			      <TELL "be">)>
		       <TELL
" very large, judging by the size of the car lot to the south. The
main entrance to the church is at the northeast.">)>)
	       (<EQUAL? .RARG ,M-END>
		<ELDER-MOVE>)>>

<ROUTINE ELDER-MOVE ()
	 <COND (<AND <EQUAL? ,SYEAR 2041 2051>
		     <G? ,STIME 480>
		     <L? ,STIME 1200>
		     <NOT <FSET? ,CHURCH-OFFICIAL ,TOUCHBIT>>
		     <NOT <IN? ,CHURCH-OFFICIAL ,HERE>>>
		<MOVE ,CHURCH-OFFICIAL ,HERE>
		<TELL CR
"You suddenly notice a church elder, pacing around at the other
end of the building." CR>)
	       (<AND <IN? ,CHURCH-OFFICIAL ,HERE>
		     <G? ,STIME 1200>>
		<MOVE ,CHURCH-OFFICIAL ,LOCAL-GLOBALS>
		<TELL CR "The church official wanders off." CR>)>>

<OBJECT CHURCH-OFFICIAL
	(LOC LOCAL-GLOBALS)
	(DESC "church elder")
	(LDESC "A church elder is pacing back and forth nearby.")
	(SYNONYM OFFICIAL ELDER)
	(ADJECTIVE CHURCH)
	(FLAGS ACTORBIT)
	(GENERIC GENERIC-OFFICIAL-F)
	(ACTION CHURCH-OFFICIAL-F)>

<ROUTINE CHURCH-OFFICIAL-F ()
	 <COND (<OR <VERB? TELL>
		    <EQUAL? ,CHURCH-OFFICIAL ,WINNER>>
		<SETG PRSO ,CHURCH-OFFICIAL>
		<FSET ,CHURCH-OFFICIAL ,TOUCHBIT>
		<BRIEF-CHAT>
		<COND (<EQUAL? ,SYEAR 2041>
		       <COND (,RECORDING
		       	      <PUT ,RECORDING-TABLE 12 1>)>
		       <TELL
"smiles and comments on how happy he is about the recent increase in
church attendance, which he attributes to an improving national moral
climate" ,OFFICIAL-LEAVES CR>)
		      (T
		       <SCORE 136> ;"2 points"
		       <TELL
"looks worried and complains about the growth of the Church of God's Word,
and a perceived erosion of religious tolerance. Suddenly he notices the time,
mumbles something about a wedding, and rushes off." CR>)> 
		<CLEAR-BUF>)
	       ;(<AND <VERB? ASK-ABOUT>
		     <PRSO? ,CHURCH-OFFICIAL>>
		<PERFORM ,V?TELL ,PRSO>
		<RTRUE>)>>

<ROUTINE BRIEF-CHAT ()
	 <SETG ELAPSED-TIME 8>
	 <SETG FOLLOW-FLAG 9>
	 <QUEUE I-UNFOLLOW 10>
	 <MOVE ,PRSO ,LOCAL-GLOBALS>
	 <TELL "You have a brief chat with the ">
	 <PRINTD ,PRSO>
	 <TELL ", who ">>

<ROOM BODANSKI-SQUARE
      (LOC ROOMS)
      (DESC "Bodanski Square")
      (NORTH TO AQUARIUM-AND-RIVER)
      (NE PER SIMONS-ENTER-F)
      (EAST TO MUSEUM-ENTRANCE)
      (SE PER TRAIN-STATION-ENTER-F)
      (SOUTH TO MIDLAND-AND-RIVER)
      (SW TO CENTRE-AND-KENNEDY)
      (WEST TO SKYCAR-LOT-5)
      (NW SORRY "There's no entrance to the lot in that direction.")
      (DOWN PER TUBES-ENTER-F)
      (FLAGS STREETBIT OUTSIDEBIT NARTICLEBIT)
      (GLOBAL TRAIN-STATION-OBJECT STAIRS SLOT RESTAURANT-OBJECT CARLOT PEOPLE
       	      CHURCH-OBJECT TUBE-STATION)
      (ACTION BODANSKI-SQUARE-F)>

<ROUTINE BODANSKI-SQUARE-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is a large plaza formed by the intersection of Bodanski Boulevard from
the east, Centre Street from the southwest, and River Street from the north
and south. There is a">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL "n abandoned">)>
		<TELL
" car lot on the western side of the square. On the northeastern
corner is a restaurant, and the ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "old ">
		       <PRINTD ,TRAIN-STATION-OBJECT>)
		      (T
		       <TELL "Church of God's Word">)>
		<TELL " can be entered to the southeast. A ">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL
"sealed-off stairway indicates a former entrance to the Tubes.">)
		      (T
		       <TELL "covered stairway leads down to the Tubes.">)>)>>

<OBJECT LAMP-POST
	(LOC BODANSKI-SQUARE)
        (DESC "lamp post")
	(SYNONYM POST)
	(ADJECTIVE LAMP)
	(FLAGS NDESCBIT)
	(ACTION LAMP-POST-F)>

<ROUTINE LAMP-POST-F ()
	 <COND (<VERB? CLIMB-FOO CLIMB-UP>
		<TELL "The lamp post is too smooth to climb." CR>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,SYEAR 2041 2051>>
		<TELL "There's a ">
		<PRINTD ,NEWSPAPER-DISPENSER>
		<TELL " chained to it." CR>)>>

<OBJECT NEWSPAPER-DISPENSER
	(LOC LOCAL-GLOBALS)
	(DESC "newspaper dispenser")
	(LDESC
"There is a newspaper dispenser chained to a lamp post on the corner.")
	(SYNONYM DISPENSER BOX)
	(ADJECTIVE NEWSPAPER)
	(ACTION NEWSPAPER-DISPENSER-F)>

<ROUTINE NEWSPAPER-DISPENSER-F (RARG)
	 <COND (<VERB? EXAMINE>
		<TELL
"The box dispenses copies of The Rockie Times, a regional weekly newspaper">
		<COND (<EQUAL? ,SYEAR 2051>
		       <SCORE 86> ;"2 points"
		       <TELL
", and one of the last remaining newspapers in the country">)>
		<TELL
". There is a slot on top of the dispenser where you can insert your ">
		<PRINTD ,CREDIT-CARD>
		<TELL "." CR>)
	       (<VERB? OPEN>
		<TELL
"The dispenser is locked. The only way to get a paper out is by
putting your card in the slot." CR>)
	       (<AND <VERB? PUT>
		     <PRSO? ,CREDIT-CARD>>
		<PERFORM ,V?PUT ,CREDIT-CARD ,SLOT>
		<RTRUE>)>>

<OBJECT NEWSPAPER
	(LOC LOCAL-GLOBALS)
	(DESC "newspaper")
	(SYNONYM NEWSPAPER PAPER TIMES ARTICLE STORY SECTION)
	(ADJECTIVE NEWS ROCKIE HEADLINE NEWSPAPER)
	(FLAGS READBIT TAKEBIT TRYTAKEBIT NDESCBIT)
	(GENERIC GENERIC-NEWSPAPER-F)
	(ACTION NEWSPAPER-F)>

<ROUTINE NEWSPAPER-F ()
	 <COND (<AND <VERB? READ TAKE>
		     <FSET? ,NEWSPAPER ,TRYTAKEBIT>>
		<TELL "It's inside the dispenser!" CR>)
	       (<VERB? READ>
		<COND (<EQUAL? ,SYEAR 2041>
		       <COND (,RECORDING
			      <PUT ,RECORDING-TABLE 6 1>)>
		       <SETG ELAPSED-TIME 10>
		       <TELL
"The headline story in the news section is about the Index of Leading
Economic Indicators, which are up a stunning 9.7% over last month, yet
another indication of the economy's robust performance. Related stories
discuss the unemployment rate, which is at the lowest level in almost
thirty years, and commercial and housing construction, which are at an
all-time high.|
|
Another major story covers President Ryder's speech for the Distinguished
Lecturer Series of the Border Security Force Academy. In his address, the
President called the '40s a \"decade of new hope,\" and attributed much of
that new hope to the work of the BSF, sending a signal to the entire world
that the USNA \"won't be pushed around by the biggest dictatorship or the
smallest band of terrorist murderers.\"|
|
On one of the inside pages, an in-depth report on crime reveals that,
although the overall crime rate has dropped only 4% over the last decade,
public perception is that crime has fallen much further. The report
attributes this perception to three points: Violent crime has decreased
much faster than other types of crime, and is down by 15% from ten years
ago. Crime in the schools, which has always gotten the most publicity,
has dropped by 40%. Most importantly, offenders are getting harsher
sentences, as opposed to the old days of getting off on technicalities,
low bail, and easy parole.|
|
Other stories in the news section deal with the construction of a new InfoTech
orbiting factory, deregulation of the medicinal drug industry, the war in
Turkey, and plans for a lunar mining operation. An editorial calls for
lowering draft board requirements in order to ease prison overcrowding." CR>)
		      (<EQUAL? ,SYEAR 2051>
		       <SETG ELAPSED-TIME 5>
		       <SCORE 87> ;"3 points"
		       <TELL
"The newspaper is extremely thin, and the news section is the thinnest section
of all. The lead story deals with the drop in USNA farm output, the first drop
in twenty years. A spokesman for the Department of Agriculture attributed the
decline to a year of unseasonable cold and low rainfall, and predicted that the
coming year would more than make up for it. An alternative viewpoint was
expressed by the head of the American Association of Agribusiness, who claimed
the drop was caused by overfarming of lands, depletion of aquifers, and an
increase in acid rain, and called for a massive government program to save the
country's farms.|
|
Other stories cover the Ryder administration's support for a strip-mining bill;
the announcement by Huang Laboratories that without subsidized shuttle flights
it would be forced to close GEO-7, the last remaining space factory; committee
hearings on euthanasia legislation; the decision by a Church of God's Word
priest in Arizona to run for a Senate seat; and a poll showing President Ryder
enjoying a 71% approval rating." CR>)
		      (T ;"epilogue"
		       <TELL
"The headline story is about a newly released study which indicates that the
average life expectancy for both sexes has now passed one hundred years, and
success in the development of regeneratives should send that figure even
higher. Despite the dropping mortality rate, global population remains stable
at just under two billion, with offworlding now running at a staggering
seven million people annually.|
|
To celebrate next month's special twentieth anniversary Disarmament Day, the
World Council has passed a bill authorizing fireworks displays in each of the
former capital cities of the twenty-two former nuclear powers. The fireworks
displays, by Aerialist designer Jean M'gomo, will feature disarmament themes,
and will be the largest display of pyrotechnic art in this century.|
|
A story on an inside page catches your eye: \"Perry Simm, Noted Author, To
Join Crew of Silver Dove,\" reads the headline. \"Perry Simm, author and poet,
recipient of the 2089 Mexicana Prize, has been selected from nearly a thousand
applicants to be the resident author aboard the Silver Dove, the space
colony that is currently being equipped for mankind's first interstellar
journey, a trip expected to last a dozen generations.\"" CR>)>)
	       (<VERB? BUY>
		<COND (<AND <EQUAL? ,HERE ,BODANSKI-SQUARE>
			    <EQUAL? ,SYEAR 2041 2051>>
		       <COND (<FSET? ,NEWSPAPER ,TRYTAKEBIT>
			      <VENDING ,NEWSPAPER-DISPENSER ,NEWSPAPER 1>)
			     (T
			      <TELL
"A red empty light flashes for a second." CR>)>)
		      (<EQUAL? ,HERE ,DRUG-STORE>
		       <TELL "They seem to be sold out." CR>)
		      (T
		       <CANT-BUY ,NEWSPAPER>)>)
	       (<AND <VERB? PUT>
		     <PRSI? ,NEWSPAPER-DISPENSER>>
		<TELL
"You can't put the paper back into the dispenser!" CR>)>>

<ROUTINE SIMONS-ENTER-F ()
	 <COND (<AND <OR <G? ,STIME 1200>
			 <L? ,STIME 420>>
		     <NOT <EQUAL? ,SYEAR 2041>>>
		<OF-COURSE ,RESTAURANT-OBJECT>
		<RFALSE>)
	       (T
		,SIMONS)>>

<ROOM SIMONS
      (LOC ROOMS)
      (DESC "Simon's")
      (LDESC
"This expensive four-star restaurant is a favorite after-theatre dining
spot. You can leave to the southwest.")
      (SW TO BODANSKI-SQUARE)
      (OUT TO BODANSKI-SQUARE)
      (FLAGS NARTICLEBIT)
      (GLOBAL RESTAURANT-OBJECT MENU PEOPLE)
      (ACTION SIMONS-F)>

<ROUTINE SIMONS-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<SETG MEAL-STATUS 1>
		<SETG MAITRE-COUNTER 0>
		<SETG WAITER-COUNTER 0>
		<MOVE ,SPEAR-CARRIER ,HERE>
		<DISABLE <INT I-MEAL>>
		<MOVE ,RESTAURANT-TABLE ,HERE>
		<MOVE ,CHAIR ,HERE>
		<COND (<IN? ,CREDIT-CARD ,SPEAR-CARRIER>
		       <MOVE ,CREDIT-CARD ,LOCAL-GLOBALS>)>
		<PUTP ,SPEAR-CARRIER ,P?SDESC "maitre d'">)
	       (<EQUAL? .RARG ,M-END>
		<COND (<RESTAURANT-CLOSES ,BODANSKI-SQUARE>
		       <RTRUE>)
		      (<PARTY-OF-ONE>
		       <RTRUE>)>)>>

<ROOM AQUARIUM-AND-RIVER
      (LOC ROOMS)
      (DESC "Aquarium & River")
      (NORTH TO AIRPORTWAY-AND-RIVER)
      (NE SORRY "There's no entrance to the theatre in that direction.")
      (EAST TO PICKFORD-THEATRE)
      (SE SORRY "There's no entrance to the theatre in that direction.")
      (SOUTH TO BODANSKI-SQUARE)
      (SW TO FIRST-METHODIST-CHURCH)
      (WEST TO AQUARIUM-AND-KENNEDY)
      (NW TO WELLS-THEATRE)
      (FLAGS STREETBIT OUTSIDEBIT NARTICLEBIT)
      (GLOBAL VACANT-LOT CHURCH-OBJECT PICKFORD-THEATRE-OBJECT PEOPLE
       	      WELLS-THEATRE-OBJECT)
      (ACTION AQUARIUM-AND-RIVER-F)>

<ROUTINE AQUARIUM-AND-RIVER-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Aquarium Drive from the west ends at this \"T\" intersection with
River Street. There's a modern theatre building to the northwest, and
an older one to the east. On the southwest corner is a">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL "n empty lot.">)
		      (T
		       <TELL " church.">)>)>>

<OBJECT PICKFORD-THEATRE-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "Pickford Theatre")
	(SYNONYM THEATRE THEATER)
	(ADJECTIVE PICKFORD FINE OLD OLDER)
	(ACTION PICKFORD-THEATRE-OBJECT-F)>

<ROUTINE PICKFORD-THEATRE-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,PICKFORD-THEATRE>
		       <TELL ,NO-TICKET CR>)
		      (<GLOBAL-IN? ,PICKFORD-THEATRE-OBJECT ,HERE>
		       <DO-WALK ,P?EAST>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,PICKFORD-THEATRE>
		       <DO-WALK ,P?WEST>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,PICKFORD-THEATRE>
		       <V-LOOK>)
		      (T
		       <TELL "The Pickford is a fine, old theatre." CR>)>)>>

<ROOM PICKFORD-THEATRE
      (LOC ROOMS)
      (DESC "Pickford Theatre")
      (LDESC
"This building is the last survivor of the fine old theatres of Rockvil's
theatre district. The exit to River Street is to the west.")
      (WEST TO AQUARIUM-AND-RIVER)
      (OUT TO AQUARIUM-AND-RIVER)
      (FLAGS ONBIT)
      (GLOBAL PICKFORD-THEATRE-OBJECT PLAY)
      (ACTION PICKFORD-THEATRE-F)>

<GLOBAL BEGGAR-FLAG <>>

<ROUTINE PICKFORD-THEATRE-F (RARG)
	 <COND (<AND <EQUAL? .RARG ,M-END>
		     <EQUAL? ,SYEAR 2061 2071>
		     <G? ,STIME 1160>
		     <L? ,STIME 1200>>
		<TELL CR
"Skycar after skycar settles onto the sidewalk outside the theatre, and
extravagantly dressed couples walk elegantly into the theatre for the
evening's performance">
		<COND (<AND <EQUAL? ,SYEAR 2071>
		       	    <PROB 50>
			    <NOT ,BEGGAR-FLAG>>
		       <SETG BEGGAR-FLAG T>
		       <SCORE 57> ;"4 points"
		       <TELL
". A beggar approaches one of the wealthy couples, but before he can even get
close to them, some theatre guards grab him, beat him viciously, and hurl him
bleeding and dazed into the gutter outside the theatre">)>
		<TELL "." CR>)>>

<ROOM AIRPORTWAY-AND-RIVER
      (LOC ROOMS)
      (DESC "Airportway & River")
      (NORTH TO RIVER-AND-KENNEDY)
      (NE SORRY "There's no way to enter the base from here.")
      (EAST TO SYMPHONY-ENTRANCE)
      (SE TO COLONIAL-HOTEL)
      (SOUTH TO AQUARIUM-AND-RIVER)
      (SW TO WELLS-THEATRE)
      (WEST PER ROCKVIL-HIGH-ENTER-F)
      (NW SORRY "There's no entrance to the school in that direction.")
      (FLAGS STREETBIT OUTSIDEBIT NARTICLEBIT)
      (GLOBAL BSF-BASE FENCE WATER RESERVOIR HOTEL-OBJECT SCHOOL-OBJECT PEOPLE
       	      WELLS-THEATRE-OBJECT)
      (SCENE 34)
      (ACTION AIRPORTWAY-AND-RIVER-F)>

<ROUTINE AIRPORTWAY-AND-RIVER-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"The road east to the airport begins here. River Street continues north
toward the reservoir, curving around to run along its southern shore. A ">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL "Church">)
		      (<EQUAL? ,SYEAR 2061>
		       <TELL "Church of God's Word">)
		      (T
		       <TELL "high">)>
		<TELL
" school, a theatre, and a hotel can be entered to the west, southwest,
and southeast, respectively. To the northeast is the perimeter fence of
the Manville Border Security Force Base.">)
	       (<AND <EQUAL? .RARG ,M-END>
		     <EQUAL? ,SYEAR 2061>
		     <EQUAL? ,LIGHT-LEVEL 3>
		     <L? <GETP ,AIRPORTWAY-AND-RIVER ,P?SCENE> 101>>
		<COND (<PROB <GETP ,AIRPORTWAY-AND-RIVER ,P?SCENE>>
		       <PUTP ,AIRPORTWAY-AND-RIVER ,P?SCENE 101>
		       <SCORE 88> ;"3 points"
		       <TELL CR
"A huge private skycar glides to a stop at the curb, nearly crushing
an old woman. Several bodyguards leap out, and begin pushing the crowds
back. A heavyset woman wearing thick furs steps out of the car, which
rises and disappears from view. The woman, surrounded by her contingent
of bodyguards, enters the hotel." CR>)
		      (T
		       <PUTP ,AIRPORTWAY-AND-RIVER ,P?SCENE
			     <+ <GETP ,AIRPORTWAY-AND-RIVER ,P?SCENE> 33>>
		       <RFALSE>)>)>>

<OBJECT WELLS-THEATRE-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "Wells Theatre")
	(SYNONYM THEATRE THEATER)
	(ADJECTIVE WELLS MODERN WELL-MAINTAINED)
	(ACTION WELLS-THEATRE-OBJECT-F)>

<ROUTINE WELLS-THEATRE-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,AIRPORTWAY-AND-RIVER>
		       <DO-WALK ,P?SW>)
		      (<EQUAL? ,HERE ,AQUARIUM-AND-RIVER>
		       <DO-WALK ,P?NW>)
		      (<GLOBAL-IN? ,WELLS-THEATRE-OBJECT ,HERE>
		       <TELL ,NO-TICKET CR>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,WELLS-THEATRE>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,WELLS-THEATRE>
		       <V-LOOK>)
		      (T
		       <TELL "The Wells is a modern-looking theatre." CR>)>)>>

<ROOM WELLS-THEATRE
      (LOC ROOMS)
      (DESC "Wells Theatre")
      (NE TO AIRPORTWAY-AND-RIVER)
      (SE TO AQUARIUM-AND-RIVER)
      (FLAGS ONBIT)
      (GLOBAL WELLS-THEATRE-OBJECT PLAY)
      (ACTION WELLS-THEATRE-F)>

<ROUTINE WELLS-THEATRE-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "This is the lobby of a ">
		<COND (<EQUAL? ,SYEAR 2041 2051>
		       <TELL "modern">)
		      (T
		       <TELL "well-maintained">)>
		<TELL " theatre, built on the site of the original ">
		<PRINTD ,WELLS-THEATRE>
		<TELL
", which dates to the middle of the last century. According to a showcase,
the current season includes productions of ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL
"Shakespeare's \"Hamlet,\" Williams' \"A Streetcar Named Desire,\" Furrough's
\"Plastic Summer,\" and the classic musical \"Hair.\"">)
		      (<EQUAL? ,SYEAR 2051>
		       <TELL
"Wilder's \"Our Town,\" Shakespeare's \"A Midsummer Night's Dream,\" Rodgers
and Hammerstein's \"Oklahoma\", and Grzenda and Rice's \"Prairie Song.\"">)
		      (<EQUAL? ,SYEAR 2061>
		       <TELL
"Hilbert's \"Faith of our Fathers,\" Kim's \"Furs, Trees, and Beef,\" and
Shaw's \"Man and Superman.\"">)
		      (T
		       <SCORE 89> ;"2 points"
		       <TELL "several recent ecumenical plays.">)>
		<TELL
" The theatre has exits to the northeast and southeast.">)>>

<ROOM MUSEUM-ENTRANCE
      (LOC ROOMS)
      (DESC "Museum Entrance")
      (NORTH TO SKYCAR-LOT-6)
      (NE SORRY "There's no entrance to the lot in that direction.")
      (EAST PER RIVERSIDE-PARK-ENTER-F)
      (SE SORRY "There's no entrance to the museum in that direction.")
      (SOUTH PER RAILROAD-MUSEUM-ENTER-F)
      (SW SORRY "There's no entrance to the museum in that direction.")
      (WEST TO BODANSKI-SQUARE)
      (NW PER CINEMA-ENTER-F)
      (IN PER RAILROAD-MUSEUM-ENTER-F)
      (FLAGS STREETBIT OUTSIDEBIT)
      (GLOBAL GLOBAL-SIGN MUSEUM-OBJECT MOVIE-THEATRE-OBJECT PEOPLE
       	      PARK-OBJECT CARLOT)
      (SCENE 100)
      (ACTION MUSEUM-ENTRANCE-F)>

<ROUTINE MUSEUM-ENTRANCE-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Standing on the south side of Bodanski Boulevard is the ">
		<COND (<EQUAL? ,SYEAR 2061 2071>
		       <SCORE 90> ;"1 point"
		       <TELL "boarded-up ">)>
		<PRINTD ,RAILROAD-MUSEUM>
		<TELL
". The street runs east toward the park and west toward the square. North of
here is a car lot and to the northwest is a huge cinema complex.">)
	       (<AND <EQUAL? .RARG ,M-END>
		     <EQUAL? ,SYEAR 2061>
		     <EQUAL? ,LIGHT-LEVEL 3>
		     <EQUAL? <GETP ,MUSEUM-ENTRANCE ,P?SCENE> 100>>
		<PUTP ,MUSEUM-ENTRANCE ,P?SCENE 101>
		<SCORE 91> ;"5 points"
		<TELL CR
"Two policemen across the street are savagely beating a dark-skinned youth.
A hot dog peddler catches their attention, and as they begin buying some
food the youth slinks away." CR>)>>

<ROOM SKYCAR-LOT-6
      (LOC ROOMS)
      (DESC "Skycar Lot")
      (NORTH PER SYMPHONY-HALL-ENTER-F)
      (NE SORRY "There's a tall fence in the way.")
      (EAST PER RIVERSIDE-PARK-ENTER-F)
      (SE SORRY "There's a tall fence in the way.")
      (SOUTH TO MUSEUM-ENTRANCE)
      (SW SORRY "There's a tall fence in the way.")
      (WEST PER CINEMA-ENTER-F)
      (NW SORRY "There's a tall fence in the way.")
      (FLAGS OUTSIDEBIT)
      (GLOBAL GLOBAL-SIGN FENCE MOVIE-THEATRE-OBJECT PARK-OBJECT CARLOT
       	      SYMPHONY-HALL-OBJECT UNOPENABLE-DOOR)
      (ACTION SKYCAR-LOT-6-F)>

<ROUTINE SKYCAR-LOT-6-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "This is a large lot ">
		<COND (<EQUAL? ,SYEAR 2041 2051>
		       <TELL
"for the cinema to the west, the park to the east, the symphony to
the north, and the museum across the street to the south.">)
		      (<EQUAL? ,SYEAR 2061>
		       <TELL
"for the park to the east, the symphony to the north, and
the cinema to the west.">)
		      (T
		       <TELL
"for the park to the east and the cinema to the west, although the sort
of people who would attend that sort of cinema are hardly the sort of
people who could afford to own skycars.">)>)>>

<ROUTINE RAILROAD-MUSEUM-ENTER-F ()
	 <COND (<EQUAL? ,SYEAR 2041 2051>
		<COND (<AND <G? ,STIME 615>
			    <L? ,STIME 1185>>
		       ,RAILROAD-MUSEUM)
		      (T
		       <CLOSED-PRINT "The museum">
		       <RFALSE>)>)
	       (T
		<SCORE 90> ;"1 point"
		<TELL ,BOARDED-OVER>
		<COND (<EQUAL? ,SYEAR 2061>
		       <TELL " A yellowed sign under the boards reads ">
		       <PERFORM ,V?READ ,GLOBAL-SIGN>)
		      (T
		       <CRLF>)>
		<RFALSE>)>>

<ROOM RAILROAD-MUSEUM
      (LOC ROOMS)
      (DESC "Railroad Museum")
      (NORTH TO MUSEUM-ENTRANCE)
      (OUT TO MUSEUM-ENTRANCE)
      (EAST PER RIVERSIDE-PARK-ENTER-F)
      (FLAGS ONBIT)
      (GLOBAL GLOBAL-WINDOW MUSEUM-OBJECT RAILROAD-YARD EXHIBITS PARK-OBJECT
	      PEOPLE)
      (ACTION RAILROAD-MUSEUM-F)>

<ROUTINE RAILROAD-MUSEUM-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "This museum is devoted to ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL
"the old North Central Railroad Station around the corner,
and more generally to ">)>
		<TELL
"the entire history of rail travel. Through huge glass windows on the southern
wall of the entrance lobby you can see the old ">
		<PRINTD ,RAILROAD-YARD>
		<TELL
"s behind the station. The street is to the north and
another exit leads east.">)
	       (<EQUAL? .RARG ,M-END>
		<CLOSING-TIME 1185 "the museum" "a guard" ,MUSEUM-ENTRANCE>)>>

<OBJECT RAILROAD-YARD
	(LOC LOCAL-GLOBALS)
	(DESC "railroad yard")
	(SYNONYM YARD YARDS)
	(ADJECTIVE OLD ABANDONED RAILROAD)
	(ACTION RAILROAD-YARD-F)>

<ROUTINE RAILROAD-YARD-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,HERE ,MIDLAND-AND-CHURCH>
		       <DO-WALK ,P?NORTH>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?SOUTH>)>)
	       (<VERB? DISEMBARK LEAVE>
		<TELL ,LOOK-AROUND CR>)>>

<ROUTINE RIVERSIDE-PARK-ENTER-F ()
	 <COND (<EQUAL? ,SYEAR 2071>
		<SCORE 92> ;"2 points"
		<TELL
"As you enter the park, a guard stops you, staring with barely concealed
repugnance. \"Admission to the park is restricted,\" he says, twisting your
arm as he pushes you out of the park." CR>
		<RFALSE>)
	       (T
		,RIVERSIDE-PARK)>>

<ROOM RIVERSIDE-PARK
      (LOC ROOMS)
      (DESC "Riverside Park")
      (LDESC
"This is the city's most popular park. From the hilltop is a beautiful
view of the river as it bends off to the east. Paths to various exits
lead north, northwest, west, and southwest.")
      (NORTH PER SYMPHONY-HALL-ENTER-F)
      (NE PER RIVER-ENTER-F)
      (EAST PER RIVER-ENTER-F)
      (SE PER RIVER-ENTER-F)
      (SOUTH SORRY
       "A fence separates the park from the railroad yard to the south.")
      (SW PER RAILROAD-MUSEUM-ENTER-F)
      (WEST TO MUSEUM-ENTRANCE)
      (NW TO SKYCAR-LOT-6)
      (FLAGS OUTSIDEBIT PARKBIT NARTICLEBIT)
      (GLOBAL RAILROAD-YARD FENCE RIVER RIVER-BANK WATER PARK-OBJECT CARLOT
              GLOBAL-SIGN MUSEUM-OBJECT SYMPHONY-HALL-OBJECT PEOPLE)>

<ROUTINE CINEMA-ENTER-F ()
	 <COND (<AND <OR <G? ,STIME 1200>
			 <L? ,STIME 420>>
		     <NOT <EQUAL? ,SYEAR 2041>>>
		<OF-COURSE ,MOVIE-THEATRE-OBJECT>
		<RFALSE>)
	       (T
		,CINEMA)>>

<ROOM CINEMA
      (LOC ROOMS)
      (DESC "Cinema")
      (NORTH TO SKYCAR-LOT-7)
      (EAST TO SKYCAR-LOT-6)
      (SE TO MUSEUM-ENTRANCE)
      (IN PER THEATRE-ENTER-F)
      (FLAGS ONBIT)
      (GLOBAL SLOT MOVIE-THEATRE-OBJECT CARLOT HALLWAY PEOPLE)
      (ACTION CINEMA-F)>

<ROUTINE CINEMA-F (RARG)
	 <COND (<AND <EQUAL? .RARG ,M-ENTER>
		     <FSET? ,TICKET ,NDESCBIT>>
		<MOVE ,TICKET ,HERE>)
	       (<EQUAL? .RARG ,M-LOOK>
		<TELL "The Downtown Cinema Quad is a ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "modern, ">)
		      (<EQUAL? ,SYEAR 2061 2071>
		       <TELL "seedy, ">)>
		<TELL "four-theatre movie complex">
		<COND (<EQUAL? ,SYEAR 2041 2051>
		       <TELL
" with all the latest holographic and personalized stereo technology">)
		      (<EQUAL? ,SYEAR 2071>
		       <SCORE 128> ;"1 point"
		       <TELL
". The carpeting is dirty and torn, and the air is rank with a
mixture of putrid odors">)>
		<TELL 
". A marquee above the ticket \"window\" announces the current features. A
hallway leads in to the theatres, and there are exits north and east to car
lots, and southeast to the street.">)
	       (<EQUAL? .RARG ,M-END>
		<CURFEW-CLOSE ,MUSEUM-ENTRANCE>)>>

<ROUTINE THEATRE-ENTER-F ()
	 <COND (<HELD? ,TICKET>
		<MOVE ,TICKET ,CINEMA>
		<FSET ,TICKET ,TRYTAKEBIT>
		<FSET ,TICKET ,NDESCBIT>
		<FCLEAR ,TICKET ,TOUCHBIT>
		<SETG ELAPSED-TIME 15>
		<COND (,RECORDING
		       <PUT ,RECORDING-TABLE 14 1>)>
		<TELL 
"The usher takes your ticket and you step into the darkened theatre and find
an empty seat.|
|
Movie Theatre|
You begin watching ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL
"\"Upbeat Patrol II,\" which is funny and fast-moving like the prequel,
but seems to lack some of the originality and freshness. The soundtrack,
locations, and special effects are all top notch. A">)
		      (<EQUAL? ,SYEAR 2051>
		       <SCORE 93> ;"1 point"
		       <TELL
"\"Manure Marauders,\" but it's so insipid that a">)
		      (<EQUAL? ,SYEAR 2061>
		       <SCORE 94> ;"2 points"
		       <TELL
"\"More of Anything,\" and you quickly find yourself being aroused by
the skillfully filmed and edited sex scenes. Then, during a slow moment,
you begin to feel ashamed and guilty, and a">)
		      (T
		       <SCORE 95> ;"3 points"
		       <TELL
"an untitled hatefilm, preceded by a five minute Church propaganda short.
Most of the audience is much younger; many are still in their teens. When
they begin chanting in rhythm with the mobs on the screen, you begin to
feel very uncomfortable. A">)>
		<TELL
"fter about fifteen minutes, you decide you've seen enough, and head out to
the lobby." CR>)
	       (T
		<TELL ,NO-TICKET CR>)>
	 <RFALSE>>

<OBJECT MOVIE-THEATRE-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "movie theatre")
	(SYNONYM THEATER THEATRE CINEMA COMPLEX)
	(ADJECTIVE MOVIE DOWNTOWN QUAD HUGE FOUR-THEATRE)
	(ACTION MOVIE-THEATRE-OBJECT-F)>

<ROUTINE MOVIE-THEATRE-OBJECT-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,HERE ,MUSEUM-ENTRANCE>
		       <DO-WALK ,P?NW>)
		      (<EQUAL? ,HERE ,CINEMA>
		       <DO-WALK ,P?IN>)
		      (<EQUAL? ,HERE ,SKYCAR-LOT-7>
		       <DO-WALK ,P?SOUTH>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?WEST>)>)
	       (<VERB? DISEMBARK LEAVE>
		<COND (<EQUAL? ,HERE ,CINEMA>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,CINEMA>
		       <V-LOOK>)
		      (T
		       <TELL "The ">
		       <PRINTD ,MOVIE-THEATRE-OBJECT>
		       <TELL " is a large four-plex." CR>)>)
	       (<AND <VERB? SMELL>
		     <EQUAL? ,HERE ,CINEMA>
		     <EQUAL? ,SYEAR 2071>>
		<TELL "An unidentifiable, putrid odor hangs in the air." CR>)>>

<OBJECT MOVIE
	(LOC GLOBAL-OBJECTS)
	(DESC "movie")
	(SYNONYM MOVIE FILM)
	(ACTION MOVIE-F)>

<ROUTINE MOVIE-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<GLOBAL-IN? ,MOVIE-THEATRE-OBJECT ,HERE>
		       <PERFORM ,V?WALK-TO ,MOVIE-THEATRE-OBJECT>
		       <RTRUE>)
		      (T
		       <V-WALK-AROUND>)>)
	       (<VERB? EXAMINE>
		<COND (<GLOBAL-IN? ,MOVIE-THEATRE-OBJECT ,HERE>
		       <PERFORM ,V?WALK-TO ,MOVIE-THEATRE-OBJECT>
		       <RTRUE>)
		      (T
		       <TELL "You can't watch a movie here!" CR>)>)>>

<OBJECT MARQUEE
	(LOC CINEMA)
	(DESC "marquee")
	(SYNONYM MARQUEE)
	(FLAGS NDESCBIT READBIT)
	(ACTION MARQUEE-F)>

<ROUTINE MARQUEE-F ()
	 <COND (<VERB? READ>
		<TELL
"According to the marquee, the current features of the Cinema are ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL
"an action-romance entitled \"Let's Get Going,\" a comedy called
\"Paulette,\" the sequel to last year's Best Picture, \"Upbeat Patrol II,\"
and \"Freefall,\" a Korean film. " CR>)
		      (<EQUAL? ,SYEAR 2051>
		       <SCORE 93> ;"1 point"
		       <TELL
"\"Manure Marauders,\" a long-running comedy, a horror-thriller called
\"Not Until I Scream,\" and the sixth and seventh films in the popular
Foreign Raiders series." CR>)
		      (<EQUAL? ,SYEAR 2061>
		       <SCORE 94> ;"2 points"
		       <TELL
"a slasher-comedy named \"Gutsplosion,\" a lustfilm called \"More of
Anything,\" \"Gringo Wars,\" a cheap action film, and \"Let's Kill Some
Slants,\" a hatefilm being billed as a \"rousing killer comedy frolic.\"" CR>)
		      (T
		       <SCORE 95> ;"3 points"
		       <TELL
"two hatefilms, a lustfilm called \"Wild and Woolly,\" and a Church
propaganda piece called \"Triumph of Man.\"" CR>)>)>>

<OBJECT TICKET-SELLER
	(LOC CINEMA)
	(DESC "ticket seller")
	(SYNONYM SELLER DISPENSER WINDOW WINDOWS)
	(ADJECTIVE TICKET)
	(FLAGS NDESCBIT)
	(ACTION TICKET-SELLER-F)>

<ROUTINE TICKET-SELLER-F ()
	 <COND (<VERB? EXAMINE>
		<TELL "The ">
		<PRINTD ,TICKET-SELLER>
		<TELL
" is often called a ticket window, an anachronistic term from the last century
when tickets were sold by humans sitting in glass booths. This typical ">
		<PRINTD ,TICKET-SELLER>
		<TELL " has a slot for your ">
		<PRINTD ,CREDIT-CARD>
		<TELL "." CR>)>>

<OBJECT TICKET
	(LOC LOCAL-GLOBALS)
	(DESC "ticket")
	(SYNONYM TICKET PASS)
	(ADJECTIVE BOARDING)
	(SIZE 1)
	(FLAGS TAKEBIT TRYTAKEBIT NDESCBIT)
	(ACTION TICKET-F)>

<ROUTINE TICKET-F ()
	 <COND (<VERB? BUY>
		<COND (<EQUAL? ,HERE ,CINEMA>
		       <COND (<FSET? ,TICKET ,NDESCBIT>
			      <VENDING ,TICKET-SELLER ,TICKET 15>)
			     (T
		       	      <TELL "You already did." CR>)>)
		      (<AND <EQUAL? ,HERE ,TRAIN-STATION>
			    <EQUAL? ,SYEAR 2041>>
		       <TELL
"You discover that all the rides are sold out for the rest of the day." CR>)
		      (<EQUAL? ,HERE ,WELLS-THEATRE ,PICKFORD-THEATRE>
		       <TELL
"You discover that the current season is already sold out." CR>)
		      (<EQUAL? ,HERE ,SKYBUS-TERMINAL ,TERMINAL>
		       <TELL "You have no reason to leave the city!" CR>)
		      (T
		       <CANT-BUY ,TICKET>)>)
	       (<AND <VERB? TAKE>
		     <FSET? ,TICKET ,TRYTAKEBIT>>
		<PERFORM ,V?BUY ,TICKET>
		<RTRUE>)
	       (<VERB? READ EXAMINE>
		<TELL "**Admit One**">
		<PRINT-SPACES 18>
		<TELL "No." N <+ <RANDOM 899> 100> N <+ <RANDOM 8999> 1000> CR>
		<PRINT-SPACES 10>
		<TELL "Downtown Cinema Quad" CR>
		<PRINT-SPACES 10>
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL " \"Upbeat Patrol II\"">)
		      (<EQUAL? ,SYEAR 2051>
		       <TELL " \"Manure Marauders\"">)
		      (<EQUAL? ,SYEAR 2061>
		       <TELL " \"More of Anything\"">)
		      (T
		       <TELL "hatefilm number 8722">)>
		<TELL CR
"Not refundable or exchangable. Management|
reserves the right to refuse admission by|
refunding the price of this ticket." CR>)>>

<ROOM COLONIAL-HOTEL
      (LOC ROOMS)
      (DESC "Colonial Hotel")
      (LDESC
"This old hotel features many of the architectural luxuries rarely seen
nowadays, most notably the huge, multistory atrium. There are exits leading
northwest and east.")
      (NW TO AIRPORTWAY-AND-RIVER)
      (EAST TO SKYCAR-LOT-7)
      (FLAGS ONBIT)
      (GLOBAL CARLOT HOTEL-OBJECT)>

<OBJECT ATRIUM
	(LOC COLONIAL-HOTEL)
	(DESC "atrium")
	(SYNONYM ATRIUM)
	(ADJECTIVE TREMENDOU HUGE MULTI STORY MULTI-STORY)
	(FLAGS VOWELBIT NDESCBIT)
	(ACTION ATRIUM-F)>

<ROUTINE ATRIUM-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The atrium is tremendous, rising through the center of the hotel,
ending at roof level with a wide skylight." CR>)>>

<OBJECT SKYLIGHT
	(LOC COLONIAL-HOTEL)
	(DESC "skylight")
	(SYNONYM SKYLIGHT)
	(ADJECTIVE WIDE)
	(FLAGS NDESCBIT TRANSBIT)
	(ACTION SKYLIGHT-F)>

<ROUTINE SKYLIGHT-F ()
	 <COND (<VERB? LOOK-INSIDE>
		<COND (<EQUAL? ,LIGHT-LEVEL 0>
		       <TELL
"Because it is dark outside, the lights in the atrium prevent you from
seeing through the skylight." CR>)
		      (T
		       <TELL "You see the sky." CR>)>)>>

<ROOM SKYCAR-LOT-7
      (LOC ROOMS)
      (DESC "Skycar Lot")
      (LDESC
"You are in a parking lot with entrances to buildings to the east, west and
south. The exit to the street is northeast.")
      (NORTH SORRY "There's a tall fence in the way.")
      (NE TO SYMPHONY-ENTRANCE)
      (EAST PER SYMPHONY-HALL-ENTER-F)
      (SE SORRY "There's a tall fence in the way.")
      (SOUTH PER CINEMA-ENTER-F)
      (SW SORRY "There's a tall fence in the way.")
      (WEST TO COLONIAL-HOTEL)
      (NW SORRY "There's a tall fence in the way.")
      (FLAGS OUTSIDEBIT)
      (GLOBAL GLOBAL-SIGN FENCE MOVIE-THEATRE-OBJECT CARLOT HOTEL-OBJECT
       	      SYMPHONY-HALL-OBJECT UNOPENABLE-DOOR)>

<OBJECT SYMPHONY-HALL-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "Symphony Hall")
	(SYNONYM HALL SYMPHONY)
	(ADJECTIVE SYMPHONY ORNATE)
	(ACTION SYMPHONY-HALL-F)>

<ROUTINE SYMPHONY-HALL-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,SYMPHONY-HALL>
		       <TELL ,LOOK-AROUND CR>)
		      (<EQUAL? ,HERE ,SYMPHONY-ENTRANCE>
		       <DO-WALK ,P?SOUTH>)
		      (<EQUAL? ,HERE ,SKYCAR-LOT-7>
		       <DO-WALK ,P?EAST>)
		      (<GLOBAL-IN? ,SYMPHONY-HALL-OBJECT ,HERE>
		       <DO-WALK ,P?NORTH>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,SYMPHONY-HALL>
		       <DO-WALK ,P?NORTH>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,SYMPHONY-HALL>
		       <V-LOOK>)
		      (T
		       <PRINTD ,SYMPHONY-HALL>
		       <TELL " is an ornate building">
		       <COND (<EQUAL? ,SYEAR 2071>
			      <TELL ", closed for several years">)>
		       <TELL "." CR>)>)>>

<ROOM SYMPHONY-HALL
      (LOC ROOMS)
      (DESC "Symphony Hall")
      (LDESC
"This is the home of the Rockvil Symphony Orchestra. An exterior balcony
offers a fine view of the river to the east. There are exits to the southeast,
south, west, and north.")
      (NORTH TO SYMPHONY-ENTRANCE)
      (SE PER RIVERSIDE-PARK-ENTER-F)
      (SOUTH TO SKYCAR-LOT-6)
      (WEST TO SKYCAR-LOT-7)
      (FLAGS NARTICLEBIT)
      (GLOBAL WATER RIVER RIVER-BANK PARK-OBJECT CARLOT SYMPHONY-HALL-OBJECT)>

<ROUTINE SYMPHONY-HALL-ENTER-F ()
	 <COND (<EQUAL? ,SYEAR 2071>
		<SCORE 96> ;"2 points"
		<COND (<EQUAL? ,HERE ,RIVERSIDE-PARK>
		       <PRINTD ,SYMPHONY-HALL>
		       <TELL " has been closed for several years now." CR>)
		      (T
		       <TELL
"A faded sign on the boarded up doors reads " ,SYMPHONY-CLOSED CR>)>
		<RFALSE>)
	       (T
		,SYMPHONY-HALL)>>

<ROOM SYMPHONY-ENTRANCE
      (LOC ROOMS)
      (DESC "Symphony Entrance")
      (LDESC
"Airportway curves northeast along the river toward the airport, and a road
leads north into the military base. On the south side of the street is
Symphony Hall, and next to it is a car lot.")
      (NORTH TO BASE-GATE)
      (NE TO AIRPORT-ENTRANCE)
      (EAST PER RIVER-ENTER-F)
      (SE SORRY "There's no entrance into Symphony Hall in that direction.")
      (SOUTH PER SYMPHONY-HALL-ENTER-F)
      (SW TO SKYCAR-LOT-7)
      (WEST TO AIRPORTWAY-AND-RIVER)
      (NW SORRY "There's no entrance to the base in that direction.")
      (IN PER SYMPHONY-HALL-ENTER-F)
      (FLAGS STREETBIT OUTSIDEBIT)
      (GLOBAL BSF-BASE GLOBAL-SIGN WATER RIVER CARLOT SYMPHONY-HALL-OBJECT
       	      RIVER-BANK UNOPENABLE-DOOR PEOPLE)>

<ROOM BASE-GATE
      (LOC ROOMS)
      (DESC "Base Gate")
      (LDESC
"This is the entrance gate to the Manville Border Security Force Base. The
base road continues northwest into the base and southeast away from it.")
      (NORTH SORRY "The road is surrounded on all sides by a high fence.")
      (NE SORRY "The road is surrounded on all sides by a high fence.")
      (EAST SORRY "The road is surrounded on all sides by a high fence.")
      (SE TO SYMPHONY-ENTRANCE)
      (SOUTH SORRY "The road is surrounded on all sides by a high fence.")
      (SW SORRY "The road is surrounded on all sides by a high fence.")
      (WEST SORRY "The road is surrounded on all sides by a high fence.")
      (NW PER BASE-GATE-ENTER-F)
      (FLAGS OUTSIDEBIT STREETBIT)
      (GLOBAL BSF-BASE FENCE GATE GUN)
      (ACTION BASE-GATE-F)>

<ROUTINE BASE-GATE-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<MOVE ,SPEAR-CARRIER ,HERE>
		<PUTP ,SPEAR-CARRIER ,P?SDESC "guard">)>>

<ROUTINE BASE-GATE-ENTER-F ()
	 <TELL "The gate is closed. A guard">
	 <COND (<EQUAL? ,SYEAR 2041>
		<TELL " politely">)
	       (<EQUAL? ,SYEAR 2051>
		<TELL " brusquely">)
	       (<EQUAL? ,SYEAR 2061>
		<SCORE 97> ;"1 point"
		<TELL " threateningly">)
	       (T
		<SCORE 98> ;"2 points"
		<TELL
", jabbing you painfully with the point of his weapon,">)>
	 <TELL
" informs you that nonmilitary personnel are not
allowed beyond this point." CR>
	 <RFALSE>>

<OBJECT BSF-BASE
	(LOC LOCAL-GLOBALS)
	(DESC "BSF base")
	(SYNONYM BASE MONUMENT)
	(ADJECTIVE MANVILLE BORDER SECURITY FORCE BSF MILITARY SOBERING)
	(GENERIC GENERIC-GUARD-F) ;"confusion with BSF GUARD"
	(ACTION BSF-BASE-F)>

<ROUTINE BSF-BASE-F ()
	 <COND (<EQUAL? ,HERE ,SKYCAB>
		<COND (<VERB? EXAMINE>
		       <TELL "The base has been turned into a museum." CR>)
		      (T
		       <MILE-AWAY ,BSF-BASE>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,BASE-GATE>
		       <DO-WALK ,P?SE>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,BASE-GATE>
		       <DO-WALK ,P?NW>)
		      (<EQUAL? ,HERE ,SYMPHONY-ENTRANCE>
		       <DO-WALK ,P?NORTH>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?NE>)>)
	       (<VERB? EXAMINE>
		<TELL
"You can't see much through the perimeter fence." CR>)>>

<ROOM AIRPORT-ENTRANCE
      (LOC ROOMS)
      (DESC "Airport Entrance")
      (LDESC
"Airportway ends here in a huge loop past the terminal buildings of Rockvil
International Airport. The main terminal building can be entered to the
north, and the road leads southwest back toward the city.")
      (NORTH TO TERMINAL)
      (NE SORRY "There's no entrance to the terminal in that direction.")
      (EAST SORRY "There's no entrance to the terminal in that direction.")
      (SE SORRY "There's no entrance to the terminal in that direction.")
      (SOUTH SORRY "There's no entrance to the terminal in that direction.")
      (SW TO SYMPHONY-ENTRANCE)
      (WEST SORRY "There's no entrance to the terminal in that direction.")
      (NW SORRY "There's no entrance to the terminal in that direction.")
      (IN TO TERMINAL)
      (FLAGS STREETBIT OUTSIDEBIT)
      (GLOBAL AIRPORT-TERMINAL-OBJECT PEOPLE)>

<ROOM TERMINAL
      (LOC ROOMS)
      (DESC "Terminal")
      (NORTH PER SPACEPORT-ENTER-F)
      (EAST SORRY "You can't get into the gate area without a boarding pass.")
      (SOUTH TO AIRPORT-ENTRANCE)
      (DOWN PER TUBES-ENTER-F)
      (FLAGS ONBIT)
      (SCENE 34)
      (GLOBAL STAIRS AIRPORT-TERMINAL-OBJECT GUN TUBE-STATION PEOPLE)
      (ACTION TERMINAL-F)>

<ROUTINE TERMINAL-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"The main terminal building has an exit to Airportway on the south. The ">
		<PRINTD ,AIRPORT-GATE>
		<TELL "s are east of here, ">
		<COND (<EQUAL? ,SYEAR 2041 2051>
		       <TELL "and the ">
		       <PRINTD ,SPACEPORT-GATE>
		       <TELL "s lie to the north">)
		      (T
		       <SCORE 99> ;"3 point"
		       <TELL
"and to the north are the shuttered gates of the once thriving spaceport">)>
		<TELL ". There is a large red sign over the gates, and ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "a couple of BSF guards stand beneath it">)
		      (T
		       <TELL "BSF guards are everywhere">)>
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL
". Plastiboards seal off a stairway leading down.">)
		      (T
		       <TELL ". Stairs lead down to a ">
		       <PRINTD ,TUBE-STATION>
		       <TELL ".">)>)
	       (<AND <EQUAL? .RARG ,M-END>
		     <EQUAL? ,SYEAR 2071>
		     <L? <GETP ,TERMINAL ,P?SCENE> 101>>
		<COND (<PROB <GETP ,TERMINAL ,P?SCENE>>
		       <PUTP ,TERMINAL ,P?SCENE 101>
		       <SCORE 100> ;"5 points"
		       <TELL CR
"Nearby, a man with an Asian complexion is walking past a pair of BSF guards,
and one of their Belt Rad-Detectors clicks. In the wink of an eye, four guns
are pointed at the man, who looks terrified and begins to run. As the guns
explode, people all around are screaming and throwing themselves on the ground;
the Asian's mutilated body lies sprawled in the middle of the terminal. |
|
A guard cautiously approaches the dead man with a Rad-Detector. He scans
the body until he finds the source of the signal. \"Just a nuke-powered
wristwatch,\" he laughs, waving the other guards over. \"Can you imagine
the gook being dumb enough to wear one of them near a border point?\" They
shake their heads in disbelief as they drag the body away." CR>)
		      (T
		       <PUTP ,TERMINAL ,P?SCENE
			     <+ <GETP ,TERMINAL ,P?SCENE> 33>>
		       <RFALSE>)>)>>

<ROUTINE SPACEPORT-ENTER-F ()
	 <COND (<EQUAL? ,SYEAR 2041 2051>
		<TELL
"You can't get into the gate area without a boarding pass." CR>)
	       (T
		<TELL "The ">
		<PRINTD ,SPACEPORT-GATE>
		<TELL "s are closed and boarded over." CR>)>
	 <RFALSE>>

<OBJECT SPACEPORT
	(LOC TERMINAL)
	(DESC "spaceport")
	(SYNONYM SPACEPORT)
	(ADJECTIVE ONCE THRIVING ONCE-THRIVING)
	(FLAGS NDESCBIT)
	(ACTION SPACEPORT-F)>

<ROUTINE SPACEPORT-F ()
	 <COND (<AND <VERB? WALK-TO THROUGH>
		     <EQUAL? ,HERE ,TERMINAL>>
		<DO-WALK ,P?NORTH>)>>

<OBJECT AIRPORT-GATE
	(LOC TERMINAL)
	(DESC "airport gate")
	(SYNONYM GATE GATES)
	(ADJECTIVE AIRPORT)
	(FLAGS NDESCBIT VOWELBIT)
	(ACTION AIRPORT-GATE-F)>

<ROUTINE AIRPORT-GATE-F ()
	 <COND (<VERB? OPEN>
		<TELL "The gates are open!" CR>)
	       (<VERB? CLOSE>
		<TELL "You can't and wouldn't be allowed to if you could." CR>)
	       (<VERB? THROUGH>
		<DO-WALK ,P?EAST>)
	       (<VERB? EXAMINE>
		<TELL "The gates are patrolled by BSF guards." CR>)>>

<OBJECT SPACEPORT-GATE
	(LOC TERMINAL)
	(DESC "spaceport gate")
	(SYNONYM GATE GATES)
	(ADJECTIVE SPACEPORT)
	(FLAGS NDESCBIT)
	(ACTION SPACEPORT-GATE-F)>

<ROUTINE SPACEPORT-GATE-F ()
	 <COND (<VERB? OPEN>
		<COND (<EQUAL? ,SYEAR 2041 2051>
		       <TELL "The gates are open!" CR>)
		      (T
		       <TELL
"You'd need a full-scale construction crew to re-open these gates!" CR>)>)
	       (<VERB? CLOSE>
		<COND (<EQUAL? ,SYEAR 2041 2051>
		       <PERFORM ,V?CLOSE ,AIRPORT-GATE>
		       <RTRUE>)
		      (T
		       <TELL "The gates are closed!" CR>)>)
	       (<VERB? THROUGH>
		<DO-WALK ,P?NORTH>)
	       (<VERB? EXAMINE>
		<TELL "The ">
		<PRINTD ,SPACEPORT-GATE>
		<TELL "s are ">
		<COND (<EQUAL? ,SYEAR 2041 2051>
		       <TELL "open">)
		      (T
		       <TELL "sealed up">)>
		<TELL "." CR>)>>

<OBJECT AIRPORT-TERMINAL-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "terminal")
	(SYNONYM TERMINAL AIRPORT)
        (ADJECTIVE AIRPORT)
	(ACTION AIRPORT-TERMINAL-OBJECT-F)>

<ROUTINE AIRPORT-TERMINAL-OBJECT-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,HERE ,TERMINAL>
		       <TELL ,LOOK-AROUND CR>)
		      (<EQUAL? ,HERE ,AIRPORT-ENTRANCE>
		       <DO-WALK ,P?NORTH>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?UP>)>)
	       (<VERB? DISEMBARK LEAVE>
		<COND (<EQUAL? ,HERE ,TERMINAL>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,TERMINAL>
		       <V-LOOK>)
		      (T
		       <FROM-HERE>)>)>>

<OBJECT BSF-GUARDS
	(LOC TERMINAL)
	(DESC "BSF guard")
	(SYNONYM GUARD GUARDS)
	(ADJECTIVE BSF BORDER SECURITY FORCE)
	(FLAGS NDESCBIT ACTORBIT)
	(GENERIC GENERIC-GUARD-F)
	(ACTION BSF-GUARDS-F)>

<ROUTINE BSF-GUARDS-F ()
	 <COND (<EQUAL? ,WINNER ,BSF-GUARDS ,NATIONAL-GUARDSMAN>
		<TELL "The guard ignores you." CR>
		<CLEAR-BUF>)>>

<OBJECT AIRPORT-SIGN
	(LOC TERMINAL)
	(DESC "red sign")
	(SYNONYM SIGN)
	(ADJECTIVE RED)
	(FLAGS NDESCBIT READBIT)
	(ACTION AIRPORT-SIGN-F)>

<ROUTINE AIRPORT-SIGN-F ()
	 <COND (<VERB? READ>
		<COND (<EQUAL? ,SYEAR 2041 2051>
		       <CRLF>
		       <PRINT-SPACES 20>
		       <TELL "Remember! Our security procedures" CR>
		       <PRINT-SPACES 29>
		       <TELL "exist to protect" CR>
		       <PRINT-SPACES 20>
		       <ITALICIZE "your">
		       <TELL " country and ">
		       <ITALICIZE "your">
		       <TELL " way of life" CR>)
		      (T
		       <SCORE 101> ;"2 points"
		       <CRLF>
		       <PRINT-SPACES 24>
		       <TELL "All international travellers" CR>
		       <PRINT-SPACES 23>
		       <TELL "must pass through strip-search" CR>
		       <PRINT-SPACES 30>
		       <ITALICIZE "no exceptions!">
		       <CRLF>)>)>>

<ROUTINE NO-ENTRY-TO-HEIMAN-WORLD-F ()
	  <TELL "There's no ">
	  <COND (<EQUAL? ,SYEAR 2041>
		 <TELL "opening in the perimeter fence there." CR>)
		(T
		 <TELL "entry into ">
		 <PRINTD ,HEIMAN-WORLD-OBJECT>
		 <TELL " in that direction." CR>)>
	  <RFALSE>>

<ROOM BEND
      (LOC ROOMS)
      (DESC "Bend")
      (NORTH TO SOUTHWAY-AND-RIVER)
      (NE TO CONSTRUCTION-SITE-2)
      (EAST PER NO-ENTRY-TO-HEIMAN-WORLD-F)
      (SE TO WICKER-AND-RIVER)
      (SOUTH PER HARDWARE-STORE-ENTER-F)
      (SW PER DRUG-STORE-ENTER-F)
      (WEST TO LAUNDROMAT)
      (NW SORRY "There's no entrance into the row houses from here.")
      (FLAGS STREETBIT OUTSIDEBIT)
      (GLOBAL PEOPLE RAILROAD-BRIDGE CONSTRUCTION-OBJECT DRUG-STORE-OBJECT
       	      FENCE HARDWARE-STORE-OBJECT HEIMAN-WORLD-OBJECT RAILROAD-TRACKS)
      (ACTION BEND-F)>

<ROUTINE BEND-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"River Street curves here, heading downtown to the north and under an old ">
		<PRINTD ,RAILROAD-BRIDGE>
		<TELL " to the southeast. To the northeast is an ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "opening in a tall fence">)
		      (T
		       <TELL "entrance to a massive indoor city">)>
		<TELL
". A row of stores round the curve on the other side of the street:
a laundromat to the west, a pharmacy to the southwest, and a hardware
store to the south.">)>>

<ROOM LAUNDROMAT
      (LOC ROOMS)
      (DESC "Laundromat")
      (LDESC
"This laundromat is equipped with a vibramat as well as the traditional
washers and dryers. The exit is east.")
      (EAST TO BEND)
      (OUT TO BEND)
      (FLAGS ONBIT)>

<OBJECT WASHERS
	(LOC LAUNDROMAT)
	(DESC "washers")
	(SYNONYM WASHER WASHERS)
	(ADJECTIVE TRADITION CLOTHES)
	(FLAGS NDESCBIT NARTICLEBIT PLURALBIT)
	(ACTION LAUNDROMAT-OBJECT-F)>

<OBJECT DRYERS
	(LOC LAUNDROMAT)
	(DESC "dryers")
	(SYNONYM DRYER DRYERS)
	(ADJECTIVE TRADITION CLOTHES)
	(FLAGS NDESCBIT NARTICLEBIT PLURALBIT)
	(ACTION LAUNDROMAT-OBJECT-F)>

<OBJECT VIBRAMAT
	(LOC LAUNDROMAT)
	(DESC "vibramat")
	(SYNONYM VIBRAMAT)
	(FLAGS NDESCBIT)
	(ACTION LAUNDROMAT-OBJECT-F)>

<ROUTINE LAUNDROMAT-OBJECT-F ()
	 <COND (<VERB? OPEN ON>
		<TELL "But you don't have any dirty clothes!" CR>)
	       (<AND <VERB? PUT>
		     <PRSI? ,VIBRAMAT ,WASHERS>>
		<PERFORM ,V?WASH ,PRSO>
		<RTRUE>)
	       (<AND <VERB? PUT>
		     <PRSI? ,DRYERS>>
		<TELL "But">
		<ARTICLE ,PRSO T>
		<TELL " isn't wet!" CR>)>>

<OBJECT DRUG-STORE-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "drug store")
	(SYNONYM STORE STORES SHOP SHOPS PHARMACY)
	(ADJECTIVE DRUG)
	(ACTION DRUG-STORE-OBJECT-F)>

<ROUTINE DRUG-STORE-OBJECT-F ()
	 <COND (<VERB? DISEMBARK LEAVE>
		<COND (<EQUAL? ,HERE ,DRUG-STORE>
		       <DO-WALK ,P?NE>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,HERE ,DRUG-STORE>
		       <TELL ,LOOK-AROUND CR>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?SW>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,DRUG-STORE>>
		<V-LOOK>)>>

<ROUTINE DRUG-STORE-ENTER-F ()
	 <COND (<AND <G? ,STIME 480>
		     <L? ,STIME 1305>>
		,DRUG-STORE)
	       (T
		<CLOSED-PRINT "The drug store">
		<RFALSE>)>>

<ROOM DRUG-STORE
      (LOC ROOMS)
      (DESC "Drug Store")
      (LDESC
"This is one of those \"pharmacies\" that sells everything from milkshakes
to magazines. There is a door leading northeast. A clerk waits nearby.")
      (NE TO BEND)
      (OUT TO BEND)
      (FLAGS ONBIT)
      (GLOBAL DRUG-STORE-OBJECT COUNTER PEOPLE)
      (ACTION DRUG-STORE-F)>

<ROUTINE DRUG-STORE-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<MOVE ,SPEAR-CARRIER ,HERE>
		<PUTP ,SPEAR-CARRIER ,P?SDESC "clerk">)
	       (<EQUAL? .RARG ,M-END>
		<SHOP-CLOSES 1305 "drug store" "A clerk" ,BEND>)>>

<OBJECT MAGAZINE
	(LOC DRUG-STORE)
	(DESC "magazine")
	(SYNONYM MAGAZINE MAGAZINES MAG MAGS PUBLICATI PERIODICA ARTICLE)
	(ADJECTIVE MAGAZINE)
	(FLAGS NDESCBIT READBIT TRYTAKEBIT)
	(ACTION MAGAZINE-F)>

<ROUTINE MAGAZINE-F ()
	 <COND (<AND <EQUAL? ,HERE ,SKYCAB>
		     <VERB? TAKE READ EXAMINE>>
		<TELL "Jill is reading it!" CR>)
	       (<VERB? BUY TAKE READ EXAMINE>
		<COND (<EQUAL? ,HERE ,DRUG-STORE>
		       <TELL
"You peruse the rack, but there's nothing that interests you." CR>)
		      (T
		       <TELL
"There aren't any magazines for sale here!" CR>)>)>>

<OBJECT MILKSHAKE
	(LOC DRUG-STORE)
	(DESC "milkshake")
	(SYNONYM MILKSHAKE FRAPPE SODA SHAKE FLOAT CREAM)
	(ADJECTIVE MILK ICE CREAM)
	(GENERIC GENERIC-SODA-F)
	(FLAGS NDESCBIT)
	(ACTION MILKSHAKE-F)>

<ROUTINE MILKSHAKE-F ()
	 <COND (<VERB? BUY TAKE>
		<COND (<EQUAL? ,HERE ,DRUG-STORE>
		       <TELL
"You approach the ice cream counter, but it's pretty crowded, so
you decide against it." CR>)
		      (T
		       <TELL "You can't get a milkshake here!" CR>)>)
	       (<VERB? EXAMINE>
		<TELL "It's sold at the ice cream counter." CR>)>>

<OBJECT DRUGS
	(LOC DRUG-STORE)
	(DESC "drugs")
	(SYNONYM DRUG DRUGS PILL PILLS PHARMACEU MEDICINE MEDICINES)
	(FLAGS NDESCBIT PLURALBIT NARTICLEBIT)
	(ACTION DRUGS-F)>

<ROUTINE DRUGS-F ()
	 <COND (<VERB? BUY>
		<COND (<EQUAL? ,HERE ,DRUG-STORE>
		       <TELL
"You decide that it's silly to spend your hard-earned money on
medicine when you're feeling perfectly fine." CR>)
		      (T
		       <TELL "This isn't a drug store!" CR>)>)>>

<OBJECT HARDWARE-STORE-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "hardware store")
	(SYNONYM STORE STORES SHOP SHOPS)
	(ADJECTIVE HARDWARE LARGE WELL-STOCKED)
	(ACTION HARDWARE-STORE-OBJECT-F)>

<ROUTINE HARDWARE-STORE-OBJECT-F ()
	 <COND (<VERB? DISEMBARK LEAVE>
		<COND (<EQUAL? ,HERE ,HARDWARE-STORE>
		       <DO-WALK ,P?NORTH>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,HARDWARE-STORE>
		       <TELL ,LOOK-AROUND CR>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?SOUTH>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,HARDWARE-STORE>>
		<V-LOOK>)>>

<ROUTINE HARDWARE-STORE-ENTER-F ()
	 <COND (<AND <G? ,STIME 600>
		     <L? ,STIME 1080>>
		,HARDWARE-STORE)
	       (T
		<CLOSED-PRINT "The hardware store">
		<RFALSE>)>>

<ROOM HARDWARE-STORE
      (LOC ROOMS)
      (DESC "Hardware Store")
      (NORTH TO BEND)
      (OUT TO BEND)
      (FLAGS ONBIT)
      (GLOBAL HARDWARE-STORE-OBJECT)
      (ACTION HARDWARE-STORE-F)>

<ROUTINE HARDWARE-STORE-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<MOVE ,SPEAR-CARRIER ,HERE>
		<PUTP ,SPEAR-CARRIER ,P?SDESC "clerk">)
	       (<EQUAL? .RARG ,M-LOOK>
		<TELL "You have entered a large ">
		<PRINTD ,HARDWARE-STORE-OBJECT>
		<TELL ", ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "well-">)
		      (<EQUAL? ,SYEAR 2071>
		       <TELL "sparsely ">)>
		<TELL
"stocked with various tools and hardware, as well as stuff for
home-improvement, home entertainment facilities, skycars, and so
forth. The front door is on the north side of the store.">)
	       (<EQUAL? .RARG ,M-END>
		<SHOP-CLOSES 1080 "hardware store" "A clerk" ,BEND>)>>

<OBJECT HARDWARE
	(LOC HARDWARE-STORE)
	(DESC "hardware")
	(SYNONYM HARDWARE TOOL TOOLS)
	(FLAGS NARTICLEBIT NDESCBIT TRYTAKEBIT)
	(ACTION HARDWARE-F)>

<ROUTINE HARDWARE-F ()
	 <COND (<VERB? BUY>
		<COND (<EQUAL? ,HERE ,HARDWARE-STORE>
		       <TELL
"You look around the store, but you don't see anything you need for the
apartment. At least, nothing that will fit within your budget." CR>)
		      (T
		       <CANT-BUY ,HARDWARE>)>)
	       (<VERB? TAKE>
		<TELL "You'd be arrested for shoplifting!" CR>)>>

<OBJECT TOOL
	(LOC LOCAL-GLOBALS)
	(DESC "tool")
	(SYNONYM CROWBAR SCREWDRIVER WRENCH HAMMER SAW HACKSAW)
	(ACTION TOOL-F)>

<ROUTINE TOOL-F ()
	 <COND (<VERB? BUY>
		<COND (<EQUAL? ,HERE ,HARDWARE-STORE>
		       <TELL
"The clerk says, \"All out. Try again in a coupla weeks.\"" CR>)
		      (T
		       <CANT-BUY ,TOOL>)>)>>

<ROOM WICKER-AND-RIVER
      (LOC ROOMS)
      (DESC "Wicker & River")
      (NORTH PER CLOSED-FACTORY-ENTER-F)
      (NE TO FACTORY-ENTRANCE)
      (EAST SORRY "There's no way to enter that factory from here.")
      (SE TO POWER-STATION-ENTRANCE)
      (SOUTH TO TENEMENT-1)
      (SW TO INDUSTRIAL-PARK-ENTRANCE)
      (WEST TO WAREHOUSE-1)
      (NW TO BEND)
      (DOWN PER TUBES-ENTER-F)
      (FLAGS STREETBIT OUTSIDEBIT BADAREABIT NARTICLEBIT)
      (SCENE 34)
      (GLOBAL TENEMENT-OBJECT RAILROAD-BRIDGE VACANT-LOT WAREHOUSE-OBJECT
       	      FACTORY-OBJECT STAIRS RAILROAD-TRACKS TUBE-STATION SOUP-KITCHEN)
      (ACTION WICKER-AND-RIVER-F)>

<ROUTINE CLOSED-FACTORY-ENTER-F ()
	 <COND (<EQUAL? ,SYEAR 2061 2071>
		<SCORE 49> ;"2 points"
		<TELL "The ">
		<PRINTD ,SOUP-KITCHEN>
		<TELL " is closed down." CR>
		<RFALSE>)
	       (T
		,CLOSED-FACTORY)>>

<ROUTINE WICKER-AND-RIVER-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "You have crossed the proverbial railroad tracks. ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL
"The optimism and economic recovery don't seem to have spilled over into
this run-down section of Rockvil, near the river">)
		      (T
		       <TELL "This section of town, near the river, is ">
		       <COND (<EQUAL? ,SYEAR 2071>
			      <TELL "particularly ">)>
		       <TELL "run-down and seedy">)>
		<TELL
". Wicker Drive, which runs northeast to southwest, cuts perpendicularly across
River Street here. To the northwest, River dips under an unused rail bridge. ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL
"There are factories on the northern and eastern corners">)
		      (T
		       <TELL
"There is a factory on the eastern corner, and on the northern corner a ">
		       <COND (<EQUAL? ,SYEAR 2051>
			      <SCORE 102> ;"2 points"
			      <TELL
"line forms along the sidewalk outside a ">)
			     (T
			      <SCORE 49> ;"2 points"
			      <TELL "boarded-up ">)>
		       <PRINTD ,SOUP-KITCHEN>)>
		<TELL ". To the west is a ">
		<COND (<EQUAL? ,SYEAR 2041 2051>
		       <TELL "dingy warehouse">)
		      (T
		       <TELL "vacant lot">)>
		<TELL ", and south of here are some dilapidated apartments. ">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL "An entrance to the Tubes is sealed up.">)
		      (T
		       <TELL
"The smell of stale urine wafts from a stairway leading down to a gloomy ">
		       <PRINTD ,TUBE-STATION>
		       <TELL ".">)>)
	       (<AND <EQUAL? .RARG ,M-END>
		     <EQUAL? ,SYEAR 2071>
		     <L? <GETP ,WICKER-AND-RIVER ,P?SCENE> 101>>
		<COND (<PROB <GETP ,WICKER-AND-RIVER ,P?SCENE>>
		       <PUTP ,WICKER-AND-RIVER ,P?SCENE 101>
		       <SCORE 103> ;"3 points"
		       <TELL CR
"A skycopter whizzes overhead, announcing a special series of
execution matches this weekend." CR>)
		      (T
		       <PUTP ,WICKER-AND-RIVER ,P?SCENE
			     <+ <GETP ,WICKER-AND-RIVER ,P?SCENE> 33>>
		       <RFALSE>)>)>>

<ROOM WAREHOUSE-1
      (LOC ROOMS)
      (SDESC "")
      (NORTH PER WAREHOUSE-1-EXIT-F)
      (NE PER WAREHOUSE-1-EXIT-F)
      (EAST TO WICKER-AND-RIVER)
      (SE PER WAREHOUSE-1-EXIT-F)
      (SOUTH PER WAREHOUSE-1-EXIT-F)
      (SW PER WAREHOUSE-1-EXIT-F)
      (WEST PER WAREHOUSE-1-EXIT-F)
      (NW PER WAREHOUSE-1-EXIT-F)
      (FLAGS ONBIT BADAREABIT)
      (GLOBAL VACANT-LOT WAREHOUSE-OBJECT FENCE RAILROAD-TRACKS)
      (ACTION WAREHOUSE-1-F)>

<ROUTINE WAREHOUSE-1-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<COND (<EQUAL? ,SYEAR 2041 2051>
		       <PUTP ,WAREHOUSE-1 ,P?SDESC "Warehouse">)
		      (T
		       <PUTP ,WAREHOUSE-1 ,P?SDESC "Vacant Lot">)>)
	       (<EQUAL? .RARG ,M-LOOK>
		<COND (<EQUAL? ,SYEAR 2041 2051>
		       <TELL
"You are standing at the front entrance of an old warehouse whose walls
are coated with soot from the nearby factories. The door is locked. The
street is east of here.">)
		      (T
		       <TELL
"This lot is completely empty except for a few concrete footings that must
have once formed the foundation for some large building. A rusting, overgrown
set of railroad tracks borders the far side of the lot. An intersection of
two streets lies to the east.">)>)>>

<ROUTINE WAREHOUSE-1-EXIT-F ()
	 <COND (<EQUAL? ,SYEAR 2041 2051>
		<COND (<PRSO? ,P?WEST>
		       <TELL "The door is locked." CR>)
		      (T
		       <TELL ,CANT-GO CR>)>)
	       (T
		<COND (<PRSO? ,P?WEST>
		       <TELL "The tracks are fenced off." CR>)
		      (T
		       <TELL
"There's no exit from the lot in that direction." CR>)>)>
	 <RFALSE>>

<OBJECT WAREHOUSE-DOOR
	(LOC WAREHOUSE-1)
	(DESC "door")
	(SYNONYM DOOR)
	(FLAGS NDESCBIT)
	(ACTION WAREHOUSE-DOOR-F)>

<ROUTINE WAREHOUSE-DOOR-F ()
	 <COND (<VERB? THROUGH OPEN EXAMINE>
		<TELL "It's locked." CR>)>>

<ROOM CLOSED-FACTORY
      (LOC ROOMS)
      (SDESC "")
      (SOUTH TO WICKER-AND-RIVER)
      (OUT TO WICKER-AND-RIVER)
      (FLAGS ONBIT BADAREABIT)
      (GLOBAL FACTORY-OBJECT GLOBAL-TABLE SOUP-KITCHEN)
      (ACTION CLOSED-FACTORY-F)>

<ROUTINE CLOSED-FACTORY-F (RARG)
	  <COND (<EQUAL? .RARG ,M-ENTER>
		 <COND (<EQUAL? ,SYEAR 2041>
			<PUTP ,CLOSED-FACTORY ,P?SDESC "Closed Factory">)
		       (T
			<PUTP ,CLOSED-FACTORY ,P?SDESC "Soup Kitchen">
			<MOVE ,CHAIR ,HERE>)>)
		(<EQUAL? .RARG ,M-LOOK>
		 <COND (<EQUAL? ,SYEAR 2041>
			<TELL
"You have entered the crumbling buildings of a once-booming chip factory, idle
since the invention of the IDF made chips obsolete. The exit leads south.">)
		       (T
			<SCORE 102> ;"2 points"
			<TELL "You are in a dirty, crowded ">
			<PRINTD ,SOUP-KITCHEN>
			<TELL
" run by St. Michael's Church. Dozens and dozens of dispirited people are
sitting at old wooden tables, eating a thin stew. A door leads south.">)>)>>

<OBJECT SOUP-KITCHEN
	(LOC LOCAL-GLOBALS)
	(DESC "soup kitchen")
	(SYNONYM KITCHEN)
	(ADJECTIVE SOUP BOARDED-UP CLOSED DIRTY CROWDED)
	(GENERIC GENERIC-KITCHEN-F)
	(ACTION SOUP-KITCHEN-F)>

<ROUTINE SOUP-KITCHEN-F ()
	 <COND (<AND <EQUAL? ,SYEAR 2041>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,SOUP-KITCHEN>)
	       (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,WICKER-AND-RIVER>
		       <DO-WALK ,P?NORTH>)
		      (<GLOBAL-IN? ,SOUP-KITCHEN ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,CLOSED-FACTORY>
		       <DO-WALK ,P?SOUTH>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,CLOSED-FACTORY>
		       <V-LOOK>)
		      (<EQUAL? ,SYEAR 2051>
		       <TELL "There's a long line outside the ">
		       <PRINTD ,SOUP-KITCHEN>
		       <TELL "." CR>)
		      (T
		       <DO-WALK ,P?NORTH>)>)>>

<OBJECT STEW
	(LOC LOCAL-GLOBALS)
	(DESC "soup")
	(SYNONYM SOUP STEW FOOD MEAL)
	(ADJECTIVE THIN)
	(FLAGS NARTICLEBIT NDESCBIT)
	(GENERIC GENERIC-FOOD-F)
	(ACTION STEW-F)>

<ROUTINE STEW-F ()
	 <COND (<VERB? EXAMINE>
		<TELL "The soup is thin, without much substance." CR>)
	       (<VERB? TAKE EAT>
		<TELL "The line of people waiting for soup is too long." CR>)
	       (<VERB? BUY>
		<COND (<EQUAL? ,HERE ,CLOSED-FACTORY>
		       <TELL "The soup is free." CR>)
		      (<EQUAL? ,HERE ,ROYS-PAGODA>
		       <PERFORM ,V?BUY ,MEAL>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,SIMONS ,THE-COACHMAN ,BURGER-MEISTER>
		       <TELL "There's no soup on the menu." CR>)
		      (T
		       <CANT-BUY ,STEW>)>)>>

<ROOM TENEMENT-1
      (LOC ROOMS)
      (DESC "Tenement")
      (NORTH TO WICKER-AND-RIVER)
      (EAST TO POWER-STATION-ENTRANCE)
      (WEST TO INDUSTRIAL-PARK-ENTRANCE)
      (FLAGS ONBIT BADAREABIT)
      (GLOBAL TENEMENT-OBJECT)
      (ACTION TENEMENT-1-F)>

<ROUTINE TENEMENT-1-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are in the lobby of a run-down apartment building. These apartments
were probably considered desirable when constructed during the latter part
of the last century, but">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL
" with the encroachment of the factories and utility stations, ">)>
		<TELL " the building, like the entire area, ">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL "has long been">)
		      (T
		       <TELL "has become">)>
		<TELL
" a slum. The lobby has exits to the north, east, and west.">)>>

<OBJECT WAREHOUSE-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "warehouse")
	(SYNONYM WAREHOUSE)
	(ADJECTIVE GRAY GREY OLD DINGY)
	(ACTION WAREHOUSE-OBJECT-F)>

<ROUTINE WAREHOUSE-OBJECT-F ()
	 <COND (<AND <EQUAL? ,HERE ,WAREHOUSE-1 ,WICKER-AND-RIVER>
		     <EQUAL? ,SYEAR 2061 2071>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,WAREHOUSE-OBJECT>)
	       (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,WICKER-AND-RIVER>
		       <DO-WALK ,P?WEST>)
		      (<EQUAL? ,HERE ,INDUSTRIAL-PARK-ENTRANCE>
		       <DO-WALK ,P?NORTH>)
		      (<EQUAL? ,HERE ,INDUSTRIAL-PARK-DRIVE>
		       <PERFORM ,V?THROUGH ,FACTORY-OBJECT>
		       <RTRUE>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,WAREHOUSE-1>
		       <DO-WALK ,P?EAST>)
		      (<EQUAL? ,HERE ,WAREHOUSE-2>
		       <DO-WALK ,P?SOUTH>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? HERE ,WAREHOUSE-1 ,WAREHOUSE-2>>
		<V-LOOK>)>>

<ROOM INDUSTRIAL-PARK-ENTRANCE
      (LOC ROOMS)
      (DESC "Industrial Park Entrance")
      (LDESC
"You are on Wicker Drive, which leads northeast and southwest. A road
leads northwest into Rockvil Industrial Park. An old, gray warehouse
stands on the northern corner, and an ugly tenement is just east of here.")
      (NORTH TO WAREHOUSE-2)
      (NE TO WICKER-AND-RIVER)
      (EAST TO TENEMENT-1)
      (SE SORRY "A tall brick wall fronts the street in that direction.")
      (SOUTH SORRY "A tall brick wall fronts the street in that direction.")
      (SW TO DUMP-ENTRANCE)
      (WEST SORRY "There's no entrance to the industrial park that way.")
      (NW TO INDUSTRIAL-PARK-DRIVE)
      (IN TO INDUSTRIAL-PARK-DRIVE)
      (FLAGS STREETBIT OUTSIDEBIT BADAREABIT)
      (GLOBAL INDUSTRIAL-PARK-OBJECT WAREHOUSE-OBJECT TENEMENT-OBJECT)>

<ROOM WAREHOUSE-2
      (LOC ROOMS)
      (DESC "Warehouse")
      (SOUTH TO INDUSTRIAL-PARK-ENTRANCE)
      (OUT TO INDUSTRIAL-PARK-ENTRANCE)
      (FLAGS BADAREABIT)
      (GLOBAL WAREHOUSE-OBJECT)
      (ACTION WAREHOUSE-2-F)>

<ROUTINE WAREHOUSE-2-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You have entered a warehouse filled with dusty crates. The exit is to
the south. An alarm ">
		<COND (<FSET? ,WAREHOUSE-2 ,ONBIT>
		       <TELL "is ringing">)
		      (T
		       <FSET ,WAREHOUSE-2 ,ONBIT>
		       <TELL "begins to ring">)>
		<TELL " loudly.">)>>

<OBJECT ALARM
	(LOC WAREHOUSE-2)
	(DESC "alarm")
	(SYNONYM ALARM)
	(ADJECTIVE LOUD)
	(FLAGS NDESCBIT VOWELBIT)
	(ACTION ALARM-F)>

<ROUTINE ALARM-F ()
	 <COND (<VERB? LISTEN>
		<TELL
"You have little choice -- you can't hear much else." CR>)>>

<OBJECT CRATE
	(LOC WAREHOUSE-2)
	(DESC "crate")
	(SYNONYM CRATE CRATES)
	(ADJECTIVE DUSTY)
	(FLAGS NDESCBIT CONTBIT SEARCHBIT)
	(ACTION CRATE-F)>

<ROUTINE CRATE-F ()
	 <COND (<VERB? OPEN>
		<TELL "You'd need a crowbar to open these crates." CR>)
	       (<VERB? EXAMINE>
		<TELL "The crates are closed." CR>)>>

<ROOM INDUSTRIAL-PARK-DRIVE
      (LOC ROOMS)
      (DESC "Industrial Park Drive")
      (LDESC
"You are on a narrow road circling through a grouping of warehouses and
light factories. There are buildings on every side except southeast,
where the road leads out of the park.")
      (NORTH SORRY "The door of that building is locked.")
      (NE SORRY "The door of that building is locked.")
      (EAST SORRY "The door of that building is locked.")
      (SE TO INDUSTRIAL-PARK-ENTRANCE)
      (SOUTH SORRY "The door of that building is locked.")
      (SW SORRY "The door of that building is locked.")
      (WEST SORRY "The door of that building is locked.")
      (NW SORRY "The door of that building is locked.")
      (FLAGS STREETBIT OUTSIDEBIT BADAREABIT NARTICLEBIT)
      (GLOBAL UNOPENABLE-DOOR INDUSTRIAL-PARK-OBJECT FACTORY-OBJECT
       	      WAREHOUSE-OBJECT)>

<OBJECT INDUSTRIAL-PARK-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "industrial park")
        (SYNONYM PARK)
	(ADJECTIVE INDUSTRIAL ROCKVIL)
	(FLAGS VOWELBIT)
	(ACTION INDUSTRIAL-PARK-OBJECT-F)>

<ROUTINE INDUSTRIAL-PARK-OBJECT-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,HERE ,INDUSTRIAL-PARK-ENTRANCE>
		       <DO-WALK ,P?NW>)
		      (<EQUAL? ,HERE ,SKYCAR-LOT-1>
		       <DO-WALK ,P?SOUTH>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? DISEMBARK LEAVE>
		<COND (<EQUAL? ,HERE ,INDUSTRIAL-PARK-ENTRANCE>
		       <TELL ,LOOK-AROUND CR>)
		      (T
		       <DO-WALK ,P?SE>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,INDUSTRIAL-PARK-DRIVE>>
		<V-LOOK>)>>

<ROOM DUMP-ENTRANCE
      (LOC ROOMS)
      (DESC "Dump Entrance")
      (LDESC
"Wicker Drive turns ninety degrees here, leading northeast and northwest.
To the southwest is an entrance to the city's primary waste disposal facility,
which extends along the southern side of the street. A deserted tenement
blocks movement north.")
      (NORTH SORRY "There's no entrance to that building here.")
      (NE TO INDUSTRIAL-PARK-ENTRANCE)
      (EAST SORRY "There's no entrance to the dump in that direction.")
      (SE SORRY "There's no entrance to the dump in that direction.")
      (SOUTH SORRY "There's no entrance to the dump in that direction.")
      (SW TO CITY-DUMP)
      (WEST SORRY "There's no entrance to the dump in that direction.")
      (NW TO BURNED-OUT-AREA)
      (IN TO CITY-DUMP)
      (FLAGS STREETBIT OUTSIDEBIT BADAREABIT)
      (GLOBAL DUMP-OBJECT TENEMENT-OBJECT)>

<ROOM CITY-DUMP
      (LOC ROOMS)
      (DESC "City Dump")
      (NE TO DUMP-ENTRANCE)
      (OUT TO DUMP-ENTRANCE)
      (FLAGS OUTSIDEBIT BADAREABIT)
      (GLOBAL FENCE RIVER RIVER-BANK WATER DUMP-OBJECT)
      (ACTION CITY-DUMP-F)>

<ROUTINE CITY-DUMP-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This sprawling site along the river is a multiple unit disposal facility
handling all of Rockvil's waste. Garbage ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL
"is processed and shipped downriver for landfilling. Liquid wastes
are dechemified and then">)
		      (T
		       <SCORE 104> ;"3 points"
		       <TELL "and liquid wastes are">)>
		<TELL
" dumped into the river. Radioactive wastes are stored for ">
		<COND (<EQUAL? ,SYEAR 2061 2071>
		       <TELL "high-security ">)>
		<TELL
"shipment to one of the national storage sites. Energy produced during
processing is piped to the ">
		<PRINTD ,POWER-STATION-OBJECT>
		<TELL
" nearby. An opening in the perimeter fence leads northeast to Wicker
Drive.">)>>

<OBJECT WASTE
	(LOC CITY-DUMP)
	(DESC "waste")
	(SYNONYM WASTE WASTES GARBAGE LANDFILL)
	(ADJECTIVE LIQUID PROCESSED DECHEMIFIED RADIOACTIVE RADIO-ACTIVE)
	(FLAGS NDESCBIT NARTICLEBIT)
	(ACTION WASTE-F)>

<ROUTINE WASTE-F ()
	 <COND (<VERB? EXAMINE>
		<TELL "Like most waste, it's pretty vile." CR>)>>

<OBJECT DUMP-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "garbage dump")
	(SYNONYM DUMP FACILITY SITE)
	(ADJECTIVE SPRAWLING CITY CITY\'S ROCKVIL ROCKVIL\'S PRIMARY WASTE
	 	   DISPOSAL GARBAGE MULTIPLE UNIT)
	(ACTION DUMP-OBJECT-F)>

<ROUTINE DUMP-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,CITY-DUMP>
		       <TELL ,LOOK-AROUND CR>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?SW>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,CITY-DUMP>
		       <DO-WALK ,P?NE>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,CITY-DUMP>
		       <V-LOOK>)
		      (T
		       <FROM-HERE>)>)>>

<ROOM BURNED-OUT-AREA
      (LOC ROOMS)
      (DESC "Burned-out Area")
      (LDESC
"You are in a tangle of narrow streets. All the buildings around you are
deserted, their windows broken, their fixtures looted. Many are no more
than burned-out shells. One street, slightly wider than the rest, leads
southeast.")
      (NORTH TO BURNED-OUT-AREA)
      (NE TO BURNED-OUT-AREA)
      (EAST TO BURNED-OUT-AREA)
      (SE TO DUMP-ENTRANCE)
      (SOUTH TO BURNED-OUT-AREA)
      (SW TO BURNED-OUT-AREA)
      (WEST TO BURNED-OUT-AREA)
      (NW TO BURNED-OUT-AREA)
      (FLAGS STREETBIT OUTSIDEBIT BADAREABIT)
      (GLOBAL GLOBAL-WINDOW)>

<ROOM POWER-STATION-ENTRANCE
      (LOC ROOMS)
      (DESC "Power Station Entrance")
      (LDESC
"You are on River Street at the entrance of a utility station which lies to
the south. The street continues southeast towards the River Street Bridge.
Northeast of here is the entrance to a huge factory complex, and tenements
line the street to the west and southwest.")
      (NORTH SORRY "There's no entrance to the complex in that direction.")
      (NE TO SKYCAR-FACTORY)
      (EAST SORRY "There's no entrance to the complex in that direction.")
      (SE TO RIVER-STREET-BRIDGE)
      (SOUTH TO POWER-STATION)
      (SW TO TENEMENT-1)
      (WEST TO TENEMENT-1)
      (NW TO WICKER-AND-RIVER)
      (IN TO POWER-STATION)
      (FLAGS STREETBIT OUTSIDEBIT BADAREABIT)
      (GLOBAL POWER-STATION-OBJECT WATER RIVER RIVER-BANK STREET-BRIDGE
       	      FACTORY-OBJECT TENEMENT-OBJECT)>

<OBJECT POWER-STATION-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "power station")
	(SYNONYM STATION)
	(ADJECTIVE POWER UTILITY CENTRAL)
	(ACTION POWER-STATION-OBJECT-F)>

<ROUTINE POWER-STATION-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,POWER-STATION>
		       <TELL ,LOOK-AROUND CR>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?SOUTH>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,POWER-STATION>
		       <DO-WALK ,P?NORTH>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,POWER-STATION>
		       <V-LOOK>)
		      (T
		       <FROM-HERE>)>)>>

<ROOM POWER-STATION
      (LOC ROOMS)
      (DESC "Power Station")
      (NORTH TO POWER-STATION-ENTRANCE)
      (OUT TO POWER-STATION-ENTRANCE)
      (FLAGS OUTSIDEBIT BADAREABIT)
      (GLOBAL POWER-STATION-OBJECT SMOKE)
      (ACTION POWER-STATION-F)>

<ROUTINE POWER-STATION-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "This is the central ">
		<PRINTD ,POWER-STATION-OBJECT>
		<TELL
" for all of Rockvil. Power is generated here by fusion reactors">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL ", and is">)
		      (<EQUAL? ,SYEAR 2051>
		       <SCORE 105> ;"1 point"
		       <TELL
" and supplemental coal-burning generators, and is">)
		      (<EQUAL? ,SYEAR 2061>
		       <SCORE 106> ;"2 points"
		       <TELL
", as well as by more environmentally damaging
coal-burning generators. Power is">)
		      (T
		       <SCORE 107> ;"3 points"
		       <TELL
" in addition to the less expensive coal-burners; each coal generator
is belching tremendous pillars of black, ashy smoke into the sky.
Power is also">)>
		<TELL
" received here from distant generators via a huge array of microwave
receivers. The main entrance is on the north side of the plant.">)>>

<ROOM RIVER-STREET-BRIDGE
      (LOC ROOMS)
      (DESC "River Street Bridge")
      (NORTH PER RIVER-ENTER-F)
      (NE PER RIVER-ENTER-F)
      (EAST PER RIVER-ENTER-F)
      (SE PER SUBURBS-ENTER-F)
      (SOUTH PER RIVER-ENTER-F)
      (SW PER RIVER-ENTER-F)
      (WEST PER RIVER-ENTER-F)
      (NW TO POWER-STATION-ENTRANCE)
      (FLAGS STREETBIT OUTSIDEBIT BADAREABIT)
      (GLOBAL STREET-BRIDGE RIVER RIVER-BANK WATER)
      (ACTION RIVER-STREET-BRIDGE-F)>

<ROUTINE RIVER-STREET-BRIDGE-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"River Street leaves Rockvil via this bridge, crossing the river into the
older and poorer southeastern suburbs.">
		<RIVER-FIRE "north">
		<RTRUE>)>>

<ROUTINE RIVER-FIRE (STRING)
	 <COND (<EQUAL? ,SYEAR 2071>
		<SCORE 108> ;"3 points"
		<TELL
" Off to the " .STRING ", the river is on fire again. Nowadays, ">
		<PRINTD ,FIRECOPTER>
		<TELL
"s usually ignore river fires unless they approach the shoreline.">)>>

<ROOM SKYCAR-FACTORY
      (LOC ROOMS)
      (DESC "Skycar Factory")
      (NORTH SORRY "There's no exit from the factory complex that way.")
      (NE SORRY "There's no exit from the factory complex that way.")
      (EAST SORRY "There's no exit from the factory complex that way.")
      (SE SORRY "There's no exit from the factory complex that way.")
      (SOUTH SORRY "There's no exit from the factory complex that way.")
      (SW TO POWER-STATION-ENTRANCE)
      (WEST SORRY "There's no exit from the factory complex that way.")
      (NW TO FACTORY-ENTRANCE)
      (FLAGS OUTSIDEBIT BADAREABIT)
      (GLOBAL FACTORY-OBJECT CARLOT PEOPLE)
      (ACTION SKYCAR-FACTORY-F)>

<ROUTINE SKYCAR-FACTORY-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "The Omni-Fabb ">
		<PRINTD ,SKYCAR-FACTORY>
		<TELL
", the last surviving smokestack industry in the area, provides jobs to many
residents of the city and the suburbs across the river">
		<COND (<EQUAL? ,SYEAR 2061 2071>
		       <TELL
", although not nearly as many as before the suspension of federal regulations
limiting robotic job replacement">)>
		<COND (<AND <NOT <EQUAL? ,SYEAR 2041>>
			    <L? ,STIME 480>
			    <G? ,STIME 990>>
		       <SCORE 109> ;"1 point"
		       <TELL
". The parking lot is empty; there must currently be only one shift per day">)
		      (T
		       <TELL
". Judging by the number of cars in the workers' lot, and the general level
of activity, the plant is running at ">
		       <COND (<EQUAL? ,SYEAR 2041>
			      <TELL "nearly full">)
			     (<EQUAL? ,SYEAR 2051>
			      <SCORE 109> ;"1 point"
			      <TELL "well above half of">)
			     (<EQUAL? ,SYEAR 2061>
			      <SCORE 110> ;"2 points"
			      <TELL "less than half of">)
			     (T
			      <SCORE 111> ;"3 points"
			      <TELL "a fraction of">)>
		       <TELL " capacity">)>
		<TELL
". There are exits from this complex of buildings to the
northwest and the southwest.">)>>

<ROOM FACTORY-ENTRANCE
      (LOC ROOMS)
      (DESC "Factory Entrance")
      (LDESC
"You are on Wicker Drive, which runs northeast to southwest. An alley
forks off to the east. A large factory complex can be entered to the
southeast, and a gun shop is north of here. A row of tenements stretches
off to the northwest and west.")
      (NORTH PER GUN-SHOP-ENTER-F)
      (NE TO WICKER-AND-PIER)
      (EAST TO ALLEY)
      (SE TO SKYCAR-FACTORY)
      (SOUTH SORRY "There's no entrance to the complex in that direction.")
      (SW TO WICKER-AND-RIVER)
      (WEST TO TENEMENT-2)
      (NW TO TENEMENT-2)
      (IN TO SKYCAR-FACTORY)
      (FLAGS STREETBIT OUTSIDEBIT BADAREABIT)
      (GLOBAL FACTORY-OBJECT TENEMENT-OBJECT GUN-SHOP-OBJECT)>

<ROOM TENEMENT-2
      (LOC ROOMS)
      (DESC "Tenement")
      (SE TO FACTORY-ENTRANCE)
      (OUT TO FACTORY-ENTRANCE)
      (FLAGS ONBIT BADAREABIT)
      (GLOBAL TENEMENT-OBJECT)
      (ACTION TENEMENT-F)>

<ROUTINE GUN-SHOP-ENTER-F ()
	 <COND (<AND <G? ,STIME 630>
		     <L? ,STIME 1230>>
		,GUN-SHOP)
	       (T
		<CLOSED-PRINT "The gun store">
		<RFALSE>)>>

<OBJECT GUN-SHOP-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "gun shop")
	(SYNONYM SHOP STORE)
	(ADJECTIVE GUN)
	(ACTION GUN-SHOP-OBJECT-F)>

<ROUTINE GUN-SHOP-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,FACTORY-ENTRANCE>
		       <DO-WALK ,P?NORTH>)
		      (<NOT <MOBY-VERB?>>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXIT LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,FACTORY-ENTRANCE>
		       <TELL ,LOOK-AROUND CR>)
		      (T
		       <DO-WALK ,P?SOUTH>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,GUN-SHOP>>
		<V-LOOK>)>>

<ROOM GUN-SHOP
      (LOC ROOMS)
      (DESC "Gun Shop")
      (LDESC
"You are in a small armaments store, with metal bars over the counter
separating you from the proprietor. There is an exit to the south.")
      (SOUTH TO FACTORY-ENTRANCE)
      (OUT TO FACTORY-ENTRANCE)
      (FLAGS ONBIT BADAREABIT)
      (GLOBAL COUNTER GUN GUN-SHOP-OBJECT)
      (ACTION GUN-SHOP-F)>

<ROUTINE GUN-SHOP-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<MOVE ,SPEAR-CARRIER ,HERE>
		<PUTP ,SPEAR-CARRIER ,P?SDESC "proprietor">)
	       (<EQUAL? .RARG ,M-END>
		<SHOP-CLOSES
		 1230 "gun shop" "The proprietor" ,FACTORY-ENTRANCE>)>>

<OBJECT GUN
	(LOC LOCAL-GLOBALS)
	(DESC "firearm")
	(SYNONYM FIREARM FIREARMS GUN GUNS RIFLE RIFLES PISTOL PISTOLS
	 	 WEAPON WEAPONS GAT GATS HEATER HEATERS ROD RODS PIECE
		 PIECES AUTOMATIC REVOLVER REVOLVERS SPECIAL SPECIALS
		 COLT COLTS FORTY-FIVE SHOTGUN SHOTGUNS FLINTLOCK
		 SIX-SHOOTER BIOGUN) ;"SIX-GUN"
	(ADJECTIVE SNUB NOSED SNUB-NOSED COLT SATURDAY NIGHT SAWED-OFF
	 	   BB MACHINE SUB-MACHINE SUBMACHINE FORTY-FIVE CALIBER
		   THIRTY-TWO THIRTY-EIGHT TWENTY-TWO ZIP PELLET SILENCED
		   POORLY CONCEALED YOUR)
	(FLAGS NDESCBIT TRYTAKEBIT)
	(ACTION GUN-F)>

<ROUTINE GUN-F ()
	 <COND (<AND <EQUAL? ,HERE ,CORE>
		     <NOT <IN? ,SABOTEURS ,HERE>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,GUN>)
	       (<AND <EQUAL? ,HERE ,CONTROL-CENTER>
		     <NOT ,SEIGE>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,GUN>)
	       (<VERB? BUY>
		<COND (<EQUAL? ,HERE ,GUN-SHOP>
		       <TELL
"The proprietor shows you many different firearms, and you finally settle on
a twenty-two caliber pellet gun. However, when you pass your ">
		       <PRINTD ,CREDIT-CARD>
		       <TELL
" through the grill to the proprietor, he looks disappointed as he announces
that you don't have enough in your account for that particular gun. \"In
fact,\" he says, \"I doubt there's anything in the shop in your price range.
You might try Ribeiro's Secondhand Firearms over in Yankton.\"" CR>)
		      (T
		       <CANT-BUY ,GUN>)>)
	       (<AND <EQUAL? ,HERE ,GUN-SHOP>
		     <VERB? TAKE SHOOT>>
		<TELL "You'll have to buy a gun before you can ">
		<COND (<VERB? SHOOT>
		       <TELL "shoot">)
		      (T
		       <TELL "take">)>
		<TELL " it." CR>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,GUN-SHOP>>
		<TELL "There are a staggering variety of weapons here." CR>)>>

<ROOM ALLEY
      (LOC ROOMS)
      (DESC "Alley")
      (LDESC
"This long, narrow, dim alley is flanked by tall, featureless walls. The
alley, which begins to the west, ends east of here at a back doorway, through
which loud, raucous music can be heard.")
      (OUT TO FACTORY-ENTRANCE)
      (WEST TO FACTORY-ENTRANCE)
      (EAST TO BAR)
      (IN TO BAR)
      (FLAGS STREETBIT OUTSIDEBIT BADAREABIT)
      (GLOBAL BAR-OBJECT MUSIC)>

<ROOM BAR
      (LOC ROOMS)
      (DESC "Bar")
      (WEST PER BAR-TO-ALLEY-F)
      (NE PER BAR-TO-PIER-F)
      (FLAGS BADAREABIT)
      (GLOBAL BAR-OBJECT COUNTER PIER-OBJECT MUSIC SMOKE BAR PEOPLE)
      (ACTION BAR-F)>

<ROUTINE BAR-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<COND (<L? ,STIME 1201> ;"for owner's curfew message"
		       <FCLEAR ,BAR ,ONBIT>)>
		<MOVE ,SPEAR-CARRIER ,HERE>
		<PUTP ,SPEAR-CARRIER ,P?SDESC "bartender">
		<MOVE ,BEER ,LOCAL-GLOBALS>
		<MOVE ,BAR-STOOL ,HERE>)
	       (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is a tiny, smoke-filled bar, with exits to the west and northeast.
Loud, distorted music comes from an old jukebox" ,STOOL-DESC>
		<PEOPLE-IN-BAR-DESC>)
	       (<AND <EQUAL? .RARG ,M-END>
		     <NOT <EQUAL? ,SYEAR 2041>>
		     <G? ,STIME 1195>
		     <L? ,STIME 1255>
		     <NOT <FSET? ,BAR ,ONBIT>>>
		<FSET ,BAR ,ONBIT>
		<TELL CR
"Someone, possibly the owner, shouts above the din, \"It's getting near curfew
time; anyone who doesn't wanna stay 'til morning should get a move on it! Of
course, we'll be staying open all night, as usual -- you just gotta know the
right people!\" He rubs his fingers together, indicating that some official
of the Curfew Board is now slightly richer. \"Well, drink up!\"" CR>)>>

<ROUTINE BAR-TO-ALLEY-F ()
	 <COND (<HELD? ,BEER>
		<TELL ,BARTENDER-YELLS CR>
		<RFALSE>)
	       (T
		,ALLEY)>>

<ROUTINE BAR-TO-PIER-F ()
	 <COND (<HELD? ,BEER>
		<TELL ,BARTENDER-YELLS CR>
		<RFALSE>)
	       (T
		,PIER)>>

<OBJECT BAR-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "bar")
	(SYNONYM BAR LOUNGE CLUB SPOT)
	(ADJECTIVE NOISY TINY FAVORITE HANGOUT DINGY DINGY-LOOKING
	 	   LOOKING SMOKY SMOKE-FILLED SMOKE FILLED EZZIS EZZI\'S)
	(ACTION BAR-OBJECT-F)>

<ROUTINE BAR-OBJECT-F ()
	 <COND (<AND <EQUAL? ,HERE ,BURGER-MEISTER ,AQUARIUM-AND-PARK>
		     <NOT <EQUAL? ,SYEAR 2071>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,BAR-OBJECT>)
	       (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,BURGER-MEISTER ,EZZIS-BAR ,BAR>
		       <TELL ,LOOK-AROUND CR>)
		      (<EQUAL? ,HERE ,AQUARIUM-AND-PARK>
		       <DO-WALK ,P?NE>)
		      (<EQUAL? ,HERE ,ELM-UNDERPASS>
		       <DO-WALK ,P?NORTH>)
		      (<EQUAL? ,HERE ,ALLEY>
		       <DO-WALK ,P?EAST>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?SW>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,BURGER-MEISTER ,EZZIS-BAR ,BAR>
		       <DO-WALK ,P?OUT>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,BURGER-MEISTER ,EZZIS-BAR ,BAR>>
		<V-LOOK>)
	       (<AND <VERB? SMELL>
		     <EQUAL? ,HERE ,BURGER-MEISTER>>
		<TELL
"The air is heavy with the smells of tobacco smoke,
urine, and spilled beer." CR>)
	       (<AND <VERB? PUT-ON>
		     <PRSI? ,BAR-OBJECT>
		     <EQUAL? ,HERE ,BURGER-MEISTER ,EZZIS-BAR ,BAR>>
		<PERFORM ,V?PUT-ON ,PRSO ,COUNTER>
		<RTRUE>)>>

<OBJECT BAR-STOOL
	(LOC LOCAL-GLOBALS)
	(DESC "stool")
	(SYNONYM STOOL STOOLS)
	(ADJECTIVE BATTERED WOODEN)
	(FLAGS VEHBIT FURNITUREBIT NDESCBIT)
	(ACTION BAR-STOOL-F)>

<ROUTINE BAR-STOOL-F ;("OPTIONAL" RARG) ()
	 <COND ;(.RARG
		<RFALSE>)
	       ;(<VERB? OPEN CLOSE>
		<TELL "Huh?" CR>)
               (<AND <VERB? PUT>
		     <PRSI? ,BAR-STOOL>>
		<COND (<PRSO? ,ME>
		       <PERFORM ,V?SIT ,BAR-STOOL>
		       <RTRUE>)>
		<TELL "Stools are for sitting on." CR>)>>

<OBJECT JUKEBOX
	(LOC BAR)
	(DESC "jukebox")
	(SYNONYM JUKEBOX BOX)
	(ADJECTIVE JUKE OLD)
	(FLAGS NDESCBIT)
	(ACTION JUKEBOX-F)>

<ROUTINE JUKEBOX-F ()
	<COND (<VERB? LISTEN>
	       <SETG ELAPSED-TIME 4>
	       <COND (<EQUAL? ,SYEAR 2071>
		      <TELL
"The tune is a jazzed-up version of a popular Church march." CR>)
		     (T
	       	      <TELL
"You listen to the current selection, " <PICK-ONE ,JUKEBOXES> CR>)>)
	      (<VERB? ON PLAY>
	       <TELL "It's already playing." CR>)>>

<GLOBAL JUKEBOXES
	<LTABLE
	 0
	 "a popular country & western tune from the 1990's."
	 "a recent tri-rock single."
	 "a jazzy instrumental."
	 "\"Hey Jude,\" the Beatles classic.">>

<OBJECT PIER-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "pier")
	(SYNONYM PIER WHARF DOCK QUAY)
	(ADJECTIVE AGING RIVERFRONT SHORT WOODEN ROCKVIL)
	(ACTION PIER-OBJECT-F)>

<ROUTINE PIER-OBJECT-F ()
	 <COND (<AND <EQUAL? ,HERE ,SKYCAB>
		     <NOT <VERB? EXAMINE>>>
		<MILE-AWAY ,PIER-OBJECT>)
	       (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,BAR>
		       <DO-WALK ,P?NE>)
		      (<EQUAL? ,HERE ,WICKER-AND-PIER>
		       <DO-WALK ,P?SE>)
		      (<EQUAL? ,HERE ,POOL-HALL>
		       <DO-WALK ,P?SW>)
		      (<GLOBAL-IN? ,PIER ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,PIER>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,PIER>>
		<V-LOOK>)>>

<ROOM PIER
      (LOC ROOMS)
      (DESC "Pier")
      (NORTH SORRY "There's no entrance to the pool hall in that direction.")
      (NE PER POOL-HALL-ENTER-F)
      (EAST PER RIVER-ENTER-F)
      (SE PER RIVER-ENTER-F)
      (SOUTH PER RIVER-ENTER-F)
      (SW TO BAR)
      (WEST SORRY "There's no entrance to the bar in that direction.")
      (NW TO WICKER-AND-PIER)
      (FLAGS STREETBIT OUTSIDEBIT BADAREABIT)
      (GLOBAL WATER RIVER RIVER-BANK BAR-OBJECT POOL-HALL-OBJECT PIER-OBJECT)
      (ACTION PIER-F)>

<ROUTINE PIER-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "This is an aging riverfront pier, ">
	        <COND (<EQUAL? ,SYEAR 2041>
		       <TELL "extending a short way">)
		      (T
		       <TELL
"ending abruptly at the river edge. Jagged, splintered wood at the end
of the pier reveals that it once extended further">)>
		<TELL
" out into the river. To the northwest, the pier intersects with Wicker
Drive. A bar opens to the southwest, and a pool hall to the northeast.">)>>

<ROUTINE POOL-HALL-ENTER-F ()
	 <COND (<AND <OR <G? ,STIME 1200>
			 <L? ,STIME 420>>
		     <NOT <EQUAL? ,SYEAR 2041>>>
		<OF-COURSE ,POOL-HALL-OBJECT>
		<RFALSE>)
	       (T
		,POOL-HALL)>>

<ROOM POOL-HALL
      (LOC ROOMS)
      (DESC "Pool Hall")
      (SW TO PIER)
      (OUT TO PIER)
      (FLAGS ONBIT BADAREABIT)
      (GLOBAL POOL-HALL-OBJECT PIER-OBJECT SMOKE PEOPLE)
      (ACTION POOL-HALL-F)>

<ROUTINE POOL-HALL-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is a classless establishment, which has clearly seen its better days. "
,TOBACCO-ODOR " A door to the pier lies to the southwest. ">)
	       (<EQUAL? .RARG ,M-END>
		<CURFEW-CLOSE ,PIER>)>>

<OBJECT POOL-HALL-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "pool hall")
	(SYNONYM HALL ESTABLISHMENT)
	(ADJECTIVE POOL CLASSLESS)
	(ACTION POOL-HALL-OBJECT-F)>

<ROUTINE POOL-HALL-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,POOL-HALL>
		       <TELL ,LOOK-AROUND CR>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?NE>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,POOL-HALL>
		       <DO-WALK ,P?SW>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,POOL-HALL>>
		<V-LOOK>)
	       (<AND <VERB? SMELL>
		     <EQUAL? ,HERE ,POOL-HALL>>
		<TELL ,TOBACCO-ODOR CR>)>>

<OBJECT POOL-TABLE
	(LOC POOL-HALL)
	(DESC "pool table")
	(SYNONYM TABLE TABLES)
	(ADJECTIVE POOL BILLIARD)
	(FLAGS NDESCBIT)
	(ACTION POOL-TABLE-F)>

<ROUTINE POOL-TABLE-F ()
	 <COND (<VERB? EXAMINE>
		<TELL "The ">
		<PRINTD ,POOL-TABLE>
		<TELL
"s are all in poor shape, frayed in many places and scarred by cigarette
burns." CR>)>>

<OBJECT POOL
	(LOC GLOBAL-OBJECTS)
	(DESC "billiards")
	(SYNONYM POOL BILLIARDS)
	(FLAGS NARTICLEBIT)
	(ACTION POOL-F)>

<ROUTINE POOL-F ()
	 <COND (<VERB? PLAY SHOOT>
		<COND (<EQUAL? ,HERE ,POOL-HALL>
		       <TELL
"You knock a few balls around, but, as usual, you have to admit that
you're not very good at cuesmanship." CR>)
		      (T
		       <TELL "You'd better find a pool hall first." CR>)>)>>

<ROOM WICKER-AND-PIER
      (LOC ROOMS)
      (DESC "Wicker & Pier")
      (NORTH SORRY "There's no entrance into the tenements in that direction.")
      (NE TO MAIN-AND-WICKER)
      (EAST PER BOOKSTORE-ENTER-F)
      (SE TO PIER)
      (SOUTH PER LIQUOR-STORE-ENTER-F)
      (SW TO FACTORY-ENTRANCE)
      (WEST SORRY "There's no entrance into the tenements in that direction.")
      (NW TO TENEMENT-3)
      (FLAGS STREETBIT OUTSIDEBIT BADAREABIT NARTICLEBIT)
      (GLOBAL RAILROAD-BRIDGE BOOKSTORE-OBJECT LIQUOR-STORE-OBJECT
              TENEMENT-OBJECT GLOBAL-WINDOW PIER-OBJECT RAILROAD-TRACKS)
      (ACTION WICKER-AND-PIER-F)>

<ROUTINE WICKER-AND-PIER-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<COND (<EQUAL? ,SYEAR 2081>
		       <SCORE 112> ;"15 points!"
		       <TELL
"Rats scamper among the weeds growing through the cracks in the street and
among the ruined buildings. A pallor of smoke hangs in the air, and a distant
sound like a drumbeat gives this area the feel of a surreal jungle.">)
		      (T
		       <TELL 
"Northeast of here, Wicker curves northwards and passes under an old
railroad trestle. An aging, wooden pier leads off to the southeast. On
the eastern corner of the street is what appears to be a ">
		       <COND (<EQUAL? ,SYEAR 2071>
			      <SCORE 113> ;"1 point"
			      <TELL "closed ">)>
		       <TELL "bookstore. A ">
		       <PRINTD ,LIQUOR-STORE-OBJECT>
		       <TELL
" occupies the southern corner, and a row of dismal apartment buildings
lines the northwestern side of Wicker.">)>)
	       (<AND <EQUAL? .RARG ,M-END>
		     <EQUAL? ,SYEAR 2081>>
		<JIGS-UP
"Suddenly, you are surrounded by a group of men clad only in loin cloths,
their faces marked with charcoal in an identical, tribal pattern. You are
quickly bound and gagged, and carried to an open area where many people
with similar facial markings are gathered.|
|
You are tossed helplessly in the center of the clearing, amidst bones that
are unmistakably human. Wood is quickly gathered for a bonfire, and you are
rudely thrown upon it. Through the agonizing pain of the fire, you hear the
tribal members chanting. Your last sight is of one of your captors, tending
the fire and salivating like a wild animal.">)>>

<ROOM TENEMENT-3
      (LOC ROOMS)
      (DESC "Tenement")
      (SE TO WICKER-AND-PIER)
      (OUT TO WICKER-AND-PIER)
      (FLAGS ONBIT BADAREABIT)
      (GLOBAL TENEMENT-OBJECT)
      (ACTION TENEMENT-F)>

<ROUTINE TENEMENT-F (RARG) ;"NOTE: This serves TENEMENT-2 and TENEMENT-3"
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "This is a ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "substandard residence unit">)
		      (<EQUAL? ,SYEAR 2071>
		       <TELL "malodorous, disease-ridden, rat-infested slum">)
		      (T
		       <COND (<EQUAL? ,HERE ,TENEMENT-2>
			      <TELL "filthy">)
			     (T
			      <TELL "dirty">)>
		       <TELL " tenement">)>
		<TELL ". The exit is southeast.">)>>

<OBJECT TENEMENT-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "tenement")
	(SYNONYM TENEMENT TENEMENTS SLUM SLUMS ROW UNIT)
	(ADJECTIVE OLD DIRTY FILTHY RUN-DOWN UGLY DESERTED RESIDENCE DISEASE
		   RIDDEN DISEASE-RIDDEN MALODOROUS SUBSTANDARD SUB-STANDARD
		   RAT-INFESTED RAT INFESTED)
	(ACTION TENEMENT-OBJECT-F)>

<ROUTINE TENEMENT-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,WICKER-AND-RIVER>
		       <DO-WALK ,P?SOUTH>)
		      (<EQUAL? ,HERE ,POWER-STATION-ENTRANCE>
		       <DO-WALK ,P?WEST>)
		      (<EQUAL? ,HERE ,INDUSTRIAL-PARK-ENTRANCE>
		       <DO-WALK ,P?EAST>)
		      (<EQUAL? ,HERE ,DUMP-ENTRANCE>
		       <DO-WALK ,P?NORTH>)
		      (<EQUAL? ,HERE ,FACTORY-ENTRANCE ,WICKER-AND-PIER>
		       <DO-WALK ,P?NW>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,TENEMENT-2 ,TENEMENT-3>
		       <DO-WALK ,P?SE>)
		      (<EQUAL? ,HERE ,TENEMENT-3>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,TENEMENT-1 ,TENEMENT-2 ,TENEMENT-3>>
		<V-LOOK>)
	       (<AND <VERB? SMELL>
		     <EQUAL? ,HERE ,TENEMENT-2 ,TENEMENT-3>
		     <EQUAL? ,SYEAR 2071>>
		<TELL "The building smells foul." CR>)>>

<ROUTINE BOOKSTORE-ENTER-F ()
	 <COND (<EQUAL? ,SYEAR 2071>
		<SCORE 113> ;"1 point"
		<TELL
"The bookstore is locked. Through the grimy window, the bookstore looks
empty and barren." CR>
		<RFALSE>)
	       (<OR <G? ,STIME 1083>
		    <L? ,STIME 501>>
		<CLOSED-PRINT "The bookstore">
		<RFALSE>)
	       (T
		,BOOKSTORE)>>

<OBJECT BOOKSTORE-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "bookstore")
	(SYNONYM STORE STORES SHOP SHOPS BOOKSTORE)
	(ADJECTIVE BOOK)
	(ACTION BOOKSTORE-OBJECT-F)>

<ROUTINE BOOKSTORE-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,BOOKSTORE>
		       <TELL ,LOOK-AROUND CR>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?EAST>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,BOOKSTORE>
		       <DO-WALK ,P?WEST>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,BOOKSTORE>>
		<V-LOOK>)
	       (<AND <VERB? SEARCH>
		     <EQUAL? ,HERE ,BOOKSTORE>
		     <FSET? ,BOOK ,TRYTAKEBIT>>
		<PERFORM ,V?BUY ,BOOKS>
		<RTRUE>)
	       (<AND <VERB? SMELL>
		     <EQUAL? ,HERE ,BOOKSTORE>>
		<TELL "A pleasant, papery odor fills the shop." CR>)>>

<ROOM BOOKSTORE
      (LOC ROOMS)
      (DESC "Bookstore")
      (LDESC
"A less likely place for a bookstore you couldn't imagine. This one seems to
be stocked mostly with used books. Closely-placed shelves, filled with old
books, rise to ceiling, and a pleasant, papery odor fills the shop. The front
door leads west.|
The proprietor smiles at you kindly.")
      (WEST TO WICKER-AND-PIER)
      (OUT TO WICKER-AND-PIER)
      (FLAGS ONBIT BADAREABIT)
      (GLOBAL SHELVES BOOKSTORE-OBJECT)
      (ACTION BOOKSTORE-F)>

<ROUTINE BOOKSTORE-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<MOVE ,SPEAR-CARRIER ,HERE>
      		<MOVE ,BOOKS ,HERE>
		<PUTP ,SPEAR-CARRIER ,P?SDESC "proprietor">)
	       (<EQUAL? .RARG ,M-END>
		<SHOP-CLOSES
		 1083 "bookstore" "The proprietor" ,WICKER-AND-PIER>)>>

<GLOBAL BOOK-PURCHASED <>>

<OBJECT BOOK
	(LOC LOCAL-GLOBALS)
	(DESC "copy of \"The Wizard of Oz\"")
	(SYNONYM BOOK WIZARD OZ COPY)
	(ADJECTIVE OLD USED NEW MY)
	(SIZE 10)
	(FLAGS TRYTAKEBIT TAKEBIT READBIT NDESCBIT)
	(GENERIC GENERIC-BOOK-F)
	(TEXT
"The book, an aging copy of that timeless fable \"The Wizard of Oz,\"
is in startlingly good condition, and features the original, classic
illustrations. You skim a few chapters, remembering the joy of the
tale from your younger days.")
	(ACTION BOOK-F)>

<ROUTINE BOOK-F ()
	 <COND (<VERB? BUY>
		<COND (<FSET? ,BOOK ,TRYTAKEBIT>
		       <PERFORM ,V?BUY ,BOOKS>
		       <RTRUE>)
		      (T
		       <TELL "You already did." CR>)>)
	       (<AND <VERB? TAKE>
		     <FSET? ,BOOK ,TRYTAKEBIT>>
		<PERFORM ,V?TAKE ,BOOKS>
		<RTRUE>)
	       (<AND <VERB? FIND>
		     <EQUAL? ,HERE ,BOOKSTORE>
		     <FSET? ,BOOK ,TRYTAKEBIT>>
		<PERFORM ,V?BUY ,BOOKS>
		<RTRUE>)
	       (<VERB? OPEN>
		<PERFORM ,V?READ ,BOOK>
		<RTRUE>)
	       (<VERB? CLOSE>
		<TELL "It is." CR>)>>

<OBJECT BOOKS
	(LOC LOCAL-GLOBALS)
	(DESC "books")
	(SYNONYM BOOK BOOKS NOVEL NOVELS)
	(ADJECTIVE OLD USED LIBRARY)
	(FLAGS NARTICLEBIT PLURALBIT TRYTAKEBIT NDESCBIT)
	(GENERIC GENERIC-BOOK-F)
	(ACTION BOOKS-F)>

<ROUTINE BOOKS-F ()
	 <COND (<VERB? BUY>
		<COND (<EQUAL? ,HERE ,BOOKSTORE>
		       <COND (,BOOK-PURCHASED
			      <SETG ELAPSED-TIME 6>
			      <TELL
"You browse for a few minutes, but don't find anything of interest." CR>)
			     (<FSET? ,BOOK ,TRYTAKEBIT>
			      <SETG ELAPSED-TIME 3>
			      <SETG P-IT-OBJECT ,BOOK>
			      <TELL
"After browsing for several minutes, something catches your eye: a handsome
edition of Baum's \"The Wizard of Oz.\" Eagerly, you give your ">
			      <PRINTD ,CREDIT-CARD>
			      <TELL " to the proprietor">
			      <COND (<TOO-POOR 30 ,BOOK>
				     <RTRUE>)>
			      <MOVE ,BOOK ,PLAYER>
			      <FCLEAR ,BOOK ,TRYTAKEBIT>
			      <FCLEAR ,BOOK ,NDESCBIT>
			      <SETG BOOK-PURCHASED T>
			      <DEBIT 30>
			      <TELL "." CR>)
			     (T
			      <TELL
"You already bought one book. That's enough extravagance for one day." CR>)>)
		      (T
		       <CANT-BUY ,BOOKS>)>)
	       (<AND <VERB? SEARCH>
		     <EQUAL? ,HERE ,BOOKSTORE>
		     <FSET? ,BOOK ,TRYTAKEBIT>>
		<PERFORM ,V?BUY ,BOOKS>
		<RTRUE>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,BOOKSTORE ,MAIN-LIBRARY>>
		<PERFORM ,V?READ ,BOOKS>
		<RTRUE>)
	       (<VERB? READ OPEN>
		<COND (<EQUAL? ,HERE ,BOOKSTORE>
		       <TELL
"There are thousands of books in the store, of many different sizes
and ages. Many are used. You continue to look for one you might be
interested in buying." CR>)
		      (<EQUAL? ,HERE ,MAIN-LIBRARY>
		       <TELL "There are many books in the library">
		       <COND (<EQUAL? ,SYEAR 2071>
			      <TELL
", although some of the shelves are empty and covered with dust">)>
		       <TELL "." CR>)
		      (T ;"Perelman's office"
		       <PERFORM ,V?TAKE ,BOOKS>
		       <RTRUE>)>)
	       (<VERB? TAKE>
		<COND (<EQUAL? ,HERE ,MAIN-LIBRARY>
		       <TELL "You don't have a library account." CR>)
		      (T
		       <TELL
"You can't take a book without paying for it." CR>)>)
	       (<AND <VERB? SMELL>
		     <EQUAL? ,HERE ,MAIN-LIBRARY>>
		<PERFORM ,V?SMELL ,MAIN-LIBRARY-OBJECT>
		<RTRUE>)>>

<OBJECT LIQUOR-STORE-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "liquor store")
	(SYNONYM STORE STORES SHOP SHOPS)
	(ADJECTIVE LIQUOR PACKAGE)
	(ACTION LIQUOR-STORE-OBJECT-F)>

<ROUTINE LIQUOR-STORE-OBJECT-F ()
	 <COND (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,LIQUOR-STORE>
		       <DO-WALK ,P?NORTH>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,LIQUOR-STORE>
		       <TELL ,LOOK-AROUND CR>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?SOUTH>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,LIQUOR-STORE>>
		<V-LOOK>)>>

<ROUTINE LIQUOR-STORE-ENTER-F ()
	 <COND (<AND <G? ,STIME 660>
		     <L? ,STIME 1320>>
		,LIQUOR-STORE)
	       (T
		<CLOSED-PRINT "The liquor store">
		<RFALSE>)>>

<ROOM LIQUOR-STORE
      (LOC ROOMS)
      (DESC "Liquor Store")
      (LDESC
"This is a small establishment stocked with cheap scotch and other liquor.
There is an exit to the north.")
      (NORTH TO WICKER-AND-PIER)
      (OUT TO WICKER-AND-PIER)
      (FLAGS ONBIT BADAREABIT)
      (GLOBAL LIQUOR-STORE-OBJECT)
      (ACTION LIQUOR-STORE-F)>

<ROUTINE LIQUOR-STORE-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<MOVE ,SPEAR-CARRIER ,HERE>
		<PUTP ,SPEAR-CARRIER ,P?SDESC "clerk">)
	       (<EQUAL? .RARG ,M-END>
		<SHOP-CLOSES 1320 "liquor store" "A clerk" ,WICKER-AND-PIER>)>>

<OBJECT SCOTCH
	(LOC LIQUOR-STORE)
	(DESC "bottle of cheap scotch")
	(SYNONYM BOTTLE BOTTLES SCOTCH BRAND)
	(ADJECTIVE CHEAP)
	(FLAGS TAKEBIT TRYTAKEBIT NDESCBIT)
	(SIZE 8)
	(ACTION SCOTCH-F)>

<ROUTINE SCOTCH-F ()
	 <COND (<VERB? BUY>
		<COND (<EQUAL? ,HERE ,LIQUOR-STORE>
		       <COND (<NOT <FSET? ,SCOTCH ,TRYTAKEBIT>>
			      <TELL
"On second thought, you decide you've already wasted enough on liquor." CR>
			      <RTRUE>)>
		       <TELL "You pick out a ">
		       <PRINTD ,SCOTCH>
		       <COND (<TOO-POOR 22 ,SCOTCH>
			      <RTRUE>)>
		       <MOVE ,SCOTCH ,PLAYER>
		       <FCLEAR ,SCOTCH ,TRYTAKEBIT>
		       <FCLEAR ,SCOTCH ,NDESCBIT>
		       <DEBIT 22>
		       <TELL "." CR>)
		      (<OR <EQUAL? ,HERE ,EZZIS-BAR ,BAR>
			   <AND <EQUAL? ,HERE ,BURGER-MEISTER>
				<EQUAL? ,SYEAR 2071>>>
		       <PERFORM ,V?BUY ,OTHER-LIQUOR>
		       <RTRUE>)
		      (T
		       <CANT-BUY ,SCOTCH>)>)
	       (<AND <VERB? TAKE OPEN DRINK>
		     <FSET? ,SCOTCH ,TRYTAKEBIT>>
		<PERFORM ,V?TAKE ,LIQUOR>
		<RTRUE>)
	       (<VERB? OPEN DRINK>
		<COND (<OR <IN-APARTMENT?>
			   ,MITCHELL-RAID-FLAG>
		       <TELL
"You open the bottle, take a swig, and close it again." CR>)
		      (T
		       <TELL
"Jill would kill you if you came home drunk." CR>)>)
	       (<VERB? CLOSE>
		<TELL "It is." CR>)
	       (<VERB? READ>
		<TELL "\"Hampton Scotch, 120 Proof\"" CR>)>>

<OBJECT BEER
	(LOC LOCAL-GLOBALS)
	(DESC "mug of beer")
	(LDESC "There is a tall mug of beer in front of you.")
	(SYNONYM DRINK BEER ALE GLASS MUG BREW)
	(ADJECTIVE TALL FOAMY MY)
	(FLAGS TAKEBIT)
	(ACTION BEER-F)>

<ROUTINE BEER-F ()
	 <COND (<VERB? BUY>
		<COND (<EQUAL? ,HERE ,EZZIS-BAR ,BAR ,BURGER-MEISTER>
		       <COND (<VISIBLE? ,BEER>
			      <TELL "You haven't finished your last one." CR>
			      <RTRUE>)>
		       <TELL "You give your card to the bartender">
		       <COND (<TOO-POOR 8 ,BEER>
			      <RTRUE>)>
		       <MOVE ,BEER ,HERE>
		       <DEBIT 8>
		       <TELL ". He gives you a tall, foamy mug of beer." CR>)
		      (<EQUAL? ,HERE ,LIQUOR-STORE>
		       <TELL
"The clerk says, \"Sorry, we don't usually got none.\"" CR>)
		      (<EQUAL? ,HERE ,ROYS-PAGODA>
		       <PERFORM ,V?BUY ,LIQUOR>
		       <RTRUE>)
		      (T
		       <CANT-BUY ,BEER>)>)
	       (<VERB? THROW>
		<TELL "You'd probably get thrown out." CR>)
	       (<VERB? DRINK>
		<MOVE ,BEER ,LOCAL-GLOBALS>
		<TELL
"You down the brew, and the bartender clears away the empty." CR>)>>

<OBJECT LIQUOR
	(LOC LIQUOR-STORE)
	(DESC "liquor")
	(SYNONYM DRINK LIQUOR BOOZE ALCOHOL)
	(FLAGS NARTICLEBIT NDESCBIT)
	(ACTION LIQUOR-F)>

<ROUTINE LIQUOR-F ()
	 <COND (<VERB? BUY>
		<COND (<EQUAL? ,HERE ,LIQUOR-STORE>
		       <PERFORM ,V?BUY ,SCOTCH>
		       <RTRUE>)
		      (<OR <EQUAL? ,HERE ,EZZIS-BAR ,BAR>
			   <AND <EQUAL? ,HERE ,BURGER-MEISTER>
				<EQUAL? ,SYEAR 2071>>>
		       <PERFORM ,V?BUY ,BEER>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,SIMONS ,THE-COACHMAN>
		       <TELL
"After a quick glance at the drink prices and the prices on the wine list,
you decide to abstain." CR>)
		      (<EQUAL? ,HERE ,ROYS-PAGODA>
		       <TELL "Roy's has no liquor license." CR>)
		      (T
		       <CANT-BUY ,OTHER-LIQUOR>)>)
	       (<VERB? TAKE>
		<TELL "You haven't paid for it!" CR>)>>

<OBJECT OTHER-LIQUOR
	(LOC LOCAL-GLOBALS)
	(DESC "liquor")
	(SYNONYM GLASS VODKA RUM WHISKEY WHISKY ALE SCHNAPPS LIQUEUR TEQUILA
	         WINE KAHLUA AMARETTO COGNAC PORT SHERRY BURGUNDY CHAMPAGNE)
	(FLAGS NARTICLEBIT)
	(ACTION OTHER-LIQUOR-F)>

<ROUTINE OTHER-LIQUOR-F ()
	 <COND (<VERB? BUY>
		<COND (<EQUAL? ,HERE ,LIQUOR-STORE>
		       <SETG P-IT-OBJECT ,SCOTCH>
		       <TELL
"You look for some, but they seem to be all out. The clerk recommends a
cheap brand of scotch that's on sale." CR>)
		      (<OR <EQUAL? ,HERE ,EZZIS-BAR ,BAR>
			   <AND <EQUAL? ,HERE ,BURGER-MEISTER>
				<EQUAL? ,SYEAR 2071>>>
		       <TELL
"The bartender tells you that they're all out, recommending beer instead." CR>)
		      (<EQUAL? ,HERE ,SIMONS ,THE-COACHMAN ,ROYS-PAGODA>
		       <PERFORM ,V?BUY ,LIQUOR>
		       <RTRUE>)
		      (T
		       <CANT-BUY ,OTHER-LIQUOR>)>)>>


;"TUBE system"

<OBJECT TUBE-STATION
	(LOC LOCAL-GLOBALS)
	(DESC "Tube station")
	(SYNONYM TUBES STATION SYSTEM)
	(ADJECTIVE TUBE TUBES)
	(ACTION TUBE-STATION-F)>

<ROUTINE TUBE-STATION-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,RED-TUBECAR ,BROWN-TUBECAR>
		       <DO-WALK ,P?OUT>)
		      (<FSET? ,HERE ,TUBEBIT>
		       <TELL ,LOOK-AROUND CR>)
		      (<GLOBAL-IN? ,TUBE-STATION ,HERE>
		       <DO-WALK ,P?DOWN>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,RED-TUBECAR ,BROWN-TUBECAR>
		       <DO-WALK ,P?OUT>)
		      (<FSET? ,HERE ,TUBEBIT>
		       <DO-WALK ,P?UP>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXAMINE>
		<COND (<FSET? ,HERE ,TUBEBIT>
		       <V-LOOK>)
		      (<EQUAL? ,SYEAR 2071>
		       <TELL
"Like the entire Tube system, the station is closed down." CR>)>)
	       (<AND <VERB? SMELL>
		     <EQUAL? ,HERE ,WICKER-AND-RIVER>
		     <NOT <EQUAL? ,SYEAR 2071>>>
		<PERFORM ,V?SMELL ,STAIRS>
		<RTRUE>)>>

<ROUTINE TUBES-ENTER-F ()
	 <COND (<EQUAL? ,SYEAR 2071>
		<SCORE 32> ;"2 points"
		<TELL "The Tube system closed five years ago!" CR>
		<RFALSE>)
	       (<AND <EQUAL? ,SYEAR 2051 2061>
		     <OR <L? ,STIME 420>
			 <G? ,STIME 1250>>>
		<TELL "As usual, the Tubes have closed for curfew." CR>
		<RFALSE>)
	       (<EQUAL? ,HERE ,HALLEY-PARK-WEST>
		,TUBE-AT-PARK)
	       (<EQUAL? ,HERE ,ROCKVIL-STADIUM>
		,TUBE-AT-STADIUM)
	       (<EQUAL? ,HERE ,SKYBUS-TERMINAL>
		,TUBE-JUNCTION)
	       (<EQUAL? ,HERE ,ELM-AND-UNIVERSITY>
		,TUBE-AT-UNIVERSITY)
	       (<EQUAL? ,HERE ,ELM-AND-RIVER>
		,TUBE-AT-HEIMAN)
	       (<EQUAL? ,HERE ,BODANSKI-SQUARE>
		,TUBE-AT-BODANSKI)
	       (<EQUAL? ,HERE ,TERMINAL>
		,TUBE-AT-AIRPORT)
	       (<EQUAL? ,HERE ,WICKER-AND-RIVER>
		,TUBE-AT-FACTORY)
	       (T
		<TELL "Bug #5X." CR>
		<RFALSE>)>>

<ROUTINE TUBE-STATION-DESC ("OPTIONAL" (BROWN <>))
	 <TELL
"You are on a platform between two sets of tracks which lie to the ">
	 <COND (.BROWN
		<TELL "northwest and southeast">)
	       (T
		<TELL "northeast and southwest">)>
	 <TELL ". On the wall is a ">
	 <COND (.BROWN
		<TELL "brown">)
	       (T
		<TELL "red">)>
	 <TELL " sign which reads:" CR>
	 <PERFORM ,V?READ ,TUBE-SIGN>
	 <TELL "A stairway leads up out of the station.">>

<ROUTINE DEBARK ()
	 <TELL "he doors open and ">
	 <COND (<L? ,STIME 360>
		<TELL "a few ">)>
	 <TELL "people begin boarding and debarking." CR>>

<ROOM TUBE-AT-STADIUM
      (LOC ROOMS)
      (DESC "Tube Station")
      (IN PER RED-TUBECAR-ENTER-F)
      (UP TO ROCKVIL-STADIUM)
      (OUT TO ROCKVIL-STADIUM)
      (NE PER RED-TUBECAR-ENTER-F)
      (SW PER RED-TUBECAR-ENTER-F)
      (FLAGS TUBEBIT)
      (GLOBAL TUBE-SIGN STAIRS STADIUM-OBJECT RAILROAD-TRACKS TUBE-STATION
       	      BOARDING-PLATFORM PEOPLE)
      (ACTION RED-TUBE-STATION-F)>

<ROOM TUBE-AT-PARK
      (LOC ROOMS)
      (DESC "Tube Station")
      (IN PER RED-TUBECAR-ENTER-F)
      (UP TO HALLEY-PARK-WEST)
      (OUT TO HALLEY-PARK-WEST)
      (NE PER RED-TUBECAR-ENTER-F)
      (SW PER RED-TUBECAR-ENTER-F)
      (FLAGS TUBEBIT)
      (GLOBAL TUBE-SIGN STAIRS RAILROAD-TRACKS TUBE-STATION BOARDING-PLATFORM
	      PEOPLE)
      (ACTION RED-TUBE-STATION-F)>

<ROOM TUBE-AT-HEIMAN
      (LOC ROOMS)
      (DESC "Tube Station")
      (IN PER RED-TUBECAR-ENTER-F)
      (UP TO ELM-AND-RIVER)
      (OUT TO ELM-AND-RIVER)
      (NE PER RED-TUBECAR-ENTER-F)
      (SW PER RED-TUBECAR-ENTER-F)
      (FLAGS TUBEBIT)
      (GLOBAL TUBE-SIGN STAIRS RAILROAD-TRACKS TUBE-STATION BOARDING-PLATFORM
	      PEOPLE)
      (ACTION RED-TUBE-STATION-F)>

<ROOM TUBE-AT-FACTORY
      (LOC ROOMS)
      (DESC "Tube Station")
      (IN PER RED-TUBECAR-ENTER-F)
      (UP TO WICKER-AND-RIVER)
      (OUT TO WICKER-AND-RIVER)
      (NE PER RED-TUBECAR-ENTER-F)
      (SW PER RED-TUBECAR-ENTER-F)
      (FLAGS TUBEBIT)
      (GLOBAL TUBE-SIGN STAIRS RAILROAD-TRACKS TUBE-STATION BOARDING-PLATFORM
       	      PEOPLE)
      (ACTION RED-TUBE-STATION-F)>

<ROUTINE RED-TUBE-STATION-F (RARG "AUX" (X <>))
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TUBE-STATION-DESC>)
	       (<AND <EQUAL? .RARG ,M-END>
		     <IN? ,RED-TUBECAR-OBJECT ,HERE>>
		<COND (<VERB? LOOK SAVE>
		       <SET X T>)
		      (<NOT <EQUAL? ,HERE ,L-HERE>>
		       <SET X T>)>
		<COND (.X
		       <TELL ,TUBECAR-WAITING>
		       <COND (,RED-NORTHBOUND
			      <TELL "northeast">)
			     (T
			      <TELL "southwest">)>
		       <TELL "." CR>)>)>>

<ROOM TUBE-AT-AIRPORT
      (LOC ROOMS)
      (DESC "Tube Station")
      (UP TO TERMINAL)
      (SE PER BROWN-TUBECAR-ENTER-F)
      (NW PER BROWN-TUBECAR-ENTER-F)
      (IN PER BROWN-TUBECAR-ENTER-F)
      (OUT TO TERMINAL)
      (FLAGS TUBEBIT)
      (GLOBAL STAIRS TUBE-SIGN AIRPORT-TERMINAL-OBJECT RAILROAD-TRACKS PEOPLE
       	      TUBE-STATION BOARDING-PLATFORM)
      (ACTION BROWN-TUBE-STATION-F)>

<ROOM TUBE-AT-BODANSKI
      (LOC ROOMS)
      (DESC "Tube Station")
      (UP TO BODANSKI-SQUARE)
      (SE PER BROWN-TUBECAR-ENTER-F)
      (NW PER BROWN-TUBECAR-ENTER-F)
      (IN PER BROWN-TUBECAR-ENTER-F)
      (OUT TO BODANSKI-SQUARE)
      (FLAGS TUBEBIT)
      (GLOBAL STAIRS TUBE-SIGN RAILROAD-TRACKS TUBE-STATION BOARDING-PLATFORM
       	      PEOPLE)
      (ACTION BROWN-TUBE-STATION-F)>

<ROOM TUBE-AT-UNIVERSITY
      (LOC ROOMS)
      (DESC "Tube Station")
      (UP TO ELM-AND-UNIVERSITY)
      (OUT TO ELM-AND-UNIVERSITY)
      (SE PER BROWN-TUBECAR-ENTER-F)
      (NW PER BROWN-TUBECAR-ENTER-F)
      (IN PER BROWN-TUBECAR-ENTER-F)
      (FLAGS TUBEBIT)
      (GLOBAL STAIRS TUBE-SIGN RAILROAD-TRACKS TUBE-STATION BOARDING-PLATFORM
       	      PEOPLE)
      (ACTION BROWN-TUBE-STATION-F)>

<ROUTINE BROWN-TUBE-STATION-F (RARG "AUX" (X <>))
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TUBE-STATION-DESC T>)
	       (<AND <EQUAL? .RARG ,M-END>
		     <IN? ,BROWN-TUBECAR-OBJECT ,HERE>>
		<COND (<VERB? LOOK SAVE>
		       <SET X T>)
		      (<NOT <EQUAL? ,HERE ,L-HERE>>
		       <SET X T>)>
		<COND (.X
		       <TELL ,TUBECAR-WAITING>
		       <COND (,BROWN-NORTHBOUND
			      <TELL "southeast">)
			     (T
			      <TELL "northwest">)>
		       <TELL "." CR>)>)>>

<ROOM TUBE-JUNCTION
      (LOC ROOMS)
      (DESC "Tube Station")
      (UP TO SKYBUS-TERMINAL)
      (DOWN SORRY "Stairs lead down to both the southwest and northeast.")
      (IN PER TUBECAR-AT-JUNCTION-ENTER-F)
      (OUT TO SKYBUS-TERMINAL)
      (NE PER RED-TUBECAR-ENTER-F)
      (NW PER BROWN-TUBECAR-ENTER-F)
      (SE PER BROWN-TUBECAR-ENTER-F)
      (SW PER RED-TUBECAR-ENTER-F)
      (FLAGS TUBEBIT)
      (GLOBAL STAIRS TUBE-SIGN SKYBUS-TERMINAL-OBJECT RAILROAD-TRACKS PEOPLE
       	      TUBE-STATION BOARDING-PLATFORM)
      (ACTION TUBE-JUNCTION-F)>

<ROUTINE TUBECAR-AT-JUNCTION-ENTER-F ()
	 <COND (<AND <VISIBLE? ,RED-TUBECAR-OBJECT>
		     <VISIBLE? ,BROWN-TUBECAR-OBJECT>>
		<TELL
"At the moment, there's more than one tubecar waiting to be boarded." CR>
		<RFALSE>)
	       (<VISIBLE? ,RED-TUBECAR-OBJECT>
		<MOVE ,RED-TUBECAR-OBJECT ,RED-TUBECAR>
		<MOVE ,RED-TUBECAR-DOOR ,RED-TUBECAR>
		,RED-TUBECAR)
	       (<VISIBLE? ,BROWN-TUBECAR-OBJECT>
		<MOVE ,BROWN-TUBECAR-OBJECT ,BROWN-TUBECAR>
		<MOVE ,BROWN-TUBECAR-DOOR ,BROWN-TUBECAR>
		,BROWN-TUBECAR)
	       (T
		<TELL "There are no tubecars in the station at the moment." CR>
		<RFALSE>)>>

<ROUTINE TUBE-JUNCTION-F (RARG "AUX" (RED <>) (BROWN <>) (BOTH <>) (X <>))
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are on a central platform between four sets of tracks. On the wall
is a sign, in brown and red:" CR>
		<PERFORM ,V?READ ,TUBE-SIGN>
		<TELL
"Tracks for the Brownline tubecars lie to the southeast and northwest.
Another pair of tracks, for the Redline, lie down some steps to the
southwest and northeast. A stairway leads up out of the station.">)
	       (<EQUAL? .RARG ,M-END>
		<COND (<VERB? LOOK SAVE>
		       <SET X T>)
		      (<NOT <EQUAL? ,HERE ,L-HERE>>
		       <SET X T>)>
		<COND (<NOT .X>
		       <RFALSE>)>
		<COND (<IN? ,RED-TUBECAR-OBJECT ,HERE>
		       <SET RED T>)>
	 	<COND (<IN? ,BROWN-TUBECAR-OBJECT ,HERE>
		       <SET BROWN T>
		       <COND (.RED
			      <SET BOTH T>)>)>
		<COND (<NOT <OR .RED .BROWN>>
		       <RFALSE>)
		      (T
		       <COND (.BOTH
			      <TELL "Tubecars are">)
			     (T
			      <TELL "A tubecar is">)>
		       <TELL " sitting on the tracks to the ">
		       <COND (.BROWN
			      <COND (,BROWN-NORTHBOUND
				     <TELL "southeast">)
				    (T
				     <TELL "northwest">)>)>
		       <COND (.BOTH
			      <TELL " and ">)>
		       <COND (.RED
			      <COND (,RED-NORTHBOUND
				     <TELL "northeast">)
				    (T
				     <TELL "southwest">)>)>
		       <TELL "." CR>)>)>>

<OBJECT RED-TUBECAR-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "red tubecar")
	(SYNONYM TUBECAR CAR TRAIN SUBWAY)
	(ADJECTIVE RED TUBE OMNI-FABB PLANT ROCKVIL STADIUM)
	(FLAGS NDESCBIT VEHBIT)
	(GENERIC GENERIC-TUBECAR-F)
	(ACTION RED-TUBECAR-OBJECT-F)>

<ROUTINE RED-TUBECAR-OBJECT-F ;("OPTIONAL" RARG) ()
	 <COND ;(.RARG
		<RFALSE>)
	       (<VERB? THROUGH BOARD>
		<COND (<EQUAL? ,HERE ,RED-TUBECAR>
		       <TELL "You've already done that." CR>)
		      (,RED-NORTHBOUND
		       <DO-WALK ,P?NE>)
		      (T
		       <DO-WALK ,P?SW>)>)
	       (<VERB? DISEMBARK LEAVE>
		<COND (<EQUAL? ,HERE ,RED-TUBECAR>
		       <DO-WALK ,P?OUT>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? WAIT-FOR>
		<V-WAIT 60>)>>

<ROOM RED-TUBECAR
      (LOC ROOMS)
      (DESC "Tubecar")
      (OUT PER RED-TUBECAR-EXIT-F)
      (FLAGS ONBIT)
      (GLOBAL TUBE-SIGN GRAFFITI TUBE-STATION PEOPLE)
      (ACTION TUBECAR-F)>

<OBJECT RED-TUBECAR-DOOR
	(LOC RED-TUBECAR)
	(DESC "red tubecar doors")
	(SYNONYM DOOR DOORS)
	(ADJECTIVE TUBECAR RED)
	(FLAGS DOORBIT NDESCBIT PLURALBIT)
	(ACTION RED-TUBECAR-DOOR-F)>

<ROUTINE RED-TUBECAR-DOOR-F ()
	 <COND (<VERB? THROUGH>
		<COND (<EQUAL? ,HERE ,RED-TUBECAR>
		       <DO-WALK ,P?OUT>)
		      (T
		       <PERFORM ,V?BOARD ,RED-TUBECAR-OBJECT>
		       <RTRUE>)>)
	       (<VERB? OPEN CLOSE>
		<TELL
"You can't --  the doors open and close automatically." CR>)>>

<OBJECT BROWN-TUBECAR-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "brown tubecar")
	(SYNONYM TUBECAR CAR TRAIN SUBWAY)
	(ADJECTIVE BROWN TUBE AIRPORT ROCKVIL UNIVERSIT)
	(FLAGS NDESCBIT VEHBIT)
	(GENERIC GENERIC-TUBECAR-F)
	(ACTION BROWN-TUBECAR-OBJECT-F)>

<ROUTINE BROWN-TUBECAR-OBJECT-F ;("OPTIONAL" RARG) ()
	 <COND ;(.RARG
		<RFALSE>)
	       (<VERB? THROUGH BOARD>
		<COND (<EQUAL? ,HERE ,BROWN-TUBECAR>
		       <TELL ,LOOK-AROUND CR>)
		      (,BROWN-NORTHBOUND
		       <DO-WALK ,P?SE>)
		      (T
		       <DO-WALK ,P?NW>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,BROWN-TUBECAR>
		       <DO-WALK ,P?OUT>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? WAIT-FOR>
		<V-WAIT 60>)>>

<ROOM BROWN-TUBECAR
      (LOC ROOMS)
      (DESC "Tubecar")
      (OUT PER BROWN-TUBECAR-EXIT-F)
      (FLAGS ONBIT)
      (GLOBAL TUBE-SIGN GRAFFITI TUBE-STATION PEOPLE)
      (ACTION TUBECAR-F)>

<ROUTINE TUBECAR-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "This is a typical tubecar, ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "clean and free of graffiti">)
		      (<EQUAL? ,SYEAR 2051>
		       <SCORE 114> ;"1 point"
		       <TELL "moderately clean and with a splash of graffiti">)
		      (T
		       <SCORE 115> ;"2 points"
		       <TELL "grimy and covered with layers of graffiti">)>
		<TELL ". The doors of the car are ">
		<COND (<OR <AND <EQUAL? ,HERE ,RED-TUBECAR>
				<FSET? ,RED-TUBECAR-DOOR ,OPENBIT>>
			   <AND <EQUAL? ,HERE ,BROWN-TUBECAR>
				<FSET? ,BROWN-TUBECAR-DOOR ,OPENBIT>>>
		       <TELL "open.">)
		      (T
		       <TELL "closed.">)>)>>

<OBJECT BROWN-TUBECAR-DOOR
	(LOC BROWN-TUBECAR)
	(DESC "brown tubecar doors")
	(SYNONYM DOOR DOORS)
	(ADJECTIVE TUBECAR BROWN)
	(FLAGS DOORBIT NDESCBIT PLURALBIT)
	(ACTION BROWN-TUBECAR-DOOR-F)>

<ROUTINE BROWN-TUBECAR-DOOR-F ()
	 <COND (<VERB? THROUGH>
		<COND (<EQUAL? ,HERE ,BROWN-TUBECAR>
		       <DO-WALK ,P?OUT>)
		      (T
		       <PERFORM ,V?BOARD ,BROWN-TUBECAR-OBJECT>
		       <RTRUE>)>)
	       (<VERB? OPEN CLOSE>
		<PERFORM ,V?OPEN ,RED-TUBECAR-DOOR>
		<RTRUE>)>>

<OBJECT TUBE-SIGN
	(LOC LOCAL-GLOBALS)
	(DESC "sign")
	(SYNONYM SIGN)
	(ADJECTIVE RED BROWN)
	(FLAGS READBIT)
	(ACTION TUBE-SIGN-F)>

<ROUTINE TUBE-SIGN-F ("AUX" CURRENT-STATION)
	 <COND (<EQUAL? ,HERE ,RED-TUBECAR>
		<SET CURRENT-STATION <GET ,RED-TABLE ,RED-POINTER>>)
	       (<EQUAL? ,HERE ,BROWN-TUBECAR>
		<SET CURRENT-STATION <GET ,BROWN-TABLE ,BROWN-POINTER>>)
	       (T
		<SET CURRENT-STATION <>>)>
	 <COND (<VERB? READ>
		<COND (<EQUAL? ,TUBE-AT-STADIUM ,HERE .CURRENT-STATION>
		       <TELL "      ">
		       <PRINTD ,ROCKVIL-STADIUM>
		       <TELL CR "  (Red Tubeline Terminus)" CR>)
		      (<EQUAL? TUBE-AT-PARK ,HERE .CURRENT-STATION>
		       <TELL
"  Halley Park|
  Rockvil Zoo" CR>)
		      (<EQUAL? ,TUBE-AT-HEIMAN ,HERE .CURRENT-STATION>
		       <TELL
"  Elm and River Street|
    (">
		       <PRINTD ,HEIMAN-VILLAGE>
		       <TELL ")" CR>)
		      (<EQUAL? ,TUBE-AT-FACTORY ,HERE .CURRENT-STATION>
		       <TELL
"  Wicker Drive and River Street|
     (Red Tubeline Terminus)|
        (Omni-Fabb Plant)" CR>)
		      (<EQUAL? ,TUBE-AT-AIRPORT ,HERE .CURRENT-STATION>
		       <TELL
"      Airport Terminals|
  (Brown Tubeline Terminus)" CR>)
		      (<EQUAL? ,TUBE-AT-BODANSKI ,HERE .CURRENT-STATION>
		       <COND (<NOT <EQUAL? ,SYEAR 2041>>
			      <TELL "   ">)> ;"to keep the top line centered"
		       <TELL "  ">
		       <PRINTD ,BODANSKI-SQUARE>
		       <CRLF>
		       <COND (<EQUAL? ,SYEAR 2041>
			      <TELL "  (Train Station)" CR>)
			     (T
			      <TELL "  (Church of God's Word)" CR>)>)
		      (<EQUAL? ,TUBE-AT-UNIVERSITY ,HERE .CURRENT-STATION>
		       <TELL "  Elm Street and University Avenue" CR>
		       <PRINT-SPACES 12>
		       <TELL "(Rockvil U)|
     (Brown Tubeline Terminus)" CR>)
		      (<EQUAL? ,TUBE-JUNCTION ,HERE .CURRENT-STATION>
		       <PRINT-SPACES 10>
		       <PRINTD ,SKYBUS-TERMINAL>
		       <TELL CR "  (Transfer Between Brown and Red)" CR>)
		      (<NOT <MOBY-VERB?>>
		       <CANT-SEE ,TUBE-SIGN>)>)>>

<GLOBAL RED-TUBECAR-IN-STATION <>>

<GLOBAL BROWN-TUBECAR-IN-STATION <>>

<GLOBAL RED-POINTER 2>

<GLOBAL BROWN-POINTER 0>

<GLOBAL RED-NORTHBOUND <>>

<GLOBAL BROWN-NORTHBOUND <>>

<GLOBAL RED-TABLE
	<TABLE
	 TUBE-AT-STADIUM
	 TUBE-AT-PARK
	 TUBE-JUNCTION
	 TUBE-AT-HEIMAN
	 TUBE-AT-FACTORY>>

<GLOBAL BROWN-TABLE
	<TABLE
	 TUBE-AT-AIRPORT
	 TUBE-AT-BODANSKI
	 TUBE-JUNCTION
	 TUBE-AT-UNIVERSITY>>

<ROUTINE I-RED-TUBE ("AUX" OLD-WINNER)
	 <COND (,RED-TUBECAR-IN-STATION
		<SETG RED-TUBECAR-IN-STATION <>>
		<FCLEAR ,RED-TUBECAR-DOOR ,OPENBIT>
		<COND (<EQUAL? ,SYEAR 2041>
		       <QUEUE I-RED-TUBE 4>)
		      (<EQUAL? ,SYEAR 2051>
		       <QUEUE I-RED-TUBE 6>)
		      (T
		       <QUEUE I-RED-TUBE 8>)>
		<MOVE ,RED-TUBECAR-OBJECT ,RED-TUBECAR>
		<MOVE ,RED-TUBECAR-DOOR ,RED-TUBECAR>
		<COND (<AND <EQUAL? ,HERE ,RED-TUBECAR>
			    ,RECORDING>
		       <PUT ,RECORDING-TABLE 8 1>)>
		<COND (<EQUAL? ,HERE ,RED-TUBECAR
			       	     <GET ,RED-TABLE ,RED-POINTER>>
		       <TELL CR "The ">
		       <PRINTD ,RED-TUBECAR-OBJECT>
		       <TELL
"'s doors slide shut, and it glides away from the station">
		       <COND (<EQUAL? ,RED-POINTER 0 4>
			      <TELL
" in the same direction that it came from">)>
		       <TELL "." CR>)
		      (T
		       <RFALSE>)>)
	       (T
		<COND (,RED-NORTHBOUND
		       <SETG RED-POINTER <- ,RED-POINTER 1>>)
		      (T
		       <SETG RED-POINTER <+ ,RED-POINTER 1>>)>
		<COND (<EQUAL? ,RED-POINTER 0>
		       <SETG RED-NORTHBOUND <>>)
		      (<EQUAL? ,RED-POINTER 4>
		       <SETG RED-NORTHBOUND T>)>
		<FSET ,RED-TUBECAR-DOOR ,OPENBIT>
		<SETG RED-TUBECAR-IN-STATION T>
		<COND (<EQUAL? ,SYEAR 2041>
		       <QUEUE I-RED-TUBE 2>)
		      (<EQUAL? ,SYEAR 2051>
		       <QUEUE I-RED-TUBE 3>)
		      (T
		       <QUEUE I-RED-TUBE 4>)>
		<COND (<EQUAL? ,HERE ,RED-TUBECAR>
		       <COND (,RECORDING
			      <PUT ,RECORDING-TABLE 8 1>)>
		       <TELL CR
"The tubecar glides into a station, and you can make out a sign reading:" CR>
		       <SET OLD-WINNER ,WINNER>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?READ ,TUBE-SIGN>
		       <SETG WINNER .OLD-WINNER>
		       <TELL
"The car comes to a stop and the doors slide open." CR>)
		      (T
		       <MOVE ,RED-TUBECAR-OBJECT <GET ,RED-TABLE ,RED-POINTER>>
		       <MOVE ,RED-TUBECAR-DOOR <GET ,RED-TABLE ,RED-POINTER>>
		       <COND (<EQUAL? ,HERE <GET ,RED-TABLE ,RED-POINTER>>
		       	      <SETG P-IT-OBJECT ,RED-TUBECAR-OBJECT>
			      <TELL CR "A ">
			      <PRINTD ,RED-TUBECAR-OBJECT>
			      <TELL ", marked \"">
		       	      <COND (<EQUAL? ,HERE ,TUBE-AT-FACTORY>
				     <TELL "Omni-Fabb Plant">)
				    (<OR ,RED-NORTHBOUND
					 <EQUAL? ,HERE ,TUBE-AT-STADIUM>>
				     <PRINTD ,ROCKVIL-STADIUM>)
				    (T
				     <TELL "Omni-Fabb Plant">)>
		       	      <TELL "\" whooshes into the station on the ">
		       	      <COND (,RED-NORTHBOUND
			      	     <TELL "northeast">)
			     	    (T
			      	     <TELL "southwest">)>
		       	      <TELL " set of tracks. ">
			      <COND (<EQUAL? ,HERE ,TUBE-AT-STADIUM
					     	   ,TUBE-AT-FACTORY>
				     <TELL "As the sign changes to \"">
				     <COND (<EQUAL? ,HERE ,TUBE-AT-STADIUM>
					    <TELL "Omni-Fabb Plant">)
					   (T
					    <PRINTD ,ROCKVIL-STADIUM>)>
				     <TELL ",\" t">)
				    (T
				     <TELL "T">)>
			      <DEBARK>)>)>)>>

<ROUTINE RED-TUBECAR-ENTER-F ()
	 <COND (<AND <PRSO? ,P?IN>
		     ,RED-TUBECAR-IN-STATION
		     <EQUAL? ,HERE <GET ,RED-TABLE ,RED-POINTER>>>
	        <MOVE ,RED-TUBECAR-OBJECT ,RED-TUBECAR>
		<MOVE ,RED-TUBECAR-DOOR ,RED-TUBECAR>
		,RED-TUBECAR)
	       (<AND <PRSO? ,P?NE>
		     ,RED-NORTHBOUND
		     ,RED-TUBECAR-IN-STATION
		     <EQUAL? ,HERE <GET ,RED-TABLE ,RED-POINTER>>>
		<MOVE ,RED-TUBECAR-OBJECT ,RED-TUBECAR>
		<MOVE ,RED-TUBECAR-DOOR ,RED-TUBECAR>
		,RED-TUBECAR)
	       (<AND <PRSO? ,P?SW>
		     <NOT ,RED-NORTHBOUND>
		     ,RED-TUBECAR-IN-STATION
		     <EQUAL? ,HERE <GET ,RED-TABLE ,RED-POINTER>>>
		<MOVE ,RED-TUBECAR-OBJECT ,RED-TUBECAR>
		<MOVE ,RED-TUBECAR-DOOR ,RED-TUBECAR>
		,RED-TUBECAR)
	       (T
		<TELL "There's no tubecar there at the moment." CR>
		<RFALSE>)>>

<ROUTINE RED-TUBECAR-EXIT-F ()
	 <COND (<FSET? ,RED-TUBECAR-DOOR ,OPENBIT>
		<MOVE ,RED-TUBECAR-OBJECT <GET ,RED-TABLE ,RED-POINTER>>
		<MOVE ,RED-TUBECAR-DOOR <GET ,RED-TABLE ,RED-POINTER>>
		<GET ,RED-TABLE ,RED-POINTER>)
	       (T
		<TELL "You can't leave the tubecar between stations!" CR>
		<RFALSE>)>>

<ROUTINE I-BROWN-TUBE ("AUX" OLD-WINNER)
	 <COND (,BROWN-TUBECAR-IN-STATION
		<SETG BROWN-TUBECAR-IN-STATION <>>
		<FCLEAR ,BROWN-TUBECAR-DOOR ,OPENBIT>
		<MOVE ,BROWN-TUBECAR-OBJECT ,BROWN-TUBECAR>
		<MOVE ,BROWN-TUBECAR-DOOR ,BROWN-TUBECAR>
		<COND (<AND <EQUAL? ,HERE ,BROWN-TUBECAR>
			    ,RECORDING>
		       <PUT ,RECORDING-TABLE 8 1>)>
		<COND (<EQUAL? ,SYEAR 2041>
		       <QUEUE I-BROWN-TUBE 4>)
		      (<EQUAL? ,SYEAR 2051>
		       <QUEUE I-BROWN-TUBE 6>)
		      (T
		       <QUEUE I-BROWN-TUBE 8>)>
		<COND (<EQUAL? ,HERE ,BROWN-TUBECAR
			       <GET ,BROWN-TABLE ,BROWN-POINTER>>
		       <TELL CR "The doors of the ">
		       <PRINTD ,BROWN-TUBECAR-OBJECT>
		       <TELL " slide shut, and it glides out of the station">
		       <COND (<EQUAL? ,BROWN-POINTER 0 3>
			      <TELL
" in the same direction that it came from">)>
		       <TELL "." CR>)
		      (T
		       <RFALSE>)>)
	       (T
		<COND (,BROWN-NORTHBOUND
		       <SETG BROWN-POINTER <- ,BROWN-POINTER 1>>)
		      (T
		       <SETG BROWN-POINTER <+ ,BROWN-POINTER 1>>)>
		<COND (<EQUAL? ,BROWN-POINTER 0>
		       <SETG BROWN-NORTHBOUND <>>)
		      (<EQUAL? ,BROWN-POINTER 3>
		       <SETG BROWN-NORTHBOUND T>)>
		<FSET ,BROWN-TUBECAR-DOOR ,OPENBIT>
		<SETG BROWN-TUBECAR-IN-STATION T>
		<COND (<EQUAL? ,SYEAR 2041>
		       <QUEUE I-BROWN-TUBE 2>)
		      (<EQUAL? ,SYEAR 2051>
		       <QUEUE I-BROWN-TUBE 3>)
		      (T
		       <QUEUE I-BROWN-TUBE 4>)>
		<COND (<EQUAL? ,HERE ,BROWN-TUBECAR>
		       <COND (,RECORDING
			      <PUT ,RECORDING-TABLE 8 1>)>
		       <TELL CR
"The tubecar glides into a station, and you can make out a sign reading:" CR>
		       <SET OLD-WINNER ,WINNER>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?READ ,TUBE-SIGN>
		       <SETG WINNER .OLD-WINNER>
		       <TELL
"The car comes to a stop and the doors slide open." CR>)
		      (T
		       <MOVE ,BROWN-TUBECAR-OBJECT
			     <GET ,BROWN-TABLE ,BROWN-POINTER>>
		       <MOVE ,BROWN-TUBECAR-DOOR
			     <GET ,BROWN-TABLE ,BROWN-POINTER>>
		       <COND (<EQUAL? ,HERE <GET ,BROWN-TABLE ,BROWN-POINTER>>
		       	      <SETG P-IT-OBJECT ,BROWN-TUBECAR-OBJECT>
			      <TELL CR "A ">
			      <PRINTD ,BROWN-TUBECAR-OBJECT>
			      <TELL ", marked \"">
		       	      <COND (<EQUAL? ,HERE ,TUBE-AT-UNIVERSITY>
				     <TELL "University">)
				    (<OR ,BROWN-NORTHBOUND
					 <EQUAL? ,HERE ,TUBE-AT-AIRPORT>>
				     <TELL "Airport">)
				    (T
				     <TELL "University">)>
		       	      <TELL "\" whooshes into the station on the ">
		       	      <COND (,BROWN-NORTHBOUND
				     <TELL "southeast">)
				    (T
				     <TELL "northwest">)>
			      <TELL " set of tracks. ">
			      <COND (<EQUAL? ,HERE ,TUBE-AT-AIRPORT
					     	   ,TUBE-AT-UNIVERSITY>
				     <TELL "As the sign changes to \"">
				     <COND (<EQUAL? ,HERE ,TUBE-AT-AIRPORT>
					    <TELL "University">)
					   (T
					    <TELL "Airport">)>
				     <TELL ",\" t">)
				    (T
				     <TELL "T">)>
			      <DEBARK>)>)>)>>

<ROUTINE BROWN-TUBECAR-ENTER-F ()
	 <COND (<PRSO? ,P?IN>
		<COND (<AND <EQUAL? ,HERE
				    <GET ,BROWN-TABLE ,BROWN-POINTER>>
			    ,BROWN-TUBECAR-IN-STATION>
		       <MOVE ,BROWN-TUBECAR-OBJECT ,BROWN-TUBECAR>
		       <MOVE ,BROWN-TUBECAR-DOOR ,BROWN-TUBECAR>
		       ,BROWN-TUBECAR)
		      (T
		       <TELL "There's no train here at the moment." CR>
		       <RFALSE>)>)
	       (<AND <PRSO? ,P?SE>
		     ,BROWN-NORTHBOUND
		     ,BROWN-TUBECAR-IN-STATION
		     <EQUAL? ,HERE <GET ,BROWN-TABLE ,BROWN-POINTER>>>
		<MOVE ,BROWN-TUBECAR-OBJECT ,BROWN-TUBECAR>
		<MOVE ,BROWN-TUBECAR-DOOR ,BROWN-TUBECAR>
		,BROWN-TUBECAR)
	       (<AND <PRSO? ,P?NW>
		     <NOT ,BROWN-NORTHBOUND>
		     ,BROWN-TUBECAR-IN-STATION
		     <EQUAL? ,HERE <GET ,BROWN-TABLE ,BROWN-POINTER>>>
		<MOVE ,BROWN-TUBECAR-OBJECT ,BROWN-TUBECAR>
		<MOVE ,BROWN-TUBECAR-DOOR ,BROWN-TUBECAR>
		,BROWN-TUBECAR)
	       (T
		<TELL "There's no tubecar there at the moment." CR>
		<RFALSE>)>>

<ROUTINE BROWN-TUBECAR-EXIT-F ()
	 <COND (<FSET? ,BROWN-TUBECAR-DOOR ,OPENBIT>
		<MOVE ,BROWN-TUBECAR-OBJECT 
		      <GET ,BROWN-TABLE ,BROWN-POINTER>>
		<MOVE ,BROWN-TUBECAR-DOOR
		      <GET ,BROWN-TABLE ,BROWN-POINTER>>
		<GET ,BROWN-TABLE ,BROWN-POINTER>)
	       (T
		<TELL "You can't leave the tubecar between stations!" CR>
		<RFALSE>)>>

;"city background"

<GLOBAL LIGHT-LEVEL 0> ;"0 = night, 3 = day"

<GLOBAL LAST-SUN-TIME 0>

<ROUTINE I-CITY-NOISES ()
	 <QUEUE I-CITY-NOISES <+ 6 <RANDOM 7>>>
	 <COND (<OR <NOT <FSET? ,HERE ,STREETBIT>>
		    <NOT <EQUAL? ,LIGHT-LEVEL 3>>
		    <FSET? ,HERE ,BADAREABIT>
		    <EQUAL? ,HERE ,AIRPORT-ENTRANCE ,BASE-GATE ,INTERCHANGE>
		    <EQUAL? ,SYEAR 2081>
		    <PROB 75>>
		<RFALSE>)
	       (<AND <EQUAL? ,HERE ,ROCKVIL-UNIVERSITY>
		     <EQUAL? ,SYEAR 2061 2071>>
		<RFALSE>)
	       (T
		<CRLF>
		<SETG FOLLOW-FLAG 9>
		<QUEUE I-UNFOLLOW 2>
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL <PICK-ONE ,2041-CITY-NOISES> CR>)
		      (<EQUAL? ,SYEAR 2051>
		       <TELL <PICK-ONE ,2051-CITY-NOISES> CR>)
		      (<EQUAL? ,SYEAR 2061>
		       <TELL <PICK-ONE ,2061-CITY-NOISES> CR>)
		      (<EQUAL? ,SYEAR 2071>
		       <TELL <PICK-ONE ,2071-CITY-NOISES> CR>)>
		<RFALSE>)>>

<GLOBAL 2041-CITY-NOISES
	<LTABLE
	 0
"A swirling wind catches a yellowed newspaper page, and blows it upward,
out of sight."
"The ground shakes as a huge truck rumbles down the street."
"You are startled as a taxi horn blares nearby."
"A skycopter drones by far overhead and disappears into the distance."
"Across the street, two policemen are frisking a youth. As you watch, they
usher the youth into a waiting car and fly off."
"A car alarm shrieks momentarily, then trails off into merciful silence."
"A stranger bumps against you, mumbles an apology, and is swallowed by
the crowds."
"A man with a shaved head asks your views on some obscure religious point,
then wanders off into the crowds.">>

<GLOBAL 2051-CITY-NOISES
	<LTABLE
	 0
"A swirling wind catches a yellowed newspaper page, and blows it upward,
out of sight."
"A panhandler is working his way towards you, but misses you in the crowds."
"A dog runs up to you, barking, then vanishes into the crowds."
"A squeal of rubber against asphalt announces a near-collision between
two road vehicles."
"Two youths wander past carrying loud porta-stereos."
"A policeman strolls past, nonchalantly swinging his club."
"A distant siren pierces the steady background noise of the city streets."
"A stranger bumps against you, mumbles an apology, and is swallowed by
the crowds.">>

<GLOBAL 2061-CITY-NOISES
	<LTABLE
	 0
"A distant siren pierces the steady background noise of the city streets."
"A police van pulls up, and two policemen load a sleeping drunk into the back."
"A pregnant woman walks past you, sobbing quietly. You turn, but she is gone,
swallowed up by the crowds."
"A BSF patrol is moving down the block, searching people indiscriminately.
Fortunately, they pass by without stopping you."
"A change in the wind brings you a sudden odor of something rotting. A moment
later, the odor is gone."
"A siren wails with increasing intensity, but then recedes without ever
revealing its source."
"A sharp crack, like a distant pistol shot, echoes among the buildings."
"A distant splintering explosion could only be the sound of another
skycar crash.">>

<GLOBAL 2071-CITY-NOISES
	<LTABLE
	 0
"A sudden gust of wind blows some dust and paper around."
"A thin teenager passes you, kicking a dented tin can."
"A BSF patrol is moving down the block, searching people indiscriminately.
Fortunately, they pass by without stopping you."
"A Church Police Paddywagon coasts slowly down the street, stopping
here and there to take someone prisoner."
"An ugly mob bearing signs and banners with Church symbols, possibly looking
for a lynching victim, appears down the street. You begin looking for a
hiding place, but fortunately the mob turns onto an adjoining street. You
stand frozen for a minute as the sounds from the mob recede."
"Out of the corner of your eye, you glimpse something that looks like a
panhandler being dragged into an alley, but when you turn, you see nothing."
"A woman dressed in gauzy red fabrics, quite obviously a prostitute, enters
a building with a man garbed in Church robes."
"A scream comes from a nearby building, but before you can even determine
the direction, it has stopped.">>

<ROUTINE I-MUG ("AUX" X)
	 <SET X <* <+ <- 3 ,LIGHT-LEVEL> 1> 10>> ;"range is 10 to 40"
	 <COND (<NOT <FSET? ,HERE ,OUTSIDEBIT>>
		<SET X 0>)
	       (<EQUAL? ,HERE ,ATHLETIC-FIELD>
		<SET X 0>)
	       (<NOT <OR <FSET? ,HERE ,BADAREABIT>
			 <FSET? ,HERE ,PARKBIT>>>
		<SET X </ .X 3>>) ;"Safe area? Chance is cut by one-third">
	 <COND (<PROB .X>
		<SCORE 125> ;"2 points"
		<INCREMENT-TIME 14>
		<SETG MUGGED T>
		<TELL CR
"CRACK! Something hits you from behind. As you crumple to the ground, you
catch a glimpse of someone wielding a metal bar. Unknown minutes later,
your head clears, and you stagger slowly to your feet">
		<COND (<FIRST? ,PLAYER>
		       <TELL ". Everything you were carrying is gone">
		       <ROB ,PLAYER ,LOCAL-GLOBALS>)>
		<TELL "." CR>)
	       (T
		<QUEUE I-MUG 7>
		<RFALSE>)>>

<GLOBAL BRUISED <>>

<GLOBAL MUGGED <>>

;"objects"

<OBJECT KEY
	(DESC "key")
	(SYNONYM KEY)
	(ADJECTIVE YOUR MY)
	(SIZE 2)
	(FLAGS TAKEBIT KEYBIT)
	(ACTION KEY-F)>

<ROUTINE KEY-F ()
	 <COND (<VERB? EXAMINE>
		<TELL "It's the key to the doors of your apartment">
		<COND (<EQUAL? ,SYEAR 2061 2071>
		       <TELL ", ">
		       <COND (<EQUAL? ,SYEAR 2061>
			      <TELL "slightly">)
			     (T
			      <TELL "very">)>
		       <TELL " worn with age">)>
		<TELL "." CR>)>>

<OBJECT WALLET
	(DESC "wallet")
	(SYNONYM WALLET)
	(ADJECTIVE YOUR MY)
	(SIZE 7)
	(CAPACITY 4)
	(FLAGS CONTBIT TAKEBIT SEARCHBIT)>

<OBJECT DRIVERS-LICENSE
	(LOC WALLET)
	(DESC "driver's license")
	(SYNONYM LICENSE)
	(ADJECTIVE YOUR MY DRIVER\'S DRIVERS)
	(SIZE 1)
	(FLAGS READBIT TAKEBIT)
	(TEXT
"\"Perry Simm   ID# 909-147-3838|
 Parkview Apartments, Southway|
 Rockvil, SD, Zone 55-18901\"")>

<GLOBAL CREDIT 0>

<OBJECT CREDIT-CARD
	(LOC WALLET)
	(DESC "credit card")
	(SYNONYM CARD)
	(ADJECTIVE YOUR MY CREDIT)
	(SIZE 1)
	(FLAGS READBIT TAKEBIT)
	(TEXT
"\"Perry Simm|
 Acct No 30867592-10\"")>

<OBJECT RATION-CARD
	(DESC "ration card")
	(SYNONYM CARD)
	(ADJECTIVE YOUR MY RATION)
	(SIZE 1)
	(FLAGS READBIT TAKEBIT)
	(TEXT
"\"Perry Simm|
 ID No 30867592-10|
 Class C\"")
	(ACTION RATION-CARD-F)>

<ROUTINE RATION-CARD-F ()
	 <COND (<AND <EQUAL? ,SYEAR 2071>
		     <VERB? GIVE SHOW>
		     <PRSI? ,SPEAR-CARRIER>
		     <EQUAL? ,HERE ,FOODVILLE-1 ,FOODVILLE-2>>
		<DISABLE <INT I-FOODVILLE>>
		<COND (<FSET? ,SOY-PATTY ,TOUCHBIT>
		       <TELL
"The clerk looks incensed and sets off a loud buzzer. \"You lousy
cheater,\" he screams, \"you've already had your ration for this
period!\" Two policemen, wearing patches depicting the familiar black
radar symbol of the Church, grab you and drag you off." CR CR>
		       <QUEUE I-JAIL <+ 30 <RANDOM 10>>>
	 	       <GOTO ,JAIL-CELL>)
		      (<EQUAL? <MOD ,SDATE 3> 2>
		       <MOVE ,SOY-PATTY ,PLAYER>
		       <FSET ,SOY-PATTY ,TOUCHBIT>
		       <MOVE ,RATION-CARD ,PLAYER>
		       <TELL
"The clerk electronically \"punches\" your card, hands it back, then
rudely thrusts a smelly package in your face. \"Move along, old man.
There's others waitin' ya know.\"" CR>)
		      (T
		       <SCORE 135> ;"2 points"
		       <MOVE ,RATION-CARD ,PLAYER>
		       <TELL
"The clerk tosses your card back at you in disgust. \"It's not your
day, you senile idiot.\" He motions to a bouncer, who pushes you
roughly out the door." CR CR>
		       <COND (<EQUAL? ,HERE ,FOODVILLE-1>
			      <GOTO ,SOUTHWAY-AND-PARK>)
			     (T
			      <GOTO ,MAIN-AND-WICKER>)>)>)>>

<OBJECT SLOT
	(LOC LOCAL-GLOBALS)
	(DESC "slot")
	(SYNONYM SLOT)
	(ADJECTIVE CREDIT CARD)
	(ACTION SLOT-F)>

<ROUTINE SLOT-F ()
	 <COND (<AND <EQUAL? ,HERE ,BODANSKI-SQUARE>
		     <EQUAL? ,SYEAR 2061 2071>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,SLOT>)
	       (<AND <EQUAL? ,HERE ,JOYBOOTH>
		     <EQUAL? ,SYEAR 2071>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,SLOT>)
	       (<AND <VERB? PUT>
		     <PRSO? ,CREDIT-CARD>>
		<MOVE ,CREDIT-CARD ,PLAYER>
		<COND (<AND <EQUAL? ,HERE ,JOYBOOTH>
			    <FSET? ,HEADSET ,WORNBIT>>
		       <COND (,JOYBOOTH-USED
			      <TELL
"You almost succumb and put your card in the slot again, but years of
warning messages about joybooth addiction finally prevail and prevent
you from going ahead with it." CR>
			      <RTRUE>)
			     (<L? ,CREDIT 12>
			      <TELL
"A small \"Insufficient Credit\" light flashes incessantly for a moment." CR>
			      <RTRUE>)>
		       <SETG JOYBOOTH-USED T>
		       <SETG CREDIT <- ,CREDIT 12>>
		       <SETG ELAPSED-TIME 30>
		       <TELL
"A wave of warm contentment washes over you as the joybooth, and the world,
recede. You barely notice as the headset probes the pleasure and imagination
centers of your brain, and you feel yourself moving down a tunnel of swirling
colors and lights, a warm breeze blowing in your face.|
|
The roller coaster whooshes out of the tunnel, and you scream, not from fear
but from the exhilaration of the experience. Rav, scrunched next to you in the
seat, laughs and laughs and laughs and Frita laughs and laughs and hands you
some cotton candy and suddenly the roller coaster is gone and the park is gone|
|
and you're swimming in a lake of warm clear water. Birds swoop and dive
overhead and land on your outstretched arms and sing little songs in your
ear and dart away as Father calls from the top of the stairs that dinner's
ready and you'd better be on time because it's your favorite cinnamon pie
for dessert and if you're not out of the lake in five minutes we'll miss
our bus and the vacation's almost over as a cloud passes in front of the
sun and a chill passes over you|
|
and you come to realize that you're ">
		       <COND (<EQUAL? <LOC ,PLAYER> ,SEAT>
			      <TELL "sitting">)
			     (T
			      <TELL "standing">)>
		       <TELL
" in a tiny, dim joybooth, shivering from imagined cold. You feel depressed
that the experience has ended; an almost physical longing to return to your
fantasy, to the lost innocence of a carefree childhood." CR>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,BODANSKI-SQUARE>
		       <PERFORM ,V?BUY ,NEWSPAPER>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,CINEMA>
		       <PERFORM ,V?BUY ,TICKET>
		       <RTRUE>)
		      (T
		       <TELL "Nothing happens." CR>)>)
	       (<AND <VERB? PUT>
		     <PRSO? ,DRIVERS-LICENSE ,RATION-CARD>>
		<TELL "Nothing happens." CR>)>>

;"spear carrier list:
  LIBRARIAN in Main Library
  NURSE in Hospital
  PROPRIETOR in Gun Shop, Book Store
  MAITRE D' in The Coachman, Simon's
  CLERK in Foodville, Hardware Store, Drug Store, Liquor Store
  DOORMAN and SECURITY GUARD throughout"

<OBJECT SPEAR-CARRIER
	(LOC LOCAL-GLOBALS)
	(SDESC "")
	(SYNONYM CLERK LIBRARIAN NURSE PROPRIETO PROPRIETE PROP BARTENDER
	 	 D\' DOORMAN GUARD MAN WAITER CASHIER TELLER ORDERLY)
	(ADJECTIVE MAITRE SECURITY)
	(FLAGS ACTORBIT NDESCBIT)
	(GENERIC GENERIC-GUARD-F)
	(ACTION SPEAR-CARRIER-F)>

<ROUTINE SPEAR-CARRIER-F ()
	 <COND (<EQUAL? ,WINNER ,SPEAR-CARRIER>
		<COND (<AND <EQUAL? ,HERE ,FOODVILLE-1 ,FOODVILLE-2>
			    ,CLERK-WAITING>
		       <I-FOODVILLE> ;"clerk is about to speak anyway")
		      (<AND <VERB? YES>
			    <EQUAL? ,HERE ,SIMONS ,THE-COACHMAN>
			    <EQUAL? ,MEAL-STATUS 1>>
		       <V-YES>)
		      (<AND <VERB? OPEN>
			    <PRSO? ,GATE>>
		       <DO-WALK ,P?NW>
		       <RTRUE>)
		      (<AND <VERB? TELL-ABOUT>
			    <PRSO? ,ME>>
		       <COND (<AND <PRSI? ,MAIN-LIBRARY-OBJECT>
				   <EQUAL? ,HERE ,MAIN-LIBRARY>>
			      <TELL
"The " D ,SPEAR-CARRIER " shrugs. \"It's not a bad place to work.\"" CR>)
			     (T
		       	      <TELL
"The " D ,SPEAR-CARRIER " gives you an odd look.">
		       	      <COND (<PRSO? ,MINDEX>
		       	       	     <TELL " \"It's an illegal drug.\"">)>
		       	      <CRLF>)>)
		      (<OR <AND <VERB? SHOW>
				<PRSO? ,GUN>
				<PRSI? ,ME>>
			   <AND <VERB? SSHOW>
			    	<PRSO? ,ME>
			    	<PRSI? ,GUN>>>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?BUY ,GUN>
		       <SETG WINNER ,SPEAR-CARRIER>
		       <RTRUE>)
		      (<OR <AND <VERB? SHOW>
				<PRSO? ,BOOKS>
				<PRSI? ,ME>>
			   <AND <VERB? SSHOW>
			    	<PRSO? ,ME>
			    	<PRSI? ,BOOKS>>>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?BUY ,BOOKS>
		       <SETG WINNER ,SPEAR-CARRIER>
		       <RTRUE>)
		      (<AND <VERB? SGIVE>
			    <PRSO? ,ME>>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?BUY ,PRSI>
		       <SETG WINNER ,SPEAR-CARRIER>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,MAIN-LIBRARY>
		       <TELL
"\"Ssshhh!\" hisses the librarian. \"Be quiet!\"" CR>
		       <CLEAR-BUF>)
		      (T
		       <SETG YES-NO-FLAG 12>
		       <QUEUE I-YES-NO 2>
		       <TELL "\"Can I help you?\"" CR>
		       <CLEAR-BUF>)>)
	       (<AND <EQUAL? ,HERE ,SIMONS ,THE-COACHMAN>
		     <VERB? WAIT-FOR>>
		<PERFORM ,V?BUY ,MEAL>
		<RTRUE>)
	       (<VERB? ASK-FOR>
		<COND (<PRSI? ,MENU>
		       <SETG PRSI ,MEAL>)>
		<COND (<AND <EQUAL? ,HERE ,MAIN-LIBRARY>
			    <PRSI? ,BOOK ,BOOKS>>
		       <PERFORM ,V?TAKE ,BOOKS>
		       <RTRUE>)
		      (T
		       <PERFORM ,V?BUY ,PRSI>
		       <RTRUE>)>)
	       (<AND <VERB? GIVE>
		     <PRSO? ,CREDIT-CARD>
		     <EQUAL? ,HERE ,SIMONS ,THE-COACHMAN>
		     <EQUAL? ,MEAL-STATUS 4>>
		<SETG WAITER-COUNTER 0>
		<MOVE ,CREDIT-CARD ,SPEAR-CARRIER>
		<QUEUE I-MEAL 9>
		<TELL
"\"Thank you, sir. I'll be back shortly with your meal.\"" CR>)
	       (<AND <VERB? GIVE>
		     <PRSO? ,CREDIT-CARD>
		     <EQUAL? <GETP ,SPEAR-CARRIER ,P?SDESC> "teller">>
		<TELL "You wait ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "a minute">)
		      (<EQUAL? ,SYEAR 2051>
		       <SETG ELAPSED-TIME 7>
		       <TELL "several minutes">)
		      (T
		       <SETG ELAPSED-TIME 22>
		       <TELL "a long time">)>
		<TELL
" for a teller to become available. You finally reach the teller, and hand
her your card, which she runs through a reader. Looking confused, she says
\"You only have one account, so there's no transfer to be performed.\"" CR>)
	       (<AND <VERB? CALL>
		     <EQUAL? ,HERE ,SIMONS ,THE-COACHMAN>>
		<COND (<EQUAL? ,MEAL-STATUS 1>
		       <TELL "He's right here." CR>)
		      (<EQUAL? ,MEAL-STATUS 2>
		       <SETG MEAL-STATUS 1> ;"so he'll ask PARTY OF ONE again"
		       <RTRUE> ;"unfortunately, will cause extra CR")
		      (T
		       <PERFORM ,V?BUY ,MEAL>
		       <RTRUE>)>)
	       (<AND <VERB? THANK>
		     <EQUAL? ,HERE ,BOOKSTORE>
		     <NOT <FSET? ,BOOK ,TRYTAKEBIT>>>
		<TELL
"\"No, my pleasure!\" The proprietor smiles kindly at you." CR>)
	       (<AND <VERB? FOLLOW>
		     <EQUAL? ,HERE ,SIMONS ,THE-COACHMAN>>
		<SETG FOLLOW-FLAG 9>
		<QUEUE I-UNFOLLOW 2>
		<MOVE ,SPEAR-CARRIER ,LOCAL-GLOBALS>
		<V-FOLLOW>
		<MOVE ,SPEAR-CARRIER ,HERE>)
	       (<AND <VERB? FOLLOW>
		     <EQUAL? ,FOLLOW-FLAG 13>>
		<DO-WALK ,P?SW>)	
	       ;(<VERB? ASK-ABOUT>
		<TELL "The " D ,SPEAR-CARRIER " gives you an odd look.">
		<COND (<PRSO? ,MINDEX>
		       <TELL " \"It's an illegal drug.\"">)>
		<CRLF>)>>