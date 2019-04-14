"APARTMENT for
			A MIND FOREVER VOYAGING
	(c) Copyright 1985 Infocom, Inc.  All Rights Reserved."

<ROUTINE IN-APARTMENT? ()
	 <COND (<OR <EQUAL? ,HERE ,LIVING-ROOM ,KITCHEN>
		    <EQUAL? ,HERE ,BEDROOM ,BATHROOM>>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<OBJECT APARTMENT-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "apartment")
	(SYNONYM APARTMENT FLAT PAD)
	(FLAGS VOWELBIT)
	(GENERIC GENERIC-APARTMENT-F)
	(ACTION APARTMENT-OBJECT-F)>

<ROUTINE APARTMENT-OBJECT-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (<IN-APARTMENT?>
		       <TELL ,LOOK-AROUND CR>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?NORTH>)>)
	       (<VERB? DISEMBARK LEAVE>
		<COND (<EQUAL? ,HERE ,LIVING-ROOM>
		       <DO-WALK ,P?SOUTH>)
		      (<IN-APARTMENT?>
		       <TELL ,NO-EXIT-FROM-APARTMENT CR>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? WASH>
		<PERFORM ,V?WASH ,GLOBAL-ROOM>
		<RTRUE>)>>

<OBJECT LIVING-ROOM-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "living room")
	(SYNONYM ROOM)
	(ADJECTIVE LIVING LARGE SPRAWLING)
	(GENERIC GENERIC-ROOM-F)
	(ACTION LIVING-ROOM-OBJECT-F)>

<ROUTINE LIVING-ROOM-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,KITCHEN>
		       <DO-WALK ,P?WEST>)
		      (<EQUAL? ,HERE ,PARKVIEW-HALL>
		       <DO-WALK ,P?NORTH>)
		      (<EQUAL? ,HERE ,BEDROOM>
		       <DO-WALK ,P?SOUTH>)
		      (<EQUAL? ,HERE ,SOLARIUM>
		       <DO-WALK ,P?NORTH>)
		      (<EQUAL? ,HERE ,FOYER>
		       <DO-WALK ,P?SOUTH>)
		      (<EQUAL? ,HERE ,MASTER-BEDROOM>
		       <DO-WALK ,P?DOWN>)
		      (<EQUAL? ,HERE ,DINING-ROOM>
		       <DO-WALK ,P?WEST>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,LIVING-ROOM ,EPILOGUE-LIVING-ROOM>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,LIVING-ROOM ,EPILOGUE-LIVING-ROOM>>
		<V-LOOK>)
	       (<VERB? WASH>
		<PERFORM ,V?WASH ,GLOBAL-ROOM>
		<RTRUE>)>>

<OBJECT KITCHEN-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "kitchen")
	(SYNONYM KITCHEN)
	(ADJECTIVE TINY LOVELY)
	(GENERIC GENERIC-KITCHEN-F)
	(ACTION KITCHEN-OBJECT-F)>

<ROUTINE KITCHEN-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,KITCHEN ,EPILOGUE-KITCHEN>
		       <TELL ,LOOK-AROUND CR>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?EAST>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,KITCHEN ,EPILOGUE-KITCHEN>
		       <DO-WALK ,P?WEST>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,KITCHEN ,EPILOGUE-KITCHEN>>
		<V-LOOK>)
	       (<VERB? WASH>
		<PERFORM ,V?WASH ,GLOBAL-ROOM>
		<RTRUE>)>>

<OBJECT BEDROOM-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "bedroom")
	(SYNONYM BEDROOM ROOM)
	(ADJECTIVE BED GUEST MASTER HUGE ROUND SUNNY COZY)
	(GENERIC GENERIC-ROOM-F)
	(ACTION BEDROOM-OBJECT-F)>

<ROUTINE BEDROOM-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,BEDROOM ,MASTER-BEDROOM ,GUEST-ROOM>
		       <TELL ,LOOK-AROUND CR>)
		      (<EQUAL? ,HERE ,BATHROOM ,FOYER>
		       <DO-WALK ,P?WEST>)
		      (<EQUAL? ,HERE ,EPILOGUE-LIVING-ROOM>
		       <DO-WALK ,P?UP>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <DO-WALK ,P?NORTH>)>)
	       (<VERB? DISEMBARK LEAVE>
		<COND (<EQUAL? ,HERE ,BEDROOM>
		       <DO-WALK ,P?SOUTH>)
		      (<EQUAL? ,HERE ,MASTER-BEDROOM>
		       <DO-WALK ,P?DOWN>)
		      (<EQUAL? ,HERE ,GUEST-ROOM>
		       <DO-WALK ,P?EAST>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,BEDROOM ,MASTER-BEDROOM ,GUEST-ROOM>>
		<V-LOOK>)
	       (<VERB? WASH>
		<PERFORM ,V?WASH ,GLOBAL-ROOM>
		<RTRUE>)>>

<OBJECT BATHROOM-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "bathroom")
	(SYNONYM BATH BATHROOM ROOM RESTROOM)
	(ADJECTIVE LARGE PLAIN REST BATH)
	(GENERIC GENERIC-ROOM-F)
	(ACTION BATHROOM-OBJECT-F)>

<ROUTINE BATHROOM-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,BEDROOM>
		       <DO-WALK ,P?EAST>)
		      (<EQUAL? ,HERE ,FOYER>
		       <DO-WALK ,P?SW>)
		      (<GLOBAL-IN? ,PRSO ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,BEDROOM ,FOYER>
		       <TELL ,LOOK-AROUND CR>)
		      (<EQUAL? ,HERE ,EPILOGUE-BATHROOM>
		       <DO-WALK ,P?NE>)
		      (T
		       <DO-WALK ,P?WEST>)>)
	       (<AND <VERB? TAKE>
		     <EQUAL? <GET ,P-NAMW 0> ,W?BATH>>
		<COND (<EQUAL? ,HERE ,EPILOGUE-BATHROOM>
		       <PERFORM ,V?BOARD ,TUB>
		       <RTRUE>)
		      (T
		       <TELL "There's no tub here." CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,BATHROOM ,EPILOGUE-BATHROOM>>
		<V-LOOK>)
	       (<VERB? WASH>
		<PERFORM ,V?WASH ,GLOBAL-ROOM>
		<RTRUE>)>>

<OBJECT PARKVIEW-APARTMENTS-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "Parkview Apartments")
	(SYNONYM APARTMENT)
	(ADJECTIVE PARKVIEW)
	(FLAGS NARTICLEBIT)
	(GENERIC GENERIC-APARTMENT-F)
	(ACTION PARKVIEW-APARTMENTS-OBJECT-F)>

<ROUTINE PARKVIEW-APARTMENTS-OBJECT-F ()
	 <COND (<VERB? THROUGH WALK-TO>
		<COND (<EQUAL? ,HERE ,SOUTHWAY-AND-PARK>
		       <DO-WALK ,P?WEST>)
		      (<GLOBAL-IN? ,PARKVIEW-APARTMENTS-OBJECT ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? EXIT LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,PARKVIEW-APARTMENTS>
		       <DO-WALK ,P?EAST>)
		      (<EQUAL? ,HERE ,SOUTHWAY-AND-PARK>
		       <TELL ,LOOK-AROUND CR>)
		      (T
		       <TELL ,NO-EXIT-FROM-APARTMENT CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,PARKVIEW-APARTMENTS>>
		<V-LOOK>)>>

<ROOM PARKVIEW-APARTMENTS
      (LOC ROOMS)
      (DESC "Parkview Apartments")
      (IN PER INNER-LOBBY-ENTER-F)
      (OUT TO SOUTHWAY-AND-PARK)
      (EAST TO SOUTHWAY-AND-PARK)
      (WEST PER INNER-LOBBY-ENTER-F)
      (GLOBAL MAILBOXES PICTUREPHONE GRAFFITI PARKVIEW-APARTMENTS-OBJECT
	      GLASS)
      (ACTION PARKVIEW-APARTMENTS-F)>

<ROUTINE PARKVIEW-APARTMENTS-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<MOVE ,BUZZERS ,HERE>
		<RFALSE>)
	       (<EQUAL? .RARG ,M-LOOK>
		<DESCRIBE-APARTMENT-VESTIBULE "west" "east">)>>

<OBJECT MY-BUZZER
	(LOC GLOBAL-OBJECTS)
	(DESC "your buzzer")
	(SYNONYM BUZZER BELL)
	(ADJECTIVE MY)
	(FLAGS NDESCBIT NARTICLEBIT MYBIT)
	(ACTION MY-BUZZER-F)>

<ROUTINE MY-BUZZER-F ()
	 <COND (<AND <NOT <EQUAL? ,HERE ,PARKVIEW-APARTMENTS>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,MY-BUZZER>)
	       (<VERB? PUSH>
		<COND (<OR <EQUAL? ,SYEAR 2061 2071>
			   <G? ,STIME 1402>
			   <L? ,STIME 478>>
		       <TELL "There's no response to your buzzing." CR>)
		      (T
		       <TELL "A moment later, the door gives a loud buzz">
		       <COND (<NOT <FSET? ,PARKVIEW-DOOR ,OPENBIT>>
			      <FSET ,PARKVIEW-DOOR ,OPENBIT>
			      <TELL " and pops open">)>
		       <TELL "." CR>)>)
	       (<VERB? READ>
		<TELL "\"Jill and Perry Simm.\"" CR>)>>

<OBJECT MY-MAILBOX
	(LOC GLOBAL-OBJECTS)
	(DESC "your mailbox")
	(SYNONYM MAILBOX BOX)
	(ADJECTIVE MY MAIL)
	(FLAGS NDESCBIT NARTICLEBIT MYBIT)
	(ACTION MY-MAILBOX-F)>

<ROUTINE MY-MAILBOX-F ()
	 <COND (<AND <NOT <EQUAL? ,HERE ,PARKVIEW-APARTMENTS>>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,MY-MAILBOX>)
	       (<VERB? OPEN EXAMINE LOOK-INSIDE UNLOCK>
		<TELL "Your mailbox is empty." CR>)
	       (<VERB? CLOSE>
		<TELL "It is." CR>)>>

<OBJECT PARKVIEW-DOOR
	(LOC PARKVIEW-APARTMENTS)
	(DESC "door")
	(SYNONYM DOOR DOORS)
	(FLAGS DOORBIT NDESCBIT)
	(ACTION PARKVIEW-DOOR-F)>

<ROUTINE PARKVIEW-DOOR-F ()
	 <COND (<AND <VERB? OPEN UNLOCK>
		     <PRSI? ,KEY>>
		<COND (<FSET? ,PARKVIEW-DOOR ,OPENBIT>
		       <TELL "It's already open." CR>)
		      (T
		       <FSET ,PARKVIEW-DOOR ,OPENBIT>
		       <TELL "The door opens." CR>)>)
	       (<AND <VERB? OPEN>
		     <NOT <FSET? ,PARKVIEW-DOOR ,OPENBIT>>>
		<TELL "The door is locked." CR>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,SYEAR 2071>>
		<PERFORM ,V?EXAMINE ,UNOPENABLE-DOOR>
		<RTRUE>)>>

<ROUTINE INNER-LOBBY-ENTER-F ()
	 <COND (<AND <EQUAL? ,HERE ,PARKVIEW-APARTMENTS>
		     <FSET? ,PARKVIEW-DOOR ,OPENBIT>>
		<FCLEAR ,PARKVIEW-DOOR ,OPENBIT>
		<TELL "You enter the inner lobby and">
		<COND (<EQUAL? ,SYEAR 2061 2071>
		       <SCORE 3> ;"1 point"
		       <TELL
", since the elevators are out as usual, you slowly walk up the several
flights to your floor." CR CR>)
		      (T
		       <COND (<EQUAL? ,SYEAR 2051>
			      <COND (<G? ,STIME 1374>
				     <SETG MITCHELL-COUNTER 0>
				     <MOVE ,MITCHELL ,LOCAL-GLOBALS>)
				    (<G? ,STIME 1120>
				     <SETG MITCHELL-COUNTER 4>
				     <MOVE ,HOMEWORK ,LIVING-ROOM>
				     <MOVE ,MITCHELL ,LIVING-ROOM>)
				    (<G? ,STIME 1011>
				     <SETG MITCHELL-COUNTER 3>
				     <MOVE ,MITCHELL ,LIVING-ROOM>)
				    (<G? ,STIME 505>
				     <SETG MITCHELL-COUNTER 2>
				     <MOVE ,MITCHELL ,LOCAL-GLOBALS>)
				    (<G? ,STIME 463>
				     <SETG MITCHELL-COUNTER 1>
				     <MOVE ,MITCHELL ,LIVING-ROOM>)
				    (T
				     <SETG MITCHELL-COUNTER 0>
				     <MOVE ,MITCHELL ,LOCAL-GLOBALS>)>
			      <QUEUE I-MITCHELL -1>)>
		       <TELL " take the elevator up to your floor." CR CR>)>
		,PARKVIEW-HALL)
	       (T
		<TELL "The door to the inner lobby is locked." CR>
		<COND (<EQUAL? ,HERE ,PARKVIEW-APARTMENTS>
		       <SETG P-IT-OBJECT ,PARKVIEW-DOOR>)
		      (T
		       <SETG P-IT-OBJECT ,UNOPENABLE-DOOR>)>
		<RFALSE>)>>

<ROOM PARKVIEW-HALL
      (LOC ROOMS)
      (DESC "Hall Near Your Apartment")
      (IN TO LIVING-ROOM IF APARTMENT-DOOR IS OPEN)
      (NORTH TO LIVING-ROOM IF APARTMENT-DOOR IS OPEN)
      (EAST PER HALL-NEAR-YOUR-APARTMENT-EXIT-F)
      (OUT PER HALL-NEAR-YOUR-APARTMENT-EXIT-F)
      (DOWN PER HALL-NEAR-YOUR-APARTMENT-EXIT-F)
      (GLOBAL APARTMENT-DOOR APARTMENT-OBJECT STAIRS HALLWAY
       	      LIVING-ROOM-OBJECT PARKVIEW-APARTMENTS-OBJECT)
      (ACTION PARKVIEW-HALL-F)>

<ROUTINE PARKVIEW-HALL-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are standing in the hall at the door to your apartment, which lies ">
		<COND (<FSET? ,APARTMENT-DOOR ,OPENBIT>
		       <TELL "open">)
		      (T
		       <TELL "closed">)>
		<TELL
" to the north. The stairs and elevators to the
street are off to the east.">)>>

<ROUTINE HALL-NEAR-YOUR-APARTMENT-EXIT-F ()
	 <TELL
"You descend to the first floor and head for the lobby..." CR CR>
	 ,PARKVIEW-APARTMENTS>

<OBJECT APARTMENT-DOOR
	(LOC LOCAL-GLOBALS)
	(DESC "door")
	(SYNONYM DOOR)
	(FLAGS DOORBIT)
	(ACTION APARTMENT-DOOR-F)>

<ROUTINE APARTMENT-DOOR-F ()
	 <COND (<AND <EQUAL? ,HERE ,FOYER>
		     <VERB? OPEN THROUGH>>
		<DO-WALK ,P?NORTH>)
	       (<AND <VERB? UNLOCK OPEN>
		     <PRSI? ,KEY>
		     <NOT <EQUAL? ,HERE ,FOYER>>>
		<COND (<FSET? ,APARTMENT-DOOR ,OPENBIT>
		       <TELL "The door's open!" CR>)
		      (<EQUAL? ,HERE ,LIVING-ROOM>
		       <TELL
"You don't need the key to open the door from the inside!">
		       <COND (<IN? ,JILL ,HERE>
			      <TELL
" Jill gives you a funny look as you try.">)>
		       <CRLF>)
		      (T
		       <FSET ,APARTMENT-DOOR ,OPENBIT>
		       <TELL "The door opens." CR>)>)
	       (<AND <VERB? LOCK>
		     <NOT <EQUAL? ,HERE ,FOYER>>>
		<FCLEAR ,APARTMENT-DOOR ,OPENBIT>
		<TELL "The door latches automatically when you close it." CR>)
	       (<VERB? KNOCK>
		<COND (<EQUAL? ,HERE ,LIVING-ROOM ,FOYER>
		       <TELL "There's no need to knock from the inside." CR>)
		      (<OR <EQUAL? ,SYEAR 2061 2071>
			   <G? ,STIME 1400>
			   <L? ,STIME 478>>
		       <TELL "There's no response." CR>)
		      (<FSET? ,APARTMENT-DOOR ,OPENBIT>
		       <TELL "You hear Jill call \"It's open!\"" CR>)
		      (T
		       <SETG FOLLOW-FLAG 8>
		       <QUEUE I-UNFOLLOW 2>
		       <FSET ,APARTMENT-DOOR ,OPENBIT>
		       <FSET ,JILL ,TOUCHBIT>
		       <TELL
"After a moment, Jill opens the door. \"Hi, hon! Forget your key?\" She
gives you a peck on the cheek and walks into the apartment." CR>)>)
	       (<AND <VERB? OPEN>
		     <EQUAL? ,HERE ,PARKVIEW-HALL>
		     <NOT <FSET? ,APARTMENT-DOOR ,OPENBIT>>>
		<TELL "The door is locked." CR>)>>

<ROOM LIVING-ROOM
      (LOC ROOMS)
      (DESC "Living Room")
      (NORTH TO BEDROOM)
      (EAST TO KITCHEN)
      (SOUTH PER APARTMENT-EXIT-F)
      (OUT PER APARTMENT-EXIT-F)
      (FLAGS ONBIT)
      (GLOBAL HIGHWAY APARTMENT-OBJECT APARTMENT-WINDOW APARTMENT-DOOR HALLWAY
       	      CHILDREN KITCHEN-OBJECT LIVING-ROOM-OBJECT BEDROOM-OBJECT WOMAN
	      PARKVIEW-APARTMENTS-OBJECT)
      (ACTION LIVING-ROOM-F)>

<ROUTINE LIVING-ROOM-F (RARG)
	 <COND (<AND <EQUAL? .RARG ,M-ENTER>
		     <EQUAL? ,L-HERE ,PARKVIEW-HALL>>
		<COND (<EQUAL? ,SYEAR 2071>
		       <COND (<NOT ,MITCHELL-RAID-FLAG>
			      <MOVE ,JILL ,LIVING-ROOM>
			      <QUEUE I-MITCHELL-RAID 19>)
			     (T
			      <QUEUE I-APARTMENT -1>)>)
		      (<EQUAL? ,SYEAR 2061>
		       <COND (<NOT ,MITCHELL-NEWS-FLAG>
			      <QUEUE I-JILL 9>
			      <MOVE ,JILL ,LOCAL-GLOBALS>)
			     (T
			      <QUEUE I-APARTMENT -1>)>)
		      (T
		       <PUT-JILL-IN-THE-RIGHT-PLACE>
		       <COND (<EQUAL? ,SYEAR 2051>
			      <QUEUE I-APARTMENT -1>)>
		       <QUEUE I-JILL -1>)>)
	       (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is the large living area of your apartment, with a bedroom to the
north and a kitchen to the east. The front door of the apartment, next to
the couch on the south wall, is ">
		<COND (<FSET? ,APARTMENT-DOOR ,OPENBIT>
		       <TELL "open">)
		      (T
		       <TELL "closed">)>
		<TELL ". A huge window provides a panoramic view to the west.">
		<RAID-MESS-DESC>
		<CRLF> <CRLF>
		<EASEL-DESC>
		<TELL " In one corner is the old ">
		<PRINTD ,WORD-PROCESSOR>
		<TELL " where you do your writing.">)>>

<ROUTINE RAID-MESS-DESC ()
	 <COND (,APARTMENT-RAID-FLAG
		;<COND (<AND <EQUAL? ,SYEAR 2051>
		     	    <NOT <EQUAL? ,JILL-COUNTER 13>>>
		       <RTRUE>)>
		<TELL " The room is ">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL "torn apart">)
		      (T
		       <TELL "very messy">)>
		<TELL " after the BSF raid.">)>>

<ROUTINE APARTMENT-EXIT-F ()
	 <COND (<NOT <FSET? ,APARTMENT-DOOR ,OPENBIT>>
		<TELL "The door is closed." CR>
		<SETG P-IT-OBJECT ,APARTMENT-DOOR>
		<RFALSE>)
	       (<HELD? ,BABY>
		<COND (<EQUAL? ,JILL-COUNTER 0>
		       <TELL "As Jill would say if she were awake">)
		      (T
		       <TELL "Jill yells">)>
		<TELL
", \"Perry! Don't take Mitchell outside! He'll get a chill!\"" CR>
		<RFALSE>)
	       (T
		,PARKVIEW-HALL)>>

<OBJECT WORD-PROCESSOR
	(LOC LIVING-ROOM)
	(DESC "word processor")
	(SYNONYM PROCESSOR TYPEWRITER WP)
	(ADJECTIVE WORD OLD)
	(FLAGS LIGHTBIT TRYTAKEBIT NDESCBIT)
	(ACTION WORD-PROCESSOR-F)>

<ROUTINE WORD-PROCESSOR-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"It's an old model, but it was the best WP you could afford." CR>)
	       (<VERB? WRITE SIT BOARD>
		<TELL "You're not in the proper mood for writing." CR>)
	       (<VERB? TAKE MOVE>
		<TELL "You don't want to move the ">
		<PRINTD ,WORD-PROCESSOR>
		<TELL " -- it's old and flaky and breaks easily." CR>)>>

<OBJECT EASEL
	(LOC LIVING-ROOM)
	(DESC "easel")
	(SYNONYM EASEL EASLE)
	(ADJECTIVE JILL\'S)
	(FLAGS VOWELBIT NDESCBIT)
	(ACTION EASEL-F)>

<ROUTINE EASEL-F ()
	<COND (<VERB? TAKE MOVE>
	       <TELL
"Jill doesn't like you fooling with her painting and drawing stuff." CR>)
	      (<VERB? EXAMINE>
	       <EASEL-DESC T>)>>

<ROUTINE EASEL-DESC ("OPTIONAL" (X <>))
	 <COND (<EQUAL? ,SYEAR 2041>
		<TELL
"Jill's easel occupies a beautiful, well-lit spot near the window. Her
current painting is on the easel.">)
	       (T
	       	<TELL "Jill's current artistic endeavor, ">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL "a pencil sketch">)
		      (T
		       <TELL "an acrylide painting">)>
		<TELL
", is on her easel, near the entrance to the kitchen.">)>
	 <COND (.X ;"LIVING-ROOM-F calls this w/o arg. for part of room desc"
		<CRLF>)>
	 <RTRUE>>

<OBJECT PAINTING
	(LOC LIVING-ROOM)
	(DESC "painting")
	(SYNONYM PAINTING ART ARTWORK CANVAS SKETCH WATERCOLOR ENDEAVOR
		 PICTURE)
	(ADJECTIVE WATERCOLOR BRIGHT ARTISTIC VIBRANT ACRYLIDE BROODING
	 	   DARK PENCIL)
	(FLAGS NDESCBIT TRYTAKEBIT)
	(ACTION PAINTING-F)>

<ROUTINE PAINTING-F ()
	 <COND (<VERB? TAKE MOVE>
		<PERFORM ,V?TAKE ,EASEL>
		<RTRUE>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL
"The painting is a bright watercolor of the cliff-top Bermuda cottage
colony where you and Jill spent your honeymoon." CR>)
		      (<EQUAL? ,SYEAR 2051>
		       <TELL
"The painting, in vibrant acrylide colors, depicts workers in a space factory
hovering above machinery, sipping coffee tubes. A crescent earth dominates the
view through a domed canopy. It is Jill's most mature work to date." CR>)
		      (<EQUAL? ,SYEAR 2061>
		       <TELL
"The painting, in subdued shades of brown and gray, is of a beggar woman,
her face a mask of suffering." CR>)
		      (T
		       <TELL
"The sketch is dark and brooding, depicting a demonic figure towering
over a frightened group of children. It's been months since you last
saw Jill working on it." CR>)>)>>

<OBJECT PARTITION
	(LOC LOCAL-GLOBALS)
	(DESC "partition")
	(DESCFCN PARTITION-DESCFCN)
	(SYNONYM PARTITION)
	(ADJECTIVE THIN)
	(ACTION PARTITION-F)>

<ROUTINE PARTITION-F ()
	 <COND (<VERB? LOOK-BEHIND WALK-AROUND
		       LOOK> ;"LOOK AROUND OBJECT = V-LOOK"
		<TELL "Mitchell deserves his privacy." CR>)>>

<ROUTINE PARTITION-DESCFCN ("OPTIONAL" X)
	 <TELL
"A thin partition separates Mitchell's sleeping area from the rest
of the living room">
	 <COND (<AND <EQUAL? ,SYEAR 2061>
		     <NOT ,MITCHELL-NEWS-FLAG>>
		<TELL ". Some of Mitchell's stuff seems to be missing">)>
	 <TELL "." CR>>

<OBJECT MITCHELL
	(LOC LOCAL-GLOBALS)
	(DESC "Mitchell")
	(DESCFCN MITCHELL-DESCFCN)
	(SYNONYM MITCHELL SIMM MITCH RAV SON BOY LAD)
	(ADJECTIVE MITCHELL MITCH RAV MY)
	(FLAGS ACTORBIT NARTICLEBIT CONTBIT OPENBIT)
	(GENERIC GENERIC-MITCHELL-F)
	(ACTION MITCHELL-F)>

<ROUTINE MITCHELL-DESCFCN ("OPTIONAL" RARG)
	 <TELL "Mitchell is ">
	 <COND (<EQUAL? ,MITCHELL-COUNTER 1>
		<TELL "running around the room, getting ready for school">)
	       (<EQUAL? ,MITCHELL-COUNTER 3>
		<TELL "sitting in the corner, playing some kind of new ">
		<PRINTD ,LOGIC-GAME>)
	       (T
		<TELL "sprawled on the floor, doing some homework">)>
	 <TELL "." CR>>

<ROUTINE MITCHELL-F ()
	 <COND (<EQUAL? ,MITCHELL ,WINNER>
		<COND (<VERB? HELLO>
		       <TELL "\"Hi, Dad!\"" CR>)
		      (T
		       <TELL "\"Please, Dad! I'm trying to ">
		       <COND (<EQUAL? ,MITCHELL-COUNTER 1>
			      <TELL "get ready for school">)
			     (<EQUAL? ,MITCHELL-COUNTER 3>
			      <TELL "do a logic game">)
			     (T
			      <TELL "do my homework">)>
		       <TELL "!\"" CR>
		       <CLEAR-BUF>)>)
	       (<VERB? KISS>
		<TELL
"Mitchell looks a little embarrassed, but also smiles." CR>)
	       (<VERB? EXAMINE>
		<TELL
"Your son is a healthy, sturdy boy of nearly eleven years. ">
		<MITCHELL-DESCFCN>)
	       (<VERB? PLAY-WITH>
		<TELL "\"No thanks, Dad. Too much homework.\"" CR>)
	       (<VERB? FOLLOW>
		;<COND (,DEBUG
		       <TELL "[FOLLOW-FLAG = " N ,FOLLOW-FLAG ".]" CR>)>
		<COND (<EQUAL? ,FOLLOW-FLAG 12>
		       <DO-WALK ,P?SOUTH>)
		      (<EQUAL? ,FOLLOW-FLAG 10>
		       <DO-WALK ,P?DOWN>)
		      (<EQUAL? ,FOLLOW-FLAG 11>
		       <DO-WALK ,P?NORTH>)
		      (<EQUAL? ,FOLLOW-FLAG 14>
		       <PERFORM ,V?WALK-AROUND ,PARTITION>
		       <RTRUE>)
		      (<AND <EQUAL? ,HERE ,KITCHEN ,BEDROOM ,BATHROOM>
			    <IN? ,MITCHELL ,LIVING-ROOM>>
		       <TELL "Mitchell hasn't just left!" CR>)>)
	       (<AND <VERB? WALK-TO>
		     <PRSO? ,BED>>
		<COND (<L? ,STIME 1320>
		       <TELL "\"Aw, Dad, it's too early!\"" CR>)
		      (T
		       <TELL "\"Just a couple more minutes, Dad.\"" CR>)>)
	       (<VERB? TOUCH>
		<TELL "\"C'mon, Dad, I'm not ticklish anymore!\"" CR>)>>

<GLOBAL MITCHELL-COUNTER -1> ;"used for 2051:
			      0 = sleeping (nowhere)
			      1 = getting ready for school (LR)
			      2 = in school (nowhere)
			      3 = playing an electronic logic game (LR)
			      4 = doing homework (LR)"

<OBJECT HOMEWORK
	(LOC LOCAL-GLOBALS)
	(DESC "homework")
	(SYNONYM HOMEWORK COURSEWORK)
	(ADJECTIVE TYPICAL SIXTH-GRADE)
	(FLAGS NDESCBIT READBIT TRYTAKEBIT)
	(ACTION HOMEWORK-F)>

<ROUTINE HOMEWORK-F ()
	 <COND (<VERB? TAKE>
		<TELL "Mitchell's working on it!" CR>)
	       (<VERB? READ EXAMINE>
		<TELL "It looks like typical sixth-grade coursework." CR>)>>

<OBJECT LOGIC-GAME
	(LOC LOCAL-GLOBALS)
	(DESC "electronic logic game")
	(SYNONYM GAME)
	(ADJECTIVE NEW ELECTRONIC LOGIC MITCHELL FAVORITE)
	(FLAGS NDESCBIT TRYTAKEBIT)
	(ACTION LOGIC-GAME-F)>

<ROUTINE LOGIC-GAME-F ()
	 <COND (<VERB? EXAMINE>
		<TELL "It's just another of those popular ">
		<PRINTD ,LOGIC-GAME>
		<TELL "s. Mitchell looks as if he's quite good at it." CR>)
	       (<VERB? TAKE PLAY PLAY-WITH>
		<TELL "Mitchell's playing with it!" CR>)>>

<OBJECT COUCH
	(LOC LIVING-ROOM)
	(DESC "couch")
	(SYNONYM COUCH SOFA)
	(FLAGS NDESCBIT VEHBIT FURNITUREBIT OPENBIT)
	;(ACTION COUCH-F)>

;<ROUTINE COUCH-F ("OPTIONAL" RARG)
	 <COND (.RARG
		<RFALSE>)
	       (<VERB? OPEN CLOSE>
		<TELL "Huh?" CR>)>>

<OBJECT APARTMENT-WINDOW
	(LOC LOCAL-GLOBALS)
	(DESC "window")
	(SYNONYM WINDOW WINDOWS)
	(ADJECTIVE HUGE)
	(FLAGS TRANSBIT)
	(ACTION APARTMENT-WINDOW-F)>

<ROUTINE APARTMENT-WINDOW-F ()
	 <COND (<VERB? OPEN>
		<TELL "It's a little too chilly today." CR>)
	       (<VERB? CLOSE>
		<TELL "It is." CR>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,SYEAR 2061 2071>>
		<SCORE 4> ;"2 points"
		<TELL "The aging glass is etched from pollution." CR>)
	       (<VERB? LOOK-INSIDE>
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL
"The view from this picture window is the one notable plus about the
apartment. On the other side of the old interstate, you can see Rockvil's
wealthy western suburbs, surrounded by the woods and conservation lands
of the State Park System." CR>)
		      (<EQUAL? ,SYEAR 2051>
		       <SCORE 5> ;"3 points"
		       <TELL
"The panoramic view overlooks the suburbs of Westwood and Brentwood, as well
as extensive woodlands. The forests, as a result of increasingly acidic rain,
are thinner and browner each year." CR>)
		      (<EQUAL? ,SYEAR 2061>
		       <SCORE 6> ;"5 points"
		       <TELL
"The view to the west has changed considerably over the last decade. The
forest of dying trees has been replaced by a forest of thriving mining towers,
which trundle across the landscape leaving ugly brown scars. The western
suburbs, once the most desirable in greater Rockvil, now look nearly deserted,
a sign of the vanishing middle class." CR>)
		      (<EQUAL? ,SYEAR 2071>
		       <SCORE 7> ;"7 points"
		       <TELL
"Through the gray haze that covers western Rockvil you can discern an ugly
industrial slum, where thousands upon thousands of serfs live in substandard
shacks, running the factories and mines that support Rockvil's urban
nobility." CR>)>)>>

<ROOM KITCHEN
      (LOC ROOMS)
      (DESC "Kitchen")
      (WEST TO LIVING-ROOM)
      (OUT TO LIVING-ROOM)
      (FLAGS ONBIT)
      (GLOBAL SINK WATER APARTMENT-OBJECT KITCHEN-OBJECT LIVING-ROOM-OBJECT
	      COUNTER PARKVIEW-APARTMENTS-OBJECT)
      (ACTION KITCHEN-F)>

<ROUTINE KITCHEN-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This is the tiny kitchen of your apartment. Next to the sink is a small ">
		<PRINTD ,REFRIGERATOR>
		<TELL
". Along the western wall, next to the doorway to the living area, is a ">
		<PRINTD ,DINETTE-SET>
		<TELL ".">
		<RAID-MESS-DESC>
		<RTRUE>)>>

<OBJECT DINETTE-SET
	(LOC KITCHEN)
	(DESC "dinette set")
	(SYNONYM SET TABLE CHAIR CHAIRS)
	(CAPACITY 70)
	(ADJECTIVE DINETTE)
	(FLAGS NDESCBIT FURNITUREBIT SURFACEBIT VEHBIT OPENBIT)>

<OBJECT SALAD
	(LOC LOCAL-GLOBALS)
	(DESC "vegetable salad")
	(SYNONYM SALAD FOOD)
	(ADJECTIVE VEGETABLE)
	(FLAGS TRYTAKEBIT)
	(GENERIC GENERIC-FOOD-F)
	(ACTION SALAD-F)>

<ROUTINE SALAD-F ()
	 <COND (<VERB? TAKE EAT>
		<COND (<EQUAL? ,JILL-COUNTER 3 6>
		       <TELL "Jill's ">
		       <COND (<EQUAL? ,JILL-COUNTER 3>
		       	      <TELL "still making">)
		      	     (T
		       	      <TELL "eating">)>
		       <TELL " it!" CR>)
		      (T
		       <TELL
"Jill probably made that for herself. Besides, you can't stand
anything with avocadoes in it." CR>)>)
	       (<RANDOM-FOOD-F>
		<RTRUE>)>>

<OBJECT TURKEY-SANDWICH
	(LOC LOCAL-GLOBALS)
	(DESC "turkey sandwich")
	(SYNONYM SANDWICH SANDWICHES FOOD)
	(ADJECTIVE TURKEY)
	(FLAGS TAKEBIT EATBIT)
	(GENERIC GENERIC-FOOD-F)
	(ACTION SANDWICH-F)>

<OBJECT HAM-SANDWICH
	(LOC LOCAL-GLOBALS)
	(DESC "ham sandwich")
	(SYNONYM SANDWICH SANDWICHES FOOD)
	(ADJECTIVE HAM)
	(FLAGS TAKEBIT EATBIT)
	(GENERIC GENERIC-FOOD-F)
	(ACTION SANDWICH-F)>

<ROUTINE SANDWICH-F ()
	 <COND (<AND <VERB? BUY>
		     <EQUAL? <GET ,P-NAMW 0> ,W?FOOD>>
		;<COND (<OR <IN-RESTAURANT?>
			   <EQUAL? ,HERE ,FOODVILLE-1 ,FOODVILLE-2>>
		       <PERFORM ,V?BUY ,MEAL>
		       <RTRUE>)
		      (T
		       <CANT-BUY ,PRSO>)>
		<PERFORM ,V?BUY ,MEAL>
		<RTRUE>)>>

<OBJECT FORMULA
	(LOC LOCAL-GLOBALS)
	(DESC "bottle of baby formula")
	(SYNONYM BOTTLE BOTTLES FORMULA)
	(ADJECTIVE BABY)
	(FLAGS TAKEBIT)
	(ACTION FORMULA-F)>

<ROUTINE FORMULA-F ()
	 <COND (<VERB? EXAMINE>
		<TELL "The ">
		<PRINTD ,FORMULA>
		<TELL " has a nipple for the baby to suck on." CR>)
	       (<VERB? DRINK EAT>
		<TELL "It's for the baby, not you." CR>)>>

<OBJECT SINK
	(LOC LOCAL-GLOBALS)
	(DESC "sink")
	(SYNONYM SINK BASIN WASHBASIN FAUCET SPIGOT)
	(ADJECTIVE KITCHEN BATHROOM)
	(CAPACITY 50)
	(FLAGS NDESCBIT)
	(ACTION SINK-F)>

<ROUTINE SINK-F ()
	 <COND (<AND <VERB? PUT>
		     <PRSI? ,SINK>>
		<TELL "That's a dumb place for">
		<ARTICLE ,PRSO>
		<TELL "." CR>)
	       (<VERB? EXAMINE LOOK-INSIDE>
		<COND (<AND <EQUAL? ,HERE ,KITCHEN>
		     	    <EQUAL? ,JILL-COUNTER 7>>
		       <TELL "The sink is filled with suds." CR>)
		      (T
		       <TELL "The sink is empty." CR>)>)
	       (<VERB? TURN ON OFF>
		<PERFORM ,PRSA ,WATER>
		<RTRUE>)>>

<OBJECT DISHES
	(LOC KITCHEN)
	(DESC "dirty dishes")
	(SYNONYM DISH DISHES)
	(ADJECTIVE DIRTY)
	(FLAGS NDESCBIT TRYTAKEBIT)
	(ACTION DISHES-F)>

<ROUTINE DISHES-F ()
	 <COND (<VERB? TAKE>
		<TELL "The dishes should stay here until they're washed." CR>)
	       (<VERB? WASH>
		<COND (<IN? ,JILL ,HERE>
		       <TELL ,MY-WEEK CR>)
		      (T
		       <TELL
"It's Jill's week to do the household chores." CR>)>)>>

<OBJECT REFRIGERATOR
	(LOC KITCHEN)
	(DESC "refrigerator")
	(SYNONYM REFRIGERA FRIDGE FRIGE FRIG ICEBOX)
	(ADJECTIVE SMALL)
	(CAPACITY 100)
	(FLAGS NDESCBIT CONTBIT SEARCHBIT)>

<OBJECT SODA
	(LOC LOCAL-GLOBALS)
	(DESC "can of soda")
	(SYNONYM CAN SODA COKE PEPSI COLA PEPSI-COLA COCA-COLA POP TONIC)
	(ADJECTIVE COCA PEPSI SODA)
	(FLAGS TAKEBIT DRINKBIT)
	(GENERIC GENERIC-SODA-F)
	(ACTION SODA-F)>

<ROUTINE SODA-F ()
	 <COND (<VERB? OPEN>
		<COND (<FSET? ,SODA ,OPENBIT>
		       <TELL "It is." CR>)
		      (T
		       <FSET ,SODA ,OPENBIT>
		       <TELL "Opened." CR>)>)
	       (<VERB? CLOSE>
		<TELL "You can't reclose a ">
		<PRINTD ,SODA>
		<TELL "!" CR>
		;<COND (<FSET? ,SODA ,OPENBIT>
		       <TELL
"Like all soda cans, once you opened it, that's it." CR>)
		      (T
		       <TELL "It isn't open." CR>)>)
	       (<VERB? BUY>
		<COND (<EQUAL? ,HERE ,EZZIS-BAR ,BAR ,BURGER-MEISTER>
		       <TELL "You order some soda">
		       <COND (<TOO-POOR 3 ,SODA>
			      <RTRUE>)
			     (T
			      <DEBIT 3>
			      <TELL
". You down the entire glass, which is then removed." CR>)>)
		      (<EQUAL? ,HERE ,FOODVILLE-1 ,FOODVILLE-2>
		       <TELL "The soda shelves are bare.">
		       <COND (<EQUAL? ,SYEAR 2041>
			      <TELL " There must've been a sale.">)>
		       <CRLF>)
		      (<EQUAL? ,HERE ,DRUG-STORE>
		       <PERFORM ,V?BUY ,MILKSHAKE>
		       <RTRUE>)
		      (T
		       <CANT-BUY ,SODA>)>)
	       (<VERB? LOOK-INSIDE>
		<COND (<FSET? ,SODA ,OPENBIT>
		       <TELL "Looks as if there's soda in it." CR>)
		      (T
		       <TELL "The can isn't open." CR>)>)
	       (<VERB? DRINK>
		<MOVE ,SODA ,LOCAL-GLOBALS>
		<TELL
"The soda is sweet and thirst-quenching. After you finish, you dispose
of the can." CR>)>>

<OBJECT GRANOLA-CLUSTER
	(LOC LOCAL-GLOBALS)
	(DESC "granola cluster")
	(SYNONYM CLUSTER FOOD)
	(ADJECTIVE GRANOLA)
	(FLAGS TAKEBIT EATBIT)
	(GENERIC GENERIC-FOOD-F)
	(ACTION RANDOM-FOOD-F)>

<OBJECT APPLE
	(LOC LOCAL-GLOBALS)
	(DESC "apple")
	(SYNONYM APPLE FOOD)
	(FLAGS VOWELBIT TAKEBIT EATBIT)
	(GENERIC GENERIC-FOOD-F)
	(ACTION RANDOM-FOOD-F)>

<ROUTINE RANDOM-FOOD-F ()
	 <COND (<AND <VERB? BUY>
		     <EQUAL? <GET ,P-NAMW 0> ,W?FOOD>>
		<PERFORM ,V?BUY ,MEAL>
		<RTRUE>)>>

<ROOM BEDROOM
      (LOC ROOMS)
      (DESC "Bedroom")
      (SOUTH TO LIVING-ROOM)
      (OUT TO LIVING-ROOM)
      (EAST TO BATHROOM)
      (IN TO BATHROOM)
      (FLAGS ONBIT)
      (GLOBAL APARTMENT-OBJECT APARTMENT-WINDOW BEDROOM-OBJECT BATHROOM-OBJECT
       	      LIVING-ROOM-OBJECT PARKVIEW-APARTMENTS-OBJECT)
      (ACTION BEDROOM-F)>

<ROUTINE BEDROOM-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL
"The room is almost filled by your bed, a bureau, and the baby's crib">)
		      (T
		       <TELL
"The bedroom is sparsely furnished with a bed and bureau">)>
		<TELL
". A doorway leads south to the living room,
and the bathroom is to the east.">
		<RAID-MESS-DESC>
		<RTRUE>)>>

<OBJECT BED
	(LOC BEDROOM)
	(DESC "bed")
	(SYNONYM BED)
	(ADJECTIVE YOUR MY)
	(FLAGS NDESCBIT VEHBIT FURNITUREBIT OPENBIT)
	(GENERIC GENERIC-BED-F)
	(ACTION BED-F)>

<ROUTINE BED-F ;("OPTIONAL" RARG) ()
	 <COND ;(<AND <EQUAL? .RARG ,M-BEG>
		     <OR <AND <VERB? TAKE>
			      <EQUAL? <LOC ,PRSO> ,BUREAU>>
			 <AND <VERB? PUT PUT-ON>
			      <PRSI? ,BUREAU>>>>
		<TELL "You can't reach">
		<ARTICLE ,PRSO T>
		<TELL " from the bed." CR>
		<RTRUE>)
	       ;(.RARG
		<RFALSE>)
	       ;(<VERB? OPEN CLOSE>
		<TELL "Huh?" CR>)
	       (<VERB? WALK-TO>
		<V-SLEEP>)
	       (<EQUAL? ,HERE ,MASTER-BEDROOM>
		<FURNITURE-REMOVED>)>>

<OBJECT BUREAU
	(LOC BEDROOM)
	(DESC "bureau")
	(SYNONYM BUREAU DRESSER CHEST DRAWER DRAWERS)
	(ADJECTIVE FLIMSY)
	(FLAGS NDESCBIT CONTBIT OPENBIT SURFACEBIT SEARCHBIT)
	(CAPACITY 100)
	(ACTION BUREAU-F)>

<ROUTINE BUREAU-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"The flimsy bureau has an artificial wood veneer. All the drawers are closed.">
		<COND (<FIRST? ,BUREAU>
		       <TELL " ">
		       <RFALSE>)
		      (T
		       <CRLF>
		       <RTRUE>)>)
	       (<VERB? OPEN>
		<TELL
"There's nothing interesting in the drawer. In the interest
of tidiness, you close it again." CR>)
	       (<VERB? CLOSE>
		<TELL "It is!" CR>)>> 

<ROOM BATHROOM
      (LOC ROOMS)
      (DESC "Bathroom")
      (OUT TO BEDROOM)
      (WEST TO BEDROOM)
      (FLAGS ONBIT)
      (GLOBAL APARTMENT-OBJECT WATER BEDROOM-OBJECT SINK BATHROOM-OBJECT
       	      PARKVIEW-APARTMENTS-OBJECT)
      (ACTION BATHROOM-F)>

<ROUTINE BATHROOM-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"This plain bathroom is just large enough to accommodate
a sink, toilet, and ">
		<PRINTD ,SHOWER>
		<TELL ". The bedroom is to the west.">
		<RAID-MESS-DESC>
		<RTRUE>)>>

<OBJECT TOILET
	(LOC BATHROOM)
	(DESC "toilet")
	(SYNONYM TOILET POTTY JOHN)
	(FLAGS NDESCBIT VEHBIT FURNITUREBIT)
	(ACTION TOILET-F)>

<ROUTINE TOILET-F ;("OPTIONAL" RARG) ()
	 <COND ;(.RARG
		<RFALSE>)
	       (<VERB? FLUSH>
		<TELL "Flushed." CR>)
	       ;(<VERB? CLIMB-ON> ;"you can sit on the toilet"
		<TELL
"This simulation does not include that sort of detail." CR>)
	       (<VERB? LOOK-INSIDE>
		<TELL "You find nothing of interest." CR>)>>

<OBJECT SHOWER
	(LOC BATHROOM)
	(DESC "shower stall")
	(SYNONYM SHOWER STALL)
	(ADJECTIVE SHOWER)
	(CAPACITY 200)
	(FLAGS NDESCBIT VEHBIT OPENBIT)
	(ACTION SHOWER-F)>

<ROUTINE SHOWER-F ;("OPTIONAL" RARG) ()
	 <COND ;(.RARG
		<RFALSE>)
	       (<VERB? OPEN CLOSE>
		<TELL "That killed some time." CR>)
	       (<AND <VERB? TAKE ON>
		     <PRSO? ,SHOWER>>
		<COND (<EQUAL? ,SYEAR 2071>
		       <SCORE 2> ;"1 point"
		       <TELL
"You discover that the hot water is out again today, so you
decide to forgo the shower." CR>)
		      (<HELD? ,BABY>
		       <TELL ,MITCHELL-BACK-FIRST CR>)
		      (T
		       <SETG ELAPSED-TIME 14>
		       <TELL
"You undress, take a brief and refreshing shower,
and put on fresh clothes." CR>)>)>>

<OBJECT JILL
	(LOC LOCAL-GLOBALS)
	(DESC "Jill")
	(DESCFCN JILL-DESCFCN)
	(SYNONYM JILL WIFE)
	(ADJECTIVE MY)
	(FLAGS ACTORBIT NARTICLEBIT OPENBIT CONTBIT SEARCHBIT)
	(ACTION JILL-F)>

<ROUTINE JILL-F ("OPTIONAL" (RARG 0))
	 <COND (<EQUAL? ,JILL ,WINNER>
		<COND (<EQUAL? ,JILL-COUNTER 0>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?KISS ,JILL>
		       <CLEAR-BUF>)
		      (<OR <EQUAL? ,JILL-COUNTER 13 14>
			   <EQUAL? ,SYEAR 2071>>
		       <TELL "Jill, ">
		       <COND (<EQUAL? ,JILL-COUNTER 13>
			      <TELL "sobbing quietly in the corner">)
			     (<EQUAL? ,JILL-COUNTER 14>
			      <TELL "slowly cleaning up after the raid">)
			     (T
			      <TELL "staring silently out the window">)>
		       <TELL ", doesn't reply." CR>
		       <CLEAR-BUF>)
		      (,MITCHELL-NEWS-FLAG
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?COMFORT ,JILL>
		       <SETG WINNER ,JILL>
		       <RTRUE>)
		      (<AND <VERB? YES>
			    <OR <EQUAL? ,YES-NO-FLAG 7 11>
				<EQUAL? ,YES-NO-FLAG 9 10>>>
		       <V-YES>)
		      (<AND <VERB? NO>
			    <OR <EQUAL? ,YES-NO-FLAG 7 11>
				<EQUAL? ,YES-NO-FLAG 9 10>>>
		       <V-NO>)
		      (<EQUAL? ,HERE ,SKYCAB>
		       <SETG YES-NO-FLAG 9>
		       <QUEUE I-YES-NO 2>
		       <TELL
"\"Perry Simm, for once in your life will you
shut your mouth and relax?\"" CR>)
		      (<VERB? WHO WHAT>
		       <PERFORM ,V?TELL-ABOUT ,ME ,PRSO>
		       <RTRUE>)
		      (<AND <VERB? TELL-ABOUT>
			    <PRSO? ,ME>>
		       <COND (<PRSI? ,CLERKMATON>
			      <TELL
"\"Clerkmatons! They didn't last long, did they? Remember that time I asked one
where we could find potholders, and it led us to a storeroom where shipping
cartons for pots were kept? They were cute -- I sort of miss them.\"" CR>)
			     (<PRSI? ,BABY>
			      <COND (<EQUAL? ,SYEAR 2041>
				     <TELL
"\"Mitchell's been a dear -- he hasn't cried all day.\"" CR>)
				    (T
				     <TELL "\"What baby?\"" CR>)>)
			     (<AND <PRSI? ,MITCHELL>
				   <EQUAL? ,SYEAR 2051>>
			      <COND (<IN? ,MITCHELL ,HERE>
				     <TELL
"Jill looks at Mitchell, smiling glowingly. ">)>
			      <TELL
"\"I'm so happy about Mitch -- he's healthy, he's handsome, he's studious --
what more could a parent ask for?\"" CR>)
			     (<AND <PRSI? ,PAINTING>
				   <EQUAL? ,SYEAR 2041 2051>>
			      <COND (<EQUAL? ,SYEAR 2041>
				     <TELL
"\"The watercolor? It's pretty, but it doesn't SAY anything. If only
I could think of some good subject material...\"" CR>)
				    (T
				     <TELL
"\"It's coming out well, don't you think?
Thanks for suggesting the motif!\"" CR>)>)
			     (<PRSI? ,JILL-BOOK>
			      <SETG YES-NO-FLAG 10>
			      <QUEUE I-YES-NO 2>
			      <TELL
"\"Oh, Perry, I know they're all trashy. You're not going to start
making fun of me again, are you?\"" CR>)
			     (<PRSI? ,FYLA>
			      <TELL "\"Let's not talk about her.\"" CR>)
			     (<PRSI? ,PERELMAN ,GOLD ,ESTHER ,RANDU ,GRIMWOLD
				     ,WARREN ,PRICE>
			      <TELL
"\"I don't know anyone by that name, hon.\"" CR>)
			     (<PRSI? ,SILVER-DOVE>
			      <COND (<EQUAL? ,SYEAR 2091>
				     <TELL
"\"Perry, I'm so excited about this trip! I feel like such a pioneer!\"" CR>)
				    (T
				     <PERFORM ,V?TELL-ABOUT ,ME ,RANDU>
				     <RTRUE>)>)
			     (<PRSI? ,FORTZMAN>
			      <TELL "\"I think she's Secretary of ">
			      <COND (<EQUAL? ,SYEAR 2041>
				     <TELL "Education">)
				    (T
				     <TELL "Morality">)>
			      <TELL ".\"" CR>)
			     (<PRSI? ,JILL ,YOURSELF>
			      <TELL
"\"Perry! We've been married for " N <- ,SYEAR 2034> " years!\"" CR>)
			     (T
			      <TELL "\"What a silly question, Perry!\"" CR>)>)
		      (<VERB? HELLO>
		       <TELL "\"Hi, hon!\"" CR>)
		      (<AND <VERB? EXAMINE>
			    <PRSO? ,BABY>>
		       <SETG WINNER ,PLAYER>
		       <PERFORM ,V?SHOW ,BABY ,JILL>
		       <SETG WINNER ,JILL>
		       <RTRUE>)
		      (T ;"talking to Jill default"
		       <TELL
"Jill wrinkles her nose in a display of mock annoyance. \"Honey, I'm busy ">
		       <COND (<EQUAL? ,HERE ,MASTER-BEDROOM>
			      <TELL "packing">)
			     (<EQUAL? ,JILL-COUNTER 1>
			      <TELL "dressing">)
			     (<EQUAL? ,JILL-COUNTER 2 9>
			      <TELL "cleaning">)
			     (<EQUAL? ,JILL-COUNTER 3>
			      <TELL "making a salad">)
			     (<EQUAL? ,JILL-COUNTER 4 10 12>
			      <TELL "reading">)
			     (<EQUAL? ,JILL-COUNTER 5 8>
			      <TELL "painting">)
			     (<EQUAL? ,JILL-COUNTER 6>
			      <TELL "eating">)
			     (<EQUAL? ,JILL-COUNTER 7>
			      <TELL "doing the dishes">)
			     (T
			      <TELL "coloring my hair">)>
		       <TELL ".\"" CR>
		       <CLEAR-BUF>)>)
	       (<VERB? THANK>
		<COND (<EQUAL? ,JILL-COUNTER 0>
		       <PERFORM ,V?KISS ,JILL>
		       <RTRUE>)
		      (<EQUAL? ,SYEAR 2041 2051>
		       <PERFORM ,V?THANK ,PERELMAN>
		       <RTRUE>)>)
	       (<VERB? CLIMB-ON CLIMB-FOO BOARD LIE-DOWN>
		<TELL "Ahem." CR>)
	       (<AND <VERB? ALARM>
		     <EQUAL? ,JILL-COUNTER 0>>
		<TELL "Jill mumbles incoherently and rolls over." CR>)
	       (<VERB? PLAY-WITH>
		<TELL
"You ask Jill if she's interested in a game of chess, or perhaps
gin rummy, but she begs off." CR>)
	       (<VERB? TOUCH SQUEEZE>
		<COND (<EQUAL? ,JILL-COUNTER 0>
		       <PERFORM ,V?ALARM ,JILL>
		       <RTRUE>)
		      (<OR ,MITCHELL-RAID-FLAG
			   <EQUAL? ,SYEAR 2071>>
		       <PERFORM ,V?KISS ,JILL>
		       <RTRUE>)
		      (T
		       <TELL "\"I'm touched,\" says Jill." CR>)>)
	       (<VERB? COMFORT>
		<COND (,MITCHELL-NEWS-FLAG
		       <TELL
"Jill says, \"I'll be okay. I just need to be alone for a while.\"
A moment later she adds, \"I love you, Perry.\" She buries her
face in the pillows." CR>)
		      (<EQUAL? ,JILL-COUNTER 13>
		       <TELL
"As you hug her and stroke her back, Jill calms down noticeably." CR>)
		      (<EQUAL? ,SYEAR 2071>
		       <TELL "Jill takes little notice." CR>)>)
	       (<VERB? KISS>
		<COND (<OR ,MITCHELL-NEWS-FLAG
			   <EQUAL? ,JILL-COUNTER 13>>
		       <PERFORM ,V?COMFORT ,JILL>
		       <RTRUE>)
		      (<EQUAL? ,SYEAR 2071>
		       <TELL
"Jill kisses you briefly, without much enthusiasm." CR>)
		      (<EQUAL? ,JILL-COUNTER 0>
		       <TELL "Jill is sleeping!" CR>)
		      (T
		       <TELL
"Jill kisses you back. \"Ooo-la-la,\" she says, afterwards." CR>)>)
	       (<VERB? EXAMINE>
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL
"Jill looks as beautiful as the day you married her seven years ago">)
		      (<EQUAL? ,SYEAR 2051>
		       <TELL
"Jill's thirty-nine years have done nothing to dim her natural beauty">)
		      (<EQUAL? ,SYEAR 2061>
		       <TELL
"Jill's face is a bit lined by age, and there are gray streaks in
her hair, but to you she appears with a loveliness undiminished by
twenty-seven years of marriage">)
		      (<EQUAL? ,SYEAR 2071>
		       <TELL
"Jill has aged dramatically during the last decade, an effect heightened
by the fact that Jill has become more and more withdrawn; she has lost
interest in many things, including her appearance">)
		      (<EQUAL? ,SYEAR 2091>
		       <TELL
"Jill's healthy demeanor and graceful pose are more befitting a woman
twenty years her junior">)>
		<TELL ". ">
		<JILL-DESCFCN>)
	       (<VERB? SHOW>
		<COND (<EQUAL? ,JILL-COUNTER 0>
		       <PERFORM ,V?KISS ,JILL>
		       <RTRUE>)
		      (<PRSO? ,BABY>
		       <SETG YES-NO-FLAG 11>
		       <QUEUE I-YES-NO 2>
		       <TELL
"Jill's face melts, and her eyes grow moist. \"Isn't he a bundle
of joy, Perry?\"" CR>)>)
	       (<VERB? GIVE>
		<COND (<EQUAL? ,JILL-COUNTER 0>
		       <PERFORM ,V?KISS ,JILL>
		       <RTRUE>)
		      (<PRSO? ,BABY>
		       <MOVE ,BABY ,CRIB>
		       <TELL
"As Jill takes the baby he begins crying. \"Perry, you've woken him up!\" She
begins rocking Mitchell gently. \"There, there, it's okay, go to sleep, that's
a good little boy.\" She ">
		       <COND (<EQUAL? ,HERE ,BEDROOM>
		       	      <TELL "places him in the crib">)
		      	     (T
		       	      <TELL "carries Mitchell into the bedroom">)>
		       <TELL " and goes back to what she was doing." CR>)
		      (<PRSO? ,RUSTY-CROSS>
		       <MOVE ,RUSTY-CROSS ,LOCAL-GLOBALS>
		       <TELL
"\"Perry, if the police see this, we'll get in trouble.\" Nevertheless,
she slips the cross into her pocket." CR>)>)
	       (<VERB? FOLLOW>
		;<COND (,DEBUG
		       <TELL "[FOLLOW-FLAG = " N ,FOLLOW-FLAG ".]" CR>)>
		<COND (<OR <EQUAL? ,FOLLOW-FLAG 2 8>
			   <AND <EQUAL? ,FOLLOW-FLAG 1>
				<EQUAL? ,HERE ,LIVING-ROOM>>>
		       <DO-WALK ,P?NORTH>)
		      (<EQUAL? ,FOLLOW-FLAG 3 5>
		       <DO-WALK ,P?EAST>)
		      (<OR <EQUAL? ,FOLLOW-FLAG 4 6>
			   <AND <EQUAL? ,FOLLOW-FLAG 1>
			    	<EQUAL? ,HERE ,KITCHEN ,BATHROOM>>>
		       <DO-WALK ,P?WEST>)
		      (<EQUAL? ,FOLLOW-FLAG 7>
		       <DO-WALK ,P?SOUTH>)
		      (<EQUAL? ,FOLLOW-FLAG 15>
		       <TELL "You didn't notice which way she went." CR>)
		      (<AND <NOT <IN? ,JILL ,LOCAL-GLOBALS>>
			    <NOT <IN? ,JILL ,HERE>>>
		       <TELL "Huh? Jill hasn't just left the room!?!" CR>)>)
	       (<AND <VERB? SIT-NEXT-TO>
		     <EQUAL? ,JILL-COUNTER 4 10>>
		<PERFORM ,V?SIT ,COUCH>
		<RTRUE>)
	       (<AND <VERB? SIT-NEXT-TO>
		     <EQUAL? ,JILL-COUNTER 6>>
		<PERFORM ,V?SIT ,DINETTE-SET>
		<RTRUE>)>>

<GLOBAL JILL-NOT-SPOKEN-YET T>

<GLOBAL JILL-COUNTER -1> ;"used for 2041 and 2051:
			  0 = sleeping (BedR)	      7 = washing dishes (K)
			  1 = dressing (BedR)	      8 = painting (LR)
			  2 = cleaning (BedR)	      9 = cleaning (LR)
			  3 = making a salad (K)     10 = reading (LR)
			  4 = reading (LR)	     11 = washing hair (Bath)
			  5 = painting (LR)	     12 = reading (BedR)
			  6 = eating a salad (K)"

<ROUTINE JILL-DESCFCN ("OPTIONAL" X)
	 <COND (<AND <VERB? EXAMINE>
		     <PRSO? ,JILL>>
		<TELL "She is ">)
	       (T
		<TELL "Jill is ">)>
	 <COND (<EQUAL? ,HERE ,MASTER-BEDROOM>
		<TELL "here, doing some last-minute packing." CR>)
	       (<EQUAL? ,HERE ,SKYCAB>
	        <TELL "sitting next to you on the plush seat." CR>)
	       (<EQUAL? ,SYEAR 2071>
		<TELL
"sitting on the couch, staring morosely out the window." CR>)
	       (<EQUAL? ,SYEAR 2061>
		<TELL "lying on the bed, sobbing." CR>)
	       (<EQUAL? ,JILL-COUNTER 0>
		<TELL "lying on the bed, sleeping peacefully." CR>)
	       (<EQUAL? ,JILL-COUNTER 1>
		<TELL "standing near the bureau, getting dressed." CR>)
	       (<EQUAL? ,JILL-COUNTER 2 9>
		<TELL "walking around, neatening and cleaning the ">
		<COND (<EQUAL? ,JILL-COUNTER 2>
		       <TELL "bedroom">)
		      (T
		       <TELL "living room">)>
		<TELL "." CR>)
	       (<EQUAL? ,JILL-COUNTER 3>
		<TELL "standing at the counter, preparing a salad." CR>)
	       (<EQUAL? ,JILL-COUNTER 4 10>
		<TELL
"curled up in the corner of the couch, reading a book." CR>)
	       (<EQUAL? ,JILL-COUNTER 5 8>
		<TELL
"standing at the easel, working on her current painting." CR>)
	       (<EQUAL? ,JILL-COUNTER 6>
		<TELL "sitting at the table, nibbling on a salad." CR>)
	       (<EQUAL? ,JILL-COUNTER 7>
		<TELL "washing some dishes." CR>)
	       (<EQUAL? ,JILL-COUNTER 11>
		<TELL "washing and coloring her hair." CR>)
	       (<EQUAL? ,JILL-COUNTER 12>
		<TELL "lying on the bed, reading a book." CR>)
	       (<EQUAL? ,JILL-COUNTER 13> ;"after apartment raid"
		<TELL "huddled in the corner, crying." CR>)
	       (<EQUAL? ,JILL-COUNTER 14>
		<TELL "slowly straightening up after the raid." CR>)
	       (T
		<TELL "Bug #9B" CR>)>>

<ROUTINE PUT-JILL-IN-THE-RIGHT-PLACE ()
	 <COND (<G? ,STIME 1402>
		<SETG JILL-COUNTER 0>
		<MOVE ,JILL ,BEDROOM>
		<MOVE ,JILL-BOOK ,BEDROOM>)
	       (<G? ,STIME 1299>
		<SETG JILL-COUNTER 12>
		<MOVE ,JILL-BOOK ,BEDROOM>
		<FSET ,JILL-BOOK ,NDESCBIT>
		<MOVE ,JILL ,BEDROOM>)
	       (<G? ,STIME 1242>
		<SETG JILL-COUNTER 11>
		<MOVE ,JILL-BOOK ,BEDROOM>
		<MOVE ,JILL ,BATHROOM>)
	       (<G? ,STIME 1137>
		<SETG JILL-COUNTER 10>
		<MOVE ,JILL-BOOK ,LIVING-ROOM>
		<FSET ,JILL-BOOK ,NDESCBIT>
		<MOVE ,JILL ,LIVING-ROOM>)
	       (<G? ,STIME 1084>
		<SETG JILL-COUNTER 9>
		<MOVE ,JILL ,LIVING-ROOM>
		<MOVE ,JILL-BOOK ,LIVING-ROOM>)
	       (<G? ,STIME 912>
		<SETG JILL-COUNTER 8>
		<MOVE ,JILL ,LIVING-ROOM>
		<MOVE ,JILL-BOOK ,LIVING-ROOM>)
	       (<G? ,STIME 859>
		<SETG JILL-COUNTER 7>
		<MOVE ,JILL ,KITCHEN>
		<MOVE ,JILL-BOOK ,LIVING-ROOM>)
	       (<G? ,STIME 813>
		<SETG JILL-COUNTER 6>
		<MOVE ,JILL ,KITCHEN>
		<MOVE ,JILL-BOOK ,LIVING-ROOM>
		<MOVE ,SALAD ,KITCHEN>
		<FSET ,SALAD ,NDESCBIT>) 
	       (<G? ,STIME 697>
		<SETG JILL-COUNTER 5>
		<MOVE ,JILL ,LIVING-ROOM>
		<MOVE ,JILL-BOOK ,LIVING-ROOM>
		<MOVE ,SALAD ,REFRIGERATOR>)
	       (<G? ,STIME 644>
		<SETG JILL-COUNTER 4>
		<MOVE ,JILL ,LIVING-ROOM>
		<MOVE ,SALAD ,REFRIGERATOR>
		<MOVE ,JILL-BOOK ,LIVING-ROOM>
		<FSET ,JILL-BOOK ,NDESCBIT>)
	       (<G? ,STIME 591>
		<SETG JILL-COUNTER 3>
		<MOVE ,JILL ,KITCHEN>
		<MOVE ,SALAD ,KITCHEN>
		<FSET ,SALAD ,NDESCBIT>
		<MOVE ,JILL-BOOK ,BEDROOM>)
	       (<G? ,STIME 522>
		<MOVE ,JILL ,BEDROOM>
		<MOVE ,JILL-BOOK ,BEDROOM>
		<SETG JILL-COUNTER 2>)
	       (<G? ,STIME 478>
		<MOVE ,JILL ,BEDROOM>
		<MOVE ,JILL-BOOK ,BEDROOM>
		<SETG JILL-COUNTER 1>)
	       (T
		<MOVE ,JILL ,BEDROOM>
		<MOVE ,JILL-BOOK ,BEDROOM>
		<SETG JILL-COUNTER 0>)>>

;<GLOBAL JILLISMS
	<LTABLE
"Jill goes to the kitchen and returns with a mouth-watering granola cluster."
"Jill puts down her book for a moment and stretches."
"\"Oh, Perry, I almost forgot! Clave called while you were out. He's leaving
for Japan on business; he said he'd call next week after he got back. He says
that Lisa and little Mikey are fine.\""
"\"Perry,\" calls Jill, \"I heard a report on the radio today about interest
rates and housing prices. I think if the economy keeps going the way it's
going, and the publisher buys your Africa book, we'll be able to afford a
house next year.\"">>

<OBJECT JILL-BOOK
	(LOC LIVING-ROOM)
	(DESC "romance novel")
	(SYNONYM NOVEL BOOK)
	(ADJECTIVE GOTHIC ROMANCE JILL\'S HER)
	(FLAGS READBIT)
	(GENERIC GENERIC-BOOK-F)
	(ACTION JILL-BOOK-F)>

<ROUTINE JILL-BOOK-F ()
	 <COND (<VERB? TAKE>
		<COND (<EQUAL? ,JILL-COUNTER 4 10>
		       <TELL "Jill's in the middle of reading it!" CR>)
		      (T
		       <TELL
"You have no interest in those gothic novels." CR>)>)
	       (<VERB? READ EXAMINE OPEN>
		<TELL "It's another of those indistinguishable ">
		<PRINTD ,JILL-BOOK>
		<TELL "s that Jill is always reading." CR>)
	       (<VERB? CLOSE>
		<COND (<EQUAL? ,JILL-COUNTER 4 10>
		       <PERFORM ,V?TAKE ,JILL-BOOK>
		       <RTRUE>)
		      (T
		       <TELL "It is!" CR>)>)
	       (<VERB? BUY>
		<PERFORM ,V?BUY ,BOOKS>
		<RTRUE>)>>

<OBJECT CRIB
	(LOC LOCAL-GLOBALS)
	(DESC "crib")
	(SYNONYM CRIB)
	(ADJECTIVE BABY\'S MITCH\'S MITCHELL)
	(FLAGS NDESCBIT CONTBIT OPENBIT SEARCHBIT)
	(CAPACITY 75)
	(ACTION CRIB-F)>

<ROUTINE CRIB-F ()
	 <COND (<VERB? CLOSE>
		<TELL "Huh?">)>>

<OBJECT TOY
	(LOC CRIB)
	(DESC "toy duck")
	(SYNONYM TOY DUCK DUCKS DUCKIE)
	(ADJECTIVE TOY RUBBER YELLOW)
	(FLAGS TAKEBIT)
	(ACTION TOY-F)>

<ROUTINE TOY-F ()
	 <COND (<VERB? EXAMINE>
		<TELL "The toy is a little yellow rubber duckie." CR>)
	       (<VERB? SQUEEZE PLAY-WITH>
		<TELL "The toy emits a high-pitched squeak." CR>)>>

<OBJECT BABY
	(LOC CRIB)
	(DESC "baby")
	(SYNONYM BABY MITCHELL MITCH RAV SIMM SON)
	(ADJECTIVE MITCHELL MITCH RAV MY)
	(FLAGS TAKEBIT ACTORBIT)
	(SIZE 50)
	(GENERIC GENERIC-MITCHELL-F)
	(ACTION BABY-F)>

<ROUTINE BABY-F ()
	 <COND (<OR <VERB? TELL>
		    <EQUAL? ,BABY ,WINNER>>
		<TELL
"Mitchell, waking for a moment, coos happily at the sound of your voice." CR>
		<CLEAR-BUF>)
	       (<VERB? WASH>
		<TELL
"Although, as much as possible, you try to share with Jill the chores
and pleasures of taking care of Mitchell, bathing him is one area where
you're completely helpless." CR>)
	       (<AND <VERB? GIVE>
		     <PRSO? ,BATHROOM-OBJECT ,SHOWER>>
		<PERFORM ,V?WASH ,BABY>
		<RTRUE>)
	       (<VERB? EXAMINE>
		<TELL
"Your son, Mitchell Rav Simm, was named for your father and for your
mentor. He's sleeping peacefully, his little face scrunched up in a cute
mask of baby fat." CR>)
	       (<AND <VERB? GIVE>
		     <PRSO? ,FORMULA>>
		<TELL
"Mitchell wakes up for a minute and sucks on the bottle. A moment later, his
breathing indicates that he is asleep." CR>)
	       (<VERB? FEED>
		<COND (<HELD? ,FORMULA>
		       <PERFORM ,V?GIVE ,FORMULA ,BABY>
		       <RTRUE>)
		      (T
		       <TELL
"At this age, Mitchell eats only baby formula." CR>)>)
	       (<AND <VERB? GIVE SHOW>
		     <PRSI? ,BABY>>
		<PERFORM ,V?THANK ,BABY>
		<RTRUE>)
	       (<VERB? THANK PLAY-WITH>
		<TELL "The baby is asleep." CR>)
	       (<VERB? KISS>
		<TELL
"Despite Mitchell's pudgy adorableness, you reconsider
so as not to wake him." CR>)
	       (<VERB? SHAKE>
		<TELL
"Since Mitchell's already asleep, rocking him is, at best, useless." CR>)
	       (<VERB? ALARM>
		<TELL
"As Jill has reminded you many times, babies need their sleep." CR>)
	       (<AND <VERB? PUT PUT-ON>
		     <PRSO? ,BABY>
		     <NOT <PRSI? ,CRIB>>>
		<NO-PLACE-FOR-BABY ,PRSI>)
	       (<VERB? DROP>
		<NO-PLACE-FOR-BABY ,GROUND>)
	       (<VERB? THROW KICK>
		<TELL "You reconsider this reckless act." CR>)>>

<ROUTINE NO-PLACE-FOR-BABY (DESTINATION)
	 <TELL "The " D .DESTINATION " is no place for a baby!" CR>>

<GLOBAL APARTMENT-RAID-FLAG <>>

<GLOBAL MITCHELL-NEWS-FLAG <>>

<GLOBAL RAID-PROB 0>

<GLOBAL MITCHELL-RAID-FLAG <>>

<ROUTINE I-MITCHELL-RAID ()
	 <COND (<NOT <IN-APARTMENT?>>
		<RFALSE>)>
	 <SCORE 120> ;"9 points"
	 <CRLF>
	 <COND (<EQUAL? ,HERE ,LIVING-ROOM>
		<COND (<FSET? ,APARTMENT-DOOR ,OPENBIT>
		       <TELL "With a roar of tromping feet,">)
		      (T
		       <TELL
"With a screech of splintering wood, the front door explodes open, and">)>)
	       (T
		<MOVE ,PLAYER ,LIVING-ROOM>
		<SETG HERE ,LIVING-ROOM>
		<TELL
"You hear a loud noise from the front door and dash into the living room as">)>
	 <MOVE ,JILL ,LOCAL-GLOBALS>
	 <FCLEAR ,APARTMENT-DOOR ,OPENBIT>
	 <QUEUE I-APARTMENT -1>
	 <SETG MITCHELL-RAID-FLAG T>
	 <SETG BRUISED T>
	 <TELL
" six or eight heavily armed Church police storm into the apartment. You see a
look of horror come over Jill, as she covers her mouth with the back of her
hand, as though stifling some silent scream. You follow her gaze, and -- a
shock of recognition -- sauntering in behind the police...|
|
The ten years since you last saw him have left scant change on the face of
your son. \"Mitchell!\" you yell, and take a step toward him, but a blow
from one of the cops sends your frail, old body flying against the wall.|
|
\"She is the one.\" The voice is Mitchell's, but the tone is cold,
unrecognizable, sending shivers through you. He raises a fur-clad arm,
pointing at his mother without a hint of emotion. \"She spake against the
Church; she tried to poison the mind of a child too young to know the Truth.\"
The thugs grab Jill, who reaches toward Mitchell, tears of terror streaming
down her face. Totally unresponsive, he turns and walks calmly out of the
apartment.|
|
As Jill is dragged, screaming and crying, through the front door, you try to
follow, but a cop pummels you in the stomach with his club. You fall to the
floor, retching, as the apartment door slams closed, shutting you off forever
from the son you cannot understand and the wife you will never see again." CR>>

;"epilogue apartment"

<OBJECT SOLARIUM-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "sunroom")
	(SYNONYM SOLARIUM SUNROOM PORCH SUNPORCH)
	(ADJECTIVE ENCLOSED GLASS-WALLED)
	(GENERIC GENERIC-ROOM-F)
	(ACTION SOLARIUM-OBJECT-F)>

<ROUTINE SOLARIUM-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,PATIO>
		       <DO-WALK ,P?NORTH>)
		      (<EQUAL? ,HERE ,EPILOGUE-LIVING-ROOM>
		       <DO-WALK ,P?SOUTH>)
		      (<GLOBAL-IN? ,SOLARIUM-OBJECT ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,SOLARIUM>
		       <DO-WALK ,P?NORTH>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,SOLARIUM>>
		<V-LOOK>)>>

<ROOM SOLARIUM
      (LOC ROOMS)
      (DESC "Solarium")
      (LDESC
"This enclosed sunporch of your penthouse apartment is surrounded by an outdoor
patio, accessible to the south. To the north is a sprawling living room.")
      (SOUTH TO PATIO)
      (NORTH TO EPILOGUE-LIVING-ROOM)
      (IN TO EPILOGUE-LIVING-ROOM)
      (OUT TO PATIO)
      (GLOBAL LIVING-ROOM-OBJECT SOLARIUM-OBJECT PATIO-OBJECT)>

<OBJECT PATIO-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "terrace")
	(SYNONYM PATIO TERRACE)
	(ADJECTIVE WIDE OUTDOOR)
	(ACTION PATIO-OBJECT-F)>

<ROUTINE PATIO-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,PATIO>
		       <TELL ,LOOK-AROUND CR>)
		      (<GLOBAL-IN? ,PATIO-OBJECT ,HERE>
		       <DO-WALK ,P?SOUTH>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,PATIO>
		       <DO-WALK ,P?NORTH>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,PATIO>>
		<V-LOOK>)>>

<ROOM PATIO
      (LOC ROOMS)
      (DESC "Patio")
      (NORTH TO SOLARIUM)
      (DOWN SORRY "It's a drop of thirty stories!")
      (IN TO SOLARIUM)
      (GLOBAL SOLARIUM-OBJECT PATIO-OBJECT RIVER)
      (ACTION PATIO-F)>

<ROUTINE PATIO-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"Sunlight spills off the vines and shrubs of this wide outdoor terrace. The
view, always breathtaking, seems particularly sharp today; beyond the parklands
and forests to the west, the foothills of the Rockies are clearly visible; t"
,RIVER-DESC " The glass-walled sunporch lies behind a curtain of vines to the
north.">)>>

<OBJECT FIREPLACE
	(LOC LOCAL-GLOBALS)
	(DESC "fireplace")
	(SYNONYM FIREPLACE HEARTH BRICK CHIMNEY)
	(ADJECTIVE CENTRAL CIRCULAR DEEP RED BRICK)
	(ACTION FIREPLACE-F)>

<ROUTINE FIREPLACE-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"Constructed of deep red brick, the fireplace has the usual equipment
to filter the fire's smoke before releasing it up the chimney." CR>)>>

<ROOM EPILOGUE-LIVING-ROOM
      (LOC ROOMS)
      (DESC "Living Room")
      (LDESC
"Sunken, comfy pillowseats form a vaguely oval perimeter around a central
circular fireplace. The rest of the furniture has been removed. The dining
room lies beyond a bamboo screen to the east. An open, curving stair leads
up to the master bedroom, and a foyer leads north.")
      (UP TO MASTER-BEDROOM)
      (EAST TO DINING-ROOM)
      (NORTH TO FOYER)
      (SOUTH TO SOLARIUM)
      (GLOBAL LIVING-ROOM-OBJECT HALLWAY BEDROOM-OBJECT SOLARIUM-OBJECT
       	      DINING-ROOM-OBJECT STAIRS FIREPLACE BAMBOO-SCREEN)
      (ACTION EPILOGUE-LIVING-ROOM-F)>

<ROUTINE EPILOGUE-LIVING-ROOM-F (RARG)
	 <COND (<EQUAL? .RARG ,M-ENTER>
		<MOVE ,SEAT ,HERE>
		<RFALSE>)>>

<ROOM MASTER-BEDROOM
      (LOC ROOMS)
      (DESC "Master Bedroom")
      (LDESC
"This is a huge, round bedroom, encircled by windows. A stairway leads
down to the living room. As elsewhere, the furniture has been removed.")
      (DOWN TO EPILOGUE-LIVING-ROOM)
      (GLOBAL LIVING-ROOM-OBJECT BEDROOM-OBJECT STAIRS GLOBAL-WINDOW)>

<OBJECT DINING-ROOM-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "dining room")
	(SYNONYM ROOM)
	(ADJECTIVE SPACIOUS DINING)
	(GENERIC GENERIC-ROOM-F)
	(ACTION DINING-ROOM-OBJECT-F)>

<ROUTINE DINING-ROOM-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,EPILOGUE-KITCHEN>
		       <DO-WALK ,P?WEST>)
		      (<EQUAL? ,HERE ,EPILOGUE-LIVING-ROOM>
		       <DO-WALK ,P?EAST>)
		      (<GLOBAL-IN? ,DINING-ROOM-OBJECT ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,DINING-ROOM>
		       <V-WALK-AROUND>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,DINING-ROOM>>
		<V-LOOK>)>>

<ROOM DINING-ROOM
      (LOC ROOMS)
      (DESC "Dining Room")
      (LDESC
"The spacious dining area is flanked by the living room, on the other side
of the bamboo curtain to the west, and the kitchen, to the east.")
      (WEST TO EPILOGUE-LIVING-ROOM)
      (EAST TO EPILOGUE-KITCHEN)
      (IN TO EPILOGUE-KITCHEN)
      (OUT TO EPILOGUE-LIVING-ROOM)
      (GLOBAL LIVING-ROOM-OBJECT KITCHEN DINING-ROOM-OBJECT BAMBOO-SCREEN
       	      GLOBAL-TABLE)>

<OBJECT BAMBOO-SCREEN
	(LOC LOCAL-GLOBALS)
	(DESC "bamboo screen")
	(SYNONYM SCREEN CURTAIN)
	(ADJECTIVE BAMBOO)>

<ROOM EPILOGUE-KITCHEN
      (LOC ROOMS)
      (DESC "Kitchen")
      (LDESC
"Rimmed with butcher-block counters, softly lit by recessed zyolights, and
decorated in a random pattern of pastel tile, the kitchen is both lovely and
functional. You can exit to the west.")
      (WEST TO DINING-ROOM)
      (OUT TO DINING-ROOM)
      (GLOBAL SINK KITCHEN DINING-ROOM-OBJECT)>

<ROOM FOYER
      (LOC ROOMS)
      (DESC "Foyer")
      (LDESC
"This bright, airy hallway runs northwards from the living room to the
apartment door. Tall, arched entrances lead east and west, and the bath
is down a few steps to the southwest.")
      (NORTH SORRY "A hologram of Jill appears. \"Don't go out, hon! The
skycab will be here any second!\" The image vanishes.")
      (SOUTH TO EPILOGUE-LIVING-ROOM)
      (SW TO EPILOGUE-BATHROOM)
      (DOWN TO EPILOGUE-BATHROOM)
      (EAST TO GUEST-ROOM)
      (WEST TO DEN)
      (GLOBAL LIVING-ROOM-OBJECT HALLWAY BEDROOM-OBJECT BATHROOM-OBJECT
       	      DEN-OBJECT STAIRS)>

<ROOM EPILOGUE-BATHROOM
      (LOC ROOMS)
      (DESC "Bath")
      (LDESC
"An antique, tile decor masks the ultramodern features of this large
bathroom. A whirlpool tub fills the far end of the room. The exit, up
a few steps, is northeast.")
      (NE TO FOYER)
      (OUT TO FOYER)
      (UP TO FOYER)
      (GLOBAL SINK HALLWAY BATHROOM-OBJECT STAIRS)>

<OBJECT TUB
	(LOC EPILOGUE-BATHROOM)
	(DESC "tub")
	(SYNONYM TUB JACUZZI)
	(ADJECTIVE LARGE WHIRLPOOL BATH)
	(FLAGS NDESCBIT VEHBIT OPENBIT)
	(ACTION TUB-F)>

<ROUTINE TUB-F ;("OPTIONAL" RARG) ()
	 <COND ;(.RARG
		<RFALSE>)
	       ;(<VERB? OPEN CLOSE>
		<TELL "Huh?" CR>)
	       (<VERB? THROUGH BOARD>
		<TELL "You don't have time." CR>)
	       (<VERB? EXAMINE>
		<TELL "It is a large whirlpool tub." CR>)>>

<OBJECT DEN-OBJECT
	(LOC LOCAL-GLOBALS)
	(DESC "den")
	(SYNONYM DEN SPACE)
	(ADJECTIVE HOMEY)
	(ACTION DEN-OBJECT-F)>

<ROUTINE DEN-OBJECT-F ()
	 <COND (<VERB? WALK-TO THROUGH>
		<COND (<EQUAL? ,HERE ,FOYER>
		       <DO-WALK ,P?EAST>)
		      (<GLOBAL-IN? ,DEN-OBJECT ,HERE>
		       <TELL ,LOOK-AROUND CR>)>)
	       (<VERB? LEAVE DISEMBARK>
		<COND (<EQUAL? ,HERE ,DEN>
		       <DO-WALK ,P?WEST>)
		      (T
		       <TELL ,LOOK-AROUND CR>)>)
	       (<AND <VERB? EXAMINE>
		     <EQUAL? ,HERE ,DEN>>
		<V-LOOK>)>>

<ROOM DEN
      (LOC ROOMS)
      (DESC "Den")
      (LDESC
"A second fireplace fills the far wall of this homey space. Aside from a
wall-mounted entertainment center, all the furnishings are gone. An arched
doorway leads east.")
      (EAST TO FOYER)
      (OUT TO FOYER)
      (GLOBAL HALLWAY DEN-OBJECT FIREPLACE)>

<OBJECT ENTERTAINMENT-CENTER
	(LOC DEN)
	(DESC "entertainment center")
	(SYNONYM CENTER EC)
	(ADJECTIVE ENTERTAINMENT WALL-MOUNTED)
	(FLAGS NDESCBIT VOWELBIT)
	(ACTION ENTERTAINMENT-CENTER-F)>

<ROUTINE ENTERTAINMENT-CENTER-F ()
	 <COND (<VERB? EXAMINE>
		<TELL
"Although equipped with the full range of audio, video, and holovision
capabilities, the EC's functions go far beyond entertainment. It has
complete teaching and library packages, and serves as the main computer
interface. It is currently off." CR>)
	       (<VERB? ON>
		<TELL "The power node has been packed away." CR>)>>

<ROOM GUEST-ROOM
      (LOC ROOMS)
      (DESC "Guest Room")
      (LDESC
"This is a sunny, cozy bedroom, barren of furniture. The only way out
is to the west.")
      (WEST TO FOYER)
      (OUT TO FOYER)
      (GLOBAL HALLWAY BEDROOM-OBJECT)>

<GLOBAL SKYCAB-COUNTER 0>

<ROOM SKYCAB
      (LOC ROOMS)
      (DESC "Skycab")
      (LDESC
"This skycab is a luxurious, top-of-the-line model, a veritable sky
limousine. The opulent features include reclining seats, tinted zero-glare
windows, and a two-meter viewscreen.")
      (OUT SORRY "You can't leave the cab while it's in the air!")
      (GLOBAL GLOBAL-WINDOW RIVER PIER-OBJECT PARK-OBJECT MUSEUM-OBJECT
       	      BSF-BASE PEOPLE)>

<OBJECT SKYCAB-OBJECT
	(LOC SKYCAB)
	(DESC "skycab")
	(SYNONYM SKYCAB CAB SKYTAXI TAXI HACK LIMOUSINE LIMO)
	(ADJECTIVE SKY LUXURIOUS TOP-OF-THE-LINE)
	(FLAGS NDESCBIT)
	(ACTION SKYCAB-OBJECT-F)>

<ROUTINE SKYCAB-OBJECT-F ()
	 <COND (<VERB? EXIT LEAVE DISEMBARK>
		<DO-WALK ,P?OUT>)
	       (<VERB? EXAMINE>
		<V-LOOK>)>>

<OBJECT VIEWSCREEN
	(LOC SKYCAB)
	(DESC "viewscreen")
	(SYNONYM VIEWSCREEN SCREEN)
	(ADJECTIVE TWO-METER)
	(FLAGS NDESCBIT)
	(ACTION VIEWSCREEN-F)>

<ROUTINE VIEWSCREEN-F ()
	 <COND (<VERB? EXAMINE>
		<TELL "At the moment, the screen is dark." CR>)
	       (<VERB? ON>
		<TELL
"The screen is activated automatically by incoming transmissions." CR>)>>

<OBJECT RECEIVER-STATION
	(LOC SKYCAB)
	(DESC "receiver station")
	(SYNONYM STATION)
	(ADJECTIVE RECEIVER GLEAMING)
	(FLAGS NDESCBIT)
	(ACTION RECEIVER-STATION-F)>

<ROUTINE RECEIVER-STATION-F ()
	 <COND (<AND <EQUAL? ,SKYCAB-COUNTER 6>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,RECEIVER-STATION>)
	       (<VERB? EXAMINE>
		<TELL "Y" ,RS-DESC CR>)
	       (T
		<MILE-AWAY ,RECEIVER-STATION>)>>

<OBJECT CULTURAL-CENTER
	(LOC SKYCAB)
	(DESC "Riverside Cultural Center")
	(SYNONYM CENTER)
	(ADJECTIVE RIVERSIDE CULTURAL)
	(FLAGS NDESCBIT)
	(ACTION CULTURAL-CENTER-F)>

<ROUTINE CULTURAL-CENTER-F ()
	 <COND (<AND <EQUAL? ,SKYCAB-COUNTER 6>
		     <NOT <MOBY-VERB?>>>
		<CANT-SEE ,CULTURAL-CENTER>)
	       (<VERB? EXAMINE>
		<TELL
"Along the river, south of the pier, are the outdoor shells
and amphitheatres of the ">
		<PRINTD ,CULTURAL-CENTER>
		<TELL "." CR>)
	       (T
		<MILE-AWAY ,RECEIVER-STATION>)>>