"GLOBALS for
			A MIND FOREVER VOYAGING
	(c) Copyright 1985 Infocom, Inc.  All Rights Reserved."

<OBJECT GLOBAL-OBJECTS
	(SYNONYM ZZMGCK)
	(FLAGS FURNITUREBIT BUFFERBIT VOWELBIT ;INTEGRALBIT MUNGEDBIT SEARCHBIT
	       TOUCHBIT INVISIBLE WORNBIT TAKEBIT DRINKBIT NARTICLEBIT
	       KLUDGEBIT KEYBIT PLURALBIT BADAREABIT DOORBIT TRANSBIT OPENBIT
	       TRYTAKEBIT SURFACEBIT READBIT PARKBIT ACTORBIT CONTBITS VEHBIT
	       NDESCBIT WEARBIT EATBIT ONBIT OUTSIDEBIT STREETBIT LIGHTBIT)>

<OBJECT LOCAL-GLOBALS
	(LOC GLOBAL-OBJECTS)
	(SYNONYM ZZMGCK)
	(DESCFCN 0)
        (GLOBAL GLOBAL-OBJECTS)
	(FDESC "F")
	(SDESC "F")
	(LDESC "F")
	;(PSEUDO "FOOBAR" V-WALK)
	(NORTH TO COMM-MODE)
	(SOUTH TO COMM-MODE)
	(EAST TO COMM-MODE)
	(WEST TO COMM-MODE)
	(NE TO COMM-MODE)
	(SE TO COMM-MODE)
	(NW TO COMM-MODE)
	(SW TO COMM-MODE)
	(SIZE 0)
	(TEXT "")
	(CAPACITY 0)>

<OBJECT ROOMS
	(IN TO ROOMS)>

<OBJECT INTNUM
	(LOC GLOBAL-OBJECTS)
	(DESC "number")
	(SYNONYM INTNUM)
	(ADJECTIVE NUMBER)>

;<OBJECT PSEUDO-OBJECT
	(DESC "pseudo")
	(ACTION ME-F)>

<OBJECT IT
	(LOC GLOBAL-OBJECTS)
	(SYNONYM IT THEM HER HIM)
	(DESC "it")
	(FLAGS VOWELBIT NARTICLEBIT NDESCBIT TOUCHBIT)>

<OBJECT NOT-HERE-OBJECT
	(DESC "it")
	(FLAGS NARTICLEBIT)
	(ACTION NOT-HERE-OBJECT-F)>

<ROUTINE NOT-HERE-OBJECT-F ("AUX" TBL (PRSO? T) OBJ (X <>))
	 <COND (<AND <PRSO? ,NOT-HERE-OBJECT>
		     <PRSI? ,NOT-HERE-OBJECT>>
		<TELL "[Those things aren't here!]" CR>
		<RTRUE>)
	       (<PRSO? ,NOT-HERE-OBJECT>
		<SET TBL ,P-PRSO>)
	       (T
		<SET TBL ,P-PRSI>
		<SET PRSO? <>>)>
	 <COND (<OR <AND .PRSO?
			 <PRSO-VERB?>>
		    <AND <NOT .PRSO?>
			 <PRSI-VERB?>>
		    <AND <NOT .PRSO?> ;"as in CLERK, SELL ME A CROWBAR"
			 <NOT <EQUAL? ,WINNER ,PLAYER>>
			 <VERB? SGIVE>
			 <PRSO? ,ME>>>
		<SET X T>
		<COND (<SET OBJ <FIND-NOT-HERE .TBL .PRSO?>>
		       <COND (<NOT <EQUAL? .OBJ ,NOT-HERE-OBJECT>>
			      <RTRUE>)>)
		      (T
		       <RFALSE>)>)>
	 ;"Here is the default 'cant see any' printer"
	 <COND (.X
		<TELL "[You'll have to be more specific.]" CR>)
	       (<AND <VERB? TELL CALL>
		     <EQUAL? ,P-XNAM ,W?JILL>
		     <IN-APARTMENT?>
		     <NOT <IN? ,JILL ,LOCAL-GLOBALS>>>
		<COND (<EQUAL? ,SYEAR 2041 2051>
		       <TELL
"\"I can't hear you, Perry!\" Jill shouts back. \"Come in here!\"" CR>)
		      (T
		       <TELL
"There's no reply; perhaps Jill didn't hear you from the other room." CR>)>)
	       (<EQUAL? ,WINNER ,PLAYER>
		<TELL "[You can't ">
		<COND (<EQUAL? ,P-XNAM ,W?CONVERSAT ,W?ALARM ,W?MUSIC>
		       <TELL "hear">)
		      (T
		       <TELL "see">)>
		<COND (<AND <NOT <NAME? ,P-XNAM>>
			    <NOT <EQUAL? ,P-XADJ ,W?MY>>>
		       <TELL " any">)
		      (<EQUAL? ,P-XNAM ,W?WIZARD ,W?OZ>
		       <TELL " any">)> 
		<NOT-HERE-PRINT .PRSO?>
		<TELL " here!]" CR>)
	       (T
		<COND (<EQUAL? ,MODE ,INTERFACE-MODE>
		       <TELL "Emitting signals of confusion,">)
		      (T
		       <TELL "Looking confused,">)>
		<ARTICLE ,WINNER T>
		<COND (<EQUAL? ,MODE ,INTERFACE-MODE>
		       <TELL " reports, \"This unit is unaware of">)
		      (T
		       <TELL " says, \"I don't see">)>
		<COND (<NOT <NAME? ,P-XNAM>>
		       <TELL " any">)>
		<NOT-HERE-PRINT .PRSO?>
		<TELL " here!\"" CR>)>
	 <CLEAR-BUF>
	 <RTRUE>>

<ROUTINE PRSO-VERB? ()
	<OR <EQUAL? ,PRSA ,V?FIND ,V?FOLLOW ,V?BUY>
	    <EQUAL? ,PRSA ,V?WHAT ,V?WHERE ,V?WHO>
	    <EQUAL? ,PRSA ,V?BUY-WITH ,V?WALK-TO ,V?WAIT-FOR>
	    <EQUAL? ,PRSA ;,V?CALL ,V?PAY-FOR>>>

<ROUTINE PRSI-VERB? ()
	<EQUAL? ,PRSA ,V?ASK-ABOUT ,V?ASK-FOR ,V?TELL-ABOUT>>

<ROUTINE FIND-NOT-HERE (TBL PRSO? "AUX" M-F OBJ)
;"Protocol: return T if case was handled and msg TELLed, NOT-HERE-OBJECT
  if 'can't see' msg TELLed, <> if PRSO/PRSI ready to use"
;"Special-case code goes here. <MOBY-FIND .TBL> returns # of matches.
  If 1, then P-MOBY-FOUND is it. You can treat the 0 and >1 cases alike
  or differently. Always return RFALSE (not handled) if you have resolved
  the problem."
	<SET M-F <MOBY-FIND .TBL>>
	;<COND (,DEBUG
	       <TELL "[Moby-Found " N .M-F " obj]" CR>)>
	<COND (<EQUAL? 1 .M-F>
	       ;<COND (,DEBUG
		      <TELL "[Namely: " D ,P-MOBY-FOUND "]" CR>)>
	       <COND (.PRSO?
		      <SETG PRSO ,P-MOBY-FOUND>
		      <SETG P-IT-OBJECT ,PRSO>)
		     (T
		      <SETG PRSI ,P-MOBY-FOUND>)>
	       <RFALSE>)
	      (<AND <L? 1 .M-F>
		    <SET OBJ <APPLY <GETP <SET OBJ <GET .TBL 1>> ,P?GENERIC>>>>
;"Protocol: returns .OBJ if that's the one to use
  		    ,NOT-HERE-OBJECT if case was handled and msg TELLed
		    <> if WHICH-PRINT should be called"
	       ;<COND (,DEBUG
		      <TELL "[Generic: " D .OBJ "]" CR>)>
	       <COND (<EQUAL? .OBJ ,NOT-HERE-OBJECT>
		      <RTRUE>)
		     (.PRSO?
		      <SETG PRSO .OBJ>
		      <SETG P-IT-OBJECT ,PRSO>)
		     (T
		      <SETG PRSI .OBJ>)>
	       <RFALSE>)
	      (T
	       ,NOT-HERE-OBJECT)>>

<ROUTINE NOT-HERE-PRINT (PRSO?)
	 <COND ;(<NAME? ,P-XNAM>
		<TELL "one by that name">)
	       (<OR ,P-OFLAG ,P-MERGED>
	        <COND (,P-XADJ
		       <COND (<EQUAL? ,P-XADJ ,W?MY>
			      <TELL " your">)
			     (T
		       	      <TELL " ">
		       	      <PRINTB ,P-XADJ>)>)>
	        <COND (,P-XNAM
		       <TELL " ">
		       <PRINTB ,P-XNAM>)>)
               (.PRSO?
	        <BUFFER-PRINT <GET ,P-ITBL ,P-NC1> <GET ,P-ITBL ,P-NC1L> <>>)
               (T
	        <BUFFER-PRINT <GET ,P-ITBL ,P-NC2> <GET ,P-ITBL ,P-NC2L> <>>)>>

<OBJECT GROUND
	(LOC GLOBAL-OBJECTS)
	(SYNONYM FLOOR GROUND MUD)
	(DESC "ground")
	(ACTION GROUND-F)>

<ROUTINE GROUND-F ()
	 <COND (<VERB? CLIMB-UP CLIMB-ON CLIMB-FOO BOARD LIE-DOWN SIT>
		<V-YELL>)
	       (<VERB? LOOK-UNDER>
		<V-COUNT>)
	       (<VERB? LEAVE>
		<DO-WALK ,P?UP>)>>

<OBJECT WALLS
	(LOC GLOBAL-OBJECTS)
	(FLAGS NDESCBIT TOUCHBIT)
	(DESC "wall")
	(SYNONYM WALL WALLS)
	(ACTION WALLS-F)>

<ROUTINE WALLS-F ()
	 <COND (<AND <EQUAL? ,HERE ,ROCKVIL-REFORMATORY>
		     <VERB? EXAMINE>>
		<TELL
"Huge monolithic walls, topped with guardposts and barbed wire,
separate this entrance area from the prison proper." CR>)>>

<OBJECT CEILING
	(LOC GLOBAL-OBJECTS)
	(FLAGS NDESCBIT TOUCHBIT)
	(DESC "ceiling")
	(SYNONYM CEILING ROOF)
	(ACTION CEILING-F)>

<ROUTINE CEILING-F ()
	 <COND (<VERB? LOOK-UNDER>
		<PERFORM ,V?LOOK>
		<RTRUE>)>>

<OBJECT HALLWAY
	(LOC LOCAL-GLOBALS)
	(DESC "hallway")
	(SYNONYM HALL HALLWAY CORRIDOR FOYER BREEZEWAY)
	(ADJECTIVE DARK BRIGHT AIRY)
	(ACTION HALLWAY-F)>

<ROUTINE HALLWAY-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,EPILOGUE-LIVING-ROOM>
		       <DO-WALK ,P?NORTH>)
		      (<EQUAL? ,HERE ,HOSPITAL-ANNEX ,EPILOGUE-BATHROOM>
		       <DO-WALK ,P?NE>)
		      (<EQUAL? ,HERE ,CINEMA>
		       <DO-WALK ,P?IN>)
		      (<EQUAL? ,HERE ,LIVING-ROOM>
		       <DO-WALK ,P?SOUTH>)
		      (<EQUAL? ,HERE ,HOSPITAL>
		       <DO-WALK ,P?SW>)
		      (<EQUAL? ,HERE ,DEN>
		       <DO-WALK ,P?WEST>)
		      (<EQUAL? ,HERE ,GUEST-ROOM>
		       <DO-WALK ,P?EAST>)
		      (<GLOBAL-IN? ,HALLWAY ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,PARKVIEW-HALL ,FOYER>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXAMINE LOOK-INSIDE>
		<COND (<EQUAL? ,HERE ,PARKVIEW-HALL ,FOYER>
		       <V-LOOK>)
		      (<EQUAL? ,HERE ,CINEMA>
		       <TELL "The hall to the theatres is dark." CR>)>)>>

<OBJECT BUILDING
	(LOC GLOBAL-OBJECTS)
	(DESC "building")
	(SYNONYM BUILDING APARTMENT BLDG BUILDINGS BLDGS STRUCTURE EDIFICE
	 	 EDIFICES)
	(ADJECTIVE APARTMENT)
	(ACTION BUILDING-F)>

<ROUTINE BUILDING-F ()
	 <COND (<VERB? THROUGH WALK-TO DISEMBARK LEAVE>
		<V-WALK-AROUND>)
	       (<VERB? EXAMINE>
		<COND (<OR <EQUAL? ,SYEAR 2081>
			   <EQUAL? ,HERE ,BURNED-OUT-AREA>>
		       <TELL "The buildings are all gutted." CR>)
		      (<AND <EQUAL? ,HERE ,CHURCH-ENTRANCE ,MIDLAND-AND-CHURCH
				    	  ,CONSTRUCTION-SITE-5>
			    <EQUAL? ,SYEAR 2071>>
		       <TELL "Nothing is left of the building ">
		       <COND (<EQUAL? ,HERE ,CHURCH-ENTRANCE>
			      <TELL "to the northwest ">)
			     (<EQUAL? ,HERE ,MIDLAND-AND-CHURCH>
			      <TELL "to the southwest ">)>
		       <TELL "excepts ruins." CR>)>)>>

<OBJECT STAIRS
	(LOC LOCAL-GLOBALS)
	(DESC "stairs")
	(SYNONYM STEP STEPS STAIR STAIRS STAIRWAY STAIRCASE STAIRWELL)
	(ADJECTIVE SEALED-OFF COVERED)
	(FLAGS NARTICLEBIT NDESCBIT)
	(ACTION STAIRS-F)>

<ROUTINE STAIRS-F ()
	 <COND (<VERB? CLIMB-UP CLIMB-FOO>
		<DO-WALK ,P?UP>)
	       (<VERB? CLIMB-DOWN>
		<DO-WALK ,P?DOWN>)
	       (<AND <VERB? SMELL>
		     <EQUAL? ,HERE ,WICKER-AND-RIVER>
		     <NOT <EQUAL? ,SYEAR 2071>>>
		<TELL
"There's an odor of urine from the Tube entrance." CR>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,SYEAR 2091>>
		<TELL "The curving stairway leads ">
		<COND (<EQUAL? ,HERE ,MASTER-BEDROOM>
		       <TELL "down to the living room." CR>)
		      (T
		       <TELL "up to the master bedroom." CR>)>)>>

<OBJECT UNOPENABLE-DOOR
	(LOC LOCAL-GLOBALS)
	(DESC "door")
	(SYNONYM DOOR DOORS)
	(ADJECTIVE SHATTERED GLASS)
	(FLAGS DOORBIT)
	(ACTION UNOPENABLE-DOOR-F)>

<ROUTINE UNOPENABLE-DOOR-F ()
	 <COND (<AND <VERB? OPEN UNLOCK>
		     <PRSI? ,KEY>>
		<TELL "Your key doesn't fit the lock." CR>)
	       (<VERB? OPEN>
		<TELL "The door is locked." CR>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,SYEAR 2071>
		     <EQUAL? ,HERE ,UNIVERSITY-HEIGHTS ,PARKVIEW-APARTMENTS
			     	   ,CHURCH-STREET-APARTMENTS>>
		<TELL "The cracked glass is held together by boards." CR>)>>

<OBJECT SLEEP
	(LOC GLOBAL-OBJECTS)
	(DESC "sleep")
	(SYNONYM SLEEP NAP)
	(FLAGS NARTICLEBIT)
	(ACTION SLEEP-F)>

<ROUTINE SLEEP-F ()
	 <COND (<VERB? TAKE WALK-TO>
		<V-SLEEP>)>>

;<OBJECT AIR
	(LOC GLOBAL-OBJECTS)
	(DESC "air")
	(SYNONYM AIR)
	(FLAGS VOWELBIT NARTICLEBIT)>

<OBJECT SMOKE
	(LOC LOCAL-GLOBALS)
	(DESC "smoke")
	(SYNONYM SMOKE BILLOW BILLOWS PILLAR PILLARS)
	(ADJECTIVE BLACK ASHY TOBACCO TREMENDOU THICK)
	(FLAGS NARTICLEBIT)
	(ACTION SMOKE-F)>

<ROUTINE SMOKE-F ()
	 <COND (<AND <VERB? WALK-TO>
		     <EQUAL? ,HERE ,MAIN-AND-WICKER>
		     <EQUAL? ,SYEAR 2081>>
		<DO-WALK ,P?SOUTH>)
	       (<AND <EQUAL? ,SYEAR 2071>
		     <EQUAL? ,HERE ,MAIN-AND-WICKER ,POWER-STATION
			     	   ,BURGER-MEISTER>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,SMOKE>)
	       (<VERB? SMELL>
		<COND (<EQUAL? ,HERE ,MAIN-AND-WICKER>
		       <TELL "You get a brief whiff of burning wood." CR>)
		      (<EQUAL? ,HERE ,POWER-STATION>
		       <TELL
"The smoke carries the pungent smell of high-sulfur coal." CR>)
		      (T
		       <TELL
"The tobacco smoke has a strong, bitter odor." CR>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,POWER-STATION>
		       <TELL
"The smoke billows upward in a thick, black pillar." CR>)
		      (<EQUAL? ,HERE ,MAIN-AND-WICKER>
		       <TELL
"The smoke rises from unseen fires south of here." CR>)>)>>

<OBJECT PLAY
	(LOC LOCAL-GLOBALS)
	(DESC "play")
	(SYNONYM PLAY PRODUCTION MUSICAL)
	(ACTION PLAY-F)>

<ROUTINE PLAY-F ()
	 <COND (<AND <VERB? EXAMINE THROUGH WALK-TO>
		     <EQUAL? ,HERE ,WELLS-THEATRE ,PICKFORD-THEATRE>>
		<TELL ,NO-TICKET CR>)>>

<OBJECT SKY
	(LOC GLOBAL-OBJECTS)
	(DESC "sky")
	(SYNONYM SKY)
	(ADJECTIVE DARKENING SMOGGY GRAY)
	(ACTION SKY-F)>

<ROUTINE SKY-F ()
	 <COND (<AND <NOT <FSET? ,HERE ,OUTSIDEBIT>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,SKY>)
	       (<AND <VERB? EXAMINE>
		     ,SIMULATING>
		<TELL "The sky is ">
		<COND (<EQUAL? ,LIGHT-LEVEL 0>
		       <TELL "dark">)
		      (<EQUAL? ,LIGHT-LEVEL 1 2>
		       <TELL "getting ">
		       <COND (<L? ,STIME 720>
			      <TELL "lighter">)
			     (T
			      <TELL "darker">)>)
		      (<EQUAL? ,SYEAR 2061 2071>
		       <SCORE 118> ;"2 points"
		       <TELL "gray and smoggy">)
		      (T
		       <TELL "light">)>
		<TELL "." CR>)>>

<OBJECT DAWN
	(LOC GLOBAL-OBJECTS)
	(DESC "dawn")
	(SYNONYM DAWN SUNRISE SUNUP)
	(ADJECTIVE MORNING)
	(FLAGS NARTICLEBIT)>

<OBJECT DUSK
	(LOC GLOBAL-OBJECTS)
	(DESC "dusk")
	(SYNONYM DUSK SUNSET SUNDOWN)
	(ADJECTIVE EVENING)
	(FLAGS NARTICLEBIT)>

<OBJECT NIGHT
	(LOC GLOBAL-OBJECTS)
	(DESC "night")
	(SYNONYM NIGHT NIGHTTIME NIGHTIME DARK DARKNESS)
	(ACTION NIGHT-F)>

<ROUTINE NIGHT-F ()
	 <COND (<VERB? WAIT-FOR>
		<PERFORM ,V?WAIT-FOR ,DUSK>
		<RTRUE>)
	       (<AND ,SIMULATING
		     <NOT <EQUAL? ,LIGHT-LEVEL 0>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,NIGHT>)
	       (<AND <NOT <EQUAL? ,HERE ,ROOFTOP>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,NIGHT>)>>

<OBJECT DAY
	(LOC GLOBAL-OBJECTS)
	(DESC "day")
	(SYNONYM DAY DAYTIME DAYLIGHT LIGHTNESS LIGHT SUNSHINE)
	(ACTION DAY-F)>

<ROUTINE DAY-F ()
	 <COND (<VERB? WAIT-FOR>
		<PERFORM ,V?WAIT-FOR ,DAWN>
		<RTRUE>)
	       (<AND ,SIMULATING
		     <EQUAL? ,LIGHT-LEVEL 0>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,DAY>)>>

<OBJECT NOON
	(LOC GLOBAL-OBJECTS)
	(DESC "noon")
	(SYNONYM NOON MIDDAY MID-DAY)
	(FLAGS NARTICLEBIT)>

<OBJECT MIDNIGHT
	(LOC GLOBAL-OBJECTS)
	(DESC "midnight")
	(SYNONYM MIDNIGHT)
	(FLAGS NARTICLEBIT)>

<OBJECT FLOODLIGHT
	(LOC LOCAL-GLOBALS)
	(DESC "floodlight")
	(SYNONYM SPOTLIGHT FLOODLIGHT)
	(ADJECTIVE HARSH POWERFUL)>

<OBJECT HANDS
	(LOC GLOBAL-OBJECTS)
	(SYNONYM HANDS HAND)
	(ADJECTIVE BARE MY YOUR)
	(DESC "your hands")
	(FLAGS NDESCBIT TOUCHBIT NARTICLEBIT PLURALBIT MYBIT)
	(ACTION HANDS-F)>

<ROUTINE HANDS-F (ACTOR)
	 <COND (<NOT ,SIMULATING>
		<TELL "You have no hands." CR>)
	       (<VERB? WAVE>
		<SETG PRSO <>>
		<PERFORM ,V?WAVE-AT>
		<RTRUE>)
	       (<VERB? SHAKE>
		<COND (<SET ACTOR <FIND-IN ,HERE ,ACTORBIT>>
		       <PERFORM ,V?THANK .ACTOR>
		       <RTRUE>)
		      (T
		       <TELL "Pleased to meet you." CR>)>)
	       (<VERB? WASH>
		<COND (<GLOBAL-IN? ,SINK ,HERE>
		       <TELL "Your hands are now cleaner." CR>)
		      (T
		       <TELL "There's no sink here!" CR>)>)>>

;<OBJECT TEETH
	(LOC GLOBAL-OBJECTS)
	(DESC "your teeth")
	(SYNONYM TEETH)
	(ADJECTIVE YOUR MY)
	(FLAGS NARTICLEBIT PLURALBIT MYBIT)>

<OBJECT HEAD
	(LOC GLOBAL-OBJECTS)
	(DESC "your head")
	(SYNONYM HEAD FACE)
	(ADJECTIVE YOUR MY)
	(FLAGS NARTICLEBIT MYBIT)
	(ACTION HEAD-F)>

<ROUTINE HEAD-F ()
	 <COND (<NOT ,SIMULATING>
		<TELL "You don't have a head, in the human sense." CR>)>>

;<OBJECT EYES
	(LOC GLOBAL-OBJECTS)
	(DESC "your eyes")
	(SYNONYM EYE EYES)
	(ADJECTIVE YOUR MY)
	(FLAGS NARTICLEBIT PLURALBIT MYBIT)
	(ACTION EYES-F)>

;<ROUTINE EYES-F ()
	 <COND (<VERB? OPEN>
		<TELL "They are." CR>)
	       (<VERB? CLOSE>
		<TELL "That won't help." CR>)>>

;<OBJECT EARS
	(LOC GLOBAL-OBJECTS)
	(DESC "your ears")
	(SYNONYM EAR EARS)
	(ADJECTIVE YOUR MY)
	(FLAGS NARTICLEBIT PLURALBIT MYBIT)>

<OBJECT PLAYER
	(LOC COMM-ROOM)
	(DESC "it")
	(FLAGS NDESCBIT INVISIBLE)
	(ACTION PLAYER-F)>

<ROUTINE PLAYER-F ()
	 <COND (,SIMULATING
		<RFALSE>)
	       (<AND <VERB? GIVE>
		     <PRSO? ,RECORD-BUFFER>>
		<RFALSE>)
	       (<VERB? BOARD CLIMB-DOWN CLIMB-FOO CLIMB-ON CLIMB-OVER CLIMB-UP
		       CROSS DISEMBARK ENTER FOLLOW HIDE LEAP LEAVE
		       LIE-DOWN SIT SKIP STAND STAND-ON WALK-AROUND>
		<TELL "A difficult task for an immobile computer." CR>)
	       (<VERB? CLOSE CUT DIG DROP GIVE KILL KNOCK MOVE MUNG OPEN POINT
		       PUSH PUT PUT-BEHIND PUT-ON PUT-UNDER TOUCH SHAKE THROW
		       ROB TAKE TIE TURN UNTIE WAVE WAVE-AT SEARCH KICK DANCE>
		<TELL "That would be a neat trick without appendages." CR>)
	       (<VERB? BITE KISS SMILE>
		<TELL "Your speakers are not equipped with mouths." CR>)
	       (<VERB? EAT DRINK>
		<TELL "You can't and don't need to." CR>)
	       (<VERB? SMELL>
		<TELL "You're not equipped with olfactory senses." CR>)>>

<OBJECT YOURSELF ;"for things like PERELMAN, TELL ME ABOUT YOURSELF"
	(LOC GLOBAL-OBJECTS)
	(DESC "it")
	(SYNONYM YOURSELF YOU)
	(FLAGS NARTICLEBIT VOWELBIT)
	(ACTION YOURSELF-F)>

<ROUTINE YOURSELF-F ()
	 <TELL "[It's not clear whom you're referring to.]" CR>>

<OBJECT ME
	(LOC GLOBAL-OBJECTS)
	(DESC "yourself")
	(SYNONYM I ME MYSELF SELF PERRY SIMM PRISM)
	(ADJECTIVE PERRY)
	(FLAGS ACTORBIT TOUCHBIT NARTICLEBIT)
	(ACTION ME-F)>

<ROUTINE ME-F ("AUX" OLIT) 
	 <COND (<VERB? TELL>
		<TELL
"Talking to yourself is a sign of impending mental collapse." CR>
		<CLEAR-BUF>)
	       (<VERB? LISTEN>
		<TELL "Yes?" CR>)
	       (<VERB? ALARM>
		<COND (<EQUAL? ,MODE ,SLEEP-MODE>
		       <TELL
"You are (although you haven't left Sleep Mode yet)." CR>)
		      (T
		       <TELL ,YOU-ARE CR>)>)
	       (<AND <VERB? GIVE>
		     <PRSI? ,ME>>
		<PERFORM ,V?TAKE ,PRSO>
		<RTRUE>)
	       (<VERB? MOVE>
		<V-WALK-AROUND>)
	       (<VERB? SEARCH>
		<V-INVENTORY>
		<RTRUE>)
	       (<VERB? KILL MUNG>
		<TELL "Dumb." CR>
		<RTRUE>)
	       ;(<VERB? FIND WHERE>
		<TELL "You're right here!" CR>)
	       (<VERB? FIND WHERE>
		<TELL "You're ">
		<COND (<FSET? ,HERE ,STREETBIT>
		       <TELL "at">)
		      (<EQUAL? ,HERE ,MAIN-STREET-BRIDGE ,RIVER-STREET-BRIDGE
			       ,PIER>
		       <TELL "on">)
		      (T
		       <TELL "in">)>
		<COND (<OR <EQUAL? ,HERE ,INTERFACE-ROOM ,SIMULATION-ROOM>
			   <EQUAL? ,HERE ,LIBRARY-ROOM ,SLEEP-ROOM ,COMM-ROOM>>
		       <ARTICLE ,MODE T>)
		      (T
		       <ARTICLE ,HERE T>)>
		<TELL "." CR>)
	       (<VERB? WHO>
		<COND (,SIMULATING
		       <TELL "Perry Simm." CR>)
		      (T
		       <TELL "PRISM." CR>)>)
	       (<VERB? FOLLOW>
		<TELL "It's difficult not to follow yourself." CR>)
	       (<VERB? EXAMINE>
		<COND (<NOT ,SIMULATING>
		       <TELL
"How can you look at yourself? You're spread out through many rooms in
several buildings, most of which don't have communication outlets!" CR>)
		      (<EQUAL? ,SYEAR 2081>
		       <TELL
"Through your torn clothes you can see malnutrition sores
on your thin, bony arms." CR>)
		      (<EQUAL? ,SYEAR 2071>
		       <TELL
"Your clothes are frayed, and your skin is beginning to show
the wrinkles of your sixty years." CR>)
		      (T
		       <TELL
"You look much as you always have: a normal, middle-aged male">
		       <COND (<EQUAL? ,SYEAR 2061>
			      <TELL
", perhaps a little older and a little grayer">)>
		       <TELL ". Your clothes are ">
		       <COND (<EQUAL? ,SYEAR 2061>
			      <TELL "a bit old and ratty." CR>)
			     (T
			      <TELL "simple but adequate." CR>)>)>)
	       (<VERB? WASH>
		<TELL "You're not dirty." CR>)
	       (<VERB? CALL>
		<V-COUNT>)>>

<OBJECT MY-NAME
	(LOC GLOBAL-OBJECTS)
	(DESC "your name")
	(SYNONYM NAME)
	(ADJECTIVE MY YOUR)
	(FLAGS NARTICLEBIT MYBIT)
	(ACTION MY-NAME-F)>

<ROUTINE MY-NAME-F ()
	 <COND (<VERB? WHAT>
		<PERFORM ,V?WHO ,ME>
		<RTRUE>)>>

<OBJECT CONVERSATION
	(LOC LOCAL-GLOBALS)
	(DESC "conversation")
	(SYNONYM BUZZ CONVERSAT)
	(FLAGS NDESCBIT)
	(ACTION CONVERSATION-F)>

<ROUTINE CONVERSATION-F ()
	 <COND (<AND <EQUAL? ,HERE ,DORM>
		     <NOT ,DORM-RAID-FLAG>>
		<TELL "[You can't hear any ">
		<PRINTD ,CONVERSATION>
		<TELL " here!]" CR>)
	       (<VERB? LISTEN>
		<COND (<EQUAL? ,HERE ,CONTROL-CENTER>
		       <TELL
"Even at maximum sensitivity, your aural receptors can't quite
make out the words of the ">
		       <PRINTD ,CONVERSATION>
		       <TELL "." CR>)
		      (T
		       <TELL "You can't make out any words." CR>)>)>>

<OBJECT MUSIC
	(LOC LOCAL-GLOBALS)
	(DESC "music")
	(SYNONYM MUSIC)
	(ADJECTIVE LOUD RAUCOUS DISTORTED MUFFLED)
	(FLAGS NARTICLEBIT)
	(ACTION MUSIC-F)>

<ROUTINE MUSIC-F ()
	 <COND (<AND <EQUAL? ,SYEAR 2061>
		     <EQUAL? ,HERE ,DORM>>
		<TELL "[You can't hear any music here!]" CR>)
	       (<VERB? LISTEN>
		<COND (<EQUAL? ,HERE ,BAR>
		       <PERFORM ,V?LISTEN ,JUKEBOX>
		       <RTRUE>)
		      (T
		       <TELL "The music is loud but muffled." CR>)>)>>

<OBJECT CRIME
	(LOC GLOBAL-OBJECTS)
	(DESC "crime")
	(SYNONYM CRIME MUGGING ROBBERY MURDER SHOOTING THEFT)>

<OBJECT CRIMINAL
	(LOC LOCAL-GLOBALS)
	(DESC "criminal")
	(SYNONYM CRIMINAL THIEF MURDERER MUGGER)>

<OBJECT DOORWAY
	(LOC GLOBAL-OBJECTS)
	(DESC "entrance")
	(SYNONYM DOOR DOORS ENTRANCE OPENING DOORWAY ARCH ARCHWAY
		 PORTAL PORTALS)
	(ADJECTIVE WIDE STEEL IMPRESSIV TALL ARCHED)
	(FLAGS VOWELBIT)
	(ACTION DOORWAY-F)>

<ROUTINE DOORWAY-F ()
	 <COND (<VERB? THROUGH>
		<V-WALK-AROUND>)
	       (<VERB? OPEN>
		<TELL "It is." CR>)
	       (<VERB? CLOSE>
		<TELL "That door doesn't close." CR>)
	       (<AND <VERB? SMELL>
		     <EQUAL? ,HERE ,WICKER-AND-RIVER>
		     <NOT <EQUAL? ,SYEAR 2071>>>
		<PERFORM ,V?SMELL ,STAIRS>
		<RTRUE>)
	       (<VERB? LOOK-INSIDE>
		<TELL
"You can't tell what's on the other side from here." CR>)>>

<OBJECT GLOBAL-ROOM
	(LOC GLOBAL-OBJECTS)
	(DESC "room")
	(SYNONYM ROOM CHAMBER PLACE HALL)
	(ADJECTIVE AREA)
	(ACTION GLOBAL-ROOM-F)>

<ROUTINE GLOBAL-ROOM-F ()
	 <COND (<VERB? LOOK EXAMINE LOOK-INSIDE>
		<V-LOOK>
		<RTRUE>)
	       (<VERB? THROUGH WALK-TO>
		<V-WALK-AROUND>)
	       (<VERB? LEAVE DISEMBARK>
		<DO-WALK ,P?OUT>)
	       (<VERB? WALK-AROUND>
		<TELL
"Walking around the room reveals nothing new. To move elsewhere, just type
the desired direction." CR>)
	       (<VERB? WASH>
		<COND (<IN-APARTMENT?>
		       <COND (,APARTMENT-RAID-FLAG
			      ;<COND (<AND <EQUAL? ,SYEAR 2051>
					  <NOT <EQUAL? ,JILL-COUNTER 13>>>
				     <RTRUE>)>
			      <TELL "You begin cleaning up the mess." CR>)
			     (<AND <EQUAL? ,JILL-COUNTER 9>
				   <IN? ,JILL ,HERE>>
			      <TELL ,MY-WEEK CR>)>)
		      (<AND <EQUAL? ,HERE ,FOODVILLE-1 ,FOODVILLE-2>
			    <EQUAL? ,SYEAR 2071 2081>>
		       <TELL "A hopeless job." CR>)>)>>

<OBJECT ALLEY-OBJECT
	(LOC GLOBAL-OBJECTS)
	(DESC "alley")
	(SYNONYM ALLEY)
	(ADJECTIVE LONG NARROW DIM)
	(FLAGS VOWELBIT)
	(ACTION ALLEY-OBJECT-F)>

<ROUTINE ALLEY-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,ALLEY>
		       <TELL ,LOOK-AROUND CR>)
		      (<EQUAL? ,HERE ,FACTORY-ENTRANCE>
		       <DO-WALK ,P?EAST>)
		      (<EQUAL? ,HERE ,BAR>
		       <DO-WALK ,P?WEST>)
		      (T
		       <V-WALK-AROUND>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,ALLEY>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,ALLEY>>
		<V-LOOK>)>>

<OBJECT STREET
	(LOC GLOBAL-OBJECTS)
	(DESC "road")
	(SYNONYM STREET ROAD AVENUE BOULEVARD BLVD DRIVE)
	(ADJECTIVE WIDE)
	(ACTION STREET-F)>

<ROUTINE STREET-F ()
	 <COND (<AND <NOT <FSET? ,HERE ,STREETBIT>>
		     <NOT <EQUAL? ,HERE ,ROOFTOP>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,STREET>)
	       (<VERB? CROSS>
		<TELL
"That's not useful; anything you could do or see
there, you can do or see here." CR>)
	       (<VERB? FOLLOW>
		<V-WALK-AROUND>)>>

<OBJECT PEOPLE
	(LOC LOCAL-GLOBALS)
	(DESC "people")
	(SYNONYM PEOPLE MEN WOMEN CROWD CROWDS MOB MOBS DINERS SERFS
	 	 MARKETEER STUDENTS)
	(ADJECTIVE FRENZIED BLOODTHIRSTY MEALTIME BLACK)
	(FLAGS NARTICLEBIT PLURALBIT)
	(ACTION PEOPLE-F)>

<ROUTINE PEOPLE-F ()
	 <COND (<IN? ,SABOTEURS ,HERE>
		<CHANGE-OBJECT ,PEOPLE ,SABOTEURS>)
	       (<AND <EQUAL? ,HERE ,ATHLETIC-FIELD>
		     <EQUAL? ,SYEAR 2061 2071>>
		<CHANGE-OBJECT ,PEOPLE ,CHILDREN>)
	       (<AND <EQUAL? ,LIGHT-LEVEL 0>
		     <FSET? ,HERE ,STREETBIT>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,PEOPLE>)
	       (<AND ,SIMULATING
		     <EQUAL? ,SYEAR 2081>>
		<CANT-SEE ,PEOPLE>)
	       (<AND <EQUAL? ,HERE ,CORE>
		     <NOT <IN? ,SABOTEURS ,HERE>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,PEOPLE>)
	       (<VERB? TELL>
		<TELL
"You can't speak to crowds of people, just individuals." CR>
		<CLEAR-BUF>)
	       (<AND <VERB? ASK-ABOUT TELL-ABOUT>
		     <PRSO? ,PEOPLE>>
		<PERFORM ,V?TELL ,PEOPLE>
		<RTRUE>)
	       (<VERB? FOLLOW>
		<V-WALK-AROUND>)
	       (<AND <VERB? WAIT-FOR>
		     <EQUAL? ,HERE ,CORE ,ROOFTOP>
		     <EQUAL? ,PART-FLAG 3>>
		<V-WAIT 120>)
	       (<AND <VERB? EXAMINE LISTEN>
		     <EQUAL? ,HERE ,ROCKVIL-STADIUM>
		     <EQUAL? ,SYEAR 2071>
		     <AND <L? ,STIME 1201>
			  <G? ,STIME 481>>>
		<TELL "The mob is frenzied and bloodthirsty." CR>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,BAR>>
		<PEOPLE-IN-BAR-DESC>
		<CRLF>)>>

<ROUTINE PEOPLE-IN-BAR-DESC ()
	 <TELL "The bar is filled with ">
	 <COND (<EQUAL? ,SYEAR 2071>
		<TELL "tough-looking serfs and black marketeers">)
	       (T
		<TELL "all sorts of sleazy lowlifes">)>
	 <TELL ".">>

<OBJECT RESIGNATION
	(LOC LOCAL-GLOBALS)
	(DESC "resignation")
	(SYNONYM RESIGNATION LETTER)
	(ADJECTIVE RESIGNATION YOUR)>

<OBJECT PARENTS
	(LOC GLOBAL-OBJECTS)
	(DESC "your parents")
	(SYNONYM PARENTS PARENT MOTHER FATHER MOM DAD)
	(ADJECTIVE MY)
	(FLAGS NARTICLEBIT PLURALBIT MYBIT)
	(ACTION PARENTS-F)>

<ROUTINE PARENTS-F ()
	 <COND (<AND <OR <INTBL? ,W?MOTHER ,P-NAMW 2>
		     	 <INTBL? ,W?MOM ,P-NAMW 2>>
		     <VISIBLE? ,JILL>>
		<CHANGE-OBJECT ,PARENTS ,JILL>)
	       (<AND <OR <INTBL? ,W?FATHER ,P-NAMW 2>
		     	 <INTBL? ,W?DAD ,P-NAMW 2>>
		     <IN-APARTMENT?>
		     <EQUAL? ,SYEAR 2041 2051>>
		<CHANGE-OBJECT ,PARENTS ,ME>)
	       (<NOT <MOBY-VERB?>>
		<CANT-SEE ,PARENTS>)>>

<OBJECT CLAVE
	(LOC LOCAL-GLOBALS)
	(DESC "Clave")
	(SYNONYM CLAVE CLAVIUS SIMM BROTHER)
	(ADJECTIVE MY CLAVE CLAVIUS)
	(FLAGS NARTICLEBIT ACTORBIT)>

<OBJECT RAV
	(LOC LOCAL-GLOBALS)
	(DESC "Rav and Frita")
	(SYNONYM RAV FRITA)
	(FLAGS ACTORBIT NARTICLEBIT)>

<OBJECT FYLA
	(LOC LOCAL-GLOBALS)
	(DESC "Fyla")
	(SYNONYM FYLA)
	(FLAGS ACTORBIT NARTICLEBIT)>

<OBJECT WARREN
	(LOC LOCAL-GLOBALS)
	(DESC "Emily Warren")
	(SYNONYM EMILY WARREN)
	(ADJECTIVE EMILY)
	(FLAGS ACTORBIT NARTICLEBIT VOWELBIT)>

<OBJECT PRICE
	(LOC LOCAL-GLOBALS)
	(DESC "Alyson Price")
	(SYNONYM ALYSON PRICE)
	(ADJECTIVE ALYSON)
	(FLAGS ACTORBIT NARTICLEBIT VOWELBIT)>

<OBJECT ESTHER
	(LOC LOCAL-GLOBALS)
	(DESC "Esther Perelman")
	(SYNONYM ESTHER PERELMAN DAUGHTER)
	(ADJECTIVE ESTHER YOUR ONLY)
	(FLAGS ACTORBIT VOWELBIT NARTICLEBIT)
	(GENERIC GENERIC-PERELMAN-F)>

<OBJECT FORTZMAN
	(LOC LOCAL-GLOBALS)
	(DESC "Eleanor Fortzman")
	(SYNONYM ELEANOR FORTZMAN)
	(ADJECTIVE ELEANOR)
	(FLAGS NARTICLEBIT VOWELBIT ACTORBIT)>

<OBJECT RANDU
	(LOC LOCAL-GLOBALS)
	(DESC "Aseejh Randu")
	(SYNONYM RANDU ASEEJH)
	(ADJECTIVE ASEEJH)
	(FLAGS NARTICLE VOWELBIT ACTORBIT)>

<OBJECT GOLD
	(LOC LOCAL-GLOBALS)
	(DESC "Vera Gold")
	(SYNONYM VERA GOLD ADMINISTR)
	(ADJECTIVE VERA CHIEF)
	(FLAGS ACTORBIT NARTICLEBIT)>

<OBJECT MINDEX
	(LOC DORM)
	(DESC "mindex")
	(SYNONYM MINDEX)
	(FLAGS NDESCBIT NARTICLEBIT)
	(ACTION MINDEX-F)>

<ROUTINE MINDEX-F ()
	 <COND (<AND <EQUAL? ,SYEAR 2061 2071>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,MINDEX>)
	       (<VERB? PUSH MOVE TOUCH>
		<TELL "Why do you think they call it \"dope?\"" CR>)
	       (<VERB? SMELL>
		<COND (,DORM-RAID-FLAG
		       <TELL "The odor has dissipated." CR>)
		      (T
		       <TELL "It smells typically sweet and prickly." CR>)>)
	       (<VERB? BUY>
		<CANT-BUY ,MINDEX>)>>

<OBJECT CLERKMATON
	(LOC LOCAL-GLOBALS)
	(DESC "clerkmaton")
	(SYNONYM CLERKMATO)>

<OBJECT SILVER-DOVE
	(LOC LOCAL-GLOBALS)
	(DESC "Silver Dove")
	(SYNONYM DOVE)
	(ADJECTIVE SILVER)>

"generic routines"

<ROUTINE GENERIC-APARTMENT-F ()
	 ,APARTMENT-OBJECT>

<ROUTINE GENERIC-MITCHELL-F ()
	 <COND (<EQUAL? ,P-NAM ,W?RAV>
		,RAV)
	       (<AND ,SIMULATING
		     <EQUAL? ,SYEAR 2041>>
		,BABY)
	       (T
		,MITCHELL)>>

<ROUTINE GENERIC-BOOK-F ()
	 <COND (<AND <VISIBLE? ,BOOK>
		     <VISIBLE? ,JILL-BOOK>>
		<RFALSE>)
	       (<AND <VISIBLE? ,BOOK>
		     <NOT <FSET? ,BOOK ,TRYTAKEBIT>>
		     <EQUAL? ,P-NAM ,W?BOOK>>
		,BOOK)
	       (T
		,BOOKS)>>

<ROUTINE GENERIC-TUBECAR-F ()
	 <COND (<AND <VISIBLE? ,RED-TUBECAR-OBJECT>
		     <VISIBLE? ,BROWN-TUBECAR-OBJECT>>
		<RFALSE>)
	       (<EQUAL? ,HERE ,TUBE-AT-UNIVERSITY ,TUBE-AT-BODANSKI
			      ,TUBE-AT-AIRPORT>
		,BROWN-TUBECAR-OBJECT)
	       (T
		,RED-TUBECAR-OBJECT)>>

<ROUTINE GENERIC-SODA-F ()
	 ,SODA>

<ROUTINE GENERIC-FOOD-F ()
	 <COND (<AND <VERB? BUY>
		     <EQUAL? ,P-NAM ,W?FOOD>
		     ;<OR <EQUAL? ,HERE ,THE-COACHMAN ,FOODVILLE-2
				  		      ,FOODVILLE-1>
			 <EQUAL? ,HERE ,ROYS-PAGODA ,SIMONS ,BURGER-MEISTER>>>
		,MEAL)
	       (<OR <VISIBLE? ,TURKEY-SANDWICH>
		    <VISIBLE? ,HAM-SANDWICH>
		    <VISIBLE? ,GRANOLA-CLUSTER>
		    <VISIBLE? ,APPLE>
		    <VISIBLE? ,GROCERIES>
		    <VISIBLE? ,SOY-PATTY>
		    <VISIBLE? ,SALAD>>
		<RFALSE>)
	       (T
	 	,MEAL)>>

<ROUTINE GENERIC-PERELMAN-F ()
	 ,PERELMAN>

<ROUTINE GENERIC-NEWSPAPER-F ()
	 ,NEWSPAPER>

<ROUTINE GENERIC-BED-F ()
	 ,BED>

<ROUTINE GENERIC-GUARD-F ()
	 <COND (<INTBL? ,W?BSF ,P-ADJW 2>	;<EQUAL? ,P-ADJ ,W?BSF>
		,BSF-BASE)
	       (<AND <NOT ,SIMULATING>
		     ,SEIGE>
		,NATIONAL-GUARDSMAN)
	       (<AND <EQUAL? ,HERE ,MAIN-AND-WICKER>
		     <VERB? FOLLOW>
		     <EQUAL? ,SYEAR 2051>>
		,SPEAR-CARRIER)
	       (T
		<PUTP ,SPEAR-CARRIER ,P?SDESC "security guard">
		,SPEAR-CARRIER)>>

<ROUTINE GENERIC-ROOM-F ()
	 <COND (<EQUAL? ,HERE ,DINING-ROOM>
		,DINING-ROOM-OBJECT)
	       (<EQUAL? ,HERE ,LIVING-ROOM ,EPILOGUE-LIVING-ROOM>
		,LIVING-ROOM-OBJECT)
	       (<EQUAL? ,HERE ,BEDROOM ,MASTER-BEDROOM>
		,BEDROOM-OBJECT)
	       (<EQUAL? ,HERE ,BATHROOM ,EPILOGUE-BATHROOM>
		,BATHROOM-OBJECT)
	       (<EQUAL? ,HERE ,SOLARIUM>
		,SOLARIUM-OBJECT)
	       (T
		,GLOBAL-ROOM)>>

<ROUTINE GENERIC-KITCHEN-F ()
	 ,KITCHEN-OBJECT>

<ROUTINE GENERIC-OFFICIAL-F ()
	 <COND (<EQUAL? ,HERE ,FIRST-METHODIST-CHURCH ,ST-MICHAELS>
		,CHURCH-OFFICIAL)
	       (T
		,GOVERNMENT-OFFICIAL)>>

;"Rockvil local-globals and shared stuff"

<OBJECT ROCKVIL-OBJECT
	(LOC GLOBAL-OBJECTS)
	(DESC "Rockvil")
	(SYNONYM ROCKVIL CITY)
	(FLAGS NARTICLEBIT)
	(ACTION ROCKVIL-OBJECT-F)>

<ROUTINE ROCKVIL-OBJECT-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (,SIMULATING
		       <TELL ,LOOK-AROUND CR>)
		      (T
		       <TELL "Try entering ">
		       <PRINTD ,SIMULATION-MODE>
		       <TELL "." CR>)>)
	       (<AND <NOT ,SIMULATING>
		     <NOT <EQUAL? ,HERE ,ROOFTOP>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,ROCKVIL-OBJECT>)
	       (<AND <EQUAL? ,HERE ,ROOFTOP>
		     <VERB? EXAMINE>>
		<TELL "All you can see of the city is a g">
		<COND (<OR <G? ,TIME 1155>
			   <L? ,TIME 430>>
		       <TELL "low">)
		      (T
		       <TELL "ray haze">)>
		<TELL " on the horizon." CR>)
	       (<AND <EQUAL? ,HERE ,SKYCAB>
		     <VERB? EXAMINE>>
		<TELL "The city is spread below you like a map." CR>)>>

<ROUTINE CANT-BUY (OBJ)
	 <TELL "You can't buy">
	 <ARTICLE .OBJ>
	 <TELL " here!" CR>>

<ROUTINE TOO-POOR (AMOUNT ITEM)
	 <COND (<L? ,CREDIT .AMOUNT>
		<TELL ", but are embarrassed when">
		<ARTICLE ,SPEAR-CARRIER>
		<TELL " returns with your card and">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL " politely">)
		      (<EQUAL? ,SYEAR 2051>
		       <TELL ", with a slight smirk,">)
		      (<EQUAL? ,SYEAR 2061>
		       <TELL " rudely">)
		      (<EQUAL? ,SYEAR 2071>
		       <TELL " almost abusively">)>
		<TELL
" informs you that you don't have enough funds in your account to cover the $"
N .AMOUNT " cost of">
		<ARTICLE .ITEM T>
		<TELL "." CR>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE DEBIT (AMOUNT)
	 <SETG CREDIT <- ,CREDIT .AMOUNT>>
	 <TELL ". After a moment,">
	 <ARTICLE ,SPEAR-CARRIER T>
	 <TELL
" returns your card, informing you that your account has been debited for $"
N .AMOUNT " and that your new balance is $" N ,CREDIT>>

<ROUTINE VENDING (VENDOR ITEM AMOUNT)
	 <TELL "You insert your card into the ">
	 <PRINTD .VENDOR>
	 <TELL ". A readout flashes \"">
	 <COND (<L? ,CREDIT .AMOUNT>
		<TELL
"INSUFFICIENT FUNDS\" and your card spits back into your hand." CR>)
	       (T
	        <FCLEAR .ITEM ,TRYTAKEBIT>
		<FCLEAR .ITEM ,NDESCBIT>
		<MOVE .ITEM ,PLAYER>
		<SETG CREDIT <- ,CREDIT .AMOUNT>>
		<TELL "NEW BALANCE: $" N ,CREDIT "\" and a ">
		<PRINTD .ITEM>
		<TELL " pops out into your hands." CR>)>>

<ROUTINE CLOSING-TIME (TIME LOC-STRING ACTOR-STRING NEW-LOC)
	 <COND (<G? ,STIME .TIME>
		<TELL CR
"An announcement heralds the closing of " .LOC-STRING
" for the evening, and " .ACTOR-STRING " shows you to the exit." CR CR>
		<COND (<EQUAL? ,HERE ,JOYBOOTH>
		       <MOVE ,HEADSET ,HERE>
		       <FSET ,HEADSET ,NDESCBIT>
		       <FCLEAR ,HEADSET ,WORNBIT>)>
		<GOTO .NEW-LOC>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE CURFEW-CLOSE (NEW-LOC)
	 <COND (<AND <G? ,STIME 1200>
		     <NOT <EQUAL? ,SYEAR 2041>>>
		<TELL CR
"Someone calls out something about \"getting late\" and \"we gotta
close up.\" You follow everyone out." CR CR>
		<MOVE ,BEER ,LOCAL-GLOBALS>
		<GOTO .NEW-LOC>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE RESTAURANT-CLOSES (NEW-LOC)
	 <COND (<AND <NOT <EQUAL? ,SYEAR 2041>>
		     <G? ,STIME 1200>>
		<TELL CR
"The waiter approaches. \"I'm sorry, but notice the hour.\" He ">
		<COND (<IN? ,CREDIT-CARD ,SPEAR-CARRIER>
		       <MOVE ,CREDIT-CARD ,PLAYER>
		       <TELL "returns your credit card and ">)>
		<TELL "leads you out." CR CR>
		<GOTO .NEW-LOC>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE SHOP-CLOSES (TIME LOC-STRING ACTOR-STRING NEW-LOC)
	 <COND (<G? ,STIME .TIME>
		<TELL CR
.ACTOR-STRING " informs you that the " .LOC-STRING
" is closing and ushers you to the door." CR CR>
		<GOTO .NEW-LOC>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE CLOSED-PRINT (LOC)
	 <COND (<AND <G? ,STIME 300>
		     <L? ,STIME 840>>
		<TELL .LOC " isn't open yet." CR>)
	       (T
		<TELL .LOC " seems to be closed for the night." CR>)>>

<ROUTINE SUBURBS-ENTER-F ()
	 <COND (<AND <EQUAL? ,HERE ,SOUTHWAY-UNDERPASS>
		     <EQUAL? ,SYEAR 2071>>
		<TELL "The collapsed highway blocks the road." CR>)
	       (T
		<SOUND 1>
		<TELL
"WARNING: You have reached the boundary of this simulation." CR>)>
	 <RFALSE>>

<ROUTINE OFFICE-BUILDING-ENTER-F ()
	 <COND (<OR <G? ,STIME 1120>
		    <L? ,STIME 475>>
		<CLOSED-PRINT "The building">)
	       (<EQUAL? ,SYEAR 2071>
		<SETG BRUISED T>
		<SCORE 98> ;"3 points"
		<TELL
"As soon as you enter, two thugs in security uniforms beat you up and drag
you out to the gutter. They laugh with mindless glee before returning to
the building." CR>)
	       (T
		<PUTP ,SPEAR-CARRIER ,P?SDESC "security guard">
		<SETG FOLLOW-FLAG 9>
		<QUEUE I-UNFOLLOW 2>
		<TELL
"As you enter, a security guard, seeing that you have no badge, ">
	 	<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "politely leads ">)
	       	      (<EQUAL? ,SYEAR 2061>
		       <SCORE 97> ;"1 point"
		       <TELL "roughly pushes ">)
		      (T
		       <TELL "escorts ">)>
		<TELL
"you back out to the street and then returns to the building." CR>)>
	 <RFALSE>>

<ROUTINE APARTMENT-ENTER-F ()
	 <COND (<EQUAL? ,SYEAR 2071>
		<SCORE 98> ;"3 points"
		<TELL
"As soon as you enter, a guard clubs you and tosses you out onto the
sidewalk. Passersby look away, giving you a wide berth." CR>)
	       (T
		<PUTP ,SPEAR-CARRIER ,P?SDESC "doorman">
		<SETG FOLLOW-FLAG 9>
		<QUEUE I-UNFOLLOW 2>
		<TELL "A ">
		<COND (<L? ,STIME 420>
		       <TELL "tired-looking ">)>
		<TELL "doorman, not recognizing you as a resident, ">
	 	<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "politely ">)
	       	      (<EQUAL? ,SYEAR 2061>
		       <SCORE 97> ;"1 point"
		       <TELL "roughly ">)>
		<TELL "turns you away before returning to the building." CR>)>
	 <RFALSE>>

<ROUTINE DESCRIBE-APARTMENT-VESTIBULE (IN-DIR OUT-DIR)
	 <TELL
"You are in the vestibule of a typical high-rise city apartment building.
A wide expanse of labelled buzzers and tiny mailboxes fills one wall. ">
	 <COND (<EQUAL? ,SYEAR 2061 2071>
		<SCORE 0> ;"2 points"
		<TELL
"The mailboxes have been extensively vandalized, and graffiti is
sprayed across every surface. ">)>
	 <COND (<EQUAL? ,SYEAR 2071>
		<TELL
"Shattered glass doors, held together by cheap wooden boards,">)
	       (T
		<TELL "Glass doors">)>
	 <TELL " lie ">
	 <COND (<AND <EQUAL? ,HERE ,PARKVIEW-APARTMENTS>
		     <FSET? ,PARKVIEW-DOOR ,OPENBIT>>
		<TELL "open">)
	       (T
		<TELL "closed">)>
	 <TELL " to the " .IN-DIR ". Next to this inner door is a ">
	 <COND (<EQUAL? ,SYEAR 2061 2071>
		<TELL "tangle of cords where a ">
		<PRINTD ,PICTUREPHONE>
		<TELL " has been ripped out by vandals">)
	       (T
		<PRINTD ,PICTUREPHONE>)>
	 <TELL ". The street lies to the " .OUT-DIR ".">>

<OBJECT BUZZERS
	(LOC LOCAL-GLOBALS)
	(DESC "buzzer")
	(SYNONYM BUZZER BUZZERS DOORBELL DOORBELLS)
	(ADJECTIVE LABELLED)
	(FLAGS NDESCBIT)
	(ACTION BUZZERS-F)>

<ROUTINE BUZZERS-F ()
	 <COND (<VERB? PUSH>
		<TELL
"You push one of the buzzers at random, but there's no response." CR>)
	       (<VERB? EXAMINE READ>
		<TELL
"The buzzers and mailboxes are all labelled with name after ordinary name."
;"a pastiche of handwritings, colored slips of paper, fading stick-on labels,
and an occasional neatly-typed slip.">
		<COND (<EQUAL? ,HERE ,PARKVIEW-APARTMENTS>
		       <TELL " One of the buzzers is, of course, yours.">)>
		<CRLF>)
	       (<VERB? COUNT>
		<TELL "Hundreds." CR>)>>

<OBJECT MAILBOXES
	(LOC LOCAL-GLOBALS)
	(DESC "mailbox")
	(SYNONYM MAILBOX MAILBOXES BOX BOXES)
	(ADJECTIVE VANDALIZE TINY MAIL)
	(ACTION MAILBOXES-F)>

<ROUTINE MAILBOXES-F ()
	 <COND (<VERB? OPEN>
		<COND (<PRSI? ,KEY>
		       ;<TELL "The key doesn't fit." CR>
		       <PERFORM ,V?UNLOCK ,MAILBOXES>
		       <RTRUE>)
		      (T
		       <TELL "The mailboxes are all locked." CR>)>)
	       (<VERB? UNLOCK>
		<TELL "You don't have the proper key." CR>)
	       (<VERB? READ COUNT>
		<PERFORM ,PRSA ,BUZZERS>
		<RTRUE>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,SYEAR 2061 2071>
		       <TELL
"The mailboxes are battered and covered with graffiti." CR>)
		      (T
		       <PERFORM ,V?OPEN ,MAILBOXES>
		       <RTRUE>)>)>>

<OBJECT PICTUREPHONE
	(LOC LOCAL-GLOBALS)
	(DESC "picturephone")
	(SYNONYM PHONE TELEPHONE PICTUREPH)
	(ADJECTIVE PICTURE)
	(ACTION PICTUREPHONE-F)>

<ROUTINE PICTUREPHONE-F ()
	 <COND (<EQUAL? ,SYEAR 2061 2071>
		<TELL "The ">
		<PRINTD ,PICTUREPHONE>
		<TELL " is gone, torn out of the wall." CR>)>>

<OBJECT LABEL
	(LOC GLOBAL-OBJECTS)
	(DESC "label")
	(SYNONYM LABEL LABELS)
	(ADJECTIVE MY)
	(ACTION LABEL-F)>

<ROUTINE LABEL-F ()
	 <COND (<INTBL? ,W?MY ,P-ADJW 2>	;<EQUAL? ,P-ADJ ,W?MY>
		<COND (<EQUAL? ,HERE ,PARKVIEW-APARTMENTS>
		       <CHANGE-OBJECT ,LABEL ,MY-BUZZER>)
		      (T
		       <TELL
"Your label isn't here; it's in the lobby of your apartment building!" CR>)>)
	       (<IN? ,BUZZERS ,HERE>
		<COND (<VERB? COUNT READ EXAMINE>
		       <PERFORM ,PRSA ,BUZZERS>
		       <RTRUE>)>)
	       (<AND <EQUAL? ,HERE ,FOODVILLE-1 ,FOODVILLE-2>
		     <EQUAL? ,SYEAR 2061>>
		<COND (<VERB? READ>
		       <TELL
"The labels on the tins of food are cheaply made and poorly applied." CR>)>)
	       (<VISIBLE? ,SCOTCH>
		<COND (<VERB? READ>
		       <PERFORM ,V?READ ,SCOTCH>
		       <RTRUE>)>)
	       (<NOT <MOBY-VERB?>>
		<CANT-SEE ,LABEL>)>>

<OBJECT GRAFFITI
	(LOC LOCAL-GLOBALS)
	(DESC "graffiti")
	(SYNONYM GRAFFITI)
	(FLAGS NARTICLEBIT READBIT)
	(ACTION GRAFFITI-F)>

<ROUTINE GRAFFITI-F ()
	 <COND (<OR <AND <EQUAL? ,HERE ,RED-TUBECAR ,BROWN-TUBECAR>
			 <EQUAL? ,SYEAR 2041>>
		    <AND <EQUAL? ,HERE ,CEMETERY ,ELM-UNDERPASS>
			 <EQUAL? ,SYEAR 2041 2051 2061>>
		    <AND <EQUAL? ,HERE ,CHURCH-STREET-PARK>
			 <EQUAL? ,SYEAR 2061 2071>>
		    <AND <EQUAL? ,HERE ,CHURCH-ENTRANCE ,HALLEY-PARK-EAST>
			 <EQUAL? ,SYEAR 2041 2051 2071>>
		    <AND <GLOBAL-IN? ,PICTUREPHONE ,HERE>
			 <EQUAL? ,SYEAR 2041 2051>>>
		<COND (<NOT <MOBY-VERB?>>
		       <CANT-SEE ,GRAFFITI>
		       <RTRUE>)>)>
	 <COND (<VERB? READ>
		<COND (<EQUAL? ,HERE ,CEMETERY>
		       <TELL "The ">
		       <PRINTD ,HEADSTONES>
		       <TELL " are defaced with anti-Catholic phrases." CR>)
		      (<OR <EQUAL? ,HERE ,CHURCH-STREET-PARK>
			   <AND <EQUAL? ,HERE ,RED-TUBECAR ,BROWN-TUBECAR>
				<EQUAL? ,SYEAR 2051>>>
		       <TELL
"The graffiti is ugly but inoffensive, mostly various
names and initials." CR>)
		      (<EQUAL? ,HERE ,ELM-UNDERPASS>
		       <TELL "\"Chinks Get Lost.\"" CR>)
		      (T
		       <TELL
"The graffiti is mostly obscene or racist." CR>)>)>>

<OBJECT GLOBAL-SIGN
	(LOC LOCAL-GLOBALS)
	(DESC "sign")
	(SYNONYM SIGN SIGNS BILLBOARD)
	(ADJECTIVE LARGE)
	(FLAGS READBIT)
	(ACTION GLOBAL-SIGN-F)>

<ROUTINE GLOBAL-SIGN-F ()
	 <COND (<AND <EQUAL? ,HERE ,KENNEDY-PARK>
		     <NOT <EQUAL? ,SYEAR 2061>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,GLOBAL-SIGN>)
	       (<AND <EQUAL? ,HERE ,MAIN-AND-WICKER>
		     <NOT <EQUAL? ,SYEAR 2071 2081>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,GLOBAL-SIGN>)
	       (<AND <EQUAL? ,HERE ,CONSTRUCTION-SITE-1 ,CONSTRUCTION-SITE-2
			     ,MAIN-AND-RIVER>
		     <NOT <EQUAL? ,SYEAR 2041>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,GLOBAL-SIGN>)
	       (<AND <OR <EQUAL? ,HERE ,SOUTHWAY-AND-PARK ,SYMPHONY-ENTRANCE>
			 <EQUAL? ,HERE ,SKYCAR-LOT-6 ,SKYCAR-LOT-7 ,ZOO>>
		     <NOT <EQUAL? ,SYEAR 2071>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,GLOBAL-SIGN>)
	       (<AND <EQUAL? ,HERE ,POST-OFFICE ,MUSEUM-ENTRANCE
			     	   ,RIVERSIDE-PARK>
		     <EQUAL? ,SYEAR 2041 2051>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,GLOBAL-SIGN>)
	       (<NOT <VERB? READ EXAMINE>>
		<RFALSE>)
	       (<EQUAL? ,HERE ,KENNEDY-PARK>
		<TELL
"   \"KENNEDY PARK CONDOMINIUMS|
    Elegant Urban Living|
    Opening December 15, 2061|
    Rockvil Development Corp.\"" CR>)
	       (<EQUAL? ,HERE ,POST-OFFICE>
		<TELL "\"Open daily, ">
		<COND (<EQUAL? ,SYEAR 2061>
		       <TELL "10a">)
		      (T
			<TELL "3p">)>
		<TELL "m to 4pm.\"" CR>)
	       (<EQUAL? ,HERE ,CONSTRUCTION-SITE-1>
		<TELL
"  \"First Continent Bank Building|
   6,000 sq. meters of office space|
   Opening September 1, 2042\"" CR>)
	       (<EQUAL? ,HERE ,CONSTRUCTION-SITE-2>
		<TELL "    ">
		<PRINTD ,HEIMAN-VILLAGE>
		<TELL " Two|
 ** City Within a City **|
   Opening July 8, 2042" CR>)
	       (<AND <EQUAL? ,HERE MAIN-AND-WICKER>
	             <EQUAL? ,SYEAR 2081>>
	        <SCORE 38> ;"6 points"
		<TELL
"\"Buxton/Briggs territory begins here. Outsiders will be
killed on sight.\"" CR>)
	       (<EQUAL? ,HERE ,SOUTHWAY-AND-PARK ,MAIN-AND-WICKER>
		<TELL "\"Rations for ">
		<COND (<EQUAL? <MOD ,SDATE 3> 0>
		       <TELL "1's, 2's and 3's">)
		      (<EQUAL? <MOD ,SDATE 3> 1>
		       <TELL "4's, 5's and 6's">)
		      (T
		       <TELL "7's, 8's, 9's and 10's">)>
		<TELL " today.\"" CR>)
	       (<EQUAL? ,HERE ,SKYCAR-LOT-6 ,SKYCAR-LOT-7 ,SYMPHONY-ENTRANCE>
		<TELL ,SYMPHONY-CLOSED CR>)
	       (<EQUAL? ,HERE ,MUSEUM-ENTRANCE ,RIVERSIDE-PARK>
		<TELL
"\"Closed for remodeling. Re-opening September 2058.\"" CR>)
	       (<EQUAL? ,HERE ,ZOO>
                <TELL
"The signs on the cages, crudely made, read \"EXTINCT.\"" CR>)
	       (T
		<TELL
"The billboard advertises office space within the building." CR>)>>

<OBJECT GLOBAL-WINDOW
	(LOC LOCAL-GLOBALS)
	(DESC "window")
	(SYNONYM WINDOW WINDOWS)
	(ADJECTIVE BROKEN TALL LARGE HUGE PLATE GLASS SHATTERED TINTED
		   ZERO-GLARE)
	(FLAGS TRANSBIT)
	(ACTION GLOBAL-WINDOW-F)>

<ROUTINE GLOBAL-WINDOW-F ()
	 <COND (<EQUAL? ,HERE ,POST-OFFICE>
		<COND (<AND <VERB? LOOK-INSIDE EXAMINE OPEN>
			    <EQUAL? ,SYEAR 2071>
			    <OR <L? ,STIME 900>
				<G? ,STIME 960>>>
			<TELL "The window is shut tight." CR>)
		      (<VERB? LOOK-INSIDE>
		       <TELL "You see a typical back room of a ">
		       <PRINTD ,POST-OFFICE-OBJECT>
		       <TELL "." CR>)>)
	       (<VERB? OPEN>
		<TELL "This window cannot be opened." CR>)
	       (<VERB? CLOSE>
		<TELL "It is." CR>)
	       (<EQUAL? ,HERE ,SOUTHWAY-AND-PARK ,MAIN-AND-WICKER>
		<COND (<VERB? LOOK-INSIDE EXAMINE>
		       <TELL "The window is ">
		       <COND (<EQUAL? ,SYEAR 2041>
		       	      <TELL "brightly lit and heaped with food">)
			     (<EQUAL? ,SYEAR 2051>
		       	      <TELL "filled with food">)
			     (<EQUAL? ,SYEAR 2061>
			      <TELL "dimly-lit, with sparse stacks of cans">)
			     (<EQUAL? ,SYEAR 2071>
		       	      <TELL
"too grimy to see through. There is a sign in the window">)
			     (T
			      <TELL "completely shattered">)>
		       <TELL "." CR>)>)
	       (<EQUAL? ,HERE ,ELM-UNDERPASS>
		<COND (<AND <VERB? EXAMINE>
			    <EQUAL? ,SYEAR 2071>>
		       <TELL "There is graffiti painted on the window." CR>)
		      (<VERB? LOOK-INSIDE EXAMINE>
		       <TELL
"You can see the interior of a Chinese restaurant." CR>)>)
	       (<AND <EQUAL? ,HERE ,RAILROAD-MUSEUM>
		     <VERB? LOOK-INSIDE>>
		<TELL "You can see the old ">
		<PRINTD ,RAILROAD-YARD>
		<TELL "s." CR>)
	       (<EQUAL? ,HERE ,BURNED-OUT-AREA>
		<COND (<VERB? LOOK-INSIDE>
		       <TELL
"It's too dark inside the abandoned buildings to see anything." CR>)
		      (<VERB? EXAMINE>
		       <TELL
"Almost all the windows in sight are broken or boarded over." CR>)>)
	       (<EQUAL? ,HERE ,WICKER-AND-PIER>
		<COND (<EQUAL? ,SYEAR 2071>
		       <COND (<VERB? EXAMINE>
			      <TELL "The window is grimy." CR>)
			     (<VERB? LOOK-INSIDE>
			      <TELL "The bookstore looks deserted." CR>)>)
		      (T
		       <COND (<VERB? EXAMINE>
			      <TELL "The window is clean and shiny." CR>)
			     (<VERB? LOOK-INSIDE>
			      <TELL
"You see the interior of a small bookstore." CR>)>)>)
	       (<AND <EQUAL? ,HERE ,CAFETERIA>
		     <VERB? LOOK-INSIDE>>
		<TELL "You can see a wide expanse of lush green grass." CR>)
	       (<AND <EQUAL? ,HERE ,MASTER-BEDROOM>
		     <VERB? LOOK-INSIDE>>
		<TELL
"The windows are set into the upper part of the wall; all you can see
is a sunny sky." CR>)
	       (<AND <EQUAL? ,HERE ,SKYCAB>
		     <VERB? LOOK-INSIDE>>
		<TELL "Rockvil continues to glide by below you:" CR>)>>

<OBJECT GLASS
	(LOC LOCAL-GLOBALS)
	(DESC "glass")
	(SYNONYM GLASS)
	(ADJECTIVE BROKEN SHATTERED)
	(FLAGS NARTICLEBIT)
	(ACTION GLASS-F)>

<ROUTINE GLASS-F ()
	 <COND (<AND <EQUAL? ,HERE ,FOODVILLE-2>
		     <NOT <EQUAL? ,SYEAR 2081>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,GLASS>)
	       (<AND <EQUAL? ,HERE ,CONSTRUCTION-SITE-5>
		     <NOT <EQUAL? ,SYEAR 2071>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,GLASS>)
	       (<AND <EQUAL? ,HERE ,MIDLAND-AND-RIVER>
		     <EQUAL? ,SYEAR 2051>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,GLASS>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,FOODVILLE-2 ,CONSTRUCTION-SITE-5>>
		<TELL "The shattered glass covers most of the floor." CR>)
	       (<AND <VERB? TAKE>
		     <EQUAL? ,HERE ,FOODVILLE-2 ,CONSTRUCTION-SITE-5>>
		<TELL "The bits of glass are too sharp and tiny to carry." CR>)
	       (<AND <EQUAL? ,HERE ,UNIVERSITY-HEIGHTS ,PARKVIEW-APARTMENTS
			     	   ,CHURCH-STREET-APARTMENTS>
		     <EQUAL? ,SYEAR 2071>>
		<TELL "The glass on the doors is broken." CR>)>>

<OBJECT SEAT
	(LOC LOCAL-GLOBALS)
	(DESC "seat")
	(SYNONYM SEAT SEATS PILLOWSEAT CHAIR CHAIRS)
	(ADJECTIVE PLAIN BUILT-IN)
	(FLAGS NDESCBIT VEHBIT OPENBIT FURNITUREBIT)
	(ACTION SEAT-F)>

<ROUTINE SEAT-F ;("OPTIONAL" RARG) ()
	 <COND ;(.RARG
		<RFALSE>)
	       ;(<VERB? OPEN CLOSE>
		<TELL "Huh?" CR>)
	       (<AND <VERB? COUNT>
		     <EQUAL? ,HERE ,LECTURE-HALL>>
		<TELL "Several hundred." CR>)
	       (<AND <EQUAL? ,HERE ,SKYCAB>
		     <VERB? DISEMBARK>>
		<V-STAND>)>>

<OBJECT CHAIR
	(LOC LOCAL-GLOBALS)
	(DESC "chair")
	(SYNONYM CHAIR CHAIRS SEAT SEATS)
	(ADJECTIVE DESK SWIVEL)
	(FLAGS NDESCBIT VEHBIT FURNITUREBIT OPENBIT)
	(ACTION CHAIR-F)>

<ROUTINE CHAIR-F ;("OPTIONAL" RARG) ()
	 <COND ;(.RARG
		<RFALSE>)
	       ;(<AND <EQUAL? ,SYEAR 2081>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,CHAIR>)
	       ;(<AND <EQUAL? ,HERE ,CLOSED-FACTORY>
		     <EQUAL? ,SYEAR 2041>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,CHAIR>)
	       (<EQUAL? ,HERE ,SIMONS ,THE-COACHMAN ,ROYS-PAGODA>
		<RESTAURANT-TABLE-F>)
	       (<EQUAL? ,HERE ,DINING-ROOM>
		<FURNITURE-REMOVED>)
	       (<VERB? SIT CLIMB-ON BOARD>
		<TELL "You don't see any open chairs." CR>)>>

<OBJECT GLOBAL-TABLE
	(LOC LOCAL-GLOBALS)
	(DESC "table")
	(SYNONYM TABLE TABLES)
	(ADJECTIVE TINY OLD WOODEN)
	(FLAGS SURFACEBIT VEHBIT)
	(ACTION GLOBAL-TABLE-F)>

<ROUTINE GLOBAL-TABLE-F ;("OPTIONAL" RARG) ()
	 <COND ;(.RARG
		<RFALSE>)
	       (<AND <EQUAL? ,HERE ,CLOSED-FACTORY>
		     <EQUAL? ,SYEAR 2041>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,GLOBAL-TABLE>)
	       (<EQUAL? ,HERE ,DINING-ROOM>
		<FURNITURE-REMOVED>)
	       (<AND <EQUAL? ,HERE ,CAFETERIA>
		     <VERB? EXAMINE>>
		<CAFETERIA-TABLE-DESC>
		<CRLF>)
	       (<AND <VERB? PUT PUT-ON>
		     <PRSI? ,GLOBAL-TABLE>>
		<TELL
"It's a bad idea to leave things around in a place like this -- they're
liable to disappear." CR>)>>

<OBJECT PARK-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "park")
	(SYNONYM PARK GARDEN GARDENS COMMON COMMONS)
	(ADJECTIVE KENNEDY RIVERSIDE HALLEY CHURCH STREET
	 	   SMALL DOWNTOWN OLD POPULAR PUBLIC)
	(ACTION PARK-OBJECT-F)>

<ROUTINE PARK-OBJECT-F ()
	 <COND (<AND <EQUAL? ,SYEAR 2071>
		     <OR <EQUAL? ,HERE ,ZOO ,HUANG-HALL ,HALLEY-AND-PARK>
			 <EQUAL? ,HERE ,AQUARIUM ,HALLEY-AND-UNIVERSITY>
			 <EQUAL? ,HERE ,PARK-ENTRANCE ,SKYCAR-LOT-4>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,PARK-OBJECT>)
	       (<AND <EQUAL? ,SYEAR 2061 2071>
		     <OR <EQUAL? ,HERE ,ELM-AND-PARK ,MAIN-AND-CHURCH
				       ,CHURCH-STREET-PARK>
			 <EQUAL? ,HERE ,ELM-AND-KENNEDY ,HEIMAN-VILLAGE
				       ,MAIN-AND-KENNEDY>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,PARK-OBJECT>)
	       (<EQUAL? ,HERE ,SKYCAB>
		<COND (<VERB? EXAMINE>
		       <TELL
"You can see a festival of some sort in Halley Park. The gold and crimson
tents of the festival form a multicolored patchwork against the green
background of the city's oldest park." CR>)
		      (T
		       <MILE-AWAY ,PARK-OBJECT>)>)
	       (<VERB? EXAMINE>
		<COND (<OR <EQUAL? ,HERE ,HALLEY-PARK-EAST ,HALLEY-PARK-WEST
				         ,CHURCH-STREET-PARK>
			   <EQUAL? ,HERE ,KENNEDY-PARK ,RIVERSIDE-PARK>>
		       <V-LOOK>)
		      (T
		       <FROM-HERE>)>)
	       (<VERB? WALK-TO THROUGH>
		<COND (<OR <EQUAL? ,HERE ,HALLEY-PARK-EAST ,HALLEY-PARK-WEST
				       ,KENNEDY-PARK>
			   <EQUAL? ,HERE ,RIVERSIDE-PARK ,CHURCH-STREET-PARK>>
		       <TELL ,LOOK-AROUND CR>)
		      (<EQUAL? ,HERE ,ZOO ,SYMPHONY-HALL>
		       <DO-WALK ,P?SE>)
		      (<EQUAL? ,HERE ,HALLEY-AND-PARK ,ELM-AND-KENNEDY>
		       <DO-WALK ,P?NW>)
		      (<EQUAL? ,HERE ,PARK-ENTRANCE>
		       <DO-WALK ,P?WEST>)
		      (<EQUAL? ,HERE ,ELM-AND-PARK>
		       <DO-WALK ,P?NE>)
		      (<EQUAL? ,HERE ,MAIN-AND-KENNEDY>
		       <DO-WALK ,P?SW>)
		      (<EQUAL? ,HERE ,AQUARIUM ,MAIN-AND-CHURCH ,SKYCAR-LOT-4>
		       <DO-WALK ,P?SOUTH>)
		      (<EQUAL? ,HERE ,HALLEY-AND-UNIVERSITY ,HUANG-HALL>
		       <DO-WALK ,P?NORTH>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?EAST>)>)
	       (<VERB? DISEMBARK LEAVE>
		<COND (<OR <EQUAL? ,HERE ,HALLEY-PARK-EAST ,HALLEY-PARK-WEST
				       ,KENNEDY-PARK>
			   <EQUAL? ,HERE ,RIVERSIDE-PARK ,CHURCH-STREET-PARK>>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)>>

<OBJECT MUSEUM-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "museum")
	(SYNONYM MUSEUM)
	(ADJECTIVE HALLEY RAILROAD)
	(ACTION MUSEUM-OBJECT-F)>

<ROUTINE MUSEUM-OBJECT-F ()
	 <COND (<EQUAL? ,HERE ,SKYCAB>
		<CHANGE-OBJECT ,MUSEUM-OBJECT ,BSF-BASE>)
	       (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,HERE ,RIVERSIDE-PARK ,HALLEY-AND-PARK>
		       <DO-WALK ,P?SW>)
		      (<EQUAL? ,HERE ,MUSEUM-ENTRANCE>
		       <DO-WALK ,P?SOUTH>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? DISEMBARK LEAVE>
		<COND (<EQUAL? ,HERE ,HALLEY-MUSEUM>
		       <DO-WALK ,P?NE>)
		      (<EQUAL? ,HERE ,RAILROAD-MUSEUM>
		       <DO-WALK ,P?NORTH>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,HALLEY-MUSEUM ,RAILROAD-MUSEUM>
		       <V-LOOK>)
		      (<EQUAL? ,HERE ,HALLEY-AND-PARK>
		       <TELL "The building ">
		       <COND (<EQUAL? ,SYEAR 2041 2051>
			      <TELL "houses">)
			     (T
			      <TELL "once housed">)>
		       <TELL " the famous ">
		       <PRINTD ,HALLEY-MUSEUM>
		       <TELL "." CR>)
		      (<EQUAL? ,HERE ,MUSEUM-ENTRANCE>
		       <TELL "The ">
		       <PRINTD ,RAILROAD-MUSEUM>
		       <TELL " is housed in a small building">
		       <COND (<EQUAL? ,SYEAR 2051 2061>
			      <TELL ", now closed">)>
		       <TELL "." CR>)>)>>

<OBJECT HIGHWAY
	(LOC LOCAL-GLOBALS)
	(DESC "interstate highway")
	(SYNONYM HIGHWAY ROADWAY INTERSTATE)
	(ADJECTIVE INTERSTATE OLD ELEVATED)
	(FLAGS VOWELBIT)>

<OBJECT FIELD
	(LOC LOCAL-GLOBALS)
	(DESC "field")
	(SYNONYM FIELD)
	(ADJECTIVE ATHLETIC OUTDOOR)
	(ACTION FIELD-F)>

<ROUTINE FIELD-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,RIVER-AND-PARK>
		       <DO-WALK ,P?SE>)
		      (<EQUAL? ,HERE ,RIVER-AND-KENNEDY>
		       <DO-WALK ,P?SW>)
		      (<EQUAL? ,HERE ,ROCKVIL-STADIUM>
		       <TELL "Spectators are not permitted on the field." CR>)
		      (<GLOBAL-IN? ,FIELD ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? DISEMBARK LEAVE>
		<COND (<EQUAL? ,HERE ,ATHLETIC-FIELD ,ROCKVIL-STADIUM>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,ROCKVIL-STADIUM ,ATHLETIC-FIELD>>
		<V-LOOK>)>>

<OBJECT DESK
	(LOC LOCAL-GLOBALS)
	(DESC "desk")
	(SYNONYM DESK)
	(ADJECTIVE RECEIVING ADMITTING)>

<OBJECT FENCE
	(LOC LOCAL-GLOBALS)
	(DESC "fence")
	(SYNONYM FENCE)
	(ADJECTIVE TALL HIGH PERIMETER WOODEN TEMPORARY)
	(ACTION FENCE-F)>

<ROUTINE FENCE-F ()
	 <COND (<AND <EQUAL? ,HERE ,SOUTHWAY-AND-KENNEDY ,SOUTHWAY-AND-RIVER>
		     <NOT <EQUAL? ,SYEAR 2041>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,FENCE>)
	       (<AND <EQUAL? ,HERE ,BEND ,CONSTRUCTION-SITE-2>
		     <NOT <EQUAL? ,SYEAR 2041>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,FENCE>)
	       (<AND <EQUAL? ,HERE ,WAREHOUSE-1>
		     <EQUAL? ,SYEAR 2041 2051>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,FENCE>)
	       (<AND <EQUAL? ,HERE ,CHURCH-STREET-PARK>
		     <EQUAL? ,SYEAR 2061 2071>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,FENCE>)
	       (<VERB? CLIMB-FOO CLIMB-UP CLIMB-OVER LEAP>
		<COND (<EQUAL? ,HERE ,ROOFTOP>
		       <DO-WALK ,P?NORTH>)
		      (T
		       <TELL "The fence is unclimbable." CR>)>)>>

<OBJECT GATE
	(LOC LOCAL-GLOBALS)
	(DESC "gate")
	(SYNONYM GATES GATE)
	(ADJECTIVE BASE BOARDING)
	(FLAGS NDESCBIT)
	(ACTION GATE-F)>

<ROUTINE GATE-F ()
	 <COND (<AND <OR <EQUAL? ,HERE ,KENNEDY-PARK ,MAIN-AND-KENNEDY>
			 <EQUAL? ,HERE ,ELM-AND-KENNEDY ,ELM-AND-PARK>>
		     <EQUAL? ,SYEAR 2061 2071>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,GATE>)
	       (<AND <OR <EQUAL? ,HERE ,HALLEY-AND-PARK ,ZOO ,SKYCAR-LOT-4>
			 <EQUAL? ,HERE ,PARK-ENTRANCE ,HALLEY-AND-UNIVERSITY>>
		     <NOT <EQUAL? ,SYEAR 2071>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,GATE>)
	       (<VERB? OPEN>
		<COND (<EQUAL? ,HERE ,SKYBUS-TERMINAL>
		       <TELL
"The boarding gates can be opened only by the skybus system employees." CR>)
		      (<EQUAL? ,HERE ,BASE-GATE>
		       <TELL "Only the guard is allowed to open the gate." CR>)
		      (<OR <EQUAL? ,HERE ,PARK-ENTRANCE ,HALLEY-AND-UNIVERSITY>
			   <EQUAL? ,HERE ,HALLEY-AND-PARK ,ZOO ,SKYCAR-LOT-4>>
		       <TELL "The gates are locked." CR>)
		      (T
		       <TELL "The gates are open!" CR>)>)
	       (<VERB? CLOSE>
		<COND (<OR <EQUAL? ,HERE ,PARK-ENTRANCE ,HALLEY-AND-UNIVERSITY>
			   <EQUAL? ,HERE ,SKYBUS-TERMINAL ,HALLEY-AND-PARK>
			   <EQUAL? ,HERE ,ZOO ,BASE-GATE ,SKYCAR-LOT-4>>
		       <TELL "The gates are closed!" CR>)
		      (T
		       <TELL "The gates can't be closed." CR>)>)
	       (<VERB? THROUGH>
		<COND (<EQUAL? ,HERE ,KENNEDY-PARK ,CEMETERY>
		       <V-WALK-AROUND>)
		      (<EQUAL? ,HERE ,MAIN-AND-WICKER ,HALLEY-AND-UNIVERSITY>
		       <DO-WALK ,P?NORTH>)
		      (<EQUAL? ,HERE ,MIDLAND-AND-CHURCH ,ZOO>
		       <DO-WALK ,P?SE>)
		      (<EQUAL? ,HERE ,CHURCH-ENTRANCE>
		       <DO-WALK ,P?EAST>)
		      (<EQUAL? ,HERE ,MAIN-AND-KENNEDY>
		       <DO-WALK ,P?SW>)
		      (<EQUAL? ,HERE ,ELM-AND-KENNEDY ,BASE-GATE
			       	     ,SKYBUS-TERMINAL>
		       <DO-WALK ,P?NW>)
		      (<EQUAL? ,HERE ,PARK-ENTRANCE>
		       <DO-WALK ,P?WEST>)
		      (<EQUAL? ,HERE ,SKYCAR-LOT-4>
		       <DO-WALK ,P?SOUTH>)
		      (T
		       <DO-WALK ,P?NE>)>)>>

<OBJECT COUNTER
	(LOC LOCAL-GLOBALS)
	(DESC "counter")
	(SYNONYM COUNTER COUNTERS)
	(CAPACITY 50)
	(FLAGS SURFACEBIT OPENBIT CONTBIT NDESCBIT)
	(ACTION COUNTER-F)>

<ROUTINE COUNTER-F ()
	 <COND (<VERB? PUT PUT-ON>
		<COND (<EQUAL? ,HERE ,KITCHEN>
		       <TELL
"There's no room on the counter. Maybe you should try the table." CR>)
		      ;(<PRSI? ,COUNTER>
		       <PERFORM ,V?DROP ,BEER>
		       <RTRUE>)
		      (<NOT <EQUAL? ,HERE ,EPILOGUE-KITCHEN>>
		       <PERFORM ,V?PUT ,PRSO ,GLOBAL-TABLE>
		       <RTRUE>)>)>>

<OBJECT SHELVES
	(LOC LOCAL-GLOBALS)
	(DESC "shelves")
	(SYNONYM BOOKSHELF BOOKSHELVES SHELF SHELVES)
	(ADJECTIVE OVERSTUFFED OVER-STUFFED BOOK BARE CLOSELY PLACED HEAPING
	 	   CLOSELY-PLACED SPARSELY FILLED ADEQUATELY STOCKED)
	(FLAGS NARTICLEBIT)
	(ACTION SHELVES-F)>

<ROUTINE SHELVES-F ()
	 <COND (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,BOOKSTORE>
		       <TELL
"The shelves are closely-placed and crammed with used books." CR>)
		      (<EQUAL? ,HERE ,FOODVILLE-1 ,FOODVILLE-2>
		       <TELL "The shelves are ">
		       <COND (<EQUAL? ,SYEAR 2041>
			      <TELL "heaped with food">)
			     (<EQUAL? ,SYEAR 2051>
			      <TELL "adequately stocked with food">)
			     (<EQUAL? ,SYEAR 2061>
			      <TELL "sparsely-filled with food">)
			     (T
			      <TELL "bare">)>
		       <TELL "." CR>)>)>>

<OBJECT FACTORY-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "factory")
	(SYNONYM FACTORY FACTORIES COMPLEX PLANT)
	(ADJECTIVE FACTORY LARGE HUGE SKYCAR OMNI FABB OMNI-FABB CLOSED
	 	   CRUMBLING CHIP ONCE-BOOMING)
	(ACTION FACTORY-OBJECT-F)>

<ROUTINE FACTORY-OBJECT-F ()
	 <COND (<AND <EQUAL? ,HERE ,CLOSED-FACTORY>
		     <NOT <EQUAL? ,SYEAR 2041>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,FACTORY-OBJECT>)
	       (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,WICKER-AND-RIVER>
		       <COND (<EQUAL? ,SYEAR 2041>
			      <V-WALK-AROUND>)
			     (T
			      <DO-WALK ,P?EAST>)>)
		      (<EQUAL? ,HERE ,POWER-STATION-ENTRANCE>
		       <DO-WALK ,P?NE>)
		      (<EQUAL? ,HERE ,FACTORY-ENTRANCE>
		       <DO-WALK ,P?SE>)
		      (<EQUAL? ,HERE ,INDUSTRIAL-PARK-DRIVE>
		       <TELL "Not surprisingly, the doors are locked." CR>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,CLOSED-FACTORY>
		       <DO-WALK ,P?SOUTH>)
		      (<EQUAL? ,HERE ,SKYCAR-FACTORY>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,SKYCAR-FACTORY ,CLOSED-FACTORY>
		       <V-LOOK>)
		      (<NOT <EQUAL? ,HERE ,INDUSTRIAL-PARK-DRIVE>> 
		       <FROM-HERE>)>)>>

<OBJECT STORE-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "store")
	(SYNONYM STORE STORES SHOP SHOPS)
	(ACTION STORE-OBJECT-F)>

<ROUTINE STORE-OBJECT-F ()
	 <COND (<VERB? LEAVE DISEMBARK>
		<TELL ,LOOK-AROUND CR>)
	       (<VERB? WALK-TO THROUGH>
		<TELL "If you want to buy something, just say so." CR>)>>

<OBJECT HOTEL-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "hotel")
	(SYNONYM HOTEL)
	(ADJECTIVE VELDRAN COLONIAL FAIRLY OLD OPULENT LUXURY HIGH-RISE)
	(ACTION HOTEL-OBJECT-F)>

<ROUTINE HOTEL-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,CENTRE-AND-KENNEDY>
		       <DO-WALK ,P?EAST>)
		      (<EQUAL? ,HERE ,AIRPORTWAY-AND-RIVER>
		       <DO-WALK ,P?SE>)
		      (<EQUAL? ,HERE ,SKYCAR-LOT-7>
		       <DO-WALK ,P?WEST>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? DISEMBARK LEAVE>
		<COND (<EQUAL? ,HERE ,VELDRAN-HOTEL>
		       <DO-WALK ,P?NE>)
		      (<EQUAL? ,HERE ,COLONIAL-HOTEL>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,VELDRAN-HOTEL ,COLONIAL-HOTEL>
		       <V-LOOK>)
		      (<EQUAL? ,HERE ,CENTRE-AND-KENNEDY>
		       <TELL "The Veldran is a high-rise, luxury hotel." CR>)
		      (T
		       <TELL
"The Colonial is a fairly old but opulent hotel." CR>)>)>>

<OBJECT CHURCH-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "church")
	(SYNONYM CHURCH WORD MICHAEL\'S HEADQUARTERS)
	(ADJECTIVE LARGE OPULENT PROTESTANT CATHOLIC CLOSED BOARDED
		   BOARDED-UP OLD NEW FIRST METHODIST REGIONAL CENTRAL
		   MICHAEL\'S GOD\'S ST)
	(ACTION CHURCH-OBJECT-F)>

<ROUTINE CHURCH-OBJECT-F ()
	 <COND (<AND <EQUAL? ,HERE ,TRAIN-STATION ,BODANSKI-SQUARE
			     	   ,MIDLAND-AND-RIVER>
		     <EQUAL? ,SYEAR 2041>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,CHURCH-OBJECT>)
	       (<AND <OR <EQUAL? ,HERE ,AQUARIUM-AND-RIVER ,CHURCH-ENTRANCE
				       ,FIRST-METHODIST-CHURCH>
			 <EQUAL? ,HERE ,CHURCH-ENTRANCE ,SKYCAR-LOT-5>>
		     <EQUAL? ,SYEAR 2071>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,CHURCH-OBJECT>)
	       (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,BODANSKI-SQUARE>
		       <DO-WALK ,P?SE>)
		      (<EQUAL? ,HERE ,MIDLAND-AND-RIVER>
		       <DO-WALK ,P?NE>)
		      (<EQUAL? ,HERE ,CHURCH-ENTRANCE>
		       <DO-WALK ,P?WEST>)
		      (<EQUAL? ,HERE ,SKYCAR-LOT-5>
		       <DO-WALK ,P?NORTH>)
		      (<EQUAL? ,HERE ,AQUARIUM-AND-RIVER>
		       <DO-WALK ,P?SW>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,ST-MICHAELS>
		       <DO-WALK ,P?EAST>)
		      (<EQUAL? ,HERE ,TRAIN-STATION ,FIRST-METHODIST-CHURCH>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,TRAIN-STATION ,ST-MICHAELS
			       	     ,FIRST-METHODIST-CHURCH>
		       <V-LOOK>)
		      (<EQUAL? ,HERE ,CHURCH-ENTRANCE>
		       <TELL "It is">
		       <ST-MICHAELS-DESC>
		       <CRLF>)
		      (<EQUAL? ,HERE ,BODANSKI-SQUARE ,MIDLAND-AND-RIVER>
		       <TELL
"The building is a house of worship for the Church of God's Word." CR>)
		      (T
		       <TELL
"The neoclassical building is a Methodist church." CR>)>)>>

<OBJECT SCHOOL-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "school")
	(SYNONYM SCHOOL)
	(ADJECTIVE VINCENT ROCKVIL HIGH PUBLIC PRIVATE OLD OLDEST SECONDARY
	 	   MORTIMER DENTAL FAIRLY NEW SMALL CHURCH-OWNED)
	(ACTION SCHOOL-OBJECT-F)>

<ROUTINE SCHOOL-OBJECT-F ()
	 <COND (<EQUAL? ,HERE ,HEIMAN-VILLAGE>
		<TELL
"The schools are on the upper floors, inaccessible to you." CR>)
	       (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,AQUARIUM-AND-KENNEDY ,RIVER-AND-KENNEDY>
		       <DO-WALK ,P?SE>)
		      (<EQUAL? ,HERE ,AIRPORTWAY-AND-RIVER>
		       <DO-WALK ,P?WEST>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,ROCKVIL-HIGH>
		       <V-WALK-AROUND>)
		      (<EQUAL? ,HERE ,DENTAL-SCHOOL>
		       <DO-WALK ,P?NW>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,DENTAL-SCHOOL ,ROCKVIL-HIGH>
		       <V-LOOK>)
		      (<EQUAL? ,HERE ,AQUARIUM-AND-KENNEDY>
		       <TELL "It's the ">
		       <PRINTD ,DENTAL-SCHOOL>
		       <TELL "." CR>)
		      (T
		       <TELL "It's a ">
		       <COND (<EQUAL? ,SYEAR 2041 2051>
			      <TELL "public">)
			     (T
			      <TELL "church-owned">)>
		       <TELL " high school." CR>)>)>>

<OBJECT CONSTRUCTION-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "construction site")
	(SYNONYM CONSTRUCTION SITE PROJECT)
	(ADJECTIVE CONSTRUCTION HUGE ABANDONED)
	(ACTION CONSTRUCTION-OBJECT-F)>

<ROUTINE CONSTRUCTION-OBJECT-F ()
	 <COND (<AND <OR <EQUAL? ,HERE ,KENNEDY-PARK ,MAIN-AND-KENNEDY>
			 <EQUAL? ,HERE ,ELM-AND-KENNEDY ,ELM-AND-PARK>>
		     <NOT <EQUAL? ,SYEAR 2061>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,CONSTRUCTION-OBJECT>)
	       (<AND <OR <EQUAL? ,HERE ,CONSTRUCTION-SITE-1 ,MAIN-AND-CHURCH
				       ,CONSTRUCTION-SITE-2>
			 <EQUAL? ,HERE ,CONSTRUCTION-SITE-3 ,CHURCH-ENTRANCE
				       ,CONSTRUCTION-SITE-4>
			 <EQUAL? ,HERE ,CONSTRUCTION-SITE-5 ,MIDLAND-AND-CHURCH
				       ,SOUTHWAY-AND-KENNEDY>
			 <EQUAL? ,HERE ,SOUTHWAY-AND-RIVER ,BEND>>
		     <NOT <EQUAL? ,SYEAR 2041>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,CONSTRUCTION-OBJECT>)
	       (<AND <EQUAL? ,HERE ,CEMETERY>
		     <NOT <EQUAL? ,SYEAR 2071>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,CONSTRUCTION-OBJECT>)
	       (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,BEND ,ELM-AND-PARK>
		       <DO-WALK ,P?NE>)
		      (<EQUAL? ,HERE ,ELM-AND-KENNEDY ,SOUTHWAY-AND-KENNEDY>
		       <DO-WALK ,P?NW>)
		      (<EQUAL? ,HERE ,MAIN-AND-KENNEDY ,MIDLAND-AND-CHURCH>
		       <DO-WALK ,P?SW>)
		      (<EQUAL? ,HERE ,SOUTHWAY-AND-RIVER>
		       <DO-WALK ,P?EAST>)
		      (<EQUAL? ,HERE ,CHURCH-ENTRANCE ,MAIN-AND-CHURCH>
		       <V-WALK-AROUND>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? DISEMBARK LEAVE>
		<COND (<EQUAL? ,HERE ,CONSTRUCTION-SITE-1>
		       <DO-WALK ,P?SE>)
		      (<EQUAL? ,HERE ,CONSTRUCTION-SITE-3>
		       <DO-WALK ,P?NE>)
		      (<OR <EQUAL? ,HERE ,KENNEDY-PARK ,CONSTRUCTION-SITE-4
				   	 ,CONSTRUCTION-SITE-2>
			   <EQUAL? ,HERE ,CEMETERY ,CONSTRUCTION-SITE-5>>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <OR <EQUAL? ,HERE ,CONSTRUCTION-SITE-1 ,KENNEDY-PARK
				       ,CONSTRUCTION-SITE-2>
			 <EQUAL? ,HERE ,CONSTRUCTION-SITE-3 ,CEMETERY
				       ,CONSTRUCTION-SITE-4>
			 <EQUAL? ,HERE ,CONSTRUCTION-SITE-5>>>
		<V-LOOK>)>>

<OBJECT VACANT-LOT
	(LOC LOCAL-GLOBALS)
	(DESC "vacant lot")
	(SYNONYM LOT)
	(ADJECTIVE VACANT EMPTY LARGE)
	(ACTION VACANT-LOT-F)>

<ROUTINE VACANT-LOT-F ()
	 <COND (<AND <EQUAL? ,SYEAR 2041 2051>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,VACANT-LOT>)
	       (<AND <EQUAL? ,SYEAR 2061>
		     <NOT <EQUAL? ,HERE ,WAREHOUSE-1 ,WICKER-AND-RIVER>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,VACANT-LOT>)
	       (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,HERE ,AQUARIUM-AND-RIVER>
		       <DO-WALK ,P?SW>)
		      (<EQUAL? ,HERE ,SKYCAR-LOT-5>
		       <DO-WALK ,P?NORTH>)
		      (<EQUAL? ,HERE ,WICKER-AND-RIVER ,CHURCH-ENTRANCE>
		       <DO-WALK ,P?WEST>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,WAREHOUSE-1 ,ST-MICHAELS>
		       <DO-WALK ,P?EAST>)
		      (<EQUAL? ,HERE ,FIRST-METHODIST-CHURCH>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)>>

<OBJECT TUNNEL
	(LOC LOCAL-GLOBALS)
	(DESC "tunnel")
	(SYNONYM TUNNEL)
	(ACTION TUNNEL-F)>

<ROUTINE TUNNEL-F ()
	 <COND (<AND <EQUAL? ,HERE ,CHURCH-STREET-PARK>
		     <EQUAL? ,SYEAR 2041 2051>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,TUNNEL>)
	       (<VERB? THROUGH>
		<COND (<EQUAL? ,HERE ,HALLEY-AND-PARK>
		       <DO-WALK ,P?NORTH>)
		      (<EQUAL? ,HERE ,AQUARIUM-AND-PARK>
		       <DO-WALK ,P?SOUTH>)
		      (T
		       <DO-WALK ,P?WEST>)>)
	       (<VERB? LOOK-INSIDE>
		<TELL
"Park Street descends into the gloom of the tunnel." CR>)>>

<OBJECT EXHIBITS
	(LOC LOCAL-GLOBALS)
	(DESC "exhibits")
	(SYNONYM EXHIBIT EXHIBITS LIFE ART SCIENCE ENGINEERI HISTORY TRAVEL)
	(ADJECTIVE SMALLER MARINE LIFE MODERN CLASSICAL NATURAL HUMAN ART
	 	   HISTORY SCIENCE ENGINEERI RAILROAD RR RAIL TRAVEL VISUALLY
		   INTERESTI)
	(FLAGS NARTICLEBIT VOWELBIT PLURALBIT)
	(ACTION EXHIBITS-F)>

<ROUTINE EXHIBITS-F ()
	 <COND (<VERB? EXAMINE>
		<COND (<EQUAL? ,HERE ,AQUARIUM>
		       <TELL "The exhibits of marine life are ">
		       <COND (<EQUAL? ,SYEAR 2041>
			      <TELL "well-maintained">)
			     (T
			      <SCORE 71> ;"1 point"
			      <TELL "poorly-maintained">)>
		       <TELL "." CR>)
		      (<EQUAL? ,HERE ,RAILROAD-MUSEUM>
		       <TELL
"The exhibits of railroad history are interesting and well done." CR>)
		      (T
		       <TELL
"The exhibits are visually interesting and well-documented." CR>)>)>>

<OBJECT SKYCAR
	(LOC GLOBAL-OBJECTS)
	(DESC "skycars")
	(SYNONYM SKYCAR SKYCARS CAR CARS)
	(ADJECTIVE SKY)
	(FLAGS NARTICLEBIT PLURALBIT)
	(ACTION SKYCAR-F)>

<ROUTINE SKYCAR-F ()
	 <COND (<AND <VERB? WAIT-FOR>
		     <FSET? ,HERE ,TUBEBIT>>
		<PERFORM ,V?WAIT-FOR ,RED-TUBECAR>
		<RTRUE>)
	       (<AND <NOT <FSET? ,HERE ,OUTSIDEBIT>>
		     <NOT <EQUAL? ,HERE ,SERVICE-STATION>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,SKYCAR>)
	       (<VERB? THROUGH BOARD>
		<TELL "You'd be arrested for carbreaking!" CR>)
	       (<AND <VERB? COUNT>
		     <EQUAL? ,HERE ,SKYCAR-FACTORY>>
		<TELL
"There are too many cars to count, but you can easily see
that this huge parking lot is ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "nearly full">)
		      (<EQUAL? ,SYEAR 2051>
		       <SCORE 109> ;"1 point"
		       <TELL "well more than half full">)
		      (<EQUAL? ,SYEAR 2061>
		       <SCORE 110> ;"2 points"
		       <TELL "less than half full">)
		      (T
		       <SCORE 111> ;"3 points"
		       <TELL "nearly empty">)>
		<TELL "." CR>)
	       (<VERB? BUY>
		<CANT-BUY ,SKYCAR>)>>

<OBJECT CARLOT
	(LOC LOCAL-GLOBALS)
	(DESC "parking lot")
	(SYNONYM LOT)
	(ADJECTIVE PARKING SKYCAR SKY CAR)
	(ACTION CARLOT-F)>

<ROUTINE CARLOT-F ("AUX" (X <>))
	 <COND (<OR <EQUAL? ,HERE ,SKYCAR-LOT-1 ,SKYCAR-LOT-2 ,SKYCAR-LOT-3>
		    <EQUAL? ,HERE ,SKYCAR-LOT-4 ,SKYCAR-LOT-5 ,SKYCAR-LOT-6>
		    <EQUAL? ,HERE ,SKYCAR-LOT-7 ,SKYCAR-FACTORY>>
		<SET X T>)>
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (.X
		       <TELL ,LOOK-AROUND CR>)
		      (T
		       <V-WALK-AROUND>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (.X
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE LOOK-INSIDE>
		     <EQUAL? ,HERE ,SKYCAR-FACTORY>>
		<PERFORM ,V?COUNT ,SKYCAR>
		<RTRUE>)
	       (<AND .X
		     <VERB? EXAMINE>>
		<V-LOOK>)>>

<OBJECT PROSTITUTE
	(LOC LOCAL-GLOBALS)
	(DESC "prostitute")
	(SYNONYM PROSTITUTE WHORE HARLOT HOOKER STREETWALKER
	 	 PARAMOUR CONCUBINE NIGHTWALKER COCOTTE SLUT)
	(FLAGS ACTORBIT)>

<OBJECT CHILDREN
	(LOC LOCAL-GLOBALS)
	(DESC "children")
	(SYNONYM CHILD CHILDREN SCHOOLCHILD KID KIDS)
	(ADJECTIVE SCHOOL)
	(FLAGS NARTICLEBIT PLURALBIT)
	(ACTION CHILDREN-F)>

<ROUTINE CHILDREN-F ()
	 <COND (<EQUAL? ,HERE ,LIVING-ROOM>
		<COND (<IN? ,MITCHELL ,HERE>
		       <CHANGE-OBJECT ,CHILDREN ,MITCHELL>)
		      (<AND <EQUAL? ,HERE ,LIVING-ROOM>
			    <EQUAL? ,SYEAR 2071>>
		       <CHANGE-OBJECT ,CHILDREN ,PAINTING>)
		      (<NOT <MOBY-VERB?>>
		       <CANT-SEE ,CHILDREN>)>)
	       (<VERB? TELL>
		<TELL "They didn't seem to hear you." CR>
		<CLEAR-BUF>)
	       (<EQUAL? ,HERE ,ZOO>
		<COND (<AND <NOT <EQUAL? ,SYEAR 2061>>
			    <NOT <MOBY-VERB?>>>
		       <CANT-SEE ,CHILDREN>)
		      (<VERB? EXAMINE>
		       <TELL
"The children are poking a small, whimpering animal." CR>)>)
	       (T
		<COND (<AND <NOT <EQUAL? ,SYEAR 2061 2071>>
			    <NOT <MOBY-VERB?>>>
		       <CANT-SEE ,CHILDREN>)
		      (<VERB? EXAMINE>
		       <TELL
"The children are all uniformed and are wearing pendants with the symbol
of the Church." CR>)>)>>

<OBJECT WOMAN
	(LOC LOCAL-GLOBALS)
	(DESC "woman")
	(SYNONYM WOMAN BEGGAR)
	(ADJECTIVE BEGGAR)
	(FLAGS NDESCBIT ACTORBIT)
	(ACTION WOMAN-F)>

<ROUTINE WOMAN-F ()
	 <COND (<EQUAL? ,HERE ,LIVING-ROOM>
		<COND (<EQUAL? ,SYEAR 2061>
		       <CHANGE-OBJECT ,WOMAN ,PAINTING>)
		      (<NOT <MOBY-VERB?>>
		       <CANT-SEE ,WOMAN>)>)
	       (<EQUAL? ,SYEAR 2041>
		<COND (<VERB? TELL>
		       <TELL "She can't hear you from here." CR>
		       <CLEAR-BUF>)
		      (<AND <VERB? ASK-ABOUT TELL-ABOUT>
			    <PRSO? ,WOMAN>>
		       <PERFORM ,V?TELL ,WOMAN>
		       <RTRUE>)
		      (<VERB? EXAMINE>
		       <TELL "The woman is dressed in prison garb." CR>)>)
	       (<NOT <MOBY-VERB?>>
		<CANT-SEE ,WOMAN>)>>

<OBJECT WATER
	(LOC LOCAL-GLOBALS)
	(DESC "water")
	(SYNONYM WATER)
	(ADJECTIVE PLACID HOT COLD ICE MURKY)
	(ACTION WATER-F)>

<ROUTINE WATER-F ()
	 <COND (<AND <EQUAL? ,HERE ,KENNEDY-PARK ,HALLEY-PARK-WEST>
		     <EQUAL? ,SYEAR 2061 2071>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,WATER>)
	       (<VERB? BUY>
		<COND (<EQUAL? ,HERE ,SIMONS ,THE-COACHMAN ,ROYS-PAGODA>
		       <TELL
"The waiter brings a glass of cold water. After drinking it,
the glass is cleared away." CR>)
		      (<EQUAL? ,HERE ,BAR ,EZZIS-BAR>
		       <TELL
"The bartender snorts. \"You want water, find a lake!\"" CR>)
		      (T
		       <TELL "You can't order water here!" CR>)>)
	       (<VERB? DRINK>
		<COND (<EQUAL? ,HERE ,KITCHEN ,BATHROOM>
		       <TELL "You drink some water. It">
		       <COND (<EQUAL? ,SYEAR 2041 2051>
			      <TELL "'s quite refreshing." CR>)
			     (T
			      <SCORE 1> ;"1 point"
			      <TELL " tastes slightly rusty." CR>)>)
		      (T
		       <TELL "You can't drink the water here!" CR>)>)
	       (<EQUAL? ,HERE ,KENNEDY-PARK>
		<CHANGE-OBJECT ,WATER ,WATERPOOL>)
	       (<EQUAL? ,HERE ,HALLEY-PARK-WEST>
		<CHANGE-OBJECT ,WATER ,DUCK-POND>)
	       (<GLOBAL-IN? ,RESERVOIR ,HERE>
		<CHANGE-OBJECT ,WATER ,RESERVOIR>)
	       (<EQUAL? ,HERE ,AQUARIUM>
		<CHANGE-OBJECT ,WATER ,TANK>)
	       (<GLOBAL-IN? ,RIVER ,HERE>
		<CHANGE-OBJECT ,WATER ,RIVER>)
	       (<VERB? OFF>
		<COND (<OR <AND <EQUAL? ,HERE ,BATHROOM>
				<EQUAL? ,JILL-COUNTER 11>>
			   <AND <EQUAL? ,HERE ,KITCHEN>
				<EQUAL? ,JILL-COUNTER 7>>>
		       <TELL "Jill's using the sink!" CR>)
		      (T
		       <TELL "It is." CR>)>)
	       (<VERB? ON>
		<COND (<OR <AND <EQUAL? ,HERE ,BATHROOM>
				<EQUAL? ,JILL-COUNTER 11>>
			   <AND <EQUAL? ,HERE ,KITCHEN>
				<EQUAL? ,JILL-COUNTER 7>>>
		       <TELL "It is." CR>
		       <RTRUE>)>
		<TELL "You turn on the water for a few seconds">
		<COND (<EQUAL? ,SYEAR 2071>
		       <SCORE 2> ;"2 points"
		       <TELL ". As usual, the hot water isn't working today">)>
		<TELL "." CR>)>>

<OBJECT RESERVOIR
	(LOC LOCAL-GLOBALS)
	(DESC "reservoir")
	(SYNONYM RESERVOIR)
	(ACTION RESERVOIR-F)>

<ROUTINE RESERVOIR-F ()
	 <COND (<VERB? BOARD THROUGH SWIM>
		<TELL "An unclimbable fence surrounds the reservoir." CR>)
	       (<VERB? EXAMINE>
		<TELL
"The tall fence prevents you from approaching the reservoir. All you can see
is a wide expanse of calm water." CR>)>>

<ROUTINE RIVER-ENTER-F ()
	 <PERFORM ,V?BOARD ,RIVER>
	 <RFALSE>>

<OBJECT RIVER
	(LOC LOCAL-GLOBALS)
	(DESC "river")
	(SYNONYM RIVER)
	(ADJECTIVE LITTLE MISSOURI WIDE POLLUTED)
	(ACTION RIVER-F)>

<ROUTINE RIVER-F ()
	 <COND (<EQUAL? ,HERE ,PATIO ,SKYCAB>
		<COND (<VERB? EXAMINE>
		       <COND (<EQUAL? ,HERE ,PATIO>
		       	      <TELL "T" ,RIVER-DESC CR>)
			     (T
			      <TELL
"The river is dotted with sailboats, and a tourboat is just
pulling away from the pier for a daytrip upriver, through Montana
to the Devil's Tower region of Wyoming. ">
			      <PERFORM ,V?EXAMINE ,CULTURAL-CENTER>
			      <RTRUE>)>)
		      (T
		       <MILE-AWAY ,RIVER>)>)
	       (<VERB? BOARD THROUGH LEAP SWIM>
		<TELL "Swimming in the river is inadvisable. ">
		<PERFORM ,V?EXAMINE ,RIVER>
		<RTRUE>)
	       (<VERB? EXAMINE>
		<TELL "The current is strong, and the water is ">
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL "a bit unhealthy">)
		      (<EQUAL? ,SYEAR 2051>
		       <SCORE 132> ;"1 point"
		       <TELL "quite unhealthy">)
		      (<EQUAL? ,SYEAR 2061>
		       <SCORE 133> ;"2 points"
		       <TELL "very polluted">)
		      (T
		       <SCORE 134> ;"3 points"
		       <TELL "extremely poisoned and polluted">)>
		<TELL "." CR>)>>

<OBJECT RIVER-BANK
	(LOC LOCAL-GLOBALS)
	(DESC "river bank")
	(SYNONYM BANK RIVERBANK RIVER-BANK)
	(ADJECTIVE RIVER)>

<ROUTINE IN-RESTAURANT? ()
	 <COND (<OR <EQUAL? ,HERE ,SIMONS ,THE-COACHMAN>
		    <EQUAL? ,HERE ,ROYS-PAGODA ,BURGER-MEISTER>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<OBJECT RESTAURANT-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "restaurant")
	(SYNONYM RESTAURANT PAGODA COACHMAN MEISTER WORLD BURGERWOR SIMON\'S)
	(ADJECTIVE SMALL LARGE CHINESE FAMOUS EXPENSIVE WELL-KNOWN FAST FOOD
	 	   FAST-FOOD FOUR STAR FOUR-STAR WELL KNOWN ROY\'S ROYS)
	(ACTION RESTAURANT-OBJECT-F)>

<ROUTINE RESTAURANT-OBJECT-F ()
	 <COND (<AND <EQUAL? ,HERE ,BURGER-MEISTER ,AQUARIUM-AND-PARK>
		     <EQUAL? ,SYEAR 2071>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,RESTAURANT-OBJECT>)
	       (<VERB? THROUGH WALK-TO>
		<COND (<IN-RESTAURANT?>
		       <TELL ,LOOK-AROUND CR>)
		      (<EQUAL? ,HERE ,MAIN-AND-WICKER>
		       <DO-WALK ,P?SE>)
		      (<EQUAL? ,HERE ,AQUARIUM-AND-PARK ,BODANSKI-SQUARE>
		       <DO-WALK ,P?NE>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?SOUTH>)>)
	       (<VERB? DISEMBARK LEAVE>
		<COND (<OR <EQUAL? ,HERE ,ELM-UNDERPASS ,MAIN-AND-WICKER>
			   <EQUAL? ,HERE ,BODANSKI-SQUARE ,AQUARIUM-AND-PARK>>
		       <TELL ,LOOK-AROUND CR>)
		      (T
		       <DO-WALK ,P?OUT>)>)
	       (<VERB? EXAMINE>
		<COND (<IN-RESTAURANT?>
		       <V-LOOK>)
		      (<EQUAL? ,HERE ,ELM-UNDERPASS>
		       <PRINTD ,ROYS-PAGODA>
		       <TELL " is a small Chinese restaurant." CR>)
		      (<EQUAL? ,HERE ,AQUARIUM-AND-PARK>
		       <TELL "The ">
		       <PRINTD ,BURGER-MEISTER>
		       <TELL " looks like a typical fast-food place." CR>)
		      (<EQUAL? ,SYEAR 2081>
		       <PERFORM ,V?EXAMINE ,BUILDING>
		       <RTRUE>)
		      (T
		       <COND (<EQUAL? ,HERE ,BODANSKI-SQUARE>
			      <PRINTD ,SIMONS>)
			     (<EQUAL? ,HERE ,MAIN-AND-WICKER>
			      <PRINTD ,THE-COACHMAN>)>
		       <TELL " is a large, fairly fancy restaurant." CR>)>)>>

;"status line stuff"

<CONSTANT S-TEXT 0>       ;"<SCREEN 0> puts cursor in text part of screen"
<CONSTANT S-WINDOW 1>     ;"<SCREEN 1> puts cursor in window part of screen"
<CONSTANT H-NORMAL 0>     ;"<HLIGHT 0> returns printing to normal (default)"
<CONSTANT H-INVERSE 1>    ;"<HLIGHT 1> sets printing mode to inverse video"
<CONSTANT H-BOLD 2>       ;"<HLIGHT 2> sets printing mode to bold, else normal"
<CONSTANT H-ITALIC 4>     ;"<HLIGHT 4> italicizes, else underline, else normal"
<CONSTANT D-SCREEN-ON 1>  ;"<DIROUT 1> turns on printing to the screen"
<CONSTANT D-SCREEN-OFF -1>;"<DIROUT -1> turns off printing to the screen"
<CONSTANT D-PRINTER-ON 2> ;"<DIROUT 2> turns on printing to the printer"
<CONSTANT D-PRINTER-OFF -2>;"<DIROUT -2> turns off printing to the printer"
<CONSTANT D-TABLE-ON 3>   ;"<DIROUT 3 .TABLE> turns on printing to that table"
<CONSTANT D-TABLE-OFF -3> ;"<DIROUT -3> turns off printing to that table"
<CONSTANT D-RECORD-ON 4>  ;"<DIROUT 4> sends READs and INPUTs to record file"
<CONSTANT D-RECORD-OFF -4>;"<DIROUT -4> stops sending READs and INPUTs to file"

<ROUTINE INIT-STATUS-LINE (HEIGHT "OPTIONAL" (DONT-CLEAR <>))
	 <COND (<NOT .DONT-CLEAR>
	 	<CLEAR -1>
	 	<SPLIT .HEIGHT>)>
	 <SETG L-HERE <>>
	 <SETG L-MODE <>>
	 <SETG L-DATE <>>
	 <SCREEN ,S-WINDOW>
	 <BUFOUT <>>
	 <COND (<EQUAL? .HEIGHT 7> ;"title screens"
		<RTRUE>)>
	 <INVERSE-LINE 1>
	 <INVERSE-LINE 2>
	 <HLIGHT 1>
	 <CURSET 1 2>
	 <TELL "Mode:">
	 <CURSET 1 60>
	 <TELL "Time:">
	 <CURSET 2 2>
	 <TELL "Location:">
	 <CURSET 2 60>
	 <TELL "Date:">
	 <HLIGHT 0>
	 <BUFOUT T>
	 <SCREEN ,S-TEXT>>

<ROUTINE INVERSE-LINE (LINE-NUMBER "OPTIONAL" (CENTER-HALF <>))
	 <COND (.CENTER-HALF
		<CURSET .LINE-NUMBER 21>)
	       (T
		<CURSET .LINE-NUMBER 1>)>
	 <HLIGHT 1>
	 <REPEAT ()
		 ;<BUFOUT T> ;"only use for (speeding up) Amiga"
		 <TELL "                                        ">
		 ;<BUFOUT <>> ;"only use for (speeding up) Amiga"
		 <COND (.CENTER-HALF
			<RETURN>)
		       (T
			<SET CENTER-HALF T>)>>
	 <HLIGHT 0>>

<ROUTINE PRINT-SPACES (CNT)
	 <REPEAT ()
		 <COND (<L? <SET CNT <- .CNT 1>> 0>
			<RETURN>)
		       (T
			<PRINTC 32>)>>>

<ROUTINE CONTINUE ("AUX" (CURRENTLY-SCRIPTING <>) CNT)
	 <COND (<G? <GETB 0 32> 21> ;"is screen more than 21 lines tall?"
	        <SET CNT <- <GETB 0 32> 21>>
	        <REPEAT ()
			<SET CNT <- .CNT 1>>
			<CRLF>
			<COND (<EQUAL? .CNT 0>
			       <RETURN>)>>)>
	 <COND (<BTST <GET 0 8> 1> ;"turn scripting off so [MORE] won't print"
		<SET CURRENTLY-SCRIPTING T>
		<DIROUT ,D-PRINTER-OFF>)>
	 <TELL "[Hit any key to continue.]">
	 <BUFOUT <>>
	 <BUFOUT T>
	 <COND (.CURRENTLY-SCRIPTING
		<DIROUT ,D-PRINTER-ON>)>
	 <INPUT 1>>

<GLOBAL SL-BUFFER <ITABLE NONE 80>>

<ROUTINE STATUS-LINE ("AUX" LEN LOCATION)
	 <BUFOUT <>>
	 <SCREEN ,S-WINDOW>
	 <HLIGHT 1>
	 <COND (<OR <NOT <EQUAL? ,MODE ,L-MODE>>
		    <AND ,RECORDING
			 <NOT ,L-RECORDING>>
		    <AND ,L-RECORDING
			 <NOT ,RECORDING>>>
		<DIROUT ,D-SCREEN-OFF> ;"stop printing to screen"
		<DIROUT ,D-TABLE-ON ,SL-BUFFER> ;"start printing to buffer"
	 	<TELL D ,MODE>
		<COND (,RECORDING
		       <TELL " (recording)">)>
	 	<DIROUT ,D-TABLE-OFF> ;"stop, put length in 1st slot"
		<DIROUT ,D-SCREEN-ON> ;"resume printing to screen"
	 	<SET LEN <GET ,SL-BUFFER 0>>
	 	<CURSET 1 9>
	 	<TELL D ,MODE>
		<COND (,RECORDING
		       <SETG L-RECORDING T>
		       <TELL " (recording)">)
		      (T
		       <SETG L-RECORDING <>>)>
		<SETG L-MODE ,MODE>
	 	<PRINT-SPACES <- 33 .LEN>>)>
	 <CURSET 1 67>
	 <COND (,SIMULATING
		<TIME-PRINT ,STIME>)
	       (T
		<TIME-PRINT ,TIME>)>
	 <PRINT-SPACES 3>
	 <COND (<OR <AND ,CURRENT-FILE
			 <NOT <EQUAL? ,L-HERE ,CURRENT-DIRECTORY>>>
		    <AND <NOT ,CURRENT-FILE>
			 <NOT <EQUAL? ,L-HERE ,HERE>>>>
		<CURSET 2 13>
	 	<DIROUT ,D-SCREEN-OFF> ;"stop printing to screen"
		<DIROUT ,D-TABLE-ON ,SL-BUFFER> ;"start printing to buffer"
	 	<COND (,CURRENT-FILE
		       <SET LOCATION ,CURRENT-DIRECTORY>)
	       	      (T
		       <SET LOCATION ,HERE>)>
	 	<TELL D .LOCATION>
		<SETG L-HERE .LOCATION>
		<DIROUT ,D-TABLE-OFF> ;"stop, put length in 1st slot"
	 	<DIROUT ,D-SCREEN-ON> ;"resume printing to screen"
	 	<SET LEN <GET ,SL-BUFFER 0>>
	 	<TELL D .LOCATION>
	 	<PRINT-SPACES <- 29 .LEN>>)>
	 <COND (<AND ,SIMULATING
		     <NOT <EQUAL? ,SDATE ,L-DATE>>>
		<CURSET 2 67>
		<TELL N ,SMONTH "/" N ,SDATE "/" N ,SYEAR>
		<SETG L-DATE ,SDATE>
		<PRINT-SPACES 3>)
	       (<AND <NOT ,SIMULATING>
		     <NOT <EQUAL? ,DATE ,L-DATE>>>
		<CURSET 2 67>
		<TELL N ,MONTH "/" N ,DATE "/" N ,YEAR>
		<SETG L-DATE ,DATE>
		<PRINT-SPACES 3>)>
	 <SCREEN ,S-TEXT>
	 <HLIGHT 0>
	 <BUFOUT T>>

<GLOBAL HERE <>>

<GLOBAL L-HERE <>>

<GLOBAL L-MODE <>>

<GLOBAL L-DATE <>>

<GLOBAL TIME 1147> ;"7:07pm, if you care"

<GLOBAL YEAR 2031>

<GLOBAL MONTH 3>

<GLOBAL DATE 16>

<ROUTINE TIME-PRINT (TM "OPTIONAL" (SKIP-AM-PM <>) "AUX" HR)
	 <COND (<G? .TM 1440>
		<SET TM <- .TM 1440>>)>
	 <SET HR </ .TM 60>>
	 <COND (<G? .HR 12>
		<SET HR <- .HR 12>>)>
	 <COND (<EQUAL? .HR 0>
		<TELL "12">)
	       (T
		<PRINTN .HR>)>
	 <TELL ":">
	 <SET HR <MOD .TM 60>>
	 <COND (<L? .HR 10>
		<TELL "0">)>
	 <TELL N .HR>
	 <COND (.SKIP-AM-PM
		<RTRUE>)>
	 <AM-PM-PRINT .TM>>

<ROUTINE JUSTIFY-TIME-PRINT (NUM)
	 <COND (<AND <G? .NUM 59>
		     <L? .NUM 600>>
		<TELL " ">)
	       (<AND <L? .NUM 1320>
		     <G? .NUM 779>>
		<TELL " ">)>
	 <TIME-PRINT .NUM T>>

<ROUTINE AM-PM-PRINT (NUM)
	 <COND (<OR <L? .NUM 720>
		    <EQUAL? .NUM 1440>>
		<TELL "am">)
	       (T
		<TELL "pm">)>>

;"shared stuff"

;<ROUTINE TITLE-PRINT ()
	 <COND (<BTST <GET 0 1> 16> ;"can this interpreter print italics?"
		<HLIGHT 4>
		<TELL "A Mind Forever Voyaging">
		<HLIGHT 0>)
	       (T
		<TELL "A MIND FOREVER VOYAGING">)>>

<ROUTINE TITLE-PRINT ()
	 <ITALICIZE "A Mind Forever Voyaging">>

<ROUTINE TURN-RECORD-OFF ("OPTIONAL" (SIM <>))
	 <COND (,RECORDING
		<SOUND 1>
		<SETG RECORDING <>>
		<COND (.SIM
		       <CRLF>)>
	        <TELL "WARNING: Deactivating record feature." CR>
		<COND (<NOT .SIM>
		       <CRLF>)>)>>

<ROUTINE ERR (STR "OPTIONAL" (NO-CR <>))
	 <SOUND 2>
	 <TELL "ERROR: " .STR>
	 <COND (<NOT .NO-CR>
		<CRLF>)>
	 <RTRUE>>

<ROUTINE CANT-SEE (OBJ "AUX" PTR)
	 <TELL "[You can't see">
	 <COND (<FSET? .OBJ ,MYBIT> ;"avoids YOU CAN'T SEE ANY MY BUZZER HERE"
		<TELL " " D .OBJ>)
	       (T
	 	<COND (<OR <NOT <FSET? .OBJ ,NARTICLEBIT>>
			   <EQUAL? .OBJ ,MEAL>>
		       <TELL " any">)>
	 	<COND (<EQUAL? .OBJ ,PRSO>
		       <COND (<OR ,P-MERGED
				  <==? <GET <SET PTR <GET ,P-ITBL ,P-NC1>> 0>
				       ,W?IT>>
			      <TELL " " D ,PRSO>)
			     (T
			      <BUFFER-PRINT .PTR <GET ,P-ITBL ,P-NC1L> <>>)>)
		      (<OR ,P-MERGED
			   <==? <GET <SET PTR <GET ,P-ITBL ,P-NC2>> 0> ,W?IT>>
		       <TELL " " D ,PRSI>)
		      (T
		       <BUFFER-PRINT .PTR <GET ,P-ITBL ,P-NC2L> <>>)>)>
	 <TELL " here.]" CR>
	 <CLEAR-BUF>>

;<ROUTINE PRSO-PRINT ("AUX" PTR) ;"moved directly into CANT-SEE"
	 <COND (<OR ,P-MERGED
		    <==? <GET <SET PTR <GET ,P-ITBL ,P-NC1>> 0> ,W?IT>>
		<TELL " " D ,PRSO>)
	       (T <BUFFER-PRINT .PTR <GET ,P-ITBL ,P-NC1L> <>>)>>

;<ROUTINE PRSI-PRINT ("AUX" PTR) ;"moved directly into CANT-SEE"
	 <COND (<OR ,P-MERGED
		    <==? <GET <SET PTR <GET ,P-ITBL ,P-NC2>> 0> ,W?IT>>
		<TELL " " D ,PRSI>)
	       (T <BUFFER-PRINT .PTR <GET ,P-ITBL ,P-NC2L> <>>)>>

<ROUTINE DISCONNECTED ()
	 <TELL
"? Per Project regulations, I have no choice but to shut down your
conscious-level processors while we reevaluate your psychological makeup.
I...I don't know what else to say.\" You feel your senses begin to ebb..." CR>
	 <FINISH>>

<ROUTINE MILE-AWAY (OBJ)
	  <TELL "The " D .OBJ " is nearly a mile away!" CR>>

<ROUTINE FROM-HERE ()
	 <TELL "You can't see much of the " D ,PRSO " from here." CR>>

<ROUTINE TELL-ME-HOW ()
	 <TELL "It's not obvious how to do that to">
	 <ARTICLE ,PRSO>
	 <TELL "." CR>>

<ROUTINE OF-COURSE (OBJ)
	 <TELL "The " D .OBJ " is closed at this hour, of course." CR>>

<ROUTINE ADDRESS-DIRECTLY (ACTOR)
	 <TELL "You must address">
	 <ARTICLE .ACTOR T>
	 <TELL " directly." CR>
	 <CLEAR-BUF>>

;<ROUTINE OUT-OF-FIRST (VEHICLE)
	 <TELL "You'll have to get out of the " D .VEHICLE ", first." CR>>

;<ROUTINE PART-OF ()
	 <TELL "You can't --">
	 <ARTICLE ,PRSO T>
	 <TELL " is an integral part of">
	 <ARTICLE <LOC ,PRSO> T>
	 <TELL "." CR>>

<ROUTINE CLOTHES-BUDGET ()
	 <TELL
"You've already strained your clothes budget; Jill would have your hide
if you spent more." CR>>

<ROUTINE FURNITURE-REMOVED ()
	 <TELL "All the furniture has been removed!" CR>>

<GLOBAL LOOK-AROUND "Look around you.">

;<GLOBAL TOO-DARK "It's too dark to see!">

<GLOBAL CANT-GO "[You can't go that way.]">

<GLOBAL YOU-ARE "You already are!">

<GLOBAL ALREADY-OPEN "It is already open.">

<GLOBAL ALREADY-CLOSED "It is already closed.">

<GLOBAL REFERRING "I don't see what you're referring to.">

<GLOBAL IT-LOOKS-LIKE "It looks like">

<GLOBAL NOT-HOLDING "You're not holding">

<GLOBAL RECOGNIZE "[That sentence isn't one I recognize.]">

<GLOBAL ENTER-COMM-MODE
"Enter Communications Mode as a prerequisite for activating this outlet.">

<GLOBAL BARTENDER-YELLS
"The bartender yells out, \"Hey buster, you can't leave with that mug!\"">

<GLOBAL SHOT-ON-SIGHT
"The gates of the estate are all locked; besides, the grounds are certainly
thoroughly guarded, and you'd be shot on sight if you were found within
the walls.">

<GLOBAL MESSAGE-LINE "A message begins coming over the message line: ">

<GLOBAL NOT-ACTIVE "That function is no longer active.">

<GLOBAL TOBACCO-ODOR "The odor of burnt tobacco pervades the room.">

<GLOBAL CONTACT "\"Contact acknowledged.\"">

<GLOBAL BEYOND-BOUNDS
"\"That command is beyond the bounds of this unit's programming.\"">

<GLOBAL HEAD-THROBS
"our head throbs from the blow you took during the mugging.">

<GLOBAL RIVER-DESC
"o the south, the river bends around Rockvil before flowing
upcountry toward North Dakota and the Garrison Lakes.">

<GLOBAL NO-TICKET "You don't have a ticket.">

<GLOBAL TUBECAR-WAITING
"A tubecar, its doors open, is waiting on the tracks to the ">

<GLOBAL PRIVATE-LINE "\"Perelman to PRISM, private line, no storage: ">

<GLOBAL FINISHED-VIEWING
". \"PRISM, several of my colleagues and I have finished viewing the
recordings that you made, and ">

<GLOBAL MAYBE-MORE
". Maybe you could collect some more data, make some more recordings,
and then report back to us. Well, I've got to run, but I'll talk to
you later.\" He leaves the room.">

<GLOBAL CHUN-DESC
"On the northeast corner is the Chun Building, a small office building.">

<GLOBAL OFFICIAL-LEAVES
". Suddenly he glances at his watch, mumbles a polite parting
message, and hurries away.">

<GLOBAL TECHNICAL-DIFFICULTIES
"All you see is a static test pattern, with the message \"We are experiencing
technical difficulties -- please stand by.\"">

<GLOBAL AQUARIUM-SMELL
"A rotten odor, possibly of dead fish, hangs in the air.">

<GLOBAL STOOL-DESC ". Battered wooden stools are the only seating. ">

<GLOBAL PRACTICAL-JOKE
". If this is your idea of a practical joke, it isn't very funny. We're pretty
overworked around here as it is.\" He stalks out of the room.">

<ROUTINE PERELMAN-WALKS-IN-WITH-COFFEE ()
	 <COND (<EQUAL? ,HERE ,OFFICE>
		<TELL CR
"Doctor Perelman walks into the office carrying a cup of coffee. He sits down
at his desk, places the coffee mug almost out of sight below your monitor, and
begins working." CR>
		<RTRUE>)>
	 <RFALSE>>

<GLOBAL ALGEBRA "! I got 96 on my algebra test!\"">

<GLOBAL SPOTS-ACTIVE-LIGHT
" spots the active light on your communication unit">

<GLOBAL MITCHELL-BACK-FIRST "You should put Mitchell back in the crib first.">

<GLOBAL COME-TO-MY-OFFICE
"Please meet me at the communications outlet in my office right away.\"">

<GLOBAL RS-DESC
"ou can make out the gleaming surface of the receiver station, nestled among
the forests west of the city, where orbiting solar collectors beam their
precious energy.">

<GLOBAL CURRENT-FISCAL "ed during current fiscal year:  ">

<GLOBAL SYMPHONY-CLOSED "\"Symphony closed until further notice.\"">

<GLOBAL CHANGE-AGENTS ". I don't know why you don't change agents.\"">

<GLOBAL BOB-WILLIAMS
"\"This is the World News Network. I'm Bob Williams, and here are some
of the top stories we're covering today: ">

<GLOBAL NEWSMAKER-NOOK
"\"You're watching the World News Network, and today our guest on the
Newsmaker Nook is ">

<GLOBAL WALLY-THE-WEATHERMAN
"\"Here's Wally the Weatherman with the national forecast. Wally?\" The
camera pans to a cheery, rotund man standing before a huge weather map of
North America. \"Thanks, Bob. ">

<GLOBAL TOM-SLAYTON
"\"Here's Tom Slayton with the Sports Roundup. Tom?\" A massively-built man,
obviously an ex-jock, appears in front of a graphic of a foot kicking a soccer
ball. His voice has a friendly, midwestern drawl. \"Howdy, sports fans. ">

<GLOBAL FOUNTAIN-DESC
"The ornate fountain in the center of the park is dry and covered
with graffiti.">

<GLOBAL MOVIE-TITLE " THE MAN WHO COULDN'T BE KILLED. ">

<GLOBAL MY-WEEK
"\"You don't have to help,\" says Jill, blowing you a kiss.
\"It's my week.\"">

<GLOBAL DESK-DESC
"Perelman's desk is covered with a number of items, including a decoder,
a map of the city, a ball-point pen, and a printout of a magazine article">

<GLOBAL BOARDED-OVER "The entrance is boarded over.">

<GLOBAL NO-EXIT-FROM-APARTMENT "There's no exit from the building here.">