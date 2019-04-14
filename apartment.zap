

	.FUNCT	IN-APARTMENT?
	EQUAL?	HERE,LIVING-ROOM,KITCHEN /TRUE
	EQUAL?	HERE,BEDROOM,BATHROOM \FALSE
	RTRUE	


	.FUNCT	APARTMENT-OBJECT-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	CALL1	IN-APARTMENT?
	ZERO?	STACK /?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?LEAVE,V?DISEMBARK \?ELS16
	EQUAL?	HERE,LIVING-ROOM \?ELS21
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS21:	CALL1	IN-APARTMENT?
	ZERO?	STACK /?ELS23
	PRINT	NO-EXIT-FROM-APARTMENT
	CRLF	
	RTRUE	
?ELS23:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS16:	EQUAL?	PRSA,V?WASH \FALSE
	CALL	PERFORM,V?WASH,GLOBAL-ROOM
	RTRUE	


	.FUNCT	LIVING-ROOM-OBJECT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,KITCHEN \?ELS10
	CALL2	DO-WALK,P?WEST
	RSTACK	
?ELS10:	EQUAL?	HERE,PARKVIEW-HALL \?ELS12
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS12:	EQUAL?	HERE,BEDROOM \?ELS14
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS14:	EQUAL?	HERE,SOLARIUM \?ELS16
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS16:	EQUAL?	HERE,FOYER \?ELS18
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS18:	EQUAL?	HERE,MASTER-BEDROOM \?ELS20
	CALL2	DO-WALK,P?DOWN
	RSTACK	
?ELS20:	EQUAL?	HERE,DINING-ROOM \?ELS22
	CALL2	DO-WALK,P?WEST
	RSTACK	
?ELS22:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS28
	EQUAL?	HERE,LIVING-ROOM,EPILOGUE-LIVING-ROOM \?ELS33
	CALL1	V-WALK-AROUND
	RSTACK	
?ELS33:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS28:	EQUAL?	PRSA,V?EXAMINE \?ELS39
	EQUAL?	HERE,LIVING-ROOM,EPILOGUE-LIVING-ROOM \?ELS39
	CALL1	V-LOOK
	RSTACK	
?ELS39:	EQUAL?	PRSA,V?WASH \FALSE
	CALL	PERFORM,V?WASH,GLOBAL-ROOM
	RTRUE	


	.FUNCT	KITCHEN-OBJECT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,KITCHEN,EPILOGUE-KITCHEN \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?EAST
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS16
	EQUAL?	HERE,KITCHEN,EPILOGUE-KITCHEN \?ELS21
	CALL2	DO-WALK,P?WEST
	RSTACK	
?ELS21:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS16:	EQUAL?	PRSA,V?EXAMINE \?ELS27
	EQUAL?	HERE,KITCHEN,EPILOGUE-KITCHEN \?ELS27
	CALL1	V-LOOK
	RSTACK	
?ELS27:	EQUAL?	PRSA,V?WASH \FALSE
	CALL	PERFORM,V?WASH,GLOBAL-ROOM
	RTRUE	


	.FUNCT	BEDROOM-OBJECT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,BEDROOM,MASTER-BEDROOM,GUEST-ROOM \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	EQUAL?	HERE,BATHROOM,FOYER \?ELS14
	CALL2	DO-WALK,P?WEST
	RSTACK	
?ELS14:	EQUAL?	HERE,EPILOGUE-LIVING-ROOM \?ELS16
	CALL2	DO-WALK,P?UP
	RSTACK	
?ELS16:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?LEAVE,V?DISEMBARK \?ELS20
	EQUAL?	HERE,BEDROOM \?ELS25
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS25:	EQUAL?	HERE,MASTER-BEDROOM \?ELS27
	CALL2	DO-WALK,P?DOWN
	RSTACK	
?ELS27:	EQUAL?	HERE,GUEST-ROOM \?ELS29
	CALL2	DO-WALK,P?EAST
	RSTACK	
?ELS29:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS20:	EQUAL?	PRSA,V?EXAMINE \?ELS35
	EQUAL?	HERE,BEDROOM,MASTER-BEDROOM,GUEST-ROOM \?ELS35
	CALL1	V-LOOK
	RSTACK	
?ELS35:	EQUAL?	PRSA,V?WASH \FALSE
	CALL	PERFORM,V?WASH,GLOBAL-ROOM
	RTRUE	


	.FUNCT	BATHROOM-OBJECT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,BEDROOM \?ELS10
	CALL2	DO-WALK,P?EAST
	RSTACK	
?ELS10:	EQUAL?	HERE,FOYER \?ELS12
	CALL2	DO-WALK,P?SW
	RSTACK	
?ELS12:	CALL	GLOBAL-IN?,PRSO,HERE
	ZERO?	STACK /FALSE
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS18
	EQUAL?	HERE,BEDROOM,FOYER \?ELS23
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS23:	EQUAL?	HERE,EPILOGUE-BATHROOM \?ELS27
	CALL2	DO-WALK,P?NE
	RSTACK	
?ELS27:	CALL2	DO-WALK,P?WEST
	RSTACK	
?ELS18:	EQUAL?	PRSA,V?TAKE \?ELS31
	GET	P-NAMW,0
	EQUAL?	STACK,W?BATH \?ELS31
	EQUAL?	HERE,EPILOGUE-BATHROOM \?ELS38
	CALL	PERFORM,V?BOARD,TUB
	RTRUE	
?ELS38:	PRINTR	"There's no tub here."
?ELS31:	EQUAL?	PRSA,V?EXAMINE \?ELS44
	EQUAL?	HERE,BATHROOM,EPILOGUE-BATHROOM \?ELS44
	CALL1	V-LOOK
	RSTACK	
?ELS44:	EQUAL?	PRSA,V?WASH \FALSE
	CALL	PERFORM,V?WASH,GLOBAL-ROOM
	RTRUE	


	.FUNCT	PARKVIEW-APARTMENTS-OBJECT-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	EQUAL?	HERE,SOUTHWAY-AND-PARK \?ELS10
	CALL2	DO-WALK,P?WEST
	RSTACK	
?ELS10:	CALL	GLOBAL-IN?,PARKVIEW-APARTMENTS-OBJECT,HERE
	ZERO?	STACK /FALSE
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE,V?EXIT \?ELS16
	EQUAL?	HERE,PARKVIEW-APARTMENTS \?ELS21
	CALL2	DO-WALK,P?EAST
	RSTACK	
?ELS21:	EQUAL?	HERE,SOUTHWAY-AND-PARK \?ELS23
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS23:	PRINT	NO-EXIT-FROM-APARTMENT
	CRLF	
	RTRUE	
?ELS16:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,PARKVIEW-APARTMENTS \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	PARKVIEW-APARTMENTS-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	MOVE	BUZZERS,HERE
	RFALSE	
?ELS5:	EQUAL?	RARG,M-LOOK \FALSE
	CALL	DESCRIBE-APARTMENT-VESTIBULE,STR?129,STR?130
	RSTACK	


	.FUNCT	MY-BUZZER-F
	EQUAL?	HERE,PARKVIEW-APARTMENTS /?ELS5
	CALL1	MOBY-VERB?
	ZERO?	STACK \?ELS5
	CALL2	CANT-SEE,MY-BUZZER
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?PUSH \?ELS9
	EQUAL?	SYEAR,2061,2071 /?THN15
	GRTR?	STIME,1402 /?THN15
	LESS?	STIME,478 \?ELS14
?THN15:	PRINTR	"There's no response to your buzzing."
?ELS14:	PRINTI	"A moment later, the door gives a loud buzz"
	FSET?	PARKVIEW-DOOR,OPENBIT /?CND23
	FSET	PARKVIEW-DOOR,OPENBIT
	PRINTI	" and pops open"
?CND23:	PRINTR	"."
?ELS9:	EQUAL?	PRSA,V?READ \FALSE
	PRINTR	"""Jill and Perry Simm."""


	.FUNCT	MY-MAILBOX-F
	EQUAL?	HERE,PARKVIEW-APARTMENTS /?ELS5
	CALL1	MOBY-VERB?
	ZERO?	STACK \?ELS5
	CALL2	CANT-SEE,MY-MAILBOX
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?LOOK-INSIDE,V?EXAMINE,V?OPEN /?THN10
	EQUAL?	PRSA,V?UNLOCK \?ELS9
?THN10:	PRINTR	"Your mailbox is empty."
?ELS9:	EQUAL?	PRSA,V?CLOSE \FALSE
	PRINTR	"It is."


	.FUNCT	PARKVIEW-DOOR-F
	EQUAL?	PRSA,V?UNLOCK,V?OPEN \?ELS5
	EQUAL?	PRSI,KEY \?ELS5
	FSET?	PARKVIEW-DOOR,OPENBIT \?ELS12
	PRINTR	"It's already open."
?ELS12:	FSET	PARKVIEW-DOOR,OPENBIT
	PRINTR	"The door opens."
?ELS5:	EQUAL?	PRSA,V?OPEN \?ELS20
	FSET?	PARKVIEW-DOOR,OPENBIT /?ELS20
	PRINTR	"The door is locked."
?ELS20:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	SYEAR,2071 \FALSE
	CALL	PERFORM,V?EXAMINE,UNOPENABLE-DOOR
	RTRUE	


	.FUNCT	INNER-LOBBY-ENTER-F
	EQUAL?	HERE,PARKVIEW-APARTMENTS \?ELS5
	FSET?	PARKVIEW-DOOR,OPENBIT \?ELS5
	FCLEAR	PARKVIEW-DOOR,OPENBIT
	PRINTI	"You enter the inner lobby and"
	EQUAL?	SYEAR,2061,2071 \?ELS12
	CALL2	SCORE,3
	PRINTI	", since the elevators are out as usual, you slowly walk up the several flights to your floor."
	CRLF	
	CRLF	
	RETURN	PARKVIEW-HALL
?ELS12:	EQUAL?	SYEAR,2051 \?CND17
	GRTR?	STIME,1374 \?ELS22
	SET	'MITCHELL-COUNTER,0
	MOVE	MITCHELL,LOCAL-GLOBALS
	JUMP	?CND20
?ELS22:	GRTR?	STIME,1120 \?ELS24
	SET	'MITCHELL-COUNTER,4
	MOVE	HOMEWORK,LIVING-ROOM
	MOVE	MITCHELL,LIVING-ROOM
	JUMP	?CND20
?ELS24:	GRTR?	STIME,1011 \?ELS26
	SET	'MITCHELL-COUNTER,3
	MOVE	MITCHELL,LIVING-ROOM
	JUMP	?CND20
?ELS26:	GRTR?	STIME,505 \?ELS28
	SET	'MITCHELL-COUNTER,2
	MOVE	MITCHELL,LOCAL-GLOBALS
	JUMP	?CND20
?ELS28:	GRTR?	STIME,463 \?ELS30
	SET	'MITCHELL-COUNTER,1
	MOVE	MITCHELL,LIVING-ROOM
	JUMP	?CND20
?ELS30:	SET	'MITCHELL-COUNTER,0
	MOVE	MITCHELL,LOCAL-GLOBALS
?CND20:	CALL	QUEUE,I-MITCHELL,-1
?CND17:	PRINTI	" take the elevator up to your floor."
	CRLF	
	CRLF	
	RETURN	PARKVIEW-HALL
?ELS5:	PRINTI	"The door to the inner lobby is locked."
	CRLF	
	EQUAL?	HERE,PARKVIEW-APARTMENTS \?ELS41
	SET	'P-IT-OBJECT,PARKVIEW-DOOR
	RFALSE	
?ELS41:	SET	'P-IT-OBJECT,UNOPENABLE-DOOR
	RFALSE	


	.FUNCT	PARKVIEW-HALL-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"You are standing in the hall at the door to your apartment, which lies "
	FSET?	APARTMENT-DOOR,OPENBIT \?ELS10
	PRINTI	"open"
	JUMP	?CND8
?ELS10:	PRINTI	"closed"
?CND8:	PRINTI	" to the north. The stairs and elevators to the street are off to the east."
	RTRUE	


	.FUNCT	HALL-NEAR-YOUR-APARTMENT-EXIT-F
	PRINTI	"You descend to the first floor and head for the lobby..."
	CRLF	
	CRLF	
	RETURN	PARKVIEW-APARTMENTS


	.FUNCT	APARTMENT-DOOR-F
	EQUAL?	HERE,FOYER \?ELS5
	EQUAL?	PRSA,V?THROUGH,V?OPEN \?ELS5
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?OPEN,V?UNLOCK \?ELS9
	EQUAL?	PRSI,KEY \?ELS9
	EQUAL?	HERE,FOYER /?ELS9
	FSET?	APARTMENT-DOOR,OPENBIT \?ELS16
	PRINTR	"The door's open!"
?ELS16:	EQUAL?	HERE,LIVING-ROOM \?ELS20
	PRINTI	"You don't need the key to open the door from the inside!"
	IN?	HERE,JILL \?CND23
	PRINTI	" Jill gives you a funny look as you try."
?CND23:	CRLF	
	RTRUE	
?ELS20:	FSET	APARTMENT-DOOR,OPENBIT
	PRINTR	"The door opens."
?ELS9:	EQUAL?	PRSA,V?LOCK \?ELS33
	EQUAL?	HERE,FOYER /?ELS33
	FCLEAR	APARTMENT-DOOR,OPENBIT
	PRINTR	"The door latches automatically when you close it."
?ELS33:	EQUAL?	PRSA,V?KNOCK \?ELS39
	EQUAL?	HERE,LIVING-ROOM,FOYER \?ELS44
	PRINTR	"There's no need to knock from the inside."
?ELS44:	EQUAL?	SYEAR,2061,2071 /?THN49
	GRTR?	STIME,1400 /?THN49
	LESS?	STIME,478 \?ELS48
?THN49:	PRINTR	"There's no response."
?ELS48:	FSET?	APARTMENT-DOOR,OPENBIT \?ELS54
	PRINTR	"You hear Jill call ""It's open!"""
?ELS54:	SET	'FOLLOW-FLAG,8
	CALL	QUEUE,I-UNFOLLOW,2
	FSET	APARTMENT-DOOR,OPENBIT
	FSET	JILL,TOUCHBIT
	PRINTR	"After a moment, Jill opens the door. ""Hi, hon! Forget your key?"" She gives you a peck on the cheek and walks into the apartment."
?ELS39:	EQUAL?	PRSA,V?OPEN \FALSE
	EQUAL?	HERE,PARKVIEW-HALL \FALSE
	FSET?	APARTMENT-DOOR,OPENBIT /FALSE
	PRINTR	"The door is locked."


	.FUNCT	LIVING-ROOM-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	EQUAL?	L-HERE,PARKVIEW-HALL \?ELS5
	EQUAL?	SYEAR,2071 \?ELS12
	ZERO?	MITCHELL-RAID-FLAG \?ELS17
	MOVE	JILL,LIVING-ROOM
	CALL	QUEUE,I-MITCHELL-RAID,19
	RSTACK	
?ELS17:	CALL	QUEUE,I-APARTMENT,-1
	RSTACK	
?ELS12:	EQUAL?	SYEAR,2061 \?ELS21
	ZERO?	MITCHELL-NEWS-FLAG \?ELS26
	CALL	QUEUE,I-JILL,9
	MOVE	JILL,LOCAL-GLOBALS
	RTRUE	
?ELS26:	CALL	QUEUE,I-APARTMENT,-1
	RSTACK	
?ELS21:	CALL1	PUT-JILL-IN-THE-RIGHT-PLACE
	EQUAL?	SYEAR,2051 \?CND31
	CALL	QUEUE,I-APARTMENT,-1
?CND31:	CALL	QUEUE,I-JILL,-1
	RSTACK	
?ELS5:	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This is the large living area of your apartment, with a bedroom to the north and a kitchen to the east. The front door of the apartment, next to the couch on the south wall, is "
	FSET?	APARTMENT-DOOR,OPENBIT \?ELS40
	PRINTI	"open"
	JUMP	?CND38
?ELS40:	PRINTI	"closed"
?CND38:	PRINTI	". A huge window provides a panoramic view to the west."
	CALL1	RAID-MESS-DESC
	CRLF	
	CRLF	
	CALL1	EASEL-DESC
	PRINTI	" In one corner is the old "
	PRINTD	WORD-PROCESSOR
	PRINTI	" where you do your writing."
	RTRUE	


	.FUNCT	RAID-MESS-DESC
	ZERO?	APARTMENT-RAID-FLAG /FALSE
	PRINTI	" The room is "
	EQUAL?	SYEAR,2071 \?ELS11
	PRINTI	"torn apart"
	JUMP	?CND9
?ELS11:	PRINTI	"very messy"
?CND9:	PRINTI	" after the BSF raid."
	RTRUE	


	.FUNCT	APARTMENT-EXIT-F
	FSET?	APARTMENT-DOOR,OPENBIT /?ELS5
	PRINTI	"The door is closed."
	CRLF	
	SET	'P-IT-OBJECT,APARTMENT-DOOR
	RFALSE	
?ELS5:	CALL2	HELD?,BABY
	ZERO?	STACK /?ELS9
	ZERO?	JILL-COUNTER \?ELS12
	PRINTI	"As Jill would say if she were awake"
	JUMP	?CND10
?ELS12:	PRINTI	"Jill yells"
?CND10:	PRINTI	", ""Perry! Don't take Mitchell outside! He'll get a chill!"""
	CRLF	
	RFALSE	
?ELS9:	RETURN	PARKVIEW-HALL


	.FUNCT	WORD-PROCESSOR-F
	EQUAL?	PRSA,V?EXAMINE \?ELS5
	PRINTR	"It's an old model, but it was the best WP you could afford."
?ELS5:	EQUAL?	PRSA,V?BOARD,V?SIT,V?WRITE \?ELS9
	PRINTR	"You're not in the proper mood for writing."
?ELS9:	EQUAL?	PRSA,V?MOVE,V?TAKE \FALSE
	PRINTI	"You don't want to move the "
	PRINTD	WORD-PROCESSOR
	PRINTR	" -- it's old and flaky and breaks easily."


	.FUNCT	EASEL-F
	EQUAL?	PRSA,V?MOVE,V?TAKE \?ELS5
	PRINTR	"Jill doesn't like you fooling with her painting and drawing stuff."
?ELS5:	EQUAL?	PRSA,V?EXAMINE \FALSE
	CALL2	EASEL-DESC,TRUE-VALUE
	RSTACK	


	.FUNCT	EASEL-DESC,X=0
	EQUAL?	SYEAR,2041 \?ELS3
	PRINTI	"Jill's easel occupies a beautiful, well-lit spot near the window. Her current painting is on the easel."
	JUMP	?CND1
?ELS3:	PRINTI	"Jill's current artistic endeavor, "
	EQUAL?	SYEAR,2071 \?ELS12
	PRINTI	"a pencil sketch"
	JUMP	?CND10
?ELS12:	PRINTI	"an acrylide painting"
?CND10:	PRINTI	", is on her easel, near the entrance to the kitchen."
?CND1:	ZERO?	X /TRUE
	CRLF	
	RTRUE	


	.FUNCT	PAINTING-F
	EQUAL?	PRSA,V?MOVE,V?TAKE \?ELS5
	CALL	PERFORM,V?TAKE,EASEL
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	SYEAR,2041 \?ELS12
	PRINTR	"The painting is a bright watercolor of the cliff-top Bermuda cottage colony where you and Jill spent your honeymoon."
?ELS12:	EQUAL?	SYEAR,2051 \?ELS16
	PRINTR	"The painting, in vibrant acrylide colors, depicts workers in a space factory hovering above machinery, sipping coffee tubes. A crescent earth dominates the view through a domed canopy. It is Jill's most mature work to date."
?ELS16:	EQUAL?	SYEAR,2061 \?ELS20
	PRINTR	"The painting, in subdued shades of brown and gray, is of a beggar woman, her face a mask of suffering."
?ELS20:	PRINTR	"The sketch is dark and brooding, depicting a demonic figure towering over a frightened group of children. It's been months since you last saw Jill working on it."


	.FUNCT	PARTITION-F
	EQUAL?	PRSA,V?LOOK,V?WALK-AROUND,V?LOOK-BEHIND \FALSE
	PRINTR	"Mitchell deserves his privacy."


	.FUNCT	PARTITION-DESCFCN,X
	PRINTI	"A thin partition separates Mitchell's sleeping area from the rest of the living room"
	EQUAL?	SYEAR,2061 \?CND3
	ZERO?	MITCHELL-NEWS-FLAG \?CND3
	PRINTI	". Some of Mitchell's stuff seems to be missing"
?CND3:	PRINTR	"."


	.FUNCT	MITCHELL-DESCFCN,RARG
	PRINTI	"Mitchell is "
	EQUAL?	MITCHELL-COUNTER,1 \?ELS5
	PRINTI	"running around the room, getting ready for school"
	JUMP	?CND3
?ELS5:	EQUAL?	MITCHELL-COUNTER,3 \?ELS9
	PRINTI	"sitting in the corner, playing some kind of new "
	PRINTD	LOGIC-GAME
	JUMP	?CND3
?ELS9:	PRINTI	"sprawled on the floor, doing some homework"
?CND3:	PRINTR	"."


	.FUNCT	MITCHELL-F
	EQUAL?	MITCHELL,WINNER \?ELS5
	EQUAL?	PRSA,V?HELLO \?ELS10
	PRINTR	"""Hi, Dad!"""
?ELS10:	PRINTI	"""Please, Dad! I'm trying to "
	EQUAL?	MITCHELL-COUNTER,1 \?ELS19
	PRINTI	"get ready for school"
	JUMP	?CND17
?ELS19:	EQUAL?	MITCHELL-COUNTER,3 \?ELS23
	PRINTI	"do a logic game"
	JUMP	?CND17
?ELS23:	PRINTI	"do my homework"
?CND17:	PRINTI	"!"""
	CRLF	
	CALL1	CLEAR-BUF
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?KISS \?ELS33
	PRINTR	"Mitchell looks a little embarrassed, but also smiles."
?ELS33:	EQUAL?	PRSA,V?EXAMINE \?ELS37
	PRINTI	"Your son is a healthy, sturdy boy of nearly eleven years. "
	CALL1	MITCHELL-DESCFCN
	RSTACK	
?ELS37:	EQUAL?	PRSA,V?PLAY-WITH \?ELS41
	PRINTR	"""No thanks, Dad. Too much homework."""
?ELS41:	EQUAL?	PRSA,V?FOLLOW \?ELS45
	EQUAL?	FOLLOW-FLAG,12 \?ELS50
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS50:	EQUAL?	FOLLOW-FLAG,10 \?ELS52
	CALL2	DO-WALK,P?DOWN
	RSTACK	
?ELS52:	EQUAL?	FOLLOW-FLAG,11 \?ELS54
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS54:	EQUAL?	FOLLOW-FLAG,14 \?ELS56
	CALL	PERFORM,V?WALK-AROUND,PARTITION
	RTRUE	
?ELS56:	EQUAL?	HERE,KITCHEN,BEDROOM,BATHROOM \FALSE
	IN?	MITCHELL,LIVING-ROOM \FALSE
	PRINTR	"Mitchell hasn't just left!"
?ELS45:	EQUAL?	PRSA,V?WALK-TO \?ELS64
	EQUAL?	PRSO,BED \?ELS64
	LESS?	STIME,1320 \?ELS71
	PRINTR	"""Aw, Dad, it's too early!"""
?ELS71:	PRINTR	"""Just a couple more minutes, Dad."""
?ELS64:	EQUAL?	PRSA,V?TOUCH \FALSE
	PRINTR	"""C'mon, Dad, I'm not ticklish anymore!"""


	.FUNCT	HOMEWORK-F
	EQUAL?	PRSA,V?TAKE \?ELS5
	PRINTR	"Mitchell's working on it!"
?ELS5:	EQUAL?	PRSA,V?EXAMINE,V?READ \FALSE
	PRINTR	"It looks like typical sixth-grade coursework."


	.FUNCT	LOGIC-GAME-F
	EQUAL?	PRSA,V?EXAMINE \?ELS5
	PRINTI	"It's just another of those popular "
	PRINTD	LOGIC-GAME
	PRINTR	"s. Mitchell looks as if he's quite good at it."
?ELS5:	EQUAL?	PRSA,V?PLAY-WITH,V?PLAY,V?TAKE \FALSE
	PRINTR	"Mitchell's playing with it!"


	.FUNCT	APARTMENT-WINDOW-F
	EQUAL?	PRSA,V?OPEN \?ELS5
	PRINTR	"It's a little too chilly today."
?ELS5:	EQUAL?	PRSA,V?CLOSE \?ELS9
	PRINTR	"It is."
?ELS9:	EQUAL?	PRSA,V?EXAMINE \?ELS13
	EQUAL?	SYEAR,2061,2071 \?ELS13
	CALL2	SCORE,4
	PRINTR	"The aging glass is etched from pollution."
?ELS13:	EQUAL?	PRSA,V?LOOK-INSIDE \FALSE
	EQUAL?	SYEAR,2041 \?ELS24
	PRINTR	"The view from this picture window is the one notable plus about the apartment. On the other side of the old interstate, you can see Rockvil's wealthy western suburbs, surrounded by the woods and conservation lands of the State Park System."
?ELS24:	EQUAL?	SYEAR,2051 \?ELS28
	CALL2	SCORE,5
	PRINTR	"The panoramic view overlooks the suburbs of Westwood and Brentwood, as well as extensive woodlands. The forests, as a result of increasingly acidic rain, are thinner and browner each year."
?ELS28:	EQUAL?	SYEAR,2061 \?ELS32
	CALL2	SCORE,6
	PRINTR	"The view to the west has changed considerably over the last decade. The forest of dying trees has been replaced by a forest of thriving mining towers, which trundle across the landscape leaving ugly brown scars. The western suburbs, once the most desirable in greater Rockvil, now look nearly deserted, a sign of the vanishing middle class."
?ELS32:	EQUAL?	SYEAR,2071 \FALSE
	CALL2	SCORE,7
	PRINTR	"Through the gray haze that covers western Rockvil you can discern an ugly industrial slum, where thousands upon thousands of serfs live in substandard shacks, running the factories and mines that support Rockvil's urban nobility."


	.FUNCT	KITCHEN-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This is the tiny kitchen of your apartment. Next to the sink is a small "
	PRINTD	REFRIGERATOR
	PRINTI	". Along the western wall, next to the doorway to the living area, is a "
	PRINTD	DINETTE-SET
	PRINTI	"."
	CALL1	RAID-MESS-DESC
	RTRUE	


	.FUNCT	SALAD-F
	EQUAL?	PRSA,V?EAT,V?TAKE \?ELS5
	EQUAL?	JILL-COUNTER,3,6 \?ELS10
	PRINTI	"Jill's "
	EQUAL?	JILL-COUNTER,3 \?ELS15
	PRINTI	"still making"
	JUMP	?CND13
?ELS15:	PRINTI	"eating"
?CND13:	PRINTR	" it!"
?ELS10:	PRINTR	"Jill probably made that for herself. Besides, you can't stand anything with avocadoes in it."
?ELS5:	CALL1	RANDOM-FOOD-F
	ZERO?	STACK \TRUE
	RFALSE


	.FUNCT	SANDWICH-F
	EQUAL?	PRSA,V?BUY \FALSE
	GET	P-NAMW,0
	EQUAL?	STACK,W?FOOD \FALSE
	CALL	PERFORM,V?BUY,MEAL
	RTRUE	


	.FUNCT	FORMULA-F
	EQUAL?	PRSA,V?EXAMINE \?ELS5
	PRINTI	"The "
	PRINTD	FORMULA
	PRINTR	" has a nipple for the baby to suck on."
?ELS5:	EQUAL?	PRSA,V?EAT,V?DRINK \FALSE
	PRINTR	"It's for the baby, not you."


	.FUNCT	SINK-F
	EQUAL?	PRSA,V?PUT \?ELS5
	EQUAL?	PRSI,SINK \?ELS5
	PRINTI	"That's a dumb place for"
	CALL2	ARTICLE,PRSO
	PRINTR	"."
?ELS5:	EQUAL?	PRSA,V?LOOK-INSIDE,V?EXAMINE \?ELS13
	EQUAL?	HERE,KITCHEN \?ELS18
	EQUAL?	JILL-COUNTER,7 \?ELS18
	PRINTR	"The sink is filled with suds."
?ELS18:	PRINTR	"The sink is empty."
?ELS13:	EQUAL?	PRSA,V?OFF,V?ON,V?TURN \FALSE
	CALL	PERFORM,PRSA,WATER
	RTRUE	


	.FUNCT	DISHES-F
	EQUAL?	PRSA,V?TAKE \?ELS5
	PRINTR	"The dishes should stay here until they're washed."
?ELS5:	EQUAL?	PRSA,V?WASH \FALSE
	IN?	JILL,HERE \?ELS14
	PRINT	MY-WEEK
	CRLF	
	RTRUE	
?ELS14:	PRINTR	"It's Jill's week to do the household chores."


	.FUNCT	SODA-F
	EQUAL?	PRSA,V?OPEN \?ELS5
	FSET?	SODA,OPENBIT \?ELS10
	PRINTR	"It is."
?ELS10:	FSET	SODA,OPENBIT
	PRINTR	"Opened."
?ELS5:	EQUAL?	PRSA,V?CLOSE \?ELS18
	PRINTI	"You can't reclose a "
	PRINTD	SODA
	PRINTR	"!"
?ELS18:	EQUAL?	PRSA,V?BUY \?ELS24
	EQUAL?	HERE,EZZIS-BAR,BAR,BURGER-MEISTER \?ELS29
	PRINTI	"You order some soda"
	CALL	TOO-POOR,3,SODA
	ZERO?	STACK \TRUE
	CALL2	DEBIT,3
	PRINTR	". You down the entire glass, which is then removed."
?ELS29:	EQUAL?	HERE,FOODVILLE-1,FOODVILLE-2 \?ELS42
	PRINTI	"The soda shelves are bare."
	EQUAL?	SYEAR,2041 \?CND45
	PRINTI	" There must've been a sale."
?CND45:	CRLF	
	RTRUE	
?ELS42:	EQUAL?	HERE,DRUG-STORE \?ELS51
	CALL	PERFORM,V?BUY,MILKSHAKE
	RTRUE	
?ELS51:	CALL2	CANT-BUY,SODA
	RSTACK	
?ELS24:	EQUAL?	PRSA,V?LOOK-INSIDE \?ELS55
	FSET?	SODA,OPENBIT \?ELS60
	PRINTR	"Looks as if there's soda in it."
?ELS60:	PRINTR	"The can isn't open."
?ELS55:	EQUAL?	PRSA,V?DRINK \FALSE
	MOVE	SODA,LOCAL-GLOBALS
	PRINTR	"The soda is sweet and thirst-quenching. After you finish, you dispose of the can."


	.FUNCT	RANDOM-FOOD-F
	EQUAL?	PRSA,V?BUY \FALSE
	GET	P-NAMW,0
	EQUAL?	STACK,W?FOOD \FALSE
	CALL	PERFORM,V?BUY,MEAL
	RTRUE	


	.FUNCT	BEDROOM-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	EQUAL?	SYEAR,2041 \?ELS8
	PRINTI	"The room is almost filled by your bed, a bureau, and the baby's crib"
	JUMP	?CND6
?ELS8:	PRINTI	"The bedroom is sparsely furnished with a bed and bureau"
?CND6:	PRINTI	". A doorway leads south to the living room, and the bathroom is to the east."
	CALL1	RAID-MESS-DESC
	RTRUE	


	.FUNCT	BED-F
	EQUAL?	PRSA,V?WALK-TO \?ELS5
	CALL1	V-SLEEP
	RSTACK	
?ELS5:	EQUAL?	HERE,MASTER-BEDROOM \FALSE
	CALL1	FURNITURE-REMOVED
	RSTACK	


	.FUNCT	BUREAU-F
	EQUAL?	PRSA,V?EXAMINE \?ELS5
	PRINTI	"The flimsy bureau has an artificial wood veneer. All the drawers are closed."
	FIRST?	BUREAU \?ELS12
	PRINTI	" "
	RFALSE	
?ELS12:	CRLF	
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?OPEN \?ELS18
	PRINTR	"There's nothing interesting in the drawer. In the interest of tidiness, you close it again."
?ELS18:	EQUAL?	PRSA,V?CLOSE \FALSE
	PRINTR	"It is!"


	.FUNCT	BATHROOM-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This plain bathroom is just large enough to accommodate a sink, toilet, and "
	PRINTD	SHOWER
	PRINTI	". The bedroom is to the west."
	CALL1	RAID-MESS-DESC
	RTRUE	


	.FUNCT	TOILET-F
	EQUAL?	PRSA,V?FLUSH \?ELS5
	PRINTR	"Flushed."
?ELS5:	EQUAL?	PRSA,V?LOOK-INSIDE \FALSE
	PRINTR	"You find nothing of interest."


	.FUNCT	SHOWER-F
	EQUAL?	PRSA,V?CLOSE,V?OPEN \?ELS5
	PRINTR	"That killed some time."
?ELS5:	EQUAL?	PRSA,V?ON,V?TAKE \FALSE
	EQUAL?	PRSO,SHOWER \FALSE
	EQUAL?	SYEAR,2071 \?ELS16
	CALL2	SCORE,2
	PRINTR	"You discover that the hot water is out again today, so you decide to forgo the shower."
?ELS16:	CALL2	HELD?,BABY
	ZERO?	STACK /?ELS20
	PRINT	MITCHELL-BACK-FIRST
	CRLF	
	RTRUE	
?ELS20:	SET	'ELAPSED-TIME,14
	PRINTR	"You undress, take a brief and refreshing shower, and put on fresh clothes."


	.FUNCT	JILL-F,RARG=0
	EQUAL?	JILL,WINNER \?ELS5
	ZERO?	JILL-COUNTER \?ELS10
	SET	'WINNER,PLAYER
	CALL	PERFORM,V?KISS,JILL
	CALL1	CLEAR-BUF
	RSTACK	
?ELS10:	EQUAL?	JILL-COUNTER,13,14 /?THN13
	EQUAL?	SYEAR,2071 \?ELS12
?THN13:	PRINTI	"Jill, "
	EQUAL?	JILL-COUNTER,13 \?ELS19
	PRINTI	"sobbing quietly in the corner"
	JUMP	?CND17
?ELS19:	EQUAL?	JILL-COUNTER,14 \?ELS23
	PRINTI	"slowly cleaning up after the raid"
	JUMP	?CND17
?ELS23:	PRINTI	"staring silently out the window"
?CND17:	PRINTI	", doesn't reply."
	CRLF	
	CALL1	CLEAR-BUF
	RSTACK	
?ELS12:	ZERO?	MITCHELL-NEWS-FLAG /?ELS33
	SET	'WINNER,PLAYER
	CALL	PERFORM,V?COMFORT,JILL
	SET	'WINNER,JILL
	RTRUE	
?ELS33:	EQUAL?	PRSA,V?YES \?ELS36
	EQUAL?	YES-NO-FLAG,7,11 /?THN39
	EQUAL?	YES-NO-FLAG,9,10 \?ELS36
?THN39:	CALL1	V-YES
	RSTACK	
?ELS36:	EQUAL?	PRSA,V?NO \?ELS42
	EQUAL?	YES-NO-FLAG,7,11 /?THN45
	EQUAL?	YES-NO-FLAG,9,10 \?ELS42
?THN45:	CALL1	V-NO
	RSTACK	
?ELS42:	EQUAL?	HERE,SKYCAB \?ELS48
	SET	'YES-NO-FLAG,9
	CALL	QUEUE,I-YES-NO,2
	PRINTR	"""Perry Simm, for once in your life will you shut your mouth and relax?"""
?ELS48:	EQUAL?	PRSA,V?WHAT,V?WHO \?ELS52
	CALL	PERFORM,V?TELL-ABOUT,ME,PRSO
	RTRUE	
?ELS52:	EQUAL?	PRSA,V?TELL-ABOUT \?ELS54
	EQUAL?	PRSO,ME \?ELS54
	EQUAL?	PRSI,CLERKMATON \?ELS61
	PRINTR	"""Clerkmatons! They didn't last long, did they? Remember that time I asked one where we could find potholders, and it led us to a storeroom where shipping cartons for pots were kept? They were cute -- I sort of miss them."""
?ELS61:	EQUAL?	PRSI,BABY \?ELS65
	EQUAL?	SYEAR,2041 \?ELS70
	PRINTR	"""Mitchell's been a dear -- he hasn't cried all day."""
?ELS70:	PRINTR	"""What baby?"""
?ELS65:	EQUAL?	PRSI,MITCHELL \?ELS78
	EQUAL?	SYEAR,2051 \?ELS78
	IN?	MITCHELL,HERE \?CND81
	PRINTI	"Jill looks at Mitchell, smiling glowingly. "
?CND81:	PRINTR	"""I'm so happy about Mitch -- he's healthy, he's handsome, he's studious -- what more could a parent ask for?"""
?ELS78:	EQUAL?	PRSI,PAINTING \?ELS89
	EQUAL?	SYEAR,2041,2051 \?ELS89
	EQUAL?	SYEAR,2041 \?ELS96
	PRINTR	"""The watercolor? It's pretty, but it doesn't SAY anything. If only I could think of some good subject material..."""
?ELS96:	PRINTR	"""It's coming out well, don't you think? Thanks for suggesting the motif!"""
?ELS89:	EQUAL?	PRSI,JILL-BOOK \?ELS104
	SET	'YES-NO-FLAG,10
	CALL	QUEUE,I-YES-NO,2
	PRINTR	"""Oh, Perry, I know they're all trashy. You're not going to start making fun of me again, are you?"""
?ELS104:	EQUAL?	PRSI,FYLA \?ELS108
	PRINTR	"""Let's not talk about her."""
?ELS108:	EQUAL?	PRSI,ESTHER,GOLD,PERELMAN /?THN113
	EQUAL?	PRSI,WARREN,GRIMWOLD,RANDU /?THN113
	EQUAL?	PRSI,PRICE \?ELS112
?THN113:	PRINTR	"""I don't know anyone by that name, hon."""
?ELS112:	EQUAL?	PRSI,SILVER-DOVE \?ELS118
	EQUAL?	SYEAR,2091 \?ELS123
	PRINTR	"""Perry, I'm so excited about this trip! I feel like such a pioneer!"""
?ELS123:	CALL	PERFORM,V?TELL-ABOUT,ME,RANDU
	RTRUE	
?ELS118:	EQUAL?	PRSI,FORTZMAN \?ELS129
	PRINTI	"""I think she's Secretary of "
	EQUAL?	SYEAR,2041 \?ELS134
	PRINTI	"Education"
	JUMP	?CND132
?ELS134:	PRINTI	"Morality"
?CND132:	PRINTR	"."""
?ELS129:	EQUAL?	PRSI,YOURSELF,JILL \?ELS144
	PRINTI	"""Perry! We've been married for "
	SUB	SYEAR,2034
	PRINTN	STACK
	PRINTR	" years!"""
?ELS144:	PRINTR	"""What a silly question, Perry!"""
?ELS54:	EQUAL?	PRSA,V?HELLO \?ELS152
	PRINTR	"""Hi, hon!"""
?ELS152:	EQUAL?	PRSA,V?EXAMINE \?ELS156
	EQUAL?	PRSO,BABY \?ELS156
	SET	'WINNER,PLAYER
	CALL	PERFORM,V?SHOW,BABY,JILL
	SET	'WINNER,JILL
	RTRUE	
?ELS156:	PRINTI	"Jill wrinkles her nose in a display of mock annoyance. ""Honey, I'm busy "
	EQUAL?	HERE,MASTER-BEDROOM \?ELS165
	PRINTI	"packing"
	JUMP	?CND163
?ELS165:	EQUAL?	JILL-COUNTER,1 \?ELS169
	PRINTI	"dressing"
	JUMP	?CND163
?ELS169:	EQUAL?	JILL-COUNTER,2,9 \?ELS173
	PRINTI	"cleaning"
	JUMP	?CND163
?ELS173:	EQUAL?	JILL-COUNTER,3 \?ELS177
	PRINTI	"making a salad"
	JUMP	?CND163
?ELS177:	EQUAL?	JILL-COUNTER,4,10,12 \?ELS181
	PRINTI	"reading"
	JUMP	?CND163
?ELS181:	EQUAL?	JILL-COUNTER,5,8 \?ELS185
	PRINTI	"painting"
	JUMP	?CND163
?ELS185:	EQUAL?	JILL-COUNTER,6 \?ELS189
	PRINTI	"eating"
	JUMP	?CND163
?ELS189:	EQUAL?	JILL-COUNTER,7 \?ELS193
	PRINTI	"doing the dishes"
	JUMP	?CND163
?ELS193:	PRINTI	"coloring my hair"
?CND163:	PRINTI	"."""
	CRLF	
	CALL1	CLEAR-BUF
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?THANK \?ELS203
	ZERO?	JILL-COUNTER \?ELS208
	CALL	PERFORM,V?KISS,JILL
	RTRUE	
?ELS208:	EQUAL?	SYEAR,2041,2051 \FALSE
	CALL	PERFORM,V?THANK,PERELMAN
	RTRUE	
?ELS203:	EQUAL?	PRSA,V?BOARD,V?CLIMB-FOO,V?CLIMB-ON /?THN213
	EQUAL?	PRSA,V?LIE-DOWN \?ELS212
?THN213:	PRINTR	"Ahem."
?ELS212:	EQUAL?	PRSA,V?ALARM \?ELS218
	ZERO?	JILL-COUNTER \?ELS218
	PRINTR	"Jill mumbles incoherently and rolls over."
?ELS218:	EQUAL?	PRSA,V?PLAY-WITH \?ELS224
	PRINTR	"You ask Jill if she's interested in a game of chess, or perhaps gin rummy, but she begs off."
?ELS224:	EQUAL?	PRSA,V?SQUEEZE,V?TOUCH \?ELS228
	ZERO?	JILL-COUNTER \?ELS233
	CALL	PERFORM,V?ALARM,JILL
	RTRUE	
?ELS233:	ZERO?	MITCHELL-RAID-FLAG \?THN236
	EQUAL?	SYEAR,2071 \?ELS235
?THN236:	CALL	PERFORM,V?KISS,JILL
	RTRUE	
?ELS235:	PRINTR	"""I'm touched,"" says Jill."
?ELS228:	EQUAL?	PRSA,V?COMFORT \?ELS243
	ZERO?	MITCHELL-NEWS-FLAG /?ELS248
	PRINTR	"Jill says, ""I'll be okay. I just need to be alone for a while."" A moment later she adds, ""I love you, Perry."" She buries her face in the pillows."
?ELS248:	EQUAL?	JILL-COUNTER,13 \?ELS253
	PRINTR	"As you hug her and stroke her back, Jill calms down noticeably."
?ELS253:	EQUAL?	SYEAR,2071 \FALSE
	PRINTR	"Jill takes little notice."
?ELS243:	EQUAL?	PRSA,V?KISS \?ELS261
	ZERO?	MITCHELL-NEWS-FLAG \?THN267
	EQUAL?	JILL-COUNTER,13 \?ELS266
?THN267:	CALL	PERFORM,V?COMFORT,JILL
	RTRUE	
?ELS266:	EQUAL?	SYEAR,2071 \?ELS270
	PRINTR	"Jill kisses you briefly, without much enthusiasm."
?ELS270:	ZERO?	JILL-COUNTER \?ELS274
	PRINTR	"Jill is sleeping!"
?ELS274:	PRINTR	"Jill kisses you back. ""Ooo-la-la,"" she says, afterwards."
?ELS261:	EQUAL?	PRSA,V?EXAMINE \?ELS282
	EQUAL?	SYEAR,2041 \?ELS285
	PRINTI	"Jill looks as beautiful as the day you married her seven years ago"
	JUMP	?CND283
?ELS285:	EQUAL?	SYEAR,2051 \?ELS289
	PRINTI	"Jill's thirty-nine years have done nothing to dim her natural beauty"
	JUMP	?CND283
?ELS289:	EQUAL?	SYEAR,2061 \?ELS293
	PRINTI	"Jill's face is a bit lined by age, and there are gray streaks in her hair, but to you she appears with a loveliness undiminished by twenty-seven years of marriage"
	JUMP	?CND283
?ELS293:	EQUAL?	SYEAR,2071 \?ELS297
	PRINTI	"Jill has aged dramatically during the last decade, an effect heightened by the fact that Jill has become more and more withdrawn; she has lost interest in many things, including her appearance"
	JUMP	?CND283
?ELS297:	EQUAL?	SYEAR,2091 \?CND283
	PRINTI	"Jill's healthy demeanor and graceful pose are more befitting a woman twenty years her junior"
?CND283:	PRINTI	". "
	CALL1	JILL-DESCFCN
	RSTACK	
?ELS282:	EQUAL?	PRSA,V?SHOW \?ELS307
	ZERO?	JILL-COUNTER \?ELS312
	CALL	PERFORM,V?KISS,JILL
	RTRUE	
?ELS312:	EQUAL?	PRSO,BABY \FALSE
	SET	'YES-NO-FLAG,11
	CALL	QUEUE,I-YES-NO,2
	PRINTR	"Jill's face melts, and her eyes grow moist. ""Isn't he a bundle of joy, Perry?"""
?ELS307:	EQUAL?	PRSA,V?GIVE \?ELS318
	ZERO?	JILL-COUNTER \?ELS323
	CALL	PERFORM,V?KISS,JILL
	RTRUE	
?ELS323:	EQUAL?	PRSO,BABY \?ELS325
	MOVE	BABY,CRIB
	PRINTI	"As Jill takes the baby he begins crying. ""Perry, you've woken him up!"" She begins rocking Mitchell gently. ""There, there, it's okay, go to sleep, that's a good little boy."" She "
	EQUAL?	HERE,BEDROOM \?ELS330
	PRINTI	"places him in the crib"
	JUMP	?CND328
?ELS330:	PRINTI	"carries Mitchell into the bedroom"
?CND328:	PRINTR	" and goes back to what she was doing."
?ELS325:	EQUAL?	PRSO,RUSTY-CROSS \FALSE
	MOVE	RUSTY-CROSS,LOCAL-GLOBALS
	PRINTR	"""Perry, if the police see this, we'll get in trouble."" Nevertheless, she slips the cross into her pocket."
?ELS318:	EQUAL?	PRSA,V?FOLLOW \?ELS344
	EQUAL?	FOLLOW-FLAG,2,8 /?THN350
	EQUAL?	FOLLOW-FLAG,1 \?ELS349
	EQUAL?	HERE,LIVING-ROOM \?ELS349
?THN350:	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS349:	EQUAL?	FOLLOW-FLAG,3,5 \?ELS355
	CALL2	DO-WALK,P?EAST
	RSTACK	
?ELS355:	EQUAL?	FOLLOW-FLAG,4,6 /?THN358
	EQUAL?	FOLLOW-FLAG,1 \?ELS357
	EQUAL?	HERE,KITCHEN,BATHROOM \?ELS357
?THN358:	CALL2	DO-WALK,P?WEST
	RSTACK	
?ELS357:	EQUAL?	FOLLOW-FLAG,7 \?ELS363
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS363:	EQUAL?	FOLLOW-FLAG,15 \?ELS365
	PRINTR	"You didn't notice which way she went."
?ELS365:	IN?	JILL,LOCAL-GLOBALS /FALSE
	IN?	JILL,HERE /FALSE
	PRINTR	"Huh? Jill hasn't just left the room!?!"
?ELS344:	EQUAL?	PRSA,V?SIT-NEXT-TO \?ELS375
	EQUAL?	JILL-COUNTER,4,10 \?ELS375
	CALL	PERFORM,V?SIT,COUCH
	RTRUE	
?ELS375:	EQUAL?	PRSA,V?SIT-NEXT-TO \FALSE
	EQUAL?	JILL-COUNTER,6 \FALSE
	CALL	PERFORM,V?SIT,DINETTE-SET
	RTRUE	


	.FUNCT	JILL-DESCFCN,X
	EQUAL?	PRSA,V?EXAMINE \?ELS3
	EQUAL?	PRSO,JILL \?ELS3
	PRINTI	"She is "
	JUMP	?CND1
?ELS3:	PRINTI	"Jill is "
?CND1:	EQUAL?	HERE,MASTER-BEDROOM \?ELS16
	PRINTR	"here, doing some last-minute packing."
?ELS16:	EQUAL?	HERE,SKYCAB \?ELS20
	PRINTR	"sitting next to you on the plush seat."
?ELS20:	EQUAL?	SYEAR,2071 \?ELS24
	PRINTR	"sitting on the couch, staring morosely out the window."
?ELS24:	EQUAL?	SYEAR,2061 \?ELS28
	PRINTR	"lying on the bed, sobbing."
?ELS28:	ZERO?	JILL-COUNTER \?ELS32
	PRINTR	"lying on the bed, sleeping peacefully."
?ELS32:	EQUAL?	JILL-COUNTER,1 \?ELS36
	PRINTR	"standing near the bureau, getting dressed."
?ELS36:	EQUAL?	JILL-COUNTER,2,9 \?ELS40
	PRINTI	"walking around, neatening and cleaning the "
	EQUAL?	JILL-COUNTER,2 \?ELS45
	PRINTI	"bedroom"
	JUMP	?CND43
?ELS45:	PRINTI	"living room"
?CND43:	PRINTR	"."
?ELS40:	EQUAL?	JILL-COUNTER,3 \?ELS55
	PRINTR	"standing at the counter, preparing a salad."
?ELS55:	EQUAL?	JILL-COUNTER,4,10 \?ELS59
	PRINTR	"curled up in the corner of the couch, reading a book."
?ELS59:	EQUAL?	JILL-COUNTER,5,8 \?ELS63
	PRINTR	"standing at the easel, working on her current painting."
?ELS63:	EQUAL?	JILL-COUNTER,6 \?ELS67
	PRINTR	"sitting at the table, nibbling on a salad."
?ELS67:	EQUAL?	JILL-COUNTER,7 \?ELS71
	PRINTR	"washing some dishes."
?ELS71:	EQUAL?	JILL-COUNTER,11 \?ELS75
	PRINTR	"washing and coloring her hair."
?ELS75:	EQUAL?	JILL-COUNTER,12 \?ELS79
	PRINTR	"lying on the bed, reading a book."
?ELS79:	EQUAL?	JILL-COUNTER,13 \?ELS83
	PRINTR	"huddled in the corner, crying."
?ELS83:	EQUAL?	JILL-COUNTER,14 \?ELS87
	PRINTR	"slowly straightening up after the raid."
?ELS87:	PRINTR	"Bug #9B"


	.FUNCT	PUT-JILL-IN-THE-RIGHT-PLACE
	GRTR?	STIME,1402 \?ELS5
	SET	'JILL-COUNTER,0
	MOVE	JILL,BEDROOM
	MOVE	JILL-BOOK,BEDROOM
	RTRUE	
?ELS5:	GRTR?	STIME,1299 \?ELS7
	SET	'JILL-COUNTER,12
	MOVE	JILL-BOOK,BEDROOM
	FSET	JILL-BOOK,NDESCBIT
	MOVE	JILL,BEDROOM
	RTRUE	
?ELS7:	GRTR?	STIME,1242 \?ELS9
	SET	'JILL-COUNTER,11
	MOVE	JILL-BOOK,BEDROOM
	MOVE	JILL,BATHROOM
	RTRUE	
?ELS9:	GRTR?	STIME,1137 \?ELS11
	SET	'JILL-COUNTER,10
	MOVE	JILL-BOOK,LIVING-ROOM
	FSET	JILL-BOOK,NDESCBIT
	MOVE	JILL,LIVING-ROOM
	RTRUE	
?ELS11:	GRTR?	STIME,1084 \?ELS13
	SET	'JILL-COUNTER,9
	MOVE	JILL,LIVING-ROOM
	MOVE	JILL-BOOK,LIVING-ROOM
	RTRUE	
?ELS13:	GRTR?	STIME,912 \?ELS15
	SET	'JILL-COUNTER,8
	MOVE	JILL,LIVING-ROOM
	MOVE	JILL-BOOK,LIVING-ROOM
	RTRUE	
?ELS15:	GRTR?	STIME,859 \?ELS17
	SET	'JILL-COUNTER,7
	MOVE	JILL,KITCHEN
	MOVE	JILL-BOOK,LIVING-ROOM
	RTRUE	
?ELS17:	GRTR?	STIME,813 \?ELS19
	SET	'JILL-COUNTER,6
	MOVE	JILL,KITCHEN
	MOVE	JILL-BOOK,LIVING-ROOM
	MOVE	SALAD,KITCHEN
	FSET	SALAD,NDESCBIT
	RTRUE	
?ELS19:	GRTR?	STIME,697 \?ELS21
	SET	'JILL-COUNTER,5
	MOVE	JILL,LIVING-ROOM
	MOVE	JILL-BOOK,LIVING-ROOM
	MOVE	SALAD,REFRIGERATOR
	RTRUE	
?ELS21:	GRTR?	STIME,644 \?ELS23
	SET	'JILL-COUNTER,4
	MOVE	JILL,LIVING-ROOM
	MOVE	SALAD,REFRIGERATOR
	MOVE	JILL-BOOK,LIVING-ROOM
	FSET	JILL-BOOK,NDESCBIT
	RTRUE	
?ELS23:	GRTR?	STIME,591 \?ELS25
	SET	'JILL-COUNTER,3
	MOVE	JILL,KITCHEN
	MOVE	SALAD,KITCHEN
	FSET	SALAD,NDESCBIT
	MOVE	JILL-BOOK,BEDROOM
	RTRUE	
?ELS25:	GRTR?	STIME,522 \?ELS27
	MOVE	JILL,BEDROOM
	MOVE	JILL-BOOK,BEDROOM
	SET	'JILL-COUNTER,2
	RETURN	JILL-COUNTER
?ELS27:	GRTR?	STIME,478 \?ELS29
	MOVE	JILL,BEDROOM
	MOVE	JILL-BOOK,BEDROOM
	SET	'JILL-COUNTER,1
	RETURN	JILL-COUNTER
?ELS29:	MOVE	JILL,BEDROOM
	MOVE	JILL-BOOK,BEDROOM
	SET	'JILL-COUNTER,0
	RETURN	JILL-COUNTER


	.FUNCT	JILL-BOOK-F
	EQUAL?	PRSA,V?TAKE \?ELS5
	EQUAL?	JILL-COUNTER,4,10 \?ELS10
	PRINTR	"Jill's in the middle of reading it!"
?ELS10:	PRINTR	"You have no interest in those gothic novels."
?ELS5:	EQUAL?	PRSA,V?OPEN,V?EXAMINE,V?READ \?ELS18
	PRINTI	"It's another of those indistinguishable "
	PRINTD	JILL-BOOK
	PRINTR	"s that Jill is always reading."
?ELS18:	EQUAL?	PRSA,V?CLOSE \?ELS24
	EQUAL?	JILL-COUNTER,4,10 \?ELS29
	CALL	PERFORM,V?TAKE,JILL-BOOK
	RTRUE	
?ELS29:	PRINTR	"It is!"
?ELS24:	EQUAL?	PRSA,V?BUY \FALSE
	CALL	PERFORM,V?BUY,BOOKS
	RTRUE	


	.FUNCT	CRIB-F
	EQUAL?	PRSA,V?CLOSE \FALSE
	PRINTI	"Huh?"
	RTRUE	


	.FUNCT	TOY-F
	EQUAL?	PRSA,V?EXAMINE \?ELS5
	PRINTR	"The toy is a little yellow rubber duckie."
?ELS5:	EQUAL?	PRSA,V?PLAY-WITH,V?SQUEEZE \FALSE
	PRINTR	"The toy emits a high-pitched squeak."


	.FUNCT	BABY-F
	EQUAL?	PRSA,V?TELL /?THN6
	EQUAL?	BABY,WINNER \?ELS5
?THN6:	PRINTI	"Mitchell, waking for a moment, coos happily at the sound of your voice."
	CRLF	
	CALL1	CLEAR-BUF
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?WASH \?ELS11
	PRINTR	"Although, as much as possible, you try to share with Jill the chores and pleasures of taking care of Mitchell, bathing him is one area where you're completely helpless."
?ELS11:	EQUAL?	PRSA,V?GIVE \?ELS15
	EQUAL?	PRSO,SHOWER,BATHROOM-OBJECT \?ELS15
	CALL	PERFORM,V?WASH,BABY
	RTRUE	
?ELS15:	EQUAL?	PRSA,V?EXAMINE \?ELS19
	PRINTR	"Your son, Mitchell Rav Simm, was named for your father and for your mentor. He's sleeping peacefully, his little face scrunched up in a cute mask of baby fat."
?ELS19:	EQUAL?	PRSA,V?GIVE \?ELS23
	EQUAL?	PRSO,FORMULA \?ELS23
	PRINTR	"Mitchell wakes up for a minute and sucks on the bottle. A moment later, his breathing indicates that he is asleep."
?ELS23:	EQUAL?	PRSA,V?FEED \?ELS29
	CALL2	HELD?,FORMULA
	ZERO?	STACK /?ELS34
	CALL	PERFORM,V?GIVE,FORMULA,BABY
	RTRUE	
?ELS34:	PRINTR	"At this age, Mitchell eats only baby formula."
?ELS29:	EQUAL?	PRSA,V?SHOW,V?GIVE \?ELS40
	EQUAL?	PRSI,BABY \?ELS40
	CALL	PERFORM,V?THANK,BABY
	RTRUE	
?ELS40:	EQUAL?	PRSA,V?PLAY-WITH,V?THANK \?ELS44
	PRINTR	"The baby is asleep."
?ELS44:	EQUAL?	PRSA,V?KISS \?ELS48
	PRINTR	"Despite Mitchell's pudgy adorableness, you reconsider so as not to wake him."
?ELS48:	EQUAL?	PRSA,V?SHAKE \?ELS52
	PRINTR	"Since Mitchell's already asleep, rocking him is, at best, useless."
?ELS52:	EQUAL?	PRSA,V?ALARM \?ELS56
	PRINTR	"As Jill has reminded you many times, babies need their sleep."
?ELS56:	EQUAL?	PRSA,V?PUT-ON,V?PUT \?ELS60
	EQUAL?	PRSI,CRIB /?ELS60
	CALL2	NO-PLACE-FOR-BABY,PRSI
	RSTACK	
?ELS60:	EQUAL?	PRSA,V?DROP \?ELS64
	CALL2	NO-PLACE-FOR-BABY,GROUND
	RSTACK	
?ELS64:	EQUAL?	PRSA,V?KICK,V?THROW \FALSE
	PRINTR	"You reconsider this reckless act."


	.FUNCT	NO-PLACE-FOR-BABY,DESTINATION
	PRINTI	"The "
	CALL2	DPRINT,DESTINATION
	PRINTR	" is no place for a baby!"


	.FUNCT	I-MITCHELL-RAID
	CALL1	IN-APARTMENT?
	ZERO?	STACK /FALSE
	CALL2	SCORE,120
	CRLF	
	EQUAL?	HERE,LIVING-ROOM \?ELS6
	FSET?	APARTMENT-DOOR,OPENBIT \?ELS9
	PRINTI	"With a roar of tromping feet,"
	JUMP	?CND4
?ELS9:	PRINTI	"With a screech of splintering wood, the front door explodes open, and"
	JUMP	?CND4
?ELS6:	MOVE	PLAYER,LIVING-ROOM
	SET	'HERE,LIVING-ROOM
	PRINTI	"You hear a loud noise from the front door and dash into the living room as"
?CND4:	MOVE	JILL,LOCAL-GLOBALS
	FCLEAR	APARTMENT-DOOR,OPENBIT
	CALL	QUEUE,I-APARTMENT,-1
	SET	'MITCHELL-RAID-FLAG,TRUE-VALUE
	SET	'BRUISED,TRUE-VALUE
	PRINTR	" six or eight heavily armed Church police storm into the apartment. You see a look of horror come over Jill, as she covers her mouth with the back of her hand, as though stifling some silent scream. You follow her gaze, and -- a shock of recognition -- sauntering in behind the police...

The ten years since you last saw him have left scant change on the face of your son. ""Mitchell!"" you yell, and take a step toward him, but a blow from one of the cops sends your frail, old body flying against the wall.

""She is the one."" The voice is Mitchell's, but the tone is cold, unrecognizable, sending shivers through you. He raises a fur-clad arm, pointing at his mother without a hint of emotion. ""She spake against the Church; she tried to poison the mind of a child too young to know the Truth."" The thugs grab Jill, who reaches toward Mitchell, tears of terror streaming down her face. Totally unresponsive, he turns and walks calmly out of the apartment.

As Jill is dragged, screaming and crying, through the front door, you try to follow, but a cop pummels you in the stomach with his club. You fall to the floor, retching, as the apartment door slams closed, shutting you off forever from the son you cannot understand and the wife you will never see again."


	.FUNCT	SOLARIUM-OBJECT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,PATIO \?ELS10
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS10:	EQUAL?	HERE,EPILOGUE-LIVING-ROOM \?ELS12
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS12:	CALL	GLOBAL-IN?,SOLARIUM-OBJECT,HERE
	ZERO?	STACK /FALSE
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS18
	EQUAL?	HERE,SOLARIUM \?ELS23
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS23:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS18:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,SOLARIUM \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	PATIO-OBJECT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,PATIO \?ELS10
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS10:	CALL	GLOBAL-IN?,PATIO-OBJECT,HERE
	ZERO?	STACK /FALSE
	CALL2	DO-WALK,P?SOUTH
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS16
	EQUAL?	HERE,PATIO \?ELS21
	CALL2	DO-WALK,P?NORTH
	RSTACK	
?ELS21:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS16:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,PATIO \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	PATIO-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"Sunlight spills off the vines and shrubs of this wide outdoor terrace. The view, always breathtaking, seems particularly sharp today; beyond the parklands and forests to the west, the foothills of the Rockies are clearly visible; t"
	PRINT	RIVER-DESC
	PRINTI	" The glass-walled sunporch lies behind a curtain of vines to the north."
	RTRUE	


	.FUNCT	FIREPLACE-F
	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"Constructed of deep red brick, the fireplace has the usual equipment to filter the fire's smoke before releasing it up the chimney."


	.FUNCT	EPILOGUE-LIVING-ROOM-F,RARG
	EQUAL?	RARG,M-ENTER \FALSE
	MOVE	SEAT,HERE
	RFALSE	


	.FUNCT	DINING-ROOM-OBJECT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,EPILOGUE-KITCHEN \?ELS10
	CALL2	DO-WALK,P?WEST
	RSTACK	
?ELS10:	EQUAL?	HERE,EPILOGUE-LIVING-ROOM \?ELS12
	CALL2	DO-WALK,P?EAST
	RSTACK	
?ELS12:	CALL	GLOBAL-IN?,DINING-ROOM-OBJECT,HERE
	ZERO?	STACK /FALSE
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS18
	EQUAL?	HERE,DINING-ROOM \?ELS23
	CALL1	V-WALK-AROUND
	RSTACK	
?ELS23:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS18:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,DINING-ROOM \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	TUB-F
	EQUAL?	PRSA,V?BOARD,V?THROUGH \?ELS5
	PRINTR	"You don't have time."
?ELS5:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"It is a large whirlpool tub."


	.FUNCT	DEN-OBJECT-F
	EQUAL?	PRSA,V?THROUGH,V?WALK-TO \?ELS5
	EQUAL?	HERE,FOYER \?ELS10
	CALL2	DO-WALK,P?EAST
	RSTACK	
?ELS10:	CALL	GLOBAL-IN?,DEN-OBJECT,HERE
	ZERO?	STACK /FALSE
	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \?ELS16
	EQUAL?	HERE,DEN \?ELS21
	CALL2	DO-WALK,P?WEST
	RSTACK	
?ELS21:	PRINT	LOOK-AROUND
	CRLF	
	RTRUE	
?ELS16:	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,DEN \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	ENTERTAINMENT-CENTER-F
	EQUAL?	PRSA,V?EXAMINE \?ELS5
	PRINTR	"Although equipped with the full range of audio, video, and holovision capabilities, the EC's functions go far beyond entertainment. It has complete teaching and library packages, and serves as the main computer interface. It is currently off."
?ELS5:	EQUAL?	PRSA,V?ON \FALSE
	PRINTR	"The power node has been packed away."


	.FUNCT	SKYCAB-OBJECT-F
	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE,V?EXIT \?ELS5
	CALL2	DO-WALK,P?OUT
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?EXAMINE \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	VIEWSCREEN-F
	EQUAL?	PRSA,V?EXAMINE \?ELS5
	PRINTR	"At the moment, the screen is dark."
?ELS5:	EQUAL?	PRSA,V?ON \FALSE
	PRINTR	"The screen is activated automatically by incoming transmissions."


	.FUNCT	RECEIVER-STATION-F
	EQUAL?	SKYCAB-COUNTER,6 \?ELS5
	CALL1	MOBY-VERB?
	ZERO?	STACK \?ELS5
	CALL2	CANT-SEE,RECEIVER-STATION
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?EXAMINE \?ELS9
	PRINTI	"Y"
	PRINT	RS-DESC
	CRLF	
	RTRUE	
?ELS9:	CALL2	MILE-AWAY,RECEIVER-STATION
	RSTACK	


	.FUNCT	CULTURAL-CENTER-F
	EQUAL?	SKYCAB-COUNTER,6 \?ELS5
	CALL1	MOBY-VERB?
	ZERO?	STACK \?ELS5
	CALL2	CANT-SEE,CULTURAL-CENTER
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?EXAMINE \?ELS9
	PRINTI	"Along the river, south of the pier, are the outdoor shells and amphitheatres of the "
	PRINTD	CULTURAL-CENTER
	PRINTR	"."
?ELS9:	CALL2	MILE-AWAY,RECEIVER-STATION
	RSTACK	

	.ENDI
