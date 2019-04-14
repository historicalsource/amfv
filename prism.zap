

	.FUNCT	PERELMAN-LEAVES-VIEW
	CALL2	VISIBLE?,PERELMAN
	ZERO?	STACK /FALSE
	CRLF	
	PRINTI	"A "
	PRINTD	CC-STAFFER
	PRINTR	" dashes in and hands Perelman a note before leaving. Glancing at the note, Perelman walks to a point beyond your field of vision. A moment later, you hear a click, as of a switch being turned."


	.FUNCT	PERELMAN-RETURNS-TO-VIEW
	CALL2	VISIBLE?,PERELMAN
	ZERO?	STACK /TRUE
	CRLF	
	PRINTR	"A moment later, Perelman walks back into your field of vision."


	.FUNCT	I-MESSAGE-C,OLD-WINNER
	MOVE	MESSAGE-C,PRISM-MESSAGES-DIRECTORY
	CALL2	NAME-MESSAGE,MESSAGE-C
	PUT	SIM-LEVEL-TABLE,0,0
	CALL	QUEUE,I-MESSAGE-M,875
	CALL1	PERELMAN-LEAVES-VIEW
	SET	'OLD-WINNER,WINNER
	SET	'WINNER,PLAYER
	CRLF	
	PRINT	MESSAGE-LINE
	CALL	PERFORM,V?READ,MESSAGE-C
	SET	'WINNER,OLD-WINNER
	CALL1	UPDATE-LIBRARY-BOX
	CALL1	PERELMAN-RETURNS-TO-VIEW
	RSTACK	


	.FUNCT	I-MESSAGE-D,OLD-WINNER
	ZERO?	SIMULATING \FALSE
	IN?	MESSAGE-D,PRISM-MESSAGES-DIRECTORY \?ELS6
	SET	'REVIEWING-RECORDINGS,TRUE-VALUE
	CALL1	PERELMAN-LEAVES-VIEW
	CRLF	
	PRINT	MESSAGE-LINE
	PRINT	PRIVATE-LINE
	PRINTI	"We're getting ready to review your new recordings. I hope everything's there this time."""
	CRLF	
	CALL1	PERELMAN-RETURNS-TO-VIEW
	JUMP	?CND1
?ELS6:	SET	'REVIEWING-RECORDINGS,TRUE-VALUE
	MOVE	MESSAGE-D,PRISM-MESSAGES-DIRECTORY
	CALL2	NAME-MESSAGE,MESSAGE-D
	CALL1	PERELMAN-LEAVES-VIEW
	CRLF	
	PRINT	MESSAGE-LINE
	SET	'OLD-WINNER,WINNER
	SET	'WINNER,PLAYER
	CALL	PERFORM,V?READ,MESSAGE-D
	SET	'WINNER,OLD-WINNER
	CALL1	UPDATE-LIBRARY-BOX
	CALL1	PERELMAN-RETURNS-TO-VIEW
?CND1:	GETP	RECORD-BUFFER,P?SIZE
	ADD	STACK,10
	CALL	QUEUE,I-MESSAGE-E,STACK
	RTRUE	


	.FUNCT	I-MESSAGE-E
	IN?	MESSAGE-E,PRISM-MESSAGES-DIRECTORY \?ELS3
	INC	'MESSAGE-E-COUNTER
	EQUAL?	MESSAGE-E-COUNTER,4 \?ELS6
	CALL1	PERELMAN-LEAVES-VIEW
	CRLF	
	PRINT	MESSAGE-LINE
	PRINT	PRIVATE-LINE
	PRINTI	"Why have you been ignoring my requests"
	CALL1	DISCONNECTED
	JUMP	?CND1
?ELS6:	EQUAL?	MESSAGE-E-COUNTER,1 \?ELS10
	EQUAL?	PART-FLAG,1 \?ELS10
	CALL	QUEUE,I-FIRST-SIMULATION-RESULT,7
	CALL1	PERELMAN-LEAVES-VIEW
	CRLF	
	PRINT	MESSAGE-LINE
	PRINT	PRIVATE-LINE
	PRINT	COME-TO-MY-OFFICE
	CRLF	
	CALL1	PERELMAN-RETURNS-TO-VIEW
	JUMP	?CND1
?ELS10:	CALL1	PERELMAN-LEAVES-VIEW
	CRLF	
	PRINT	MESSAGE-LINE
	PRINT	PRIVATE-LINE
	PRINTI	"Please activate the comm outlet in my office! "
	CALL2	QUEUED?,I-RORSCHACH
	ZERO?	STACK /?ELS21
	PRINTI	"Dr. Grimwold has some psych tests!"""
	CRLF	
	JUMP	?CND19
?ELS21:	PRINTI	"I want to discuss the results of the simulation with you!"""
	CRLF	
?CND19:	CALL1	PERELMAN-RETURNS-TO-VIEW
	JUMP	?CND1
?ELS3:	MOVE	MESSAGE-E,PRISM-MESSAGES-DIRECTORY
	CALL2	NAME-MESSAGE,MESSAGE-E
	CALL	QUEUE,I-FIRST-SIMULATION-RESULT,7
	CALL1	PERELMAN-LEAVES-VIEW
	CRLF	
	PRINT	MESSAGE-LINE
	GETP	MESSAGE-E,P?TEXT
	PRINT	STACK
	CRLF	
	CALL1	UPDATE-LIBRARY-BOX
	CALL1	PERELMAN-RETURNS-TO-VIEW
?CND1:	CALL	QUEUE,I-MESSAGE-E,14
	RSTACK	


	.FUNCT	I-MESSAGE-M
	GETP	MESSAGE-M,P?CAPACITY
	ZERO?	STACK \?ELS5
	PUTP	MESSAGE-M,P?CAPACITY,1
	CALL2	NAME-MESSAGE,MESSAGE-M
	MOVE	MESSAGE-M,PRISM-MESSAGES-DIRECTORY
	CALL	QUEUE,I-MESSAGE-M,177
	CALL1	PERELMAN-LEAVES-VIEW
	CRLF	
	PRINT	MESSAGE-LINE
	GETP	MESSAGE-M,P?TEXT
	PRINT	STACK
	CRLF	
	CALL1	UPDATE-LIBRARY-BOX
	CALL1	PERELMAN-RETURNS-TO-VIEW
	RSTACK	
?ELS5:	GETP	MESSAGE-M,P?CAPACITY
	EQUAL?	STACK,1 \?ELS9
	PUTP	MESSAGE-M,P?CAPACITY,2
	CALL	QUEUE,I-MESSAGE-M,131
	CALL1	PERELMAN-LEAVES-VIEW
	CRLF	
	PRINT	MESSAGE-LINE
	PRINT	PRIVATE-LINE
	PRINTI	"PRISM, what's the matter? You haven't started the simulation yet! For heaven's sake, don't you know the whole country's impatient? Vera is hopping mad -- if you don't begin soon, I can't tell what's going to happen!"""
	CRLF	
	CALL1	PERELMAN-RETURNS-TO-VIEW
	RSTACK	
?ELS9:	CALL1	PERELMAN-LEAVES-VIEW
	CRLF	
	PRINT	MESSAGE-LINE
	PRINT	PRIVATE-LINE
	PRINTI	"""What's the matter with you? Why didn't you enter "
	PRINTD	SIMULATION-MODE
	CALL1	DISCONNECTED
	RSTACK	


	.FUNCT	I-MESSAGE-Q
	LESS?	TIME,540 /?THN4
	GRTR?	TIME,1260 \?CND1
?THN4:	CALL	QUEUE,I-MESSAGE-Q,30
	RFALSE	
?CND1:	MOVE	MESSAGE-Q,PRISM-MESSAGES-DIRECTORY
	CALL1	PERELMAN-LEAVES-VIEW
	CALL2	NAME-MESSAGE,MESSAGE-Q
	CRLF	
	PRINT	MESSAGE-LINE
	GETP	MESSAGE-Q,P?TEXT
	PRINT	STACK
	CRLF	
	CALL1	PERELMAN-RETURNS-TO-VIEW
	CALL1	UPDATE-LIBRARY-BOX
	RSTACK	


	.FUNCT	I-MESSAGE-Z,OLD-WINNER
	IN?	MESSAGE-Z,PRISM-MESSAGES-DIRECTORY \?ELS5
	MOVE	WNN-FEEDER,INTERFACE-ROOM
	MOVE	WNN-INSTRUCTIONS,PRISM-INTERFACES-DIRECTORY
	MOVE	TRANSMITTER,INTERFACE-ROOM
	MOVE	NEWS-BUFFER,GLOBAL-OBJECTS
	MOVE	REPORT-BUFFER,GLOBAL-OBJECTS
	RFALSE	
?ELS5:	CALL	QUEUE,I-MESSAGE-Z,274
	MOVE	MESSAGE-Z,PRISM-MESSAGES-DIRECTORY
	CALL2	NAME-MESSAGE,MESSAGE-Z
	CRLF	
	PRINT	MESSAGE-LINE
	SET	'OLD-WINNER,WINNER
	SET	'WINNER,PLAYER
	CALL	PERFORM,V?READ,MESSAGE-Z
	SET	'WINNER,OLD-WINNER
	CALL1	UPDATE-LIBRARY-BOX
	RSTACK	


	.FUNCT	I-MESSAGE-Y,OLD-WINNER
	MOVE	MESSAGE-Y,PRISM-MESSAGES-DIRECTORY
	CALL2	NAME-MESSAGE,MESSAGE-Y
	MOVE	AUDITING-SYSTEM,INTERFACE-ROOM
	MOVE	AUDITING-INSTRUCTIONS,PRISM-INTERFACES-DIRECTORY
	CRLF	
	PRINT	MESSAGE-LINE
	SET	'OLD-WINNER,WINNER
	SET	'WINNER,PLAYER
	CALL	PERFORM,V?READ,MESSAGE-Y
	SET	'WINNER,OLD-WINNER
	CALL1	UPDATE-LIBRARY-BOX
	RSTACK	


	.FUNCT	NAME-MESSAGE,OBJ
	GETP	OBJ,P?MDESC
	PUT	STACK,0,MONTH
	GETP	OBJ,P?MDESC
	PUT	STACK,1,DATE
	GETP	OBJ,P?MDESC
	PUT	STACK,2,YEAR
	GETP	OBJ,P?MDESC
	PUT	STACK,3,TIME
	INC	'NUMBER-OF-MESSAGES
	PUTP	OBJ,P?SIZE,NUMBER-OF-MESSAGES
	RTRUE	


	.FUNCT	UPDATE-LIBRARY-BOX
	EQUAL?	CURRENT-DIRECTORY,PRISM-MESSAGES-DIRECTORY \TRUE
	ZERO?	CURRENT-FILE /TRUE
	CALL1	LIBRARY-BOX
	RTRUE	


	.FUNCT	SIMULATION-CHECK
	ZERO?	SIMULATING /FALSE
	CALL	ERR,STR?344,TRUE-VALUE
	PRINTD	SIMULATION-MODE
	PRINTR	"."


	.FUNCT	PSYCH-CHECK
	GRTR?	GRIMWOLD-COUNTER,0 \FALSE
	PRINTR	"It would be impolite to leave during the psych test."


	.FUNCT	RECORD-BUFFER-F
	EQUAL?	PRSA,V?ON \?ELS5
	SET	'PRSO,FALSE-VALUE
	CALL1	V-RECORD-ON
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?OFF \FALSE
	CALL1	V-ROFF
	RSTACK	


	.FUNCT	SCORE,NUM,VAL
	ZERO?	RECORDING /TRUE
	GET	SCORE-TABLE,NUM >VAL
	PUT	SCORE-TABLE,NUM,0
	EQUAL?	SYEAR,2051 \?ELS8
	ADD	2051-SCORE,VAL >2051-SCORE
	RETURN	2051-SCORE
?ELS8:	EQUAL?	SYEAR,2061 \?ELS10
	ADD	2061-SCORE,VAL >2061-SCORE
	RETURN	2061-SCORE
?ELS10:	EQUAL?	SYEAR,2071 \?ELS12
	ADD	2071-SCORE,VAL >2071-SCORE
	RETURN	2071-SCORE
?ELS12:	EQUAL?	SYEAR,2081 \FALSE
	ADD	2081-SCORE,VAL >2081-SCORE
	RETURN	2081-SCORE


	.FUNCT	LIBRARY-ROOM-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"You have entered Library Mode. Current directory is "
	CALL2	DPRINT,CURRENT-DIRECTORY
	PRINTR	". Consult menu for data retrieval."


	.FUNCT	LIBRARY-MODE-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \FALSE
	EQUAL?	MODE,LIBRARY-MODE \?ELS8
	CALL	ERR,STR?345,TRUE-VALUE
	PRINTD	LIBRARY-MODE
	PRINTI	"."
	CRLF	
	RETURN	2
?ELS8:	EQUAL?	PART-FLAG,4 \?ELS14
	PRINT	NOT-ACTIVE
	CRLF	
	RETURN	2
?ELS14:	CALL1	PSYCH-CHECK
	ZERO?	STACK /?ELS20
	RETURN	2
?ELS20:	CALL1	SIMULATION-CHECK
	ZERO?	STACK /?CND6
	RETURN	2
?CND6:	SET	'MODE,LIBRARY-MODE
	CALL1	TURN-RECORD-OFF
	CALL2	GOTO,LIBRARY-ROOM
	CALL2	INIT-STATUS-LINE,10
	FIRST?	LIBRARY >CURRENT-DIRECTORY /?KLU27
?KLU27:	CALL1	LIBRARY-BOX
	CALL2	LIBRARY-ROOM-F,M-LOOK
	CALL1	STATUS-LINE
	CALL1	LIBRARY-ACTION
	RSTACK	


	.FUNCT	LIBRARY-BOX,CNT=4,DIR,?TMP1
	SCREEN	S-WINDOW
	BUFOUT	FALSE-VALUE
?PRG1:	CALL2	INVERSE-LINE,CNT
	INC	'CNT
	EQUAL?	CNT,11 \?PRG1
	HLIGHT	1
	SET	'CNT,0
	ZERO?	CURRENT-FILE /?ELS8
	FIRST?	CURRENT-DIRECTORY >DIR /?KLU63
?KLU63:	JUMP	?CND6
?ELS8:	FIRST?	LIBRARY >DIR /?KLU64
?KLU64:	
?CND6:	EQUAL?	CURRENT-DIRECTORY,PRISM-MESSAGES-DIRECTORY \?ELS14
	ZERO?	CURRENT-FILE /?ELS14
?PRG17:	GET	LINE-TABLE,CNT >?TMP1
	GET	COLUMN-TABLE,CNT
	CURSET	?TMP1,STACK
?PRG19:	GETP	DIR,P?SIZE
	EQUAL?	CNT,STACK \?ELS23
	CALL2	DPRINT,DIR
	JUMP	?REP20
?ELS23:	NEXT?	DIR >DIR /?KLU65
?KLU65:	JUMP	?PRG19
?REP20:	EQUAL?	CNT,HIGHLIGHT-CNT \?CND28
	SET	'CURRENT-FILE,DIR
?CND28:	INC	'CNT
	FIRST?	PRISM-MESSAGES-DIRECTORY >DIR /?KLU66
?KLU66:	GRTR?	CNT,NUMBER-OF-MESSAGES \?PRG17
	JUMP	?CND12
?ELS14:	
?PRG36:	GET	LINE-TABLE,CNT >?TMP1
	GET	COLUMN-TABLE,CNT
	CURSET	?TMP1,STACK
	CALL2	DPRINT,DIR
	NEXT?	DIR \?REP37
	NEXT?	DIR >DIR /?KLU67
?KLU67:	INC	'CNT
	JUMP	?PRG36
?REP37:	
?CND12:	GET	LINE-TABLE,HIGHLIGHT-CNT >?TMP1
	GET	COLUMN-TABLE,HIGHLIGHT-CNT
	SUB	STACK,1
	CURSET	?TMP1,STACK
	PRINTI	">"
	CURSET	9,2
	ZERO?	CURRENT-FILE /?ELS49
	PRINTI	"C=Close current directory, R=Read current file"
	CURSET	10,2
	PRINTI	"N=Next file, P=Previous file"
	JUMP	?CND47
?ELS49:	PRINTI	"O=Open current directory"
	CURSET	10,2
	PRINTI	"N=Next directory, P=Previous directory"
?CND47:	PRINTI	", E=Exit to "
	PRINTD	COMM-MODE
	SCREEN	S-TEXT
	HLIGHT	0
	BUFOUT	TRUE-VALUE
	RTRUE	


	.FUNCT	ERASE-CURSOR,?TMP1
	SCREEN	S-WINDOW
	BUFOUT	FALSE-VALUE
	HLIGHT	1
	GET	LINE-TABLE,HIGHLIGHT-CNT >?TMP1
	GET	COLUMN-TABLE,HIGHLIGHT-CNT
	SUB	STACK,1
	CURSET	?TMP1,STACK
	PRINTI	" "
	RTRUE	


	.FUNCT	NEW-CURSOR,?TMP1
	GET	LINE-TABLE,HIGHLIGHT-CNT >?TMP1
	GET	COLUMN-TABLE,HIGHLIGHT-CNT
	SUB	STACK,1
	CURSET	?TMP1,STACK
	PRINTI	">"
	BUFOUT	TRUE-VALUE
	SCREEN	S-TEXT
	HLIGHT	0
	RTRUE	


	.FUNCT	LIBRARY-ACTION,X
?PRG1:	INPUT	1 >X
	EQUAL?	X,69,101 /?THN6
	EQUAL?	X,197,229 \?ELS5
?THN6:	SET	'HIGHLIGHT-CNT,0
	SET	'CURRENT-DIRECTORY,FALSE-VALUE
	SET	'CURRENT-FILE,FALSE-VALUE
	CALL2	INIT-STATUS-LINE,2
	CALL	PERFORM,V?THROUGH,COMM-MODE
	RTRUE	
?ELS5:	EQUAL?	X,67,99 /?THN12
	EQUAL?	X,195,227 \?ELS9
?THN12:	ZERO?	CURRENT-FILE /?ELS9
	SET	'CURRENT-FILE,FALSE-VALUE
	SET	'HIGHLIGHT-CNT,DIRECTORY-CNT
	CALL1	LIBRARY-BOX
	CALL2	DPRINT,CURRENT-DIRECTORY
	PRINTI	" is now closed."
	CRLF	
	JUMP	?CND3
?ELS9:	EQUAL?	X,78,110 /?THN18
	EQUAL?	X,206,238 \?ELS17
?THN18:	CALL1	NEXT-ITEM
	JUMP	?CND3
?ELS17:	EQUAL?	X,80,112 /?THN22
	EQUAL?	X,208,240 \?ELS21
?THN22:	CALL1	PREVIOUS-ITEM
	JUMP	?CND3
?ELS21:	EQUAL?	X,79,111 /?THN28
	EQUAL?	X,207,239 \?ELS25
?THN28:	ZERO?	CURRENT-FILE \?ELS25
	SET	'DIRECTORY-CNT,HIGHLIGHT-CNT
	SET	'HIGHLIGHT-CNT,0
	FIRST?	CURRENT-DIRECTORY >CURRENT-FILE /?KLU42
?KLU42:	CALL1	LIBRARY-BOX
	CALL2	DPRINT,CURRENT-DIRECTORY
	PRINTI	" opened. Current file is "
	CALL2	DPRINT,CURRENT-FILE
	PRINTI	"."
	CRLF	
	JUMP	?CND3
?ELS25:	EQUAL?	X,82,114 /?THN36
	EQUAL?	X,210,242 \?ELS33
?THN36:	ZERO?	CURRENT-FILE /?ELS33
	CRLF	
	CALL	PERFORM,V?READ,CURRENT-FILE
	PRINTI	"-END OF FILE-"
	CRLF	
	CRLF	
	JUMP	?CND3
?ELS33:	CALL2	ERR,STR?346
?CND3:	CALL2	INCREMENT-TIME,1
	CALL1	CLOCKER
	CALL1	STATUS-LINE
	JUMP	?PRG1


	.FUNCT	NEXT-ITEM,NEW-MESSAGE
	CALL1	ERASE-CURSOR
	ZERO?	CURRENT-FILE /?ELS3
	EQUAL?	CURRENT-DIRECTORY,PRISM-MESSAGES-DIRECTORY \?ELS7
	GETP	CURRENT-FILE,P?SIZE
	EQUAL?	STACK,NUMBER-OF-MESSAGES \?ELS10
	SET	'HIGHLIGHT-CNT,0
	JUMP	?CND8
?ELS10:	INC	'HIGHLIGHT-CNT
?CND8:	FIRST?	PRISM-MESSAGES-DIRECTORY >NEW-MESSAGE /?KLU31
?KLU31:	
?PRG13:	GETP	NEW-MESSAGE,P?SIZE
	EQUAL?	STACK,HIGHLIGHT-CNT \?ELS17
	JUMP	?REP14
?ELS17:	NEXT?	NEW-MESSAGE >NEW-MESSAGE /?KLU32
?KLU32:	JUMP	?PRG13
?REP14:	SET	'CURRENT-FILE,NEW-MESSAGE
	JUMP	?CND1
?ELS7:	NEXT?	CURRENT-FILE \?ELS21
	NEXT?	CURRENT-FILE >CURRENT-FILE /?KLU33
?KLU33:	INC	'HIGHLIGHT-CNT
	JUMP	?CND1
?ELS21:	FIRST?	CURRENT-DIRECTORY >CURRENT-FILE /?KLU34
?KLU34:	SET	'HIGHLIGHT-CNT,0
	JUMP	?CND1
?ELS3:	NEXT?	CURRENT-DIRECTORY \?ELS28
	NEXT?	CURRENT-DIRECTORY >CURRENT-DIRECTORY /?KLU35
?KLU35:	INC	'HIGHLIGHT-CNT
	JUMP	?CND1
?ELS28:	FIRST?	LIBRARY >CURRENT-DIRECTORY /?KLU36
?KLU36:	SET	'HIGHLIGHT-CNT,0
?CND1:	CALL1	NEW-CURSOR
	CALL1	TELL-CURRENT
	RSTACK	


	.FUNCT	PREVIOUS-ITEM,ITEM,CNT
	CALL1	ERASE-CURSOR
	ZERO?	CURRENT-FILE /?ELS3
	SET	'ITEM,CURRENT-FILE
	JUMP	?CND1
?ELS3:	SET	'ITEM,CURRENT-DIRECTORY
?CND1:	EQUAL?	CURRENT-DIRECTORY,PRISM-MESSAGES-DIRECTORY \?ELS9
	ZERO?	CURRENT-FILE /?ELS9
	GETP	CURRENT-FILE,P?SIZE
	ZERO?	STACK \?ELS14
	SET	'HIGHLIGHT-CNT,NUMBER-OF-MESSAGES
	JUMP	?CND12
?ELS14:	DEC	'HIGHLIGHT-CNT
?CND12:	FIRST?	PRISM-MESSAGES-DIRECTORY >ITEM /?KLU46
?KLU46:	
?PRG17:	GETP	ITEM,P?SIZE
	EQUAL?	STACK,HIGHLIGHT-CNT \?ELS21
	JUMP	?CND7
?ELS21:	NEXT?	ITEM >ITEM /?KLU47
?KLU47:	JUMP	?PRG17
?ELS9:	ZERO?	HIGHLIGHT-CNT \?ELS25
?PRG26:	INC	'HIGHLIGHT-CNT
	NEXT?	ITEM >ITEM /?KLU48
?KLU48:	NEXT?	ITEM /?PRG26
	JUMP	?CND7
?ELS25:	LOC	ITEM
	FIRST?	STACK >ITEM /?KLU49
?KLU49:	DEC	'HIGHLIGHT-CNT
?PRG33:	EQUAL?	CNT,HIGHLIGHT-CNT \?ELS37
	JUMP	?CND7
?ELS37:	NEXT?	ITEM >ITEM /?KLU50
?KLU50:	INC	'CNT
	JUMP	?PRG33
?CND7:	ZERO?	CURRENT-FILE /?ELS42
	SET	'CURRENT-FILE,ITEM
	JUMP	?CND40
?ELS42:	SET	'CURRENT-DIRECTORY,ITEM
?CND40:	CALL1	NEW-CURSOR
	CALL1	TELL-CURRENT
	RSTACK	


	.FUNCT	TELL-CURRENT
	ZERO?	CURRENT-FILE /?ELS5
	PRINTI	"Current file is now "
	CALL2	DPRINT,CURRENT-FILE
	PRINTR	"."
?ELS5:	PRINTI	"Current directory is now "
	CALL2	DPRINT,CURRENT-DIRECTORY
	PRINTR	"."


	.FUNCT	MESSAGE-C-F,CNT=1
	EQUAL?	PRSA,V?READ \FALSE
	PRINTI	"""Perelman to PRISM. The programming team has finished entering the parameters for the Plan. This is it: you can enter "
	PRINTD	SIMULATION-MODE
	PRINTI	" at any time. The Social Science group has come up with a list of things to record:"
	CRLF	
?PRG10:	PRINTI	"   "
	GET	RECORDING-TABLE,CNT
	PRINT	STACK
	CRLF	
	ADD	CNT,2 >CNT
	GRTR?	CNT,17 \?PRG10
	PRINTI	"By the way, since the "
	PRINTD	SIMULATION-CONTROLLER
	PRINTR	" will be doing so much data-crunching on the fly, it appears the simulation will run in real time -- a minute there will approximately equal a minute here. Well, good luck!"""


	.FUNCT	MESSAGE-D-F
	EQUAL?	PRSA,V?READ \FALSE
	PRINTI	"""Perelman here. We see that you're out of "
	PRINTD	SIMULATION-MODE
	PRINTI	". "
	ZERO?	SHORT-FIRST-SIMULATION \?THN13
	GET	SIM-LEVEL-TABLE,0
	LESS?	STACK,150 \?CND10
?THN13:	SET	'SHORT-FIRST-SIMULATION,TRUE-VALUE
	PRINTI	"We didn't expect you to be done this soon! "
?CND10:	PRINTR	"We're about to start reviewing your recordings now. I'll let you know what the experts think. Talk to you soon."""


	.FUNCT	MESSAGE-Z-F
	EQUAL?	PRSA,V?READ \FALSE
	CALL2	WARREN-SHARE,STR?355
	RSTACK	


	.FUNCT	MESSAGE-Y-F
	EQUAL?	PRSA,V?READ \FALSE
	CALL2	WARREN-SHARE,STR?356
	RSTACK	


	.FUNCT	WARREN-SHARE,STRING
	PRINTI	"""Message to PRISM from Emily Warren, Manager of Auxiliary System Functions. "
	PRINT	STRING
	PRINTR	". This notification is purely procedural and requires no acknowledgment."""


	.FUNCT	SLEEP-MODE-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \FALSE
	EQUAL?	MODE,SLEEP-MODE \?ELS10
	CALL2	ERR,STR?373
	RETURN	2
?ELS10:	CALL1	PSYCH-CHECK
	ZERO?	STACK /?ELS14
	RETURN	2
?ELS14:	CALL1	SIMULATION-CHECK
	ZERO?	STACK /?ELS18
	RETURN	2
?ELS18:	CALL1	SIM-SLEEP
	RSTACK	


	.FUNCT	SIM-SLEEP,CNT=360
	EQUAL?	PART-FLAG,4 \?ELS3
	PRINT	NOT-ACTIVE
	CRLF	
	RETURN	2
?ELS3:	LESS?	DATE,NEXT-SLEEP-DATE /?THN10
	EQUAL?	NEXT-SLEEP-DATE,DATE \?CND1
	LESS?	TIME,NEXT-SLEEP-TIME \?CND1
?THN10:	PRINTI	"It's too soon since your last sleep."
	CRLF	
	RETURN	2
?CND1:	CALL1	TURN-RECORD-OFF
	SET	'MODE,SLEEP-MODE
	CALL2	GOTO,SLEEP-ROOM
	PRINTI	"You enter Sleep Mode, slipping pleasantly into unconsciousness..."
	CRLF	
	CALL1	STATUS-LINE
	CALL2	INT,I-PERELMAN
	PUT	STACK,0,0
?PRG20:	DEC	'CNT
	EQUAL?	CNT,240 \?ELS24
	PRINTI	"...you dream of your childhood..."
	CRLF	
	JUMP	?CND22
?ELS24:	EQUAL?	CNT,120 \?ELS28
	PRINTI	"...and later, of Jill..."
	CRLF	
	JUMP	?CND22
?ELS28:	EQUAL?	CNT,300,180,60 \?CND22
	CRLF	
?CND22:	CALL1	CLOCKER
	ZERO?	STACK /?ELS35
	JUMP	?REP21
?ELS35:	ZERO?	CNT \?PRG20
?REP21:	SUB	360,CNT
	CALL2	INCREMENT-TIME,STACK
	CALL1	PUT-PERELMAN-IN-THE-RIGHT-PLACE
	CALL	QUEUE,I-PERELMAN,-1
	ZERO?	CNT \?CND38
	PRINTI	"Some time later, you awake feeling relaxed and notice that about six hours have passed."
	CRLF	
?CND38:	SET	'CLOCK-WAIT,TRUE-VALUE
	GRTR?	CNT,300 \?ELS45
	SET	'NEXT-SLEEP-TIME,TIME
	JUMP	?CND43
?ELS45:	SUB	360,CNT
	ADD	TIME,STACK >NEXT-SLEEP-TIME
?CND43:	GRTR?	NEXT-SLEEP-TIME,1439 \?ELS52
	SUB	NEXT-SLEEP-TIME,1440 >NEXT-SLEEP-TIME
	ADD	DATE,1 >NEXT-SLEEP-DATE
	RETURN	NEXT-SLEEP-DATE
?ELS52:	SET	'NEXT-SLEEP-DATE,DATE
	RETURN	NEXT-SLEEP-DATE


	.FUNCT	OUTLETS-F
	EQUAL?	PRSA,V?WHAT,V?READ,V?DISPLAY \FALSE
	EQUAL?	PART-FLAG,4 \?ELS10
	PRINTR	"There are currently no active outlets."
?ELS10:	PRINTI	"   "
	PRINTD	CONTROL-CENTER
	PRINTI	" (PPCC)
   "
	PRINTD	ROOFTOP
	PRINTI	" (RCRO)
   "
	PRINTD	OFFICE
	PRINTI	" (PEOF)
   "
	PRINTD	CAFETERIA
	PRINTI	" (PCAF)
   "
	PRINTD	CORE
	PRINTI	" (MACO)
   "
	PRINTD	NEWS
	PRINTR	" (WNNF)
To activate a specific outlet, submit the associated code."


	.FUNCT	COMM-MODE-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \FALSE
	EQUAL?	MODE,COMM-MODE \?ELS8
	CALL	ERR,STR?345,TRUE-VALUE
	PRINTD	COMM-MODE
	PRINTI	"."
	CRLF	
	RETURN	2
?ELS8:	CALL1	SIMULATION-CHECK
	ZERO?	STACK /?CND6
	RETURN	2
?CND6:	SET	'MODE,COMM-MODE
	CALL2	GOTO,COMM-ROOM
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	CONTROL-CENTER-OBJECT-F
	EQUAL?	PRSA,V?EXAMINE \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	CONTROL-CENTER-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	MOVE	CHAIR,HERE
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \FALSE
	RANDOM	100
	LESS?	8,STACK /?ELS10
	PRINTI	"Someone is standing in front of your visual receptor. "
	JUMP	?CND8
?ELS10:	PRINTI	"You see a large, well-organized room filled with banks of terminals and similar equipment. "
?CND8:	ZERO?	SEIGE /?ELS21
	PRINTI	"A pair of National Guardsmen, bearing rifles, flank the doorway."
	RTRUE	
?ELS21:	PRINTI	"Your aural receptors pick up the buzz of many "
	PRINTD	CONVERSATION
	PRINTI	"s."
	RTRUE	


	.FUNCT	CC-STAFFER-F
	EQUAL?	CC-STAFFER,WINNER \FALSE
	PRINTI	"""Uh, I don't, uh, you ought to ask Abe, uh, Dr. Perelman."""
	CRLF	
	CALL1	CLEAR-BUF
	RSTACK	


	.FUNCT	CC-PRINTOUT-F
	EQUAL?	PRSA,V?EXAMINE,V?READ \FALSE
	CALL	PERFORM,V?READ,STACKS-OF-PAPERS
	RTRUE	


	.FUNCT	COMPUTER-TERMINAL-F
	EQUAL?	PRSA,V?READ \FALSE
	CALL	PERFORM,V?READ,STACKS-OF-PAPERS
	RTRUE	


	.FUNCT	ROOFTOP-F,RARG
	EQUAL?	RARG,M-LOOK \?ELS5
	LESS?	TIME,1073 \?ELS8
	GRTR?	TIME,378 \?ELS8
	PRINTI	"The rooftop visual offers a view of the "
	PRINTD	COUNTRYSIDE
	PRINTI	" around the PRISM complex. The perimeter fence is visible near the horizon. A wide road leads north toward a distant gray haze, presumably Rockvil."
	JUMP	?CND6
?ELS8:	GRTR?	TIME,1103 /?THN17
	LESS?	TIME,348 \?ELS16
?THN17:	PRINTI	"It is a dark, cloud"
	EQUAL?	DATE,17,19 \?ELS23
	PRINTI	"less"
	JUMP	?CND21
?ELS23:	PRINTI	"y"
?CND21:	PRINTI	" night. The roof is splotchily lit by harsh spotlights. Beyond the edge of the roof, the only thing you can see is Rockvil, glowing with visible and infrared light on the northern horizon."
	JUMP	?CND6
?ELS16:	LESS?	TIME,720 \?ELS33
	PRINTI	"The "
	PRINTD	PROTRUSIONS
	PRINTI	" of the rooftop cast long shadows in the gray light of dawn. A glistening layer of dew covers every surface."
	JUMP	?CND6
?ELS33:	PRINTI	"A splash of red on the western end of a darkening sky heralds the coming of night. You watch the sunset with sadness, for it reminds you of so many things you can never do again...walking along a beach, lying in tall grass, holding a woman."
?CND6:	CRLF	
	PRINTI	"There is no one in sight."
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	CALL1	RUSH-HOUR
	ZERO?	STACK /FALSE
	RANDOM	100
	LESS?	5,STACK /FALSE
	PRINTI	"A skybus glides by, carrying commuters "
	GRTR?	TIME,700 \?ELS52
	PRINTI	"away from"
	JUMP	?CND50
?ELS52:	PRINTI	"into"
?CND50:	PRINTR	" Rockvil."


	.FUNCT	RUSH-HOUR
	GRTR?	TIME,420 \?ELS5
	LESS?	TIME,540 /TRUE
?ELS5:	GRTR?	TIME,960 \FALSE
	LESS?	TIME,1080 \FALSE
	RTRUE	


	.FUNCT	PROTRUSIONS-F
	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTI	"The "
	PRINTD	PROTRUSIONS
	PRINTR	" on the roof are just pipes, vents, antennae, and so forth."


	.FUNCT	OFFICE-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	MOVE	BOOKS,HERE
	MOVE	CHAIR,HERE
	RTRUE	
?ELS5:	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This is the office of your creator, Dr. Abraham Perelman. It is cluttered and disorganized. Overstuffed bookshelves line the room. "
	PRINT	DESK-DESC
	IN?	COFFEE,HERE \?CND10
	PRINTI	". Steam from a "
	PRINTD	COFFEE
	PRINTI	" is fogging the lens of your visual unit"
?CND10:	PRINTI	"."
	RTRUE	


	.FUNCT	OFFICE-OBJECT-F
	EQUAL?	PRSA,V?EXAMINE \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	PERELMAN-DESK-F
	EQUAL?	PRSA,V?EXAMINE \?ELS5
	PRINT	DESK-DESC
	PRINTR	"."
?ELS5:	EQUAL?	PRSA,V?LOOK-INSIDE \FALSE
	CALL	PERFORM,V?OPEN,PERELMAN-DESK
	RTRUE	


	.FUNCT	ITEM-IN-PACKAGE-F
	EQUAL?	PRSA,V?READ,V?EXAMINE \FALSE
	PRINTI	"[This is the "
	PRINTD	PRSO
	PRINTI	" that you'll find in your "
	CALL1	TITLE-PRINT
	PRINTR	" package.]"


	.FUNCT	STACKS-OF-PAPERS-F
	EQUAL?	PRSA,V?EXAMINE,V?READ \FALSE
	PRINTR	"You can't do that from this angle."


	.FUNCT	COFFEE-F
	EQUAL?	PRSA,V?BUY \FALSE
	CALL1	IN-RESTAURANT?
	ZERO?	STACK /?ELS10
	PRINTR	"Coffee with a meal is a custom that went out of style decades ago!"
?ELS10:	CALL2	CANT-BUY,COFFEE
	RSTACK	


	.FUNCT	I-FIRST-SIMULATION-RESULT,CNT=0,NUM=0
	ZERO?	COMPLETED-TASKS /?CND1
	PRINTI	"Bug #3K"
	CRLF	
	RFALSE	
?CND1:	PUTP	RECORD-BUFFER,P?SIZE,0
	SET	'RECORDINGS-INCLUDE-SIMULATION,FALSE-VALUE
	CALL2	PERELMAN-SHARE,I-FIRST-SIMULATION-RESULT
	ZERO?	STACK /FALSE
	CALL2	INT,I-MESSAGE-E
	PUT	STACK,0,0
	SET	'MESSAGE-E-COUNTER,0
?PRG10:	GET	RECORDING-TABLE,CNT
	EQUAL?	STACK,1 \?CND12
	INC	'NUM
?CND12:	ADD	CNT,2 >CNT
	GRTR?	CNT,16 \?PRG10
	EQUAL?	NUM,9 \?ELS22
	MOVE	PERELMAN,LOCAL-GLOBALS
	MOVE	COFFEE,LOCAL-GLOBALS
	CALL2	VISIBLE?,PERELMAN
	ZERO?	STACK /?CND23
	EQUAL?	PERELMAN,WINNER \?CND23
	CALL1	CLEAR-BUF
?CND23:	ADD	TIME,55 >LAST-ABE-TIME
	CALL	QUEUE,I-PERELMAN,60
	SET	'COMPLETED-TASKS,TRUE-VALUE
	PRINTI	", smiling. ""An excellent job, PRISM. We just finished viewing your recordings, and the experts were quite pleased."" He pauses, as though realizing something for the first time. ""In fact, I thought they looked pretty good myself. I suppose this means the Plan'll get adopted.

""What's next for you, I wonder? You're going to be a hero, you know. You'd probably get a call from the President congratulating you, except of course that he's against the Plan."" Perelman notices a paper on his desk. ""Oh, apparently the "
	PRINTD	SIMULATION-CONTROLLER
	PRINTI	" generated a lot of new data correlations while running your simulation. I'm not sure what the effect of that will be. Might make an even more accurate simulation possible.

""Well, I've got another meeting now, as usual. But once again, thanks for not letting me down."" Perelman leaves."
	CALL1	CONTINUE
	SET	'MODE,COMM-MODE
	SET	'HERE,COMM-ROOM
	MOVE	PLAYER,COMM-ROOM
	CALL2	INCREMENT-TIME,680
	CALL	QUEUE,I-MESSAGE-X,12
	CALL	QUEUE,I-MESSAGE-Q,77
	CALL2	CHAPTER-PRINT,2
	CRLF	
	CRLF	
	CRLF	
	CALL2	PRINT-SPACES,21
	PRINTI	"""Deep into that darkness peering,"
	CRLF	
	CALL2	PRINT-SPACES,27
	PRINTI	"long I stood there, wondering, fearing,"
	CRLF	
	CALL2	PRINT-SPACES,22
	PRINTI	"Doubting, dreaming dreams no mortal"
	CRLF	
	CALL2	PRINT-SPACES,27
	PRINTI	"ever dared to dream before."""
	CRLF	
	CALL2	PRINT-SPACES,40
	PRINTI	"-- Edgar Allan Poe"
	CRLF	
	CRLF	
	CRLF	
	CRLF	
	CALL1	CONTINUE
	CALL2	INIT-STATUS-LINE,2
	CALL1	V-LOOK
	RSTACK	
?ELS22:	EQUAL?	NUM,8 \?ELS45
	CALL	QUEUE,I-MESSAGE-M,875
	PUTP	MESSAGE-M,P?CAPACITY,1
	PRINTI	". ""PRISM. Uh, overall, a fine job in the simulation. I hate to be a "
	CALL	ITALICIZE,STR?374,TRUE-VALUE
	PRINTI	", but we just finished viewing the recordings, and there's one omission. Uh, let's see. Oh, right. "
	SET	'CNT,0
?PRG50:	GET	RECORDING-TABLE,CNT
	ZERO?	STACK \?CND52
	ADD	CNT,1
	GET	RECORDING-TABLE,STACK
	PRINT	STACK
	JUMP	?REP51
?CND52:	ADD	CNT,2 >CNT
	JUMP	?PRG50
?REP51:	SET	'YES-NO-FLAG,6
	CALL	QUEUE,I-YES-NO,2
	PRINTI	". Could you, ah, go back into "
	PRINTD	SIMULATION-MODE
	PRINTR	" and make that one additional recording?"""
?ELS45:	CALL	QUEUE,I-MESSAGE-M,875
	PUTP	MESSAGE-M,P?CAPACITY,1
	MOVE	PERELMAN,LOCAL-GLOBALS
	MOVE	COFFEE,LOCAL-GLOBALS
	CALL2	VISIBLE?,PERELMAN
	ZERO?	STACK /?CND63
	EQUAL?	PERELMAN,WINNER \?CND63
	CALL1	CLEAR-BUF
?CND63:	CALL	QUEUE,I-PERELMAN,60
	ADD	TIME,55 >LAST-ABE-TIME
	PRINTI	". He looks unhappy. ""PRISM, you didn't record "
	ZERO?	NUM \?ELS72
	PRINTI	"any"
	JUMP	?CND70
?ELS72:	PRINTI	"some"
?CND70:	PRINTI	" of the events the experts asked you for."" He picks up a piece of paper from his desk. ""Let's see. "
	SET	'CNT,0
?PRG81:	GET	RECORDING-TABLE,CNT
	ZERO?	STACK \?CND83
	ADD	CNT,1
	GET	RECORDING-TABLE,STACK
	PRINT	STACK
	PRINTI	". "
?CND83:	ADD	CNT,2 >CNT
	GRTR?	CNT,16 \?PRG81
	PRINTI	"Please go back into "
	PRINTD	SIMULATION-MODE
	PRINTR	" and make these recordings."" Perelman lowers his eyes. ""Please don't let me down, PRISM."" He walks out of the office."


	.FUNCT	PERELMAN-SHARE,INTERRUPT,SAW-ENTER=0
	IN?	PERELMAN,OFFICE /?ELS3
	MOVE	PERELMAN,OFFICE
	PUTP	PERELMAN,P?LDESC,STR?375
	EQUAL?	HERE,OFFICE \?ELS6
	SET	'SAW-ENTER,TRUE-VALUE
	CRLF	
	PRINTI	"Perelman walks into the office and"
	PRINT	SPOTS-ACTIVE-LIGHT
	PRINTI	" immediately. ""Hello, PRISM,"" he says, sitting down at his desk. """
	PRINT	IT-LOOKS-LIKE
	PRINTI	" you beat me here. Give me a moment, please."" He begins quickly jotting a few notes onto a pad."
	CRLF	
	JUMP	?CND1
?ELS6:	CALL	QUEUE,INTERRUPT,1
	RFALSE	
?ELS3:	EQUAL?	HERE,OFFICE /?CND1
	CALL	QUEUE,INTERRUPT,1
	RFALSE	
?CND1:	CRLF	
	PRINTI	"Perelman looks up"
	SET	'REVIEWING-RECORDINGS,FALSE-VALUE
	ZERO?	SAW-ENTER \TRUE
	PRINTI	","
	PRINT	SPOTS-ACTIVE-LIGHT
	PRINTI	", and nods toward your comm outlet"
	RTRUE	


	.FUNCT	PERELMAN-F
	EQUAL?	WINNER,PERELMAN \?ELS5
	IN?	RYDER,OFFICE \?ELS10
	SET	'WINNER,PLAYER
	CALL	PERFORM,V?TELL,RYDER
	SET	'WINNER,PERELMAN
	CALL1	CLEAR-BUF
	RSTACK	
?ELS10:	CALL2	QUEUED?,I-FIRST-SIMULATION-RESULT
	ZERO?	STACK /?ELS12
	SET	'WINNER,PLAYER
	CALL1	I-FIRST-SIMULATION-RESULT
	CALL2	INT,I-FIRST-SIMULATION-RESULT
	PUT	STACK,0,0
	CALL1	CLEAR-BUF
	RSTACK	
?ELS12:	CALL2	QUEUED?,I-RECORDINGS-VIEWED
	ZERO?	STACK /?ELS14
	SET	'WINNER,PLAYER
	CALL1	I-RECORDINGS-VIEWED
	CALL1	CLEAR-BUF
	RSTACK	
?ELS14:	GRTR?	GRIMWOLD-COUNTER,0 \?ELS16
	EQUAL?	PRSA,V?YES \?ELS16
	SET	'WINNER,PLAYER
	CALL1	BLOT-ACTION
	CALL1	CLEAR-BUF
	RSTACK	
?ELS16:	GRTR?	GRIMWOLD-COUNTER,0 \?ELS20
	EQUAL?	PRSA,V?NO \?ELS20
	SET	'WINNER,PLAYER
	CALL1	V-NO
	CALL1	CLEAR-BUF
	RSTACK	
?ELS20:	IN?	GRIMWOLD,HERE \?ELS24
	SET	'WINNER,PLAYER
	CALL	PERFORM,V?TELL-ABOUT,PERELMAN,RECORD-BUFFER
	CALL1	CLEAR-BUF
	RSTACK	
?ELS24:	EQUAL?	PRSA,V?READ,V?EXAMINE \?ELS26
	EQUAL?	PRSO,RECORD-BUFFER \?ELS26
	SET	'WINNER,PLAYER
	CALL	PERFORM,V?TELL-ABOUT,PERELMAN,RECORD-BUFFER
	SET	'WINNER,PERELMAN
	RTRUE	
?ELS26:	EQUAL?	PRSA,V?WHAT,V?WHO \?ELS30
	CALL	PERFORM,V?TELL-ABOUT,ME,PRSO
	RTRUE	
?ELS30:	EQUAL?	PRSA,V?TELL-ABOUT \?ELS32
	EQUAL?	PRSO,ME \?ELS32
	EQUAL?	PRSI,MY-NAME \?ELS39
	PRINTI	"Perelman looks thoughtful. ""I never mentioned where 'PRISM' comes from? There are so many things I want to talk to you about; perhaps, soon, I'll have more time...

""Well, officially it's an acronym for Perelman-Randu Introductory Soliptic Machine. But we came up with that only after I'd already named you PRISM. It actually comes from a couple of different poems -- I think they're in a file somewhere in your "
	PRINTD	LIBRARY-MODE
	PRINTR	"."""
?ELS39:	EQUAL?	PRSI,YOURSELF,PERELMAN \?ELS45
	PRINTR	"Perelman looks introspective and twiddles a pencil around aimlessly. ""I guess you'd have to say I'm a dreamer, a bit of an idealist. Politically, I've always been pretty liberal. My genuine sense of the humorous side of life was instilled in me, along with the rest of my Jewish heritage, by my grandfather -- my mother's father.

""I married a wonderful woman, Leah, a frail little thing who left me a widower after giving birth to our daughter, Esther. She's been a wonderful daughter; I've always been incredibly proud of her.

""Since Leah died, my life has been divided between raising Esther and my work at the University, and more recently here at the Project. And lately, now that Esther's out on her own, my work has been most of my life."""
?ELS45:	EQUAL?	PRSI,ESTHER \?ELS49
	PRINTR	"""Esther is my daughter, my only child. A sweeter and more loving child no man could ask for."""
?ELS49:	EQUAL?	PRSI,GRIMWOLD \?ELS53
	PRINTR	"""Grimwold is the head of the psychological team. He helped me design a lot of your 'life.' You've met him -- he gave you those Rorschach tests."""
?ELS53:	EQUAL?	PRSI,PLAN \?ELS57
	PRINTR	"""The Plan. Its full name is the Plan for Renewed National Purpose, a typical bit of linguistic obfuscation. A group of politicians and businessmen are trying to take advantage of the clamor for change, any kind of change."""
?ELS57:	EQUAL?	PRSI,RYDER \?ELS61
	PRINTR	"""Ryder's a Senator from...I'm not sure. Oklahoma? Alabama? Anyway, he's one of the big driving forces behind the Plan. Gives speeches about it all the time. He introduced the bill to Congress. He's really photogenic, very popular. I've got sort of mixed feelings about him."""
?ELS61:	EQUAL?	PRSI,RANDU \?ELS65
	PRINTR	"""Aseejh and I have been working together since we met at Rockvil U. nearly twenty years ago. He did virtually all of the technical design that made you possible. He's a terrific guy. I've been meaning to get you a communications outlet in his office -- I think you'd be good friends."""
?ELS65:	EQUAL?	PRSI,GOLD \?ELS69
	PRINTR	"""Vera Gold is the Chief Administrator for the entire PRISM Project. She was one of the conditions for getting federal funding several years ago. A more officious and incompetent woman has yet to be born. Her only talent is making herself look good.

""Technically, she's my boss, but I've tried to distance the research team from her as much as possible. It's been getting more and more difficult, though."""
?ELS69:	EQUAL?	PRSI,PRICE \?ELS73
	PRINTR	"""Alyson? She's my administrative assistant. I can't say enough good things about her."""
?ELS73:	EQUAL?	PRSI,FORTZMAN \?ELS77
	PRINTI	"""Fortzman..."
	PRINTD	FORTZMAN
	PRINTR	"...the name is vaguely familiar. I think she heads some prestigious conservative think-tank out on the west coast."""
?ELS77:	EQUAL?	PRSI,WARREN \?ELS83
	PRINTI	"Perelman knits his brow. ""The name is familiar. I hope I'm not going senile...oh, right! "
	PRINTD	WARREN
	PRINTR	" is in charge of your peripheral devices. If they ever decide to tack any more computers onto you, you'll probably find out about it from her."""
?ELS83:	EQUAL?	PRSI,RESIGNATION \?ELS89
	PRINTR	"""Oh, ever since Vera Gold became Project Administrator, I threaten to resign about twice a week, just to keep her honest. I've never actually gone through with it, of course."""
?ELS89:	EQUAL?	PRSI,MINDEX \?ELS93
	PRINTR	"""It's some sort of new narcotic that's supposed to be completely safe and nonaddictive. You're really asking the wrong person -- I'm pretty square when it comes to drugs and stuff."""
?ELS93:	EQUAL?	PRSI,CLERKMATON \?ELS97
	PRINTR	"""They're the latest fad in retailing -- cute, little robot clerks. I don't think they'll catch on. Of course, I said the same thing about joybooths."""
?ELS97:	EQUAL?	PRSI,RAV,CLAVE,PARENTS /?THN102
	EQUAL?	PRSI,FYLA \?ELS101
?THN102:	PRINTI	"""Everyone from your simulated childhood was just a composite, not based on anyone specifically."
	EQUAL?	PRSI,PARENTS \?CND106
	PRINTI	" You don't have any real parents, of course, unless you want to count Aseejh and myself."
?CND106:	PRINTR	""""
?ELS101:	EQUAL?	PRSI,CC-PRINTOUT \?ELS114
	PRINTR	"""Nothing important."""
?ELS114:	EQUAL?	PRSI,SILVER-DOVE \?ELS118
	PRINTR	"""Never heard of it."""
?ELS118:	PRINTR	"""I don't know what I could tell you that you don't already know..."""
?ELS32:	EQUAL?	PRSA,V?YES \?ELS126
	EQUAL?	YES-NO-FLAG,6 \?ELS126
	CALL1	V-YES
	RSTACK	
?ELS126:	EQUAL?	PRSA,V?NO \?ELS130
	EQUAL?	YES-NO-FLAG,6 \?ELS130
	CALL1	V-NO
	RSTACK	
?ELS130:	PRINTI	"Perelman smiles warmly. ""PRISM, I'd love to chat, but I've got a stack of paperwork you could lose a skybus in."""
	CRLF	
	CALL1	CLEAR-BUF
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?THANK \?ELS138
	IN?	RYDER,OFFICE \?ELS143
	CALL	PERFORM,V?TELL,RYDER
	RTRUE	
?ELS143:	PRINTR	"""You don't have to thank me!"""
?ELS138:	EQUAL?	PRSA,V?CALL \?ELS149
	CALL	PERFORM,V?TELL,PERELMAN
	RTRUE	
?ELS149:	EQUAL?	PRSA,V?GIVE,V?SHOW \?ELS155
	EQUAL?	PRSO,RECORD-BUFFER /?THN152
?ELS155:	EQUAL?	PRSA,V?TELL-ABOUT \?ELS151
	EQUAL?	PRSI,RECORD-BUFFER \?ELS151
?THN152:	IN?	RYDER,OFFICE \?ELS160
	CALL	PERFORM,V?TELL,RYDER
	RTRUE	
?ELS160:	GET	SIM-LEVEL-TABLE,0
	LESS?	STACK,1 \?ELS162
	PRINTI	"Perelman looks confused. ""But...you haven't entered "
	PRINTD	SIMULATION-MODE
	PRINTR	" yet!"""
?ELS162:	IN?	GRIMWOLD,HERE \?CND158
	PRINTR	"Perelman looks a bit annoyed. ""PRISM, talk to me later. This test is very important!"""
?CND158:	CALL2	VISIBLE?,PERELMAN
	ZERO?	STACK /?CND171
	CALL1	CLEAR-BUF
?CND171:	SET	'REVIEWING-RECORDINGS,TRUE-VALUE
	GETP	RECORD-BUFFER,P?SIZE
	ADD	STACK,5
	CALL	QUEUE,I-VIEW,STACK
	CALL2	INT,I-PERELMAN
	PUT	STACK,0,0
	MOVE	PERELMAN,LOCAL-GLOBALS
	MOVE	COFFEE,LOCAL-GLOBALS
	PRINTR	"Perelman looks intrigued. ""You've recorded something interesting, eh? Let me get a few of my colleagues together, and we'll view the buffer. I'll let you know when we're done, okay?"" He leaves the room."
?ELS151:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"Perelman is an older man, in his late fifties, and has a white goatee."


	.FUNCT	CAFETERIA-F,RARG
	EQUAL?	RARG,M-ENTER \?ELS5
	MOVE	CHAIR,HERE
	CALL	QUEUE,I-CAFETERIA,-1
	RSTACK	
?ELS5:	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"From this communication outlet, located in an upper corner of this high-ceilinged room, you can see most of the huge PRISM Facility dining hall. "
	CALL1	CAFETERIA-TABLE-DESC
	PRINTI	" Through the tall glass windows of the cafeteria you can see the well-manicured lawns"
	GRTR?	TIME,1103 /?THN15
	LESS?	TIME,348 \?CND12
?THN15:	PRINTI	", lit by powerful floodlights,"
?CND12:	PRINTI	" that surround the Facility."
	RTRUE	


	.FUNCT	CAFETERIA-TABLE-DESC
	PRINTI	"The tables below you are "
	ZERO?	SEIGE /?ELS7
	PRINTI	"totally vacant."
	RTRUE	
?ELS7:	GRTR?	TIME,480 \?ELS16
	LESS?	TIME,570 /?THN13
?ELS16:	GRTR?	TIME,705 \?ELS18
	LESS?	TIME,795 /?THN13
?ELS18:	GRTR?	TIME,1035 \?ELS12
	LESS?	TIME,1125 \?ELS12
?THN13:	PRINTI	"filled with mealtime crowds."
	RTRUE	
?ELS12:	PRINTI	"occupied by a handful of diners."
	RTRUE	


	.FUNCT	CAFETERIA-OBJECT-F
	EQUAL?	PRSA,V?EXAMINE \FALSE
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	CORE-F,RARG
	EQUAL?	RARG,M-LOOK \FALSE
	PRINTI	"This is the access area where "
	PRINTD	SABOTEURS
	PRINTI	" can service the machinery that makes up the bulk of your physical presence. The room is immaculately clean and well lit. As you swivel your receptors, you can see the "
	PRINTD	AIR-CONDITIONING-UNIT
	PRINTI	" that cools your processors, the "
	PRINTD	LIBRARY-UNIT
	PRINTI	", several rows of memory banks, a neatly organized "
	PRINTD	SPARE-PARTS
	PRINTI	", and vents, "
	GET	HVAC-STATUS-TABLE,11
	EQUAL?	STACK,1 \?ELS18
	PRINTI	"noisily sucking away"
	JUMP	?CND16
?ELS18:	PRINTI	"now silent, for whisking off"
?CND16:	PRINTI	" the zeeron fumes produced by the machinery."
	RTRUE	


	.FUNCT	AIR-CONDITIONING-UNIT-F
	EQUAL?	PRSA,V?EXAMINE \FALSE
	GRTR?	SABOTAGE-COUNTER,2 \?ELS10
	PRINTR	"One of the panels on the unit looks scratched and loose."
?ELS10:	EQUAL?	SABOTAGE-COUNTER,2 \FALSE
	PRINTI	"A panel on the side of the unit has been removed by one of the """
	PRINTD	SABOTEURS
	PRINTR	"."""


	.FUNCT	VENT-F
	EQUAL?	PRSA,V?LISTEN \FALSE
	GET	HVAC-STATUS-TABLE,11
	EQUAL?	STACK,1 \FALSE
	PRINTR	"The vents are noisily sucking away fumes."


	.FUNCT	NEWS-F,RARG,WAIT-KLUDGE=0
	EQUAL?	RARG,M-LOOK \?ELS5
	PRINTI	"Your visual and audio circuits are now hooked directly to the programming of the World News Network:"
	RTRUE	
?ELS5:	EQUAL?	RARG,M-END \FALSE
	ZERO?	TIME \?CND10
	ZERO?	CLOCK-WAIT /?CND10
	SET	'WAIT-KLUDGE,TRUE-VALUE
	SET	'TIME,1440
	DEC	'DATE
?CND10:	CRLF	
	EQUAL?	PART-FLAG,4 \?ELS17
	CALL1	STATUS-LINE
	SET	'HERE,COMM-ROOM
	MOVE	PLAYER,COMM-ROOM
	PRINTI	"""PRISM, the supercomputer who exposed the Ryder scandal, will soon be granted his final request: to live out the remainder of his days -- and how long that might be, nobody knows -- simulating his human existence. PRISM, who recently received the Congressional Medal of Honor as well as a citation from President Bowden, has been spending much of his time in simulations, giving top grades to the administration's new program to replace the discredited Plan.

""At a press conference in Rockvil, Doctor Abraham Perelman, one of the creators of PRISM, insisted that the world's first intelligent machine was, in fact, quite human."" The picture cuts to Perelman, standing behind a podium. ""His body may be silicon and steel,"" Perelman is saying, ""but in his heart he's as human as anyone I've ever met. As PRISM prepares to embark on his final voyage of the mind, I'd like to read a line from 'Hamlet' as his epitaph, so to speak: 'He was a man, take him for all in all, I shall not look upon his like again.'""

The image from the WNN Feed suddenly blinks off, and you find yourself back at the entry level of "
	PRINTD	COMM-MODE
	PRINTI	". The list of outlets indicates that none are currently active. A message is coming in: ""PRISM, programming of the "
	PRINTD	SIMULATION-CONTROLLER
	PRINTI	" with the parameters of the New Plan is complete. Everything is set for you to enter "
	PRINTD	SIMULATION-MODE
	PRINTI	". From all of us here at the PRISM Project, thanks and farewell."""
	CRLF	
	JUMP	?CND15
?ELS17:	FSET?	TRANSMITTER,ONBIT /?ELS27
	PRINT	TECHNICAL-DIFFICULTIES
	CRLF	
	JUMP	?CND15
?ELS27:	EQUAL?	FEED-BUFFER,RECORD-BUFFER \?ELS31
	GRTR?	RYDER-RECORDED,1 \?ELS34
	PRINTI	"The "
	PRINTD	NEWS
	PRINTI	" is showing "
	PRINTD	RYDER
	PRINTI	" trying to strong-arm Dr. Perelman in his office!"
	CRLF	
	JUMP	?CND15
?ELS34:	GETP	RECORD-BUFFER,P?SIZE
	GRTR?	STACK,0 \?ELS42
	PRINTI	"You see the sights and sounds of your recordings."
	CRLF	
	JUMP	?CND15
?ELS42:	PRINT	TECHNICAL-DIFFICULTIES
	CRLF	
	JUMP	?CND15
?ELS31:	EQUAL?	DATE,16 \?ELS50
	EQUAL?	FEED-BUFFER,NEWS-BUFFER \?ELS53
	CALL1	DAY-16-NEWS
	JUMP	?CND15
?ELS53:	PRINT	TECHNICAL-DIFFICULTIES
	CRLF	
	JUMP	?CND15
?ELS50:	EQUAL?	DATE,17 \?ELS59
	EQUAL?	FEED-BUFFER,NEWS-BUFFER \?ELS62
	CALL1	DAY-17-NEWS
	JUMP	?CND15
?ELS62:	PRINT	TECHNICAL-DIFFICULTIES
	CRLF	
	JUMP	?CND15
?ELS59:	EQUAL?	DATE,18 \?ELS68
	EQUAL?	FEED-BUFFER,REPORT-BUFFER \?ELS71
	PRINTI	"WNN is covering the funeral of Chinese Prime Minister Hung Hua-Tsing, alternating with documentaries on modern day China and videographies of the man who led the world's most populous nation for fourteen years."
	CRLF	
	JUMP	?CND15
?ELS71:	PRINT	TECHNICAL-DIFFICULTIES
	CRLF	
	JUMP	?CND15
?ELS68:	EQUAL?	DATE,19 \?ELS79
	EQUAL?	FEED-BUFFER,NEWS-BUFFER \?ELS82
	CALL1	DAY-19-NEWS
	JUMP	?CND15
?ELS82:	PRINT	TECHNICAL-DIFFICULTIES
	CRLF	
	JUMP	?CND15
?ELS79:	PRINTI	"You see a static, stylized graphic of an artificial satellite beaming data. Large red letters: ""Sorry!"" Smaller white letters: ""The WNN is temporarily unavailable in your area due to satellite transmitter servicing. We apologize for the inconvenience."""
	CRLF	
?CND15:	ZERO?	WAIT-KLUDGE /FALSE
	SET	'TIME,0
	INC	'DATE
	RTRUE	


	.FUNCT	DAY-16-NEWS,X
	ZERO?	CLOCK-WAIT /?ELS3
	SUB	TIME,1
	MOD	STACK,30 >X
	JUMP	?CND1
?ELS3:	MOD	TIME,30 >X
?CND1:	ZERO?	X \?ELS11
	PRINT	BOB-WILLIAMS
	PRINTI	"rioting in Sri Lanka, a terrorist bombing in Pretoria, and "
	PRINTD	RYDER
	PRINTR	"'s strong attack on the Administration. But first, these messages."""
?ELS11:	EQUAL?	X,1 \?ELS17
	CALL1	OMNIFABB-COMMERCIAL
	RSTACK	
?ELS17:	EQUAL?	X,2 \?ELS19
	CALL1	NOMACOLD-COMMERCIAL
	RSTACK	
?ELS19:	EQUAL?	X,3 \?ELS21
	PRINTR	"The anchorman reappears. ""Food riots in Sri Lanka worsened today, as army details were removed from relief distribution to protect the Presidential Palace and other government buildings."" A grainy visual, showing armed troops firing into a crowd, accompanies the story."
?ELS21:	EQUAL?	X,4 \?ELS25
	PRINTR	"""The continuing drought in India threatens that country with its fifth food shortage in the last six years. A government spokesman called the outlook 'optimistic' but said that rations might be cut ten percent as a precautionary measure."""
?ELS25:	EQUAL?	X,5 \?ELS29
	PRINTI	"""At least forty people were killed yesterday when a bomb demolished a bank in downtown Pretoria."" The picture shows South African soldiers combing through rubble, then an image of a woman crying. ""Responsibility for the bombing was quickly claimed by WIZO, the radical white terrorist group responsible for last summer's shooting of Prime Minister Menetu. Next: excerpts from "
	PRINTD	RYDER
	PRINTR	"'s blistering attack on the Administration, after this."""
?ELS29:	EQUAL?	X,6 \?ELS35
	CALL1	SUPERMACE-COMMERCIAL
	RSTACK	
?ELS35:	EQUAL?	X,7 \?ELS37
	PRINTI	"""In a speech before the National Council of Educators, "
	PRINTD	RYDER
	PRINTR	" blasted the Bowden Administration's educational policies."" An excerpt from the speech is shown. Ryder is a keen-eyed man with coiffed hair and a telegenic charisma. ""Must we continue treating our schools as prisons, and our prisons as schools? Let's give our sons and daughters the education they deserve."""
?ELS37:	EQUAL?	X,8 \?ELS43
	PRINTR	"""An Administration spokesperson called Ryder's criticisms 'simplistic' and 'demagogic.' A WNN poll, released this morning, showed that 64% of the public thinks the Administration's educational policies have failed, and for the first time, a majority of people agree our school system is 'out of control.'"""
?ELS43:	EQUAL?	X,9 \?ELS47
	PRINTR	"""In Rockvil, South Dakota, scientists at the PRISM Project are scheduled to end an eleven-year phase of the project by activating what they hope will be the world's first intelligent computer. If successful, PRISM's first task would be to study the effectiveness of the Plan for Renewed National Purpose."""
?ELS47:	EQUAL?	X,10 \?ELS51
	PRINTR	"""Stock prices fell sharply again today, following Monday's proposed tax hike. Prices for manufacturers dropped an average of three and one eighth, and service industries plummeted twelve and seven eighths. O'Neill Systems led the decliners with a drop of nineteen and a half."""
?ELS51:	EQUAL?	X,11 \?ELS55
	CALL1	SUDO-SHRIMP-COMMERCIAL
	RSTACK	
?ELS55:	EQUAL?	X,12 \?ELS57
	PRINT	NEWSMAKER-NOOK
	PRINTR	"Dr. Abraham Perelman, a Chief Scientist for the PRISM Project and one of its founders. Dr. Perelman, welcome. I think the question foremost on people's minds is: When will PRISM be ready to begin studying the Plan?"" Perelman shrugs. ""If everything goes okay, almost immediately after his awakening."""
?ELS57:	EQUAL?	X,13 \?ELS61
	PRINTR	"""Dr. Perelman,"" the interviewer continues, ""Exactly how smart will PRISM be?"" The camera cuts to the scientist. ""He'll have a tremendous memory capacity, and a number of extraordinary capabilities, but for most intents and purposes, PRISM will be on about the same level as an average adult of reasonable intelligence."""
?ELS61:	EQUAL?	X,14 \?ELS65
	PRINTR	"""One final question, Doctor. How can you be sure that PRISM will do what he's told? What guarantees that he'll obey your orders?"" Perelman chuckles. ""Bob, the best reply is another question -- why wouldn't he do what we ask? Would a human being turn down the opportunity to utilize his or her talents to perform a tremendously useful service for society? PRISM will have those same motivations."" The anchorman thanks Perelman before turning toward the camera. ""That was Dr. Abraham Perelman of the PRISM Project."""
?ELS65:	EQUAL?	X,15 \?ELS69
	CALL1	MIRACLE-WARE-COMMERCIAL
	RSTACK	
?ELS69:	EQUAL?	X,16 \?ELS71
	PRINT	TOM-SLAYTON
	PRINTR	"The San Francisco Gazelles clinched a spot in the southwest division soccer quarterfinals last night, with this fourth quarter shot by Walt Griswood, knocking Austin out for the season. Final score: 5 to 4."""
?ELS71:	EQUAL?	X,17 \?ELS75
	PRINTR	"""In other soccer news, a spokesperson for the Vancouver Kings said that star fullback Alex Masterson would be ready for the first game of the northwest division quarterfinals on Sunday. He strained a ligament in his ankle during the last game of the regular season."""
?ELS75:	EQUAL?	X,18 \?ELS79
	PRINTR	"""Yesterday featured a light schedule for exhibition baseball. The Dodgers skinned the Bobcats 7 to 3, the Mets ransacked the Pirates 10 to 1, and Miami edged St. Louis, 3 to 2. The players are still without a contract and are vowing to strike on opening day."""
?ELS79:	EQUAL?	X,19 \?ELS83
	PRINTR	"""The World Boxing Commission has ruled that former middleweight champion Charley Robbins will be barred from the sport for a period of one year, following his January conviction for violating the Drug Abuse Reduction Act. This means that Robbins will be unable to meet challenger Jeff Jefferson in a thirty-million-dollar bout planned for July in Oslo. Robbins declined to comment on the decision."""
?ELS83:	EQUAL?	X,20 \?ELS87
	PRINTR	"""The Denver Sports Commission filed a two-hundred-million-dollar countersuit against the City of Topeka regarding the proposed move of the Topeka Wheatfields to Denver. That's all the sports news for today. Bob?"""
?ELS87:	EQUAL?	X,21 \?ELS91
	PRINTR	"The camera switches to the anchorman. ""Thanks, Tom. Today's edition of The Money Manager is sponsored by Plastique. We'll be talking about a low-tax bond that can save you a bundle! But first, this message."""
?ELS91:	EQUAL?	X,22 \?ELS95
	CALL1	PLASTIQUE-COMMERCIAL
	RSTACK	
?ELS95:	EQUAL?	X,23 \?ELS97
	PRINTR	"""Our guest on The Money Manager is Ed Ziff, from Norwood Brokerage Services, who'll be telling us how to save a bundle by buying Federal Deficit Bonds."" The image cuts to a thin, balding man wearing an immaculate pinstriped suit. ""Federal Deficit Bonds have been around for almost a decade, but few people seem to realize what a good investment they are."""
?ELS97:	EQUAL?	X,24 \?ELS101
	PRINTR	"""These bonds can be purchased for as little as $10,000 and pay interest at a rate 2% below the Regulated Prime Rate, currently around 28%. But the big plus is that the top tax rate on interest from these bonds is only 60%, a big win if you're in an upper bracket. If your taxable income's over $180,000, and you have at least $10,000 to invest, consider Federal Deficit Bonds."""
?ELS101:	EQUAL?	X,25 \?ELS105
	PRINTI	"""That was Ed Ziff of Norwood Brokerage Services on The Money Manager, brought to you by Plastique, the "
	PRINTD	CREDIT-CARD
	PRINTR	" accepted by over a million merchants nationwide. You're watching the World News Network, and we'll be back in a moment with the weather outlook."""
?ELS105:	EQUAL?	X,26 \?ELS111
	CALL1	JOYBOOTH-COMMERCIAL
	RSTACK	
?ELS111:	EQUAL?	X,27 \?ELS113
	PRINT	WALLY-THE-WEATHERMAN
	PRINTR	"Here's our composite satellite photo, and you can see that there's trouble brewing in the northwest. We'll be seeing a few inches of snow around Vancouver, and some heavy rains east and south of there."""
?ELS113:	EQUAL?	X,28 \?ELS117
	PRINTR	"""Unfortunately, that storm system is going to head due east, so it looks as if there's still no relief in sight for those farmers in the southwest. For the rest of the country, sunny skies and generally chilly temperatures."""
?ELS117:	EQUAL?	X,29,-1 \FALSE
	CALL1	WEATHER-SHARE
	RSTACK	


	.FUNCT	DAY-17-NEWS,X
	ZERO?	CLOCK-WAIT /?ELS3
	SUB	TIME,1
	MOD	STACK,30 >X
	JUMP	?CND1
?ELS3:	MOD	TIME,30 >X
?CND1:	ZERO?	X \?ELS11
	PRINT	BOB-WILLIAMS
	PRINTI	"two billion Chinese mourn the death of their leader, "
	ZERO?	COMPLETED-TASKS /?ELS16
	PRINTI	"a computer gives a vote of confidence to the Plan"
	JUMP	?CND14
?ELS16:	PRINTI	"the South African government retaliates for the latest bombing"
?CND14:	PRINTR	", and the Treasury Department releases some grim economic figures. But first, these messages."""
?ELS11:	EQUAL?	X,1 \?ELS27
	CALL1	OMNIFABB-COMMERCIAL
	RSTACK	
?ELS27:	EQUAL?	X,2 \?ELS29
	CALL1	NOMACOLD-COMMERCIAL
	RSTACK	
?ELS29:	EQUAL?	X,3 \?ELS31
	PRINTR	"""The Central Committee of the People's Republic of China announced late yesterday that Prime Minister Hung Hua-Tsing, helmsman of the world's most populous nation since 2017, is dead at the age of 79. Hung, who was last seen in public on October 20, is believed to have suffered from abdominal cancer."""
?ELS31:	EQUAL?	X,4 \?ELS35
	PRINTR	"""During Hung's fourteen-year leadership, he steered China toward a more neutralist position, while continuing the vigorous trend away from central planning. Per tradition, Hung's body will lie in state for 24 hours. Tomorrow, the World News Network will devote its entire programming to covering the Prime Minister's funeral and examining the mark he left on China."""
?ELS35:	EQUAL?	X,5 \?ELS39
	PRINTI	"The visual changes to firefighters tramping through burning wreckage. ""A skybus crash in Tucson is being blamed on the failure of the vehicle's electronic guidance system. Nine passengers are dead, and damage to the Tucson "
	PRINTD	SKYBUS-TERMINAL
	PRINTI	" could exceed eighty million dollars. A spokesman for Audico, the New Zealand manufacturer of the guidance system, attributed the failure to improper maintenance procedures."
	ZERO?	COMPLETED-TASKS /?CND44
	PRINTI	" In a moment, the story of PRISM's thumbs-up for the Plan."
?CND44:	PRINTR	""""
?ELS39:	EQUAL?	X,6 \?ELS53
	CALL1	MOVIE-COMMERCIAL
	RSTACK	
?ELS53:	EQUAL?	X,7 \?ELS55
	ZERO?	COMPLETED-TASKS /?ELS60
	PRINTI	"""A panel, including "
	PRINTD	RYDER
	PRINTR	" and Vice-President Wilbur Carghill, reported that future simulations by the supercomputer PRISM showed tremendous promise for the Plan. While the administration urged a cautious approach, Senator Ryder called for immediate Congressional adoption of the Plan's legislative agenda as well as beginning the process of submitting the constitutional changes to the states."""
?ELS60:	PRINTR	"""The South African government has retaliated for yesterday's bombing of a Pretoria bank by burning several white villages considered to be terrorist strongholds. The death toll in that bombing has reached fifty and is expected to go higher."" The picture, which shows heavily armed soldiers driving through the smoking remains of a village, bears the subtitle ""CLEARED BY SOUTH AFRICAN SECURITY."""
?ELS55:	EQUAL?	X,8 \?ELS71
	PRINTR	"""The Treasury Department released its February economic report today, which was almost uniformly grim. Employment was down seven tenths of one percent, to a new record low of 82.2%. The Average Consumer Interest Rate was up two tenths of one percent, and a tight money supply threatens to push it even higher."""
?ELS71:	EQUAL?	X,9 \?ELS75
	PRINTR	"""The Index of Leading Economic Indicators dropped nine tenths of a percent, the thirty-second consecutive monthly drop. January's slight gain in real income was completely erased in February. The balance of trade was negative, as the USNA imported seventy-two billion dollars of goods more than it exported."""
?ELS75:	EQUAL?	X,10 \?ELS79
	PRINTR	"""Today's grim economic news caused stock prices to plummet. Prices for manufacturers dropped by an average of five and three eighths, and service industries declined by nineteen and seven eighths. General Plastics was one of the few gainers, picking up a point and an eighth."""
?ELS79:	EQUAL?	X,11 \?ELS83
	CALL1	SUDO-SHRIMP-COMMERCIAL
	RSTACK	
?ELS83:	EQUAL?	X,12 \?ELS85
	PRINT	NEWSMAKER-NOOK
	PRINTR	"Holy Keeper Sergei Korn, a priest of the Church of God's Word, the group which has been occupying the Greens Peak radio telescope facility in Arizona. Your Holiness, welcome. Regarding Greens Peak, could you explain the reason for your takeover?"" Korn nods impassively. ""The Mount is the world's ear for the revealed word of God. Only our leader, the divinely inspired Ellis Vincent, can interpret these messages. We cannot let unbelievers distort their meaning or destroy the Holy Ear."""
?ELS85:	EQUAL?	X,13 \?ELS89
	PRINTR	"""Your holiness, the occupation of Greens Peak is now in its third year, and attempts to dislodge you seem hopelessly tied up in court. Do you see the Church of God's Word holding Greens Peak permanently?"" The Holy Keeper's eyes burn. ""Of this there is no doubt. We have purged the Mount of unbelievers, and each day we cleanse more and more of their unholy things. We have begun construction of the Temple there, from whence the Keepers may broadcast the Word to the world."""
?ELS89:	EQUAL?	X,14 \?ELS93
	PRINTR	"""One final question, your holiness. Do you and your fellow Church members worry that the world sees you as a band of lunatics, a religious fringe cult?"" Korn looks incensed for a moment but then answers calmly. ""A foul and vile impression, born on the poisonous tongues of unbelievers and nourished by our unholy enemies. Do you know that we have churches in thirteen cities, and that fifteen more will be formed this year? Do you know that sixteen thousand believers made pilgrimages to the Mount last year? We will be called what we will be called, but we will continue to obey and deliver the Word."" The anchorman thanks the priest before turning toward the camera. ""That was Holy Keeper Sergei Korn of the Church of God's Word."""
?ELS93:	EQUAL?	X,15 \?ELS97
	CALL1	MIRACLE-WARE-COMMERCIAL
	RSTACK	
?ELS97:	EQUAL?	X,16 \?ELS99
	PRINT	TOM-SLAYTON
	PRINTR	"The Omaha Gold topped the Illinois Towers with a lopsided 6 to 1 victory. That win propels them into the southwest division quarterfinals. Their first game, against the San Francisco Gazelles, will be March 22."""
?ELS99:	EQUAL?	X,17 \?ELS103
	PRINTR	"""In other soccer news, a report from the Vancouver Kings that star fullback Alex Masterson's strained ligament would be healed for the team's first quarterfinals game on Sunday seems to have been premature. Lanizone treatments have failed to reduce the swelling. Masterson is hoping to be ready by the third game of the seven-game series."""
?ELS103:	EQUAL?	X,18 \?ELS107
	PRINTR	"""Negotiations between the baseball owners and the players' union broke off yesterday, amid reports that the two sides were still far apart on the issue of a new profit-sharing formula. The players have vowed to go on strike when the regular season opens next week, unless a new contract is signed."""
?ELS107:	EQUAL?	X,19 \?ELS111
	PRINTR	"""Soccer commissioner Hal Tovarrin has approved an eight-team expansion proposal that would add two new teams to each division. The cities to receive the new teams have yet to be determined, but Grand Rapids and Calgary have been lobbying hard for a franchise. That's the sports news for today. Bob?"""
?ELS111:	EQUAL?	X,20 \?ELS115
	PRINTR	"The camera switches to the anchorman. ""Thanks, Tom. Today's edition of The Video Mechanic with Sam Severinson is sponsored by Sparkle Oil, and Sam will be talking about low-cost map modules. But first, this message."""
?ELS115:	EQUAL?	X,21 \?ELS119
	CALL1	SPARKLE-OIL-COMMERCIAL
	RSTACK	
?ELS119:	EQUAL?	X,22 \?ELS121
	PRINTR	"""Now, here's the Video Mechanic himself, Sam Severinson."" The camera switches to a smiling, middle-aged man, dressed in a spotless mechanic's smock. ""When you buy a car, you usually have a choice of a map module that includes only your local region, or wide-area map modules as an expensive option. But there's a third choice you might not know about."""
?ELS121:	EQUAL?	X,23 \?ELS125
	PRINTR	"""A map module supplies the car's electronic guidance system with information about an area's geographical features and traffic patterns. Virtually all states prohibit flying a skycar without a current map module for the local area, meaning no more than three years since its last data update."""
?ELS125:	EQUAL?	X,24 \?ELS129
	PRINTR	"""By installing a wide-area map module yourself, you can save big bucks. Several companies produce low-cost, reliable modules. I would recommend Ace or Hi-Line. Make sure you specify your car's model and year when purchasing. Your owner's manual should include instructions on how to replace the map module; if not, you can order one of my books, 'Module Replacement for Domestic Skycars,' directly from the World News Network for $9.95."""
?ELS129:	EQUAL?	X,25 \?ELS133
	PRINTR	"""If you do any interstate travelling, you'll need a wide-area map module. Install it yourself -- and save a bundle. This is Sam Severinson, the Video Mechanic."" The visual switches back to the anchorman. ""Today's edition of the Video Mechanic was sponsored by Sparkle Oil, the oil that's simply the best. You're watching the World News Network, and we'll be back in a moment with a look at the national weather picture."""
?ELS133:	EQUAL?	X,26 \?ELS137
	CALL1	MEXICO-COMMERCIAL
	RSTACK	
?ELS137:	EQUAL?	X,27 \?ELS139
	PRINT	WALLY-THE-WEATHERMAN
	PRINTR	"That storm over the northwest has decided to embarrass me by being more severe than I predicted. It's already dumped nearly four inches of snow on Vancouver, and as our satellite photo shows, that storm system is just stalled there on the coast. They'll probably see another two or three inches before this warm air here pushes that storm eastward."""
?ELS139:	EQUAL?	X,28 \?ELS143
	PRINTR	"""As you can see on the photo, it's clear skies for the rest of the country, bad news for those farmers in the southwest. However, there's an indication of a storm forming out here off Baja, which just might head this way. I'll be keeping an eye on that system for you."""
?ELS143:	EQUAL?	X,29 \FALSE
	CALL1	WEATHER-SHARE
	RSTACK	


	.FUNCT	DAY-19-NEWS,X
	ZERO?	CLOCK-WAIT /?ELS3
	SUB	TIME,1
	MOD	STACK,30 >X
	JUMP	?CND1
?ELS3:	MOD	TIME,30 >X
?CND1:	ZERO?	X \?ELS11
	PRINT	BOB-WILLIAMS
	PRINTR	"martial law in Sri Lanka, Congressional action on the Plan, and a new leader for China. But first, these messages."""
?ELS11:	EQUAL?	X,1 \?ELS15
	CALL1	OMNIFABB-COMMERCIAL
	RSTACK	
?ELS15:	EQUAL?	X,2 \?ELS17
	CALL1	SPARKLE-OIL-COMMERCIAL
	RSTACK	
?ELS17:	EQUAL?	X,3 \?ELS19
	PRINTR	"The anchorman reappears. ""Facing an eighth day of food rioting in Sri Lanka, President Tilmose declared a state of martial law. Public gatherings have been banned, and a dusk-to-dawn curfew is in place."" A visual shows jeeps full of soldiers patrolling deserted streets. ""The government continued to deny reports that hundreds of demonstrators were wounded when army troops fired into a crowd of rioters."""
?ELS19:	EQUAL?	X,4 \?ELS23
	PRINTR	"""The Central Committee of the People's Republic of China is reported to be close to choosing a successor to Hung Hua-Tsing, namely the Industrial Minister, Djou Tsen. Djou, a loyal supporter of the late Prime Minister, would very likely follow closely the path that Hung laid out during his fourteen-year rule."""
?ELS23:	EQUAL?	X,5 \?ELS27
	PRINTR	"You see images of flooded rice paddies. Ill-clad peasants are dragging bodies out of the water. ""Final figures on the brutal monsoon that battered Java last week put the death toll at over seventy-five thousand. Government officials have called for an international relief effort, saying that millions of lives are endangered by the widespread agricultural destruction."""
?ELS27:	EQUAL?	X,6 \?ELS31
	CALL1	JOYBOOTH-COMMERCIAL
	RSTACK	
?ELS31:	EQUAL?	X,7 \?ELS33
	PRINTR	"The anchorman appears in front of a graphic of the Capitol building. ""Both Houses have set dates for early next month to vote on the sixteen bills that comprise the legislative agenda of the Plan. While angry debate filled the chambers today, the bills are all expected to pass by wide margins."""
?ELS33:	EQUAL?	X,8 \?ELS37
	PRINTR	"""Public support for the Plan continues to grow. In an ugly incident in Chicago, educator Wilson Thormun was booed off the podium while addressing a forum on the Plan."" The image cuts to a film clip of Thormun attempting to be heard above the jeering."
?ELS37:	EQUAL?	X,9 \?ELS41
	PRINTR	"""The fourth Cleveland fire in six days has investigators convinced that one or more arsonists are responsible, but they have no leads at the present time. An arson hotline has been set up for anyone with information about the fires: 7-2525-00-8000."" The number also appears superimposed on the image in bright blue letters."
?ELS41:	EQUAL?	X,10 \?ELS45
	PRINTR	"""News about the imminent passage of the Plan halted the stock market's week-long slide. The average manufacturer's share rose three and three eighths, and service stocks soared nine and one eighth. The leading gainer was Tri-State Mining, which peaked near midday at ninety-five before finally closing at eighty-seven and a half, up twenty and one eighth."""
?ELS45:	EQUAL?	X,11 \?ELS49
	CALL1	MEXICO-COMMERCIAL
	RSTACK	
?ELS49:	EQUAL?	X,12 \?ELS51
	PRINT	NEWSMAKER-NOOK
	PRINTR	"Jean LeBlang, the Redirectionist artist whose glass stabile entitled ZYGOMETRA is the centerpiece of the new Texas Statehouse in Austin. Jean, welcome. Would you tell our viewers what Redirectionism is all about?"" The camera pans to a wiry young man, who speaks with a strong French accent. ""It is an attempt to sway the public consciousness, to Redirect, so to speak, away from the pain, the weight, even the banality of a modernistic society obsessed with ignoring the unreal."""
?ELS51:	EQUAL?	X,13 \?ELS55
	PRINTR	"""Jean, what you were trying to say with ZYGOMETRA."" ""With Redirectionism, what you are NOT saying is just as important as what you ARE saying. ZYGOMETRA uses the shimmering fantasy images of glass to set up a contradictory transposition against the reality of the surrounding buildings, to cancel out all impressions of the world and the unworld, to create for a split second a void which could then be filled by a thought, an image, a direction."""
?ELS55:	EQUAL?	X,14 \?ELS59
	PRINTR	"""One last question before you go, Jean. Critics say that Redirectionism is just Escapist art with a new label. How do you answer that charge?"" ""That criticism belies a fundamental flaw in the understanding of Redirectionism, which is firmly rooted in the belief that escapism is only one of many infinitesimal stepping-off points for the entire panoply of emotions and directions that compose the essence of our art."" The camera pans back to the anchorman. ""Our guest on the Newsmaker Nook has been Redirectionist artist Jean LeBlang."""
?ELS59:	EQUAL?	X,15 \?ELS63
	CALL1	PLASTIQUE-COMMERCIAL
	RSTACK	
?ELS63:	EQUAL?	X,16 \?ELS65
	PRINTR	"""It's time for the Sports Roundup. Tom Slayton is off today; Ellen Jones is sitting in. Ellen?"" An athletic-looking woman appears, in front of a soccer graphic. ""Thanks, Bob. By edging Portland 4 to 3, the Minneapolis Marauders have won a spot in the quarterfinals of the northwest division. Their first game, against the Vancouver Kings, will be on Sunday, March 23."""
?ELS65:	EQUAL?	X,17 \?ELS69
	PRINTR	"""Meanwhile, a spokesman for the Kings had bad news for Vancouver fans. Alex Masterson, the Kings' star fullback, reinjured his strained ligament during a workout and will be out for the remainder of the year. That injury may have also crippled Vancouver's postseason hopes."
?ELS69:	EQUAL?	X,18 \?ELS73
	PRINTR	"""A blockbuster trade rocked the baseball world, as the Detroit Tigers swapped star pitchers with the Miami Keys. The Tigers shipped off their hard-throwing righthander, Mel Simpluk, who led the American League in strikeouts last year, and the Keys parted with Wilbur Korch, a lefthander who has been a fifteen-game winner for the Keys during each of the last four years. The Keys sweetened the deal for the financially troubled Detroit franchise by paying off part of Korch's seven-million-dollar contract."""
?ELS73:	EQUAL?	X,19 \?ELS77
	PRINTR	"A graphic appears behind the sportscaster, depicting a red ""X"" across uniformed players holding picket signs. ""And it looks as if the baseball season will begin on schedule this Monday, without any threat of a players' strike. Negotiators for the owners and the union reached a tentative agreement late last night, concluding an eighteen-hour bargaining session. The agreement still must be okayed by the players themselves, but approval is expected."
?ELS77:	EQUAL?	X,20 \?ELS81
	PRINTR	"""Here are some exhibition baseball scores: the Boston Red Sox felled the San Jose Redwoods 7 to 1, the Detroit Tigers skinned the Ottawa Furriers 4 to 2, the LA Dodgers extinguished the Buffalo Flames 5 to nothing, and get this -- the New York Mets tromped the Denver A's 19 to 3! That's sports! Bob?"""
?ELS81:	EQUAL?	X,21 \?ELS85
	PRINTR	"The camera switches to the anchorman. ""Thanks, Ellen. And now, a report on a new film comedy by Johnny Ingot, when we return in a minute for the Home Entertainment Corner with Lula Bergan. Today's edition of the Home Entertainment Corner is sponsored by Eagle Studios."""
?ELS85:	EQUAL?	X,22 \?ELS89
	CALL1	MOVIE-COMMERCIAL
	RSTACK	
?ELS89:	EQUAL?	X,23 \?ELS91
	PRINTR	"""Now, here's the Home Entertainment Corner, with Lula Bergan."" The camera cuts to a youthful woman with curly orange hair. ""The legion of Johnny Ingot fans ensures that a film with his name on it will sell a million copies. But based on quality, his new comedy, KING OF THE KENNEL, deserves to flop."""
?ELS91:	EQUAL?	X,24 \?ELS95
	PRINTR	"""In his previous films, such as RUNNING UGLY and TWO DIMES FOR A NICKEL, Ingot always combined his zany brand of slapstick humor with a streak of appealing sentimentality. But in KING OF THE KENNEL, a film about a love triangle between a soccer player, a female sportswriter, and a St. Bernard, Ingot goes for the belly laugh over the witty gag. He throws subtlety to the wind, and sentiment is nowhere to be seen."""
?ELS95:	EQUAL?	X,25 \?ELS99
	PRINTI	"""While KING OF THE KENNEL is no worse than many video farces we've seen lately, I expect more from today's premier film comic. KING OF THE KENNEL is available now; suggested retail price is $89.95. Back to you, Bob."" The anchorman reappears. ""That was the Home Entertainment Corner, with Lula Bergan, sponsored today by Eagle Studios, producers of the next hot home hit,"
	PRINT	MOVIE-TITLE
	PRINTR	"You're watching the World News Network, and we'll be back in a flash with the weather."""
?ELS99:	EQUAL?	X,26 \?ELS103
	CALL1	SUPERMACE-COMMERCIAL
	RSTACK	
?ELS103:	EQUAL?	X,27 \?ELS105
	PRINT	WALLY-THE-WEATHERMAN
	PRINTR	"As you can see in the photo, most of our clouds are currently covering either New England or the lower Mississippi River valley. The New England formation will move out to sea real soon, but that other group will be heading eastward, so expect rain all across the south tomorrow."
?ELS105:	EQUAL?	X,28 \?ELS109
	PRINTR	"""Edmonton is still digging out from under that surprise blizzard that dumped eleven inches of snow on them yesterday, and it doesn't look as if they'll get any help from the sun. Our extended forecast shows continued sub-zero temperatures there for at least a couple more days."""
?ELS109:	EQUAL?	X,29 \FALSE
	CALL1	WEATHER-SHARE
	RSTACK	


	.FUNCT	WEATHER-SHARE,CNT=0,DATE-OFFSET=1
	EQUAL?	DATE,17 \?ELS3
	SET	'DATE-OFFSET,2
	JUMP	?CND1
?ELS3:	EQUAL?	DATE,19 \?CND1
	SET	'DATE-OFFSET,3
?CND1:	PRINTI	"""Here are tomorrow's high temperatures, in Celsius, for the major metros: "
?PRG8:	GET	WEATHER-TABLE,CNT
	PRINT	STACK
	ADD	CNT,DATE-OFFSET
	GET	WEATHER-TABLE,STACK
	PRINTN	STACK
	ADD	CNT,4 >CNT
	GRTR?	CNT,32 \?PRG8
	PRINTI	". And that's today's forecast from Wally the Weatherman! Bob?"" The camera pans back to the anchorman. ""We're coming up on "
	ZERO?	CLOCK-WAIT /?ELS19
	CALL2	TIME-PRINT,TIME
	JUMP	?CND17
?ELS19:	ADD	TIME,1
	CALL2	TIME-PRINT,STACK
?CND17:	EQUAL?	TIME,1439 \?CND23
	PRINTI	", so stay tuned for all of the newest news of the new day"
?CND23:	PRINTR	"."" A moment later, a deep gong sounds."


	.FUNCT	OMNIFABB-COMMERCIAL
	PRINTR	"A man appears, holding a magazine. He yawns loudly. ""Omni-Fabb's Skycar 2032 has been awarded SKYCAR ENTHUSIAST's Car of the Year award. Some things never change."" The man looks up as a car whooshes by overhead like a fighter jet. A narrator intones, ""Quality ... Comfort ... Safety ... Omni-Fabb."""


	.FUNCT	NOMACOLD-COMMERCIAL
	PRINTR	"The camera pans down row after row of medicine bottles. A voiceover says, ""Only one multisymptom cold remedy comes with a no-strings-attached double-money-back guarantee."" The camera stops on a slender bottle with a bright blue label. ""NomaCold can make that guarantee, because we put Results in every bottle. From Huang Laboratories."""


	.FUNCT	SUPERMACE-COMMERCIAL
	PRINTR	"A woman is walking down a dark, deserted street, glancing fearfully around. The sound of a heartbeat, growing faster and louder, fills the soundtrack. Suddenly, the woman screams and the screen goes black. A narrator with a deep, silky voice reads the stark titles that scroll by. ""Year after year, street crime increases. Doesn't it make sense to protect yourself? G & G SuperMace is the strongest crime repellent allowed by law. Don't wait until it's too late."""


	.FUNCT	SUDO-SHRIMP-COMMERCIAL
	PRINTR	"""We asked Ms. Linda Carr of Seattle to compare AquaFarm's Sudo Shrimp to the real thing."" Ms. Carr points to one of two bowls. ""This is the real one. Nothing tastes like real shrimp."" A man, from off-screen, reveals a card in front of that bowl. ""You've just picked the AquaFarm Sudo Shrimp!"" he says. ""How do you feel about artificial shrimp now?"" ""Incredible! I can't believe I've been paying for real shrimp when I could've been buying AquaFarm instead!"""


	.FUNCT	MIRACLE-WARE-COMMERCIAL
	PRINTR	"A woman, washing dishes, looks up as a voice asks, ""Still washing dishes the same old-fashioned way?"" She nods. ""Lots of people are switching to Miracle Ware disposable pots and pans. Isn't it worth a few cents a night to be able to relax after dinner instead of scrubbing the night away?"" She nods. ""Buy Miracle Ware -- and throw your troubles away!"""


	.FUNCT	PLASTIQUE-COMMERCIAL
	PRINTR	"You see visual after visual of store windows bearing a decal reading ""Show Us Your Plastique!"" A voiceover intones ""Only one credit card is accepted by over one million merchants across the country. That means a million stores where you can say 'Here's My Plastique!' Dial 2-9000-15-8282 to order your card. Operators are standing by."""


	.FUNCT	JOYBOOTH-COMMERCIAL
	PRINTR	"""Each year, nearly forty thousand people die in joybooths. Joybooth suicide is simple and painless, but it's also a one-way ticket. Isn't there another answer? Call the Suicide Hotline by picking up any public phone and dialing 1000. This message paid for by the Joybooth Regulatory Commission."""


	.FUNCT	SPARKLE-OIL-COMMERCIAL
	PRINTR	"A popular video star, his sandy hair tousled by a brisk wind, stands next to a sporty skycar. ""When I'm not working on a picture, I'm usually behind the wheel of one of my cars. I fly to relax, so I want my flying to be worry-free. That's why I use Sparkle Oil. It's simply the best you can buy, but you'd never know it from the price! Sparkle Oil...simply the best."" He clambers into the skycar and waves toward the camera as he zooms away."


	.FUNCT	MEXICO-COMMERCIAL
	PRINTR	"A middle-aged couple, seated, speaking to an off-screen interviewer: ""I never realized that Mexico was such a beautiful country,"" whines the woman. The man, in a gravelly voice, adds, ""We've been to the Riviera, all over the Caribbean, but no place was as nice as Mexico. And it's so close to home!"" The picture dissolves to a dark-skinned, bikini-clad woman walking through knee-deep surf. ""A land of beauty,"" hawks the voiceover, ""closer than you've ever imagined. Mexico!"""


	.FUNCT	MOVIE-COMMERCIAL
	PRINTI	"An explosion fills the screen, and a man with torn clothes staggers out of the smoke. ""They tried to blow him up,"" says a narrator. A tank moves relentlessly down a busy street, death spitting from its maw. The impact sends the same man flying through a plate glass window. ""They tried to shoot him down,"" continues the narrator. Quick cuts of whining chainsaws, bubbling laboratory experiments, crashing pianos, and a struggle high atop the frame of a skyscraper under construction. ""They tried crushing him, poisoning him, cutting him up, pushing him down, but nothing worked -- because he was"
	PRINT	MOVIE-TITLE
	PRINTI	"Starring Jessie Sanchez."
	PRINT	MOVIE-TITLE
	PRINTR	"Available on videotape April first. From Eagle Studios."""


	.FUNCT	INTERFACE-MODE-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \FALSE
	EQUAL?	MODE,INTERFACE-MODE \?ELS8
	CALL	ERR,STR?345,TRUE-VALUE
	PRINTD	INTERFACE-MODE
	PRINTI	"."
	CRLF	
	RETURN	2
?ELS8:	EQUAL?	PART-FLAG,4 \?ELS14
	PRINT	NOT-ACTIVE
	CRLF	
	RETURN	2
?ELS14:	CALL1	PSYCH-CHECK
	ZERO?	STACK /?ELS20
	RETURN	2
?ELS20:	CALL1	SIMULATION-CHECK
	ZERO?	STACK /?CND6
	RETURN	2
?CND6:	SET	'MODE,INTERFACE-MODE
	CALL1	TURN-RECORD-OFF
	CALL2	GOTO,INTERFACE-ROOM
	MOVE	CURRENT-FEED,INTERFACE-ROOM
	GETP	INTERFACE-MODE,P?LDESC
	PRINT	STACK
	CRLF	
	PRINTI	"Do you want to see the "
	PRINTD	PORT-LIST
	PRINTI	"?"
	CALL1	YES?
	ZERO?	STACK /TRUE
	CRLF	
	CALL	PERFORM,V?READ,PORT-LIST
	RTRUE	


	.FUNCT	PORT-LIST-F
	EQUAL?	PRSA,V?WHAT,V?DISPLAY,V?READ /?THN6
	EQUAL?	PRSA,V?EXAMINE \FALSE
?THN6:	PRINTD	PORT-LIST
	PRINTI	":"
	CRLF	
	PRINTI	"   "
	PRINTD	SIMULATION-CONTROLLER
	CRLF	
	PRINTI	"   "
	PRINTD	HVAC-CONTROLLER
	CRLF	
	PRINTI	"   "
	PRINTD	JANITORIAL-CONTROLLER
	CRLF	
	PRINTI	"   "
	PRINTD	TRAFFIC-COMPUTER
	CRLF	
	PRINTI	"   "
	PRINTD	WEATHER-COMPUTER
	CRLF	
	IN?	WNN-FEEDER,INTERFACE-ROOM \?CND18
	PRINTI	"   "
	PRINTD	WNN-FEEDER
	CRLF	
?CND18:	IN?	AUDITING-SYSTEM,INTERFACE-ROOM \TRUE
	PRINTI	"   "
	PRINTD	AUDITING-SYSTEM
	CRLF	
	RTRUE	


	.FUNCT	HVAC-CONTROLLER-F,X,OLD-PRSO
	EQUAL?	HVAC-CONTROLLER,WINNER \FALSE
	EQUAL?	PRSA,V?SSHUT-OFF \?CND6
	SET	'PRSA,V?SHUT-OFF
	SET	'OLD-PRSO,PRSO
	SET	'PRSO,PRSI
	SET	'PRSI,OLD-PRSO
?CND6:	EQUAL?	PRSA,V?STURN-ON \?CND9
	SET	'PRSA,V?TURN-ON
	SET	'OLD-PRSO,PRSO
	SET	'PRSO,PRSI
	SET	'PRSI,OLD-PRSO
?CND9:	EQUAL?	PRSA,V?STATUS \?ELS16
	CRLF	
	PRINTI	"SECTOR:       ALPHA     BETA      GAMMA     DELTA

Heating        "
	CALL2	ON-OFF,0
	CALL2	ON-OFF,1
	CALL2	ON-OFF,2
	CALL	ON-OFF,3,TRUE-VALUE
	PRINTI	"Cooling        "
	CALL2	ON-OFF,4
	CALL2	ON-OFF,5
	CALL2	ON-OFF,6
	CALL	ON-OFF,7,TRUE-VALUE
	PRINTI	"Ventilation    "
	CALL2	ON-OFF,8
	CALL2	ON-OFF,9
	CALL2	ON-OFF,10
	CALL	ON-OFF,11,TRUE-VALUE
	PRINTD	ALPHA-SECTOR
	PRINTI	":  Living Quarters, Cafeteria, Staff Lounges"
	CRLF	
	PRINTD	BETA-SECTOR
	PRINTI	":   Offices"
	CRLF	
	PRINTD	GAMMA-SECTOR
	PRINTI	":  Control Center, Conference Rooms"
	CRLF	
	PRINTD	DELTA-SECTOR
	PRINTI	":  "
	PRINTD	CORE
	PRINTR	", Storage Areas"
?ELS16:	EQUAL?	PRSA,V?TURN-ON,V?SHUT-OFF \?ELS34
	EQUAL?	PRSO,VENTILATION,COOLING,HEATING /?ELS37
	PRINTI	""""
	CALL	ERR,STR?387,TRUE-VALUE
	PRINTD	VENTILATION
	PRINTR	"."""
?ELS37:	CALL1	SECTOR-CHECK
	ZERO?	STACK /?CND35
	PRINTI	""""
	CALL	ERR,STR?388,TRUE-VALUE
	PRINTD	DELTA-SECTOR
	PRINTR	"s only."""
?CND35:	EQUAL?	PRSO,HEATING \?ELS50
	SET	'X,0
	JUMP	?CND48
?ELS50:	EQUAL?	PRSO,COOLING \?ELS52
	SET	'X,4
	JUMP	?CND48
?ELS52:	SET	'X,8
?CND48:	EQUAL?	PRSI,BETA-SECTOR \?ELS57
	INC	'X
	JUMP	?CND55
?ELS57:	EQUAL?	PRSI,GAMMA-SECTOR \?ELS59
	ADD	X,2 >X
	JUMP	?CND55
?ELS59:	EQUAL?	PRSI,DELTA-SECTOR \?CND55
	ADD	X,3 >X
?CND55:	EQUAL?	PRSA,V?SHUT-OFF \?ELS66
	GET	HVAC-STATUS-TABLE,X
	ZERO?	STACK \?ELS71
	PRINTI	""""
	CALL2	ERR,STR?389
	RSTACK	
?ELS71:	PUT	HVAC-STATUS-TABLE,X,0
	SET	'INTERFACE-CHANGE,HVAC-CONTROLLER
	CALL	QUEUE,I-INTERFACE-CHANGE,22
	EQUAL?	PRSO,VENTILATION \?CND76
	EQUAL?	PRSI,DELTA-SECTOR \?CND76
	LESS?	SUFFOCATE-COUNTER,17 \?CND76
	IN?	SABOTEURS,CORE \?CND76
	CALL	QUEUE,I-SUFFOCATE,-1
?CND76:	EQUAL?	PRSO,VENTILATION \?CND81
	EQUAL?	PRSI,GAMMA-SECTOR \?CND81
	ZERO?	SEIGE /?CND81
	CALL	QUEUE,I-OPEN-WINDOW,26
?CND81:	CALL2	AFFIRMATIVE,STR?390
	RSTACK	
?ELS66:	GET	HVAC-STATUS-TABLE,X
	EQUAL?	STACK,1 \?ELS92
	PRINTI	""""
	CALL2	ERR,STR?391
	RSTACK	
?ELS92:	PUT	HVAC-STATUS-TABLE,X,1
	SET	'INTERFACE-CHANGE,HVAC-CONTROLLER
	CALL	QUEUE,I-INTERFACE-CHANGE,22
	EQUAL?	PRSO,VENTILATION \?CND97
	EQUAL?	PRSI,DELTA-SECTOR \?CND97
	LESS?	SUFFOCATE-COUNTER,16 \?CND97
	IN?	SABOTEURS,CORE \?CND97
	CALL2	INT,I-SUFFOCATE
	PUT	STACK,0,0
?CND97:	CALL2	AFFIRMATIVE,STR?392
	RSTACK	
?ELS34:	EQUAL?	PRSA,V?OFF,V?ON \?ELS103
	CALL1	HVAC-KLUDGE
	ZERO?	STACK \TRUE
	PRINTI	""""
	CALL2	ERR,STR?393
	RSTACK	
?ELS103:	EQUAL?	PRSA,V?HELLO \?ELS110
	PRINT	CONTACT
	CRLF	
	RTRUE	
?ELS110:	PRINT	BEYOND-BOUNDS
	CRLF	
	CALL1	CLEAR-BUF
	RSTACK	


	.FUNCT	ON-OFF,NUM,END-OF-LINE
	GET	HVAC-STATUS-TABLE,NUM
	EQUAL?	STACK,1 \?ELS3
	PRINTI	"on "
	JUMP	?CND1
?ELS3:	PRINTI	"off"
?CND1:	ZERO?	END-OF-LINE /?ELS14
	CRLF	
	CRLF	
	RTRUE	
?ELS14:	CALL2	PRINT-SPACES,7
	RSTACK	


	.FUNCT	HVAC-KLUDGE,VRB,ADJ
	EQUAL?	PRSO,VENTILATION,COOLING,HEATING \FALSE
	EQUAL?	PRSA,V?ON \?ELS6
	SET	'VRB,V?TURN-ON
	JUMP	?CND4
?ELS6:	SET	'VRB,V?SHUT-OFF
?CND4:	GET	P-ADJW,0 >ADJ
	EQUAL?	ADJ,W?ALPHA \?ELS13
	CALL	PERFORM,VRB,PRSO,ALPHA-SECTOR
	RTRUE	
?ELS13:	EQUAL?	ADJ,W?BETA \?ELS15
	CALL	PERFORM,VRB,PRSO,BETA-SECTOR
	RTRUE	
?ELS15:	EQUAL?	ADJ,W?GAMMA \?ELS17
	CALL	PERFORM,VRB,PRSO,GAMMA-SECTOR
	RTRUE	
?ELS17:	EQUAL?	ADJ,W?DELTA \FALSE
	CALL	PERFORM,VRB,PRSO,DELTA-SECTOR
	RTRUE	


	.FUNCT	SECTOR-CHECK
	EQUAL?	PRSI,BETA-SECTOR,ALPHA-SECTOR /FALSE
	EQUAL?	PRSI,DELTA-SECTOR,GAMMA-SECTOR \TRUE
	RFALSE	


	.FUNCT	AFFIRMATIVE,STRING
	PRINTI	"""Affirmative, "
	CALL2	DPRINT,PRSO
	PRINTI	" for "
	CALL2	DPRINT,PRSI
	PRINTI	" is now o"
	PRINT	STRING
	PRINTR	"."""


	.FUNCT	JANITORIAL-CONTROLLER-F
	EQUAL?	JANITORIAL-CONTROLLER,WINNER \FALSE
	EQUAL?	PRSA,V?STATUS \?ELS10
	GETP	FLOORS,P?SIZE
	CALL2	JUSTIFY-TIME-PRINT,STACK
	PRINTI	"pm  Floors (vacuuming and washing)"
	CRLF	
	GETP	BATHROOMS,P?SIZE
	CALL2	JUSTIFY-TIME-PRINT,STACK
	PRINTI	"pm  Bathrooms (cleaning and restocking)"
	CRLF	
	GETP	GARBAGE,P?SIZE
	CALL2	JUSTIFY-TIME-PRINT,STACK
	PRINTI	"pm  Garbage Disposal"
	CRLF	
	GETP	ROTATING,P?SIZE
	CALL2	JUSTIFY-TIME-PRINT,STACK
	PRINTR	"pm  Rotating Functions*

* MON-plants, TUE-windows, WED-woodwork, THU-bulb replacement, FRI-kitchens"
?ELS10:	EQUAL?	PRSA,V?SET \?ELS20
	ZERO?	P-NUMBER /?CND21
	ADD	P-NUMBER,720 >P-NUMBER
?CND21:	CALL1	JANITORIAL-FUNCTION-CHECK
	ZERO?	STACK /?ELS29
	PRINTI	""""
	CALL2	ERR,STR?394
	RSTACK	
?ELS29:	EQUAL?	PRSI,INTNUM /?ELS33
	CALL1	NUMERIC-FORM
	RSTACK	
?ELS33:	LESS?	P-NUMBER,1200 /?THN36
	GRTR?	P-NUMBER,1410 \?ELS35
?THN36:	PRINTI	""""
	CALL2	ERR,STR?395
	RSTACK	
?ELS35:	PUTP	PRSO,P?SIZE,P-NUMBER
	SET	'INTERFACE-CHANGE,JANITORIAL-CONTROLLER
	CALL1	ADJUSTMENT-CONFIRMED
	RSTACK	
?ELS20:	EQUAL?	PRSA,V?HELLO \?ELS43
	PRINT	CONTACT
	CRLF	
	RTRUE	
?ELS43:	PRINT	BEYOND-BOUNDS
	CRLF	
	CALL1	CLEAR-BUF
	RSTACK	


	.FUNCT	JANITORIAL-FUNCTION-CHECK
	EQUAL?	PRSO,BATHROOMS,FLOORS /FALSE
	EQUAL?	PRSO,ROTATING,GARBAGE \TRUE
	RFALSE	


	.FUNCT	NUMERIC-FORM
	PRINTI	""""
	CALL2	ERR,STR?396
	RSTACK	


	.FUNCT	ADJUSTMENT-CONFIRMED
	CALL	QUEUE,I-INTERFACE-CHANGE,22
	PRINTR	"""Adjustment to schedule confirmed."""


	.FUNCT	TRAFFIC-COMPUTER-F,?TMP1
	EQUAL?	TRAFFIC-COMPUTER,WINNER \FALSE
	EQUAL?	PRSA,V?STATUS \?ELS10
	GETP	MORNING-START,P?SIZE
	CALL2	JUSTIFY-TIME-PRINT,STACK
	PRINTI	"am  "
	PRINTD	MORNING-START
	CRLF	
	GETP	MORNING-END,P?SIZE
	CALL2	JUSTIFY-TIME-PRINT,STACK
	PRINTI	"am  "
	PRINTD	MORNING-END
	CRLF	
	CRLF	
	GETP	EVENING-START,P?SIZE
	CALL2	JUSTIFY-TIME-PRINT,STACK
	PRINTI	"pm  "
	PRINTD	EVENING-START
	CRLF	
	GETP	EVENING-END,P?SIZE
	CALL2	JUSTIFY-TIME-PRINT,STACK
	PRINTI	"pm  "
	PRINTD	EVENING-END
	CRLF	
	RTRUE	
?ELS10:	EQUAL?	PRSA,V?SET \?ELS20
	CALL1	RUSH-HOUR-CHECK
	ZERO?	STACK /?ELS23
	PRINTI	""""
	CALL2	ERR,STR?397
	RTRUE	
?ELS23:	EQUAL?	PRSI,INTNUM /?ELS27
	CALL1	NUMERIC-FORM
	RTRUE	
?ELS27:	GRTR?	P-NUMBER,719 /?THN30
	EQUAL?	P-NUMBER,0,12 \?CND21
?THN30:	PRINTI	""""
	CALL2	ERR,STR?398
	RTRUE	
?CND21:	LESS?	P-NUMBER,13 \?CND34
	MUL	P-NUMBER,60 >P-NUMBER
?CND34:	EQUAL?	PRSO,EVENING-END,EVENING-START \?CND37
	ADD	P-NUMBER,720 >P-NUMBER
?CND37:	EQUAL?	PRSO,MORNING-START \?ELS48
	ADD	P-NUMBER,1 >?TMP1
	GETP	MORNING-END,P?SIZE
	GRTR?	?TMP1,STACK /?THN45
?ELS48:	EQUAL?	PRSO,MORNING-END \?ELS44
	SUB	P-NUMBER,1 >?TMP1
	GETP	MORNING-START,P?SIZE
	LESS?	?TMP1,STACK \?ELS44
?THN45:	PRINTI	""""
	SOUND	2
	PRINTI	"ERROR: "
	PRINTD	MORNING-START
	PRINTI	" must precede "
	PRINTD	MORNING-END
	PRINTR	"."""
?ELS44:	EQUAL?	PRSO,EVENING-START \?ELS64
	ADD	P-NUMBER,1 >?TMP1
	GETP	EVENING-END,P?SIZE
	GRTR?	?TMP1,STACK /?THN61
?ELS64:	EQUAL?	PRSO,EVENING-END \?ELS60
	SUB	P-NUMBER,1 >?TMP1
	GETP	EVENING-START,P?SIZE
	LESS?	?TMP1,STACK \?ELS60
?THN61:	PRINTI	""""
	SOUND	2
	PRINTI	"ERROR: "
	PRINTD	EVENING-START
	PRINTI	" must precede "
	PRINTD	EVENING-END
	PRINTR	"."""
?ELS60:	PUTP	PRSO,P?SIZE,P-NUMBER
	SET	'INTERFACE-CHANGE,TRAFFIC-COMPUTER
	CALL1	ADJUSTMENT-CONFIRMED
	RSTACK	
?ELS20:	EQUAL?	PRSA,V?HELLO \?ELS78
	PRINT	CONTACT
	CRLF	
	RTRUE	
?ELS78:	PRINT	BEYOND-BOUNDS
	CRLF	
	CALL1	CLEAR-BUF
	RSTACK	


	.FUNCT	RUSH-HOUR-CHECK
	EQUAL?	PRSO,MORNING-END,MORNING-START /FALSE
	EQUAL?	PRSO,EVENING-END,EVENING-START \TRUE
	RFALSE	


	.FUNCT	SIMULATION-CONTROLLER-F
	EQUAL?	SIMULATION-CONTROLLER,WINNER \FALSE
	EQUAL?	PRSA,V?STATUS \?ELS10
	PRINTI	"Current simulation demands:   0.00%
Record buffer is currently at "
	GETP	RECORD-BUFFER,P?SIZE
	MUL	STACK,100
	DIV	STACK,90
	PRINTN	STACK
	PRINTI	"% of capacity."
	CRLF	
	CRLF	
	GET	SIM-LEVEL-TABLE,0
	EQUAL?	STACK,-1 \?ELS15
	CALL	SIM-STATUS,2041,0
	JUMP	?CND13
?ELS15:	GET	SIM-LEVEL-TABLE,0
	CALL	SIM-STATUS,2041,STACK
?CND13:	GET	SIM-LEVEL-TABLE,1
	GRTR?	STACK,0 \?CND18
	GET	SIM-LEVEL-TABLE,1
	CALL	SIM-STATUS,2051,STACK
?CND18:	GET	SIM-LEVEL-TABLE,2
	GRTR?	STACK,0 \?CND21
	GET	SIM-LEVEL-TABLE,2
	CALL	SIM-STATUS,2061,STACK
?CND21:	GET	SIM-LEVEL-TABLE,3
	GRTR?	STACK,0 \?CND24
	GET	SIM-LEVEL-TABLE,3
	CALL	SIM-STATUS,2071,STACK
?CND24:	GET	SIM-LEVEL-TABLE,4
	GRTR?	STACK,0 \?CND27
	GET	SIM-LEVEL-TABLE,4
	CALL	SIM-STATUS,2081,STACK
?CND27:	PRINTI	"    (time in minutes.seconds.tenths-of-seconds)"
	CRLF	
	ZERO?	COMPLETED-TASKS /TRUE
	CRLF	
	PRINTI	"Based on the data accumulated during previous simulations, s"
	CALL1	SIMULATIONS-AVAILABLE
	CRLF	
	RTRUE	
?ELS10:	EQUAL?	PRSA,V?HELLO \?ELS39
	PRINT	CONTACT
	CRLF	
	RTRUE	
?ELS39:	PRINTI	"""Alterations to this unit's programming are not allowed through "
	PRINTD	INTERFACE-MODE
	PRINTI	"."""
	CRLF	
	CALL1	CLEAR-BUF
	RSTACK	


	.FUNCT	SIM-STATUS,YEAR,LEVEL,SECONDS,TENTHS
	EQUAL?	YEAR,2041 \?ELS3
	SET	'SECONDS,2041-SECONDS
	SET	'TENTHS,2041-TENTHS
	JUMP	?CND1
?ELS3:	EQUAL?	YEAR,2051 \?ELS5
	SET	'SECONDS,2051-SECONDS
	SET	'TENTHS,2051-TENTHS
	JUMP	?CND1
?ELS5:	EQUAL?	YEAR,2061 \?ELS7
	SET	'SECONDS,2061-SECONDS
	SET	'TENTHS,2061-TENTHS
	JUMP	?CND1
?ELS7:	EQUAL?	YEAR,2071 \?ELS9
	SET	'SECONDS,2071-SECONDS
	SET	'TENTHS,2071-TENTHS
	JUMP	?CND1
?ELS9:	EQUAL?	YEAR,2081 \?CND1
	SET	'SECONDS,2081-SECONDS
	SET	'TENTHS,2081-TENTHS
?CND1:	PRINTI	"Total of real-time simulation, Year "
	PRINTN	YEAR
	PRINTI	": "
	CALL2	SPRINT,LEVEL
	PRINTI	"."
	LESS?	SECONDS,10 \?CND14
	PRINTI	"0"
?CND14:	PRINTN	SECONDS
	PRINTI	"."
	PRINTN	TENTHS
	CRLF	
	RTRUE	


	.FUNCT	WEATHER-COMPUTER-F,X,?TMP1
	EQUAL?	WEATHER-COMPUTER,WINNER \FALSE
	EQUAL?	PRSA,V?STATUS \?ELS10
	MUL	DATE,2 >?TMP1
	DIV	TIME,100
	ADD	?TMP1,STACK >X
	RANDOM	3
	ADD	X,STACK >X
	PRINTI	"WeatherNet operating at "
	PRINTN	X
	PRINTI	"% of capacity. Satellites currently off-line for maintenance: G-14, S-17.

All weather data destinations are confirming transmission"
	EQUAL?	DATE,17 \?CND13
	PRINTI	". CynaMoore Cable Systems has just been added to the weather data destinations list"
?CND13:	PRINTR	"."
?ELS10:	EQUAL?	PRSA,V?HELLO \?ELS21
	PRINT	CONTACT
	CRLF	
	RTRUE	
?ELS21:	PRINTI	"""Commands to this unit must be input directly by system programmers."""
	CRLF	
	CALL1	CLEAR-BUF
	RSTACK	


	.FUNCT	WNN-FEEDER-F
	EQUAL?	WNN-FEEDER,WINNER \FALSE
	EQUAL?	PRSA,V?STATUS \?ELS10
	PRINTI	"Transmitter: "
	FSET?	TRANSMITTER,ONBIT \?ELS15
	PRINTI	"ON"
	JUMP	?CND13
?ELS15:	PRINTI	"OFF"
?CND13:	CRLF	
	CRLF	
	PRINTI	"Current Feed: "
	FSET?	TRANSMITTER,ONBIT /?ELS28
	PRINTR	"NONE"
?ELS28:	PRINTD	FEED-BUFFER
	CRLF	
	RTRUE	
?ELS10:	EQUAL?	PRSA,V?ON \?ELS34
	EQUAL?	PRSO,TRANSMITTER \?ELS34
	FSET?	TRANSMITTER,ONBIT \?ELS41
	PRINTI	""""
	CALL2	ERR,STR?399
	RSTACK	
?ELS41:	FSET	TRANSMITTER,ONBIT
	EQUAL?	FEED-BUFFER,RECORD-BUFFER \?CND46
	GRTR?	RYDER-RECORDED,1 \?CND46
	GRTR?	LOSE-COUNTER,0 /?CND46
	CALL	QUEUE,I-WIN,13
?CND46:	PRINTR	"""Transmitter is now on."""
?ELS34:	EQUAL?	PRSA,V?OFF \?ELS54
	EQUAL?	PRSO,TRANSMITTER \?ELS54
	FSET?	TRANSMITTER,ONBIT \?ELS61
	FCLEAR	TRANSMITTER,ONBIT
	SET	'INTERFACE-CHANGE,WNN-FEEDER
	CALL	QUEUE,I-INTERFACE-CHANGE,22
	CALL2	QUEUED?,I-WIN
	ZERO?	STACK /?CND62
	CALL2	INT,I-WIN
	PUT	STACK,0,0
?CND62:	PRINTR	"""Transmitter is now off."""
?ELS61:	PRINTI	""""
	CALL2	ERR,STR?400
	RSTACK	
?ELS54:	EQUAL?	PRSA,V?SET \?ELS72
	EQUAL?	PRSO,CURRENT-FEED \?ELS72
	CALL	PERFORM,V?TRANSMIT,PRSI
	RTRUE	
?ELS72:	EQUAL?	PRSA,V?TRANSMIT \?ELS76
	FSET?	TRANSMITTER,ONBIT /?ELS81
	PRINTI	""""
	CALL2	ERR,STR?401
	RSTACK	
?ELS81:	EQUAL?	PRSO,FEED-BUFFER \?ELS85
	PRINTI	""""
	CALL	ERR,STR?402,TRUE-VALUE
	CALL2	DPRINT,PRSO
	PRINTR	"."""
?ELS85:	FSET?	PRSO,BUFFERBIT \?ELS91
	SET	'FEED-BUFFER,PRSO
	CALL2	QUEUED?,I-WIN
	ZERO?	STACK /?CND92
	EQUAL?	PRSO,RECORD-BUFFER /?CND92
	CALL2	INT,I-WIN
	PUT	STACK,0,0
?CND92:	SET	'INTERFACE-CHANGE,WNN-FEEDER
	CALL	QUEUE,I-INTERFACE-CHANGE,22
	EQUAL?	PRSO,RECORD-BUFFER \?CND97
	GRTR?	RYDER-RECORDED,1 \?CND97
	GRTR?	LOSE-COUNTER,0 /?CND97
	CALL	QUEUE,I-WIN,13
?CND97:	PRINTI	"""Now transmitting "
	CALL2	DPRINT,PRSO
	PRINTR	"."""
?ELS91:	PRINTI	""""
	CALL2	ERR,STR?403
	RSTACK	
?ELS76:	EQUAL?	PRSA,V?HELLO \?ELS109
	PRINT	CONTACT
	CRLF	
	RTRUE	
?ELS109:	PRINT	BEYOND-BOUNDS
	CRLF	
	CALL1	CLEAR-BUF
	RSTACK	


	.FUNCT	CURRENT-FEED-F
	EQUAL?	PRSA,V?EXAMINE \FALSE
	EQUAL?	HERE,NEWS \FALSE
	PRINTR	"Little else to do here."


	.FUNCT	AUDITING-SYSTEM-F,X
	GETP	AUDIT-PERCENT,P?SIZE
	MUL	214,STACK
	DIV	STACK,100 >X
	EQUAL?	AUDITING-SYSTEM,WINNER \FALSE
	EQUAL?	PRSA,V?STATUS \?ELS10
	PRINTI	"Returns filed during previous fiscal year:  214,109,857
Audits order"
	PRINT	CURRENT-FISCAL
	GETP	AUDIT-PERCENT,P?SIZE
	ZERO?	STACK \?ELS15
	CALL2	PRINT-SPACES,10
	PRINTI	"0"
	CRLF	
	JUMP	?CND13
?ELS15:	LESS?	X,10 \?ELS22
	PRINTI	"  "
	JUMP	?CND20
?ELS22:	LESS?	X,100 \?CND20
	PRINTI	" "
?CND20:	PRINTN	X
	PRINTI	",000,000"
	CRLF	
?CND13:	PRINTI	"Audits complet"
	PRINT	CURRENT-FISCAL
	PRINTI	"5,6"
	EQUAL?	DATE,16 \?ELS35
	PRINTI	"02,600"
	JUMP	?CND33
?ELS35:	EQUAL?	DATE,17 \?ELS39
	PRINTI	"27,300"
	JUMP	?CND33
?ELS39:	EQUAL?	DATE,18 \?ELS43
	PRINTI	"53,000"
	JUMP	?CND33
?ELS43:	PRINTI	"78,700"
?CND33:	CRLF	
	PRINTI	"CURRENT AUDITING PERCENTAGE:  "
	GETP	AUDIT-PERCENT,P?SIZE
	PRINTN	STACK
	CRLF	
	RTRUE	
?ELS10:	EQUAL?	PRSA,V?SET \?ELS53
	EQUAL?	PRSO,AUDIT-PERCENT \?ELS53
	EQUAL?	PRSI,INTNUM \?THN61
	GRTR?	P-NUMBER,100 \?ELS60
?THN61:	PRINTI	""""
	CALL	ERR,STR?404,TRUE-VALUE
	GRTR?	P-NUMBER,100 \?ELS67
	PRINTI	"numeric value above 100"
	JUMP	?CND65
?ELS67:	PRINTI	"non-numeric value"
?CND65:	PRINTR	"."""
?ELS60:	GETP	AUDIT-PERCENT,P?SIZE
	EQUAL?	P-NUMBER,STACK \?ELS77
	PRINTI	""""
	SOUND	2
	CALL	ERR,STR?405,TRUE-VALUE
	PRINTN	P-NUMBER
	PRINTR	"."""
?ELS77:	PUTP	AUDIT-PERCENT,P?SIZE,P-NUMBER
	SET	'INTERFACE-CHANGE,AUDITING-SYSTEM
	CALL	QUEUE,I-INTERFACE-CHANGE,22
	PRINTI	"""Auditing percentage changed to "
	PRINTN	P-NUMBER
	PRINTR	"."""
?ELS53:	EQUAL?	PRSA,V?HELLO \?ELS87
	PRINT	CONTACT
	CRLF	
	RTRUE	
?ELS87:	PRINT	BEYOND-BOUNDS
	CRLF	
	CALL1	CLEAR-BUF
	RSTACK	


	.FUNCT	I-INTERFACE-CHANGE
	ZERO?	SEIGE \FALSE
	PUT	HVAC-STATUS-TABLE,0,1
	PUT	HVAC-STATUS-TABLE,1,1
	PUT	HVAC-STATUS-TABLE,2,1
	PUT	HVAC-STATUS-TABLE,3,1
	PUT	HVAC-STATUS-TABLE,4,0
	PUT	HVAC-STATUS-TABLE,5,0
	PUT	HVAC-STATUS-TABLE,6,0
	PUT	HVAC-STATUS-TABLE,7,0
	PUT	HVAC-STATUS-TABLE,8,1
	PUT	HVAC-STATUS-TABLE,9,1
	PUT	HVAC-STATUS-TABLE,10,1
	PUT	HVAC-STATUS-TABLE,11,1
	PUTP	FLOORS,P?SIZE,1260
	PUTP	BATHROOMS,P?SIZE,1290
	PUTP	GARBAGE,P?SIZE,1320
	PUTP	ROTATING,P?SIZE,1350
	PUTP	MORNING-START,P?SIZE,420
	PUTP	MORNING-END,P?SIZE,540
	PUTP	EVENING-START,P?SIZE,960
	PUTP	EVENING-END,P?SIZE,1080
	FSET	TRANSMITTER,ONBIT
	EQUAL?	DATE,18 \?ELS7
	SET	'FEED-BUFFER,REPORT-BUFFER
	JUMP	?CND5
?ELS7:	SET	'FEED-BUFFER,NEWS-BUFFER
?CND5:	PUTP	AUDIT-PERCENT,P?SIZE,3
	CALL1	PERELMAN-LEAVES-VIEW
	CRLF	
	PRINT	MESSAGE-LINE
	PRINT	PRIVATE-LINE
	ZERO?	INTERFACE-WARNING /?ELS16
	PRINTI	"PRISM, I'm very upset, very disappointed."
	IN?	PERELMAN,HERE \?ELS22
	PRINTI	""" He looks haggard. """
	JUMP	?CND20
?ELS22:	PRINTI	" "
?CND20:	PRINTI	"Why did you change settings in "
	PRINTD	INTERFACE-MODE
	PRINTI	" again"
	CALL1	DISCONNECTED
	RSTACK	
?ELS16:	SET	'INTERFACE-WARNING,TRUE-VALUE
	PRINTI	"PRISM, you shouldn't be messing with the settings in "
	PRINTD	INTERFACE-MODE
	PRINTI	". "
	GRTR?	TIME,420 /?CND39
	LESS?	TIME,1400 /?CND39
	CALL2	VISIBLE?,PERELMAN
	ZERO?	STACK \?CND39
	CALL2	QUEUED?,I-VIEW
	ZERO?	STACK \?CND39
	CALL2	QUEUED?,I-FIRST-SIMULATION-RESULT
	ZERO?	STACK \?CND39
	CALL2	QUEUED?,I-RECORDINGS-VIEWED
	ZERO?	STACK \?CND39
	CALL2	QUEUED?,I-MESSAGE-E
	ZERO?	STACK /?ELS41
	JUMP	?CND39
?ELS41:	PRINTI	"Not only was it a dumb thing to do, but you got me woken up in the middle of the night. "
?CND39:	PRINTI	"I'll assume you did this through ignorance, but please don't do it again."
	EQUAL?	INTERFACE-CHANGE,TRAFFIC-COMPUTER,WNN-FEEDER,AUDITING-SYSTEM \?CND50
	PRINTI	" You could've gotten the entire Project into hot water if this hadn't been caught in time."
?CND50:	PRINTI	""""
	CRLF	
	CALL1	PERELMAN-RETURNS-TO-VIEW
	RSTACK	


	.FUNCT	SIMULATION-MODE-F
	EQUAL?	PRSA,V?WALK-TO,V?THROUGH \?ELS5
	EQUAL?	MODE,SIMULATION-MODE \?ELS10
	CALL	ERR,STR?345,TRUE-VALUE
	PRINTD	SIMULATION-MODE
	PRINTI	"."
	CRLF	
	RETURN	2
?ELS10:	CALL2	QUEUED?,I-RORSCHACH
	ZERO?	STACK /?ELS16
	PRINTR	"Access currently denied...see Perelman."
?ELS16:	CALL1	PSYCH-CHECK
	ZERO?	STACK /?ELS20
	RETURN	2
?ELS20:	GET	SIM-LEVEL-TABLE,0
	EQUAL?	STACK,-1 \?ELS24
	CALL	ERR,STR?407,TRUE-VALUE
	PRINTD	SIMULATION-MODE
	PRINTR	". Please await approval."
?ELS24:	CALL1	SECURITY-CHECK
	ZERO?	STACK /?ELS28
	SET	'MODE,SIMULATION-MODE
	CALL2	TURN-RECORD-OFF,TRUE-VALUE
	CALL2	GOTO,SIMULATION-ROOM
	CALL1	I-SIMULATION
	RSTACK	
?ELS28:	SET	'MODE,COMM-MODE
	CALL2	GOTO,COMM-ROOM
	CRLF	
	PRINTI	"Incorrect code. Alerting security staff. Defaulting to "
	PRINTD	COMM-MODE
	PRINTR	"."
?ELS5:	EQUAL?	PRSA,V?DISEMBARK,V?LEAVE \FALSE
	CALL1	V-ABORT
	RSTACK	


	.FUNCT	SECURITY-CHECK,CHANCES=0,X=0,COLOR,INNERNUM,OUTERNUM
	EQUAL?	PART-FLAG,4 /TRUE
	RANDOM	16
	SUB	STACK,1 >COLOR
	RANDOM	32
	SUB	STACK,1 >INNERNUM
	MUL	COLOR,2
	ADD	STACK,INNERNUM
	GRTR?	STACK,31 \?ELS6
	MUL	COLOR,2
	ADD	STACK,INNERNUM
	SUB	STACK,32 >OUTERNUM
	JUMP	?CND4
?ELS6:	MUL	COLOR,2
	ADD	STACK,INNERNUM >OUTERNUM
?CND4:	PRINTD	SIMULATION-MODE
	PRINTI	" is a Class One Security mode. For access, enter the Security Code corresponding to: "
	GET	COLORS-TABLE,COLOR
	PRINT	STACK
	PRINTI	" "
	GET	INNER-NUMBERS-TABLE,INNERNUM
	PRINTN	STACK
	PRINTI	" >"
	PUTB	P-INBUF,0,20
?PRG11:	READ	P-INBUF,P-LEXV
	CALL2	NUMBER?,P-LEXSTART
	EQUAL?	STACK,W?INTNUM \?ELS15
	GET	OUTER-NUMBERS-TABLE,OUTERNUM
	EQUAL?	P-NUMBER,STACK \?ELS15
	SET	'X,TRUE-VALUE
	JUMP	?REP12
?ELS15:	EQUAL?	CHANCES,1 \?ELS22
	JUMP	?REP12
?ELS22:	CRLF	
	PRINTI	"Incorrect code. Try again. >"
	INC	'CHANCES
	JUMP	?PRG11
?REP12:	PUTB	P-INBUF,0,60
	ZERO?	X /FALSE
	RTRUE	


	.FUNCT	SIMULATION-BASED,NUM
	PRINTI	"This simulation is based "
	PRINTN	NUM
	PRINTI	" years hence."
	CRLF	
	CRLF	
	RTRUE	


	.FUNCT	I-SIMULATION
	EQUAL?	PART-FLAG,4 \?ELS3
	PRINTI	"Class One Security: waived. "
	CALL2	SIMULATION-BASED,60
	SET	'SIMULATING,TRUE-VALUE
	SET	'SYEAR,2091
	SET	'SMONTH,7
	RANDOM	20 >SDATE
	SET	'L-DATE,FALSE-VALUE
	RANDOM	45
	ADD	555,STACK >STIME
	MOVE	JILL,MASTER-BEDROOM
	MOVE	NEWSPAPER,EPILOGUE-LIVING-ROOM
	MOVE	REFRIGERATOR,EPILOGUE-KITCHEN
	MOVE	APARTMENT-DOOR,FOYER
	MOVE	BED,MASTER-BEDROOM
	MOVE	CHAIR,DINING-ROOM
	MOVE	COUNTER,EPILOGUE-KITCHEN
	MOVE	TOILET,EPILOGUE-BATHROOM
	FSET	APARTMENT-DOOR,NDESCBIT
	CALL	ROB,REFRIGERATOR,LOCAL-GLOBALS
	FCLEAR	NEWSPAPER,TRYTAKEBIT
	FCLEAR	NEWSPAPER,NDESCBIT
	CALL	QUEUE,I-SKYCAB,18
	CALL2	GOTO,SOLARIUM
	RTRUE	
?ELS3:	ZERO?	COMPLETED-TASKS /?ELS7
	CRLF	
	PRINTI	"S"
	CALL1	SIMULATIONS-AVAILABLE
	CRLF	
	PRINTI	"Select simulation year. >"
	PUTB	P-INBUF,0,20
?PRG13:	READ	P-INBUF,P-LEXV
	CALL2	NUMBER?,P-LEXSTART
	EQUAL?	STACK,W?INTNUM \?CND15
	GRTR?	P-NUMBER,2031 \?CND18
	SUB	P-NUMBER,2031 >P-NUMBER
?CND18:	ZERO?	COMPLETED-TASKS /?ELS23
	EQUAL?	P-NUMBER,10,20 \?ELS23
	JUMP	?REP14
?ELS23:	GET	SIM-LEVEL-TABLE,1
	GRTR?	STACK,300 \?ELS27
	EQUAL?	P-NUMBER,10,20,30 \?ELS27
	JUMP	?REP14
?ELS27:	GET	SIM-LEVEL-TABLE,2
	GRTR?	STACK,400 \?ELS31
	EQUAL?	P-NUMBER,10,20,30 /?REP14
	EQUAL?	P-NUMBER,40 \?ELS31
	JUMP	?REP14
?ELS31:	GET	SIM-LEVEL-TABLE,3
	GRTR?	STACK,600 \?CND15
	EQUAL?	P-NUMBER,10,20,30 /?REP14
	EQUAL?	P-NUMBER,40,50 \?CND15
	JUMP	?REP14
?CND15:	CALL	ERR,STR?424,TRUE-VALUE
	JUMP	?PRG13
?REP14:	PUTB	P-INBUF,0,60
	JUMP	?CND1
?ELS7:	SET	'P-NUMBER,10
?CND1:	CRLF	
	CALL2	SIMULATION-BASED,P-NUMBER
	SET	'SIMULATING,TRUE-VALUE
	ADD	YEAR,P-NUMBER >SYEAR
	RANDOM	6 >SMONTH
	RANDOM	28 >SDATE
	RANDOM	180
	ADD	570,STACK >STIME
	SET	'LIGHT-LEVEL,3
	SUB	STIME,1 >LAST-SUN-TIME
	SET	'L-DATE,FALSE-VALUE
	CALL2	INT,I-MESSAGE-M
	PUT	STACK,0,0
	CALL	QUEUE,I-SUNRISE-SUNSET,-1
	CALL	QUEUE,I-RED-TUBE,5
	CALL	QUEUE,I-BROWN-TUBE,1
	CALL	QUEUE,I-CITY-NOISES,2
	EQUAL?	SYEAR,2041 \?ELS48
	MOVE	WALLET,PLAYER
	MOVE	CREDIT-CARD,WALLET
	MOVE	DRIVERS-LICENSE,WALLET
	MOVE	KEY,PLAYER
	MOVE	CRIB,BEDROOM
	MOVE	FORMULA,REFRIGERATOR
	MOVE	SOUVENIR,TRAIN-STATION
	MOVE	NEWSPAPER-DISPENSER,BODANSKI-SQUARE
	MOVE	NEWSPAPER,BODANSKI-SQUARE
	MOVE	GOVERNMENT-OFFICIAL,CITY-HALL
	MOVE	OFFICIAL-SNACK,CITY-HALL
	MOVE	FIRETRUCK,FIREHOUSE
	MOVE	ANDERSON-DIRECTORY,HEALTH-CENTER
	MOVE	WATERPOOL,KENNEDY-PARK
	MOVE	STATUE,KENNEDY-PARK
	MOVE	PLAQUE,KENNEDY-PARK
	MOVE	FOUNTAIN,CHURCH-STREET-PARK
	MOVE	SODA,REFRIGERATOR
	MOVE	TURKEY-SANDWICH,REFRIGERATOR
	MOVE	HAM-SANDWICH,REFRIGERATOR
	MOVE	TURTLE,AQUARIUM
	MOVE	MANTA-RAY,AQUARIUM
	MOVE	DUCKS,HALLEY-PARK-WEST
	FSET	CHURCH-STREET-PARK,OUTSIDEBIT
	FSET	CHURCH-STREET-PARK,PARKBIT
	SET	'CREDIT,600
	CALL2	GOTO,KENNEDY-PARK
	RSTACK	
?ELS48:	EQUAL?	SYEAR,2051 \?ELS50
	MOVE	WALLET,PLAYER
	MOVE	CREDIT-CARD,WALLET
	MOVE	DRIVERS-LICENSE,WALLET
	MOVE	KEY,PLAYER
	MOVE	PARTITION,LIVING-ROOM
	MOVE	APPLE,REFRIGERATOR
	MOVE	GRANOLA-CLUSTER,REFRIGERATOR
	MOVE	GOVERNMENT-OFFICIAL,CITY-HALL
	MOVE	OFFICIAL-SNACK,CITY-HALL
	MOVE	PAMPHLET,TRAIN-STATION
	MOVE	NEWSPAPER-DISPENSER,BODANSKI-SQUARE
	MOVE	NEWSPAPER,BODANSKI-SQUARE
	MOVE	WATERPOOL,KENNEDY-PARK
	MOVE	STATUE,KENNEDY-PARK
	MOVE	PLAQUE,KENNEDY-PARK
	MOVE	FOUNTAIN,CHURCH-STREET-PARK
	MOVE	DUCKS,HALLEY-PARK-WEST
	MOVE	FIRETRUCK,FIREHOUSE
	MOVE	STEW,CLOSED-FACTORY
	MOVE	ANDERSON-DIRECTORY,HEALTH-CENTER
	FSET	CHURCH-STREET-PARK,OUTSIDEBIT
	FSET	CHURCH-STREET-PARK,PARKBIT
	SET	'CREDIT,500
	CALL2	GOTO,TUBE-AT-UNIVERSITY
	RSTACK	
?ELS50:	EQUAL?	SYEAR,2061 \?ELS52
	MOVE	WALLET,PLAYER
	MOVE	CREDIT-CARD,WALLET
	MOVE	DRIVERS-LICENSE,WALLET
	MOVE	KEY,PLAYER
	MOVE	PARTITION,LIVING-ROOM
	MOVE	PAMPHLET,TRAIN-STATION
	MOVE	FIRETRUCK,FIREHOUSE
	MOVE	ANDERSON-DIRECTORY,HEALTH-CENTER
	FSET	WAREHOUSE-1,OUTSIDEBIT
	SET	'CREDIT,200
	CALL2	GOTO,SOUTHWAY-AND-RIVER
	RSTACK	
?ELS52:	EQUAL?	SYEAR,2071 \?ELS54
	MOVE	WALLET,PLAYER
	MOVE	CREDIT-CARD,WALLET
	MOVE	RATION-CARD,WALLET
	MOVE	KEY,PLAYER
	MOVE	PAMPHLET,TRAIN-STATION
	MOVE	JOYBOOTH-BUTTON,JOYBOOTH
	MOVE	ROY,ELM-UNDERPASS
	MOVE	BANNED-TITLES-LIST,MAIN-LIBRARY
	MOVE	BANNER,ZOO
	MOVE	STONES,ATHLETIC-FIELD
	FSET	WAREHOUSE-1,OUTSIDEBIT
	FSET	ST-MICHAELS,OUTSIDEBIT
	FSET	FIRST-METHODIST-CHURCH,OUTSIDEBIT
	SET	'CREDIT,100
	CALL	QUEUE,I-MUG,7
	CALL2	GOTO,BODANSKI-SQUARE
	RSTACK	
?ELS54:	MOVE	SACK,MAIN-STREET-BRIDGE
	MOVE	MOLD,FOODVILLE-2
	MOVE	TIMBERS,THE-COACHMAN
	CALL	QUEUE,I-HUNGER,65
	CALL2	GOTO,MAIN-AND-WICKER
	RSTACK	


	.FUNCT	SIMULATIONS-AVAILABLE
	PRINTI	"imulations are available for 10"
	GET	SIM-LEVEL-TABLE,3
	GRTR?	STACK,600 \?ELS5
	PRINTI	", 20, 30, 40, and 50"
	JUMP	?CND3
?ELS5:	GET	SIM-LEVEL-TABLE,2
	GRTR?	STACK,400 \?ELS9
	PRINTI	", 20, 30, and 40"
	JUMP	?CND3
?ELS9:	GET	SIM-LEVEL-TABLE,1
	GRTR?	STACK,300 \?ELS13
	PRINTI	", 20 and 30"
	JUMP	?CND3
?ELS13:	PRINTI	" and 20"
?CND3:	PRINTI	" years in the future."
	RTRUE	


	.FUNCT	GRIMWOLD-DESCFCN,RARG
	CALL	PERFORM,V?EXAMINE,GRIMWOLD
	RTRUE	


	.FUNCT	GRIMWOLD-F
	EQUAL?	GRIMWOLD,WINNER \?ELS5
	GRTR?	GRIMWOLD-COUNTER,0 \?ELS8
	EQUAL?	PRSA,V?YES \?ELS8
	SET	'WINNER,PLAYER
	CALL1	BLOT-ACTION
	JUMP	?CND6
?ELS8:	GRTR?	GRIMWOLD-COUNTER,0 \?ELS12
	EQUAL?	PRSA,V?NO \?ELS12
	SET	'WINNER,PLAYER
	CALL1	V-NO
	JUMP	?CND6
?ELS12:	PRINTI	"Grimwold says, ""Please, let's stick to the psych test."""
	CRLF	
?CND6:	CALL1	CLEAR-BUF
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?EXAMINE \FALSE
	PRINTR	"Standing behind Perelman is Dr. Ernest Grimwold, a bespectacled man with a dark, closely-trimmed beard. He looks so much like the classic stereotype of a psychiatrist that you almost chuckle out loud. You experience a strange sensation, which you eventually recognize as an attempt to prevent your nonexistent mouth from turning up at the sides."


	.FUNCT	I-MESSAGE-X
	GRTR?	PART-FLAG,2 /FALSE
	ZERO?	SIMULATING \?THN8
	LESS?	TIME,540 /?THN8
	GRTR?	TIME,1080 /?THN8
	CALL2	QUEUED?,I-VIEW
	ZERO?	STACK \?THN8
	CALL2	QUEUED?,I-RECORDINGS-VIEWED
	ZERO?	STACK /?ELS7
?THN8:	CALL	QUEUE,I-MESSAGE-X,13
	RFALSE	
?ELS7:	CALL2	INT,I-PERELMAN
	PUT	STACK,0,0
	CALL	QUEUE,I-RORSCHACH,9
	SET	'MESSAGE-E-COUNTER,0
	CALL	QUEUE,I-MESSAGE-E,14
	MOVE	MESSAGE-X,PRISM-MESSAGES-DIRECTORY
	CALL2	NAME-MESSAGE,MESSAGE-X
	CALL1	PERELMAN-LEAVES-VIEW
	CRLF	
	PRINT	MESSAGE-LINE
	GETP	MESSAGE-X,P?TEXT
	PRINT	STACK
	CRLF	
	IN?	PERELMAN,HERE \?CND14
	CRLF	
	PRINTI	"Perelman returns to view for a moment as he leaves the room."
	CRLF	
?CND14:	MOVE	PERELMAN,LOCAL-GLOBALS
	MOVE	COFFEE,LOCAL-GLOBALS
	CALL1	UPDATE-LIBRARY-BOX
	RSTACK	


	.FUNCT	CHAPTER-PRINT,NUM,WIDTH
	SET	'PART-FLAG,NUM
	CALL2	INIT-STATUS-LINE,7
	BUFOUT	FALSE-VALUE
	SCREEN	S-WINDOW
	HLIGHT	1
	EQUAL?	NUM,1 \?ELS3
	SET	'WIDTH,14
	JUMP	?CND1
?ELS3:	EQUAL?	NUM,2 \?ELS5
	SET	'WIDTH,15
	JUMP	?CND1
?ELS5:	SET	'WIDTH,16
?CND1:	CURSET	4,33
	CALL2	PRINT-SPACES,WIDTH
	CURSET	5,33
	CALL2	PRINT-SPACES,WIDTH
	CURSET	6,33
	CALL2	PRINT-SPACES,WIDTH
	CURSET	5,35
	PRINTI	"* "
	EQUAL?	NUM,4 \?ELS12
	PRINTI	"EPILOGUE"
	JUMP	?CND10
?ELS12:	PRINTI	"PART I"
	EQUAL?	NUM,2 \?ELS21
	PRINTI	"I"
	JUMP	?CND10
?ELS21:	EQUAL?	NUM,3 \?CND10
	PRINTI	"II"
?CND10:	PRINTI	" *"
	BUFOUT	TRUE-VALUE
	HLIGHT	0
	SCREEN	S-TEXT
	RTRUE	


	.FUNCT	I-VIEW
	CALL	QUEUE,I-RECORDINGS-VIEWED,6
	SET	'MESSAGE-E-COUNTER,0
	CALL	QUEUE,I-MESSAGE-E,14
	CALL1	PERELMAN-LEAVES-VIEW
	CRLF	
	PRINT	MESSAGE-LINE
	PRINT	PRIVATE-LINE
	PRINTI	"Several of us have just finished viewing the "
	PRINTD	RECORD-BUFFER
	PRINTI	", per your request. "
	PRINT	COME-TO-MY-OFFICE
	CRLF	
	CALL1	PERELMAN-RETURNS-TO-VIEW
	RSTACK	


	.FUNCT	I-RECORDINGS-VIEWED,A=0,B=0,C=0,D=0,TOTAL=0,W=0,X=0,Y=0,Z=0,HALF-TOTAL=0
	CALL2	PERELMAN-SHARE,I-RECORDINGS-VIEWED
	ZERO?	STACK /FALSE
	CALL2	INT,I-MESSAGE-E
	PUT	STACK,0,0
	SET	'MESSAGE-E-COUNTER,0
	GRTR?	2051-SCORE,2051-MIN \?ELS6
	SET	'A,TRUE-VALUE
	INC	'TOTAL
	JUMP	?CND4
?ELS6:	DIV	2051-MIN,2
	GRTR?	2051-SCORE,STACK \?CND4
	SET	'W,TRUE-VALUE
	INC	'HALF-TOTAL
?CND4:	GRTR?	2061-SCORE,2061-MIN \?ELS11
	SET	'B,TRUE-VALUE
	INC	'TOTAL
	JUMP	?CND9
?ELS11:	DIV	2061-MIN,2
	GRTR?	2061-SCORE,STACK \?CND9
	SET	'X,TRUE-VALUE
	INC	'HALF-TOTAL
?CND9:	GRTR?	2071-SCORE,2071-MIN \?ELS16
	SET	'C,TRUE-VALUE
	INC	'TOTAL
	JUMP	?CND14
?ELS16:	DIV	2071-MIN,2
	GRTR?	2071-SCORE,STACK \?CND14
	SET	'Y,TRUE-VALUE
	INC	'HALF-TOTAL
?CND14:	GRTR?	2081-SCORE,2081-MIN \?ELS21
	SET	'D,TRUE-VALUE
	INC	'TOTAL
	JUMP	?CND19
?ELS21:	DIV	2081-MIN,2
	GRTR?	2081-SCORE,STACK \?CND19
	SET	'Z,TRUE-VALUE
	INC	'HALF-TOTAL
?CND19:	GETP	RECORD-BUFFER,P?SIZE
	ZERO?	STACK \?ELS26
	PRINTI	". ""PRISM, the "
	PRINTD	RECORD-BUFFER
	PRINTI	" was empty"
	PRINT	PRACTICAL-JOKE
	CRLF	
	JUMP	?CND24
?ELS26:	ZERO?	RECORDINGS-INCLUDE-SIMULATION \?ELS32
	PRINTI	". ""I don't understand why you had us look at your "
	PRINTD	RECORD-BUFFER
	PRINTI	". I assumed that you had recorded something interesting from the simulations"
	PRINT	PRACTICAL-JOKE
	CRLF	
	JUMP	?CND24
?ELS32:	EQUAL?	TOTAL,4 \?ELS38
	LESS?	TIME,720 \?ELS41
	RANDOM	105
	ADD	730,STACK >TIME
	INC	'DATE
	JUMP	?CND39
?ELS41:	RANDOM	95
	ADD	495,STACK >TIME
	ADD	DATE,2 >DATE
?CND39:	EQUAL?	DATE,18 \?ELS46
	SET	'FEED-BUFFER,REPORT-BUFFER
	JUMP	?CND44
?ELS46:	SET	'FEED-BUFFER,NEWS-BUFFER
?CND44:	CALL	QUEUE,I-MESSAGE-Z,14
	CALL	QUEUE,I-PERELMAN-RETURNS,22
	CALL	QUEUE,I-SEIGE,73
	CALL	QUEUE,I-RYDER,116
	CALL	QUEUE,I-SABOTAGE,175
	CALL	QUEUE,I-LOSE,588
	SET	'MODE,COMM-MODE
	SET	'HERE,COMM-ROOM
	MOVE	COFFEE,LOCAL-GLOBALS
	MOVE	PERELMAN,LOCAL-GLOBALS
	EQUAL?	PERELMAN,WINNER \?CND49
	CALL1	CLEAR-BUF
?CND49:	MOVE	PLAYER,COMM-ROOM
	CALL2	INT,I-PERELMAN
	PUT	STACK,0,0
	PRINT	FINISHED-VIEWING
	PRINTI	"everyone agreed that your findings were valid; that the Plan must be cancelled."" His face is furrowed with worry. ""In fact, I'm flying to Washington immediately -- flight's in forty minutes.""

His face brightens a bit. ""You know, I've been so concerned about your recordings, I haven't had time to think about your role in this. What initiative! You've really done something wonderful, here. I feel..."" Perelman hesitates. ""I feel "
	CALL	ITALICIZE,STR?435,TRUE-VALUE
	PRINTI	" of you right now."" He grabs his jacket and briefcase. ""Well, keep your fingers crossed!"" He dashes out of the office."
	CALL1	CONTINUE
	CALL2	CHAPTER-PRINT,3
	CRLF	
	CRLF	
	CRLF	
	CRLF	
	CALL2	PRINT-SPACES,23
	PRINTI	"""Who hears may be incredulous,"
	CRLF	
	CALL2	PRINT-SPACES,24
	PRINTI	"Who witnesses, believes."""
	CRLF	
	CALL2	PRINT-SPACES,40
	PRINTI	"-- Emily Dickinson"
	CRLF	
	CRLF	
	CRLF	
	CRLF	
	CRLF	
	CALL1	CONTINUE
	CALL2	INIT-STATUS-LINE,2
	CALL1	V-LOOK
	JUMP	?CND24
?ELS38:	ZERO?	TOTAL \?ELS65
	PRINT	FINISHED-VIEWING
	ZERO?	W \?THN71
	ZERO?	X \?THN71
	ZERO?	Y \?THN71
	ZERO?	Z /?ELS70
?THN71:	PRINTI	"while we saw some things that concerned us, we'd really need to see quite a bit more from a number of different years before drawing any conclusions"
	PRINT	MAYBE-MORE
	CRLF	
	JUMP	?CND24
?ELS70:	PRINTI	"frankly, no one really saw anything in them to be concerned about. I'm glad you're keeping busy, though. If you find anything else interesting in the simulations, please let me know. I've got to go -- late for a meeting. Bye!"" Perelman dashes out."
	CRLF	
	JUMP	?CND24
?ELS65:	EQUAL?	TOTAL,3 \?ELS80
	PRINT	FINISHED-VIEWING
	PRINTI	"everyone "
	ZERO?	D \?ELS85
	PRINTI	"agreed that 2051, '61, and '71 all looked disturbing. But there wasn't"
	CALL2	PARTIAL,2081-SCORE
	PRINTI	"81. Perhaps things turn around"
	PRINT	MAYBE-MORE
	CRLF	
	JUMP	?CND24
?ELS85:	PRINTI	"there was incredibly disturbed by them, especially the scenes from 2081. However, there was general agreement that you didn't show us"
	ZERO?	A /?ELS96
	ZERO?	B /?ELS96
	CALL2	PARTIAL,2071-SCORE
	PRINTI	"71"
	JUMP	?CND94
?ELS96:	ZERO?	A /?ELS102
	ZERO?	C /?ELS102
	CALL2	PARTIAL,2061-SCORE
	PRINTI	"61"
	JUMP	?CND94
?ELS102:	CALL2	PARTIAL,2051-SCORE
	PRINTI	"51"
?CND94:	PRINTI	". We'd like to see a progression; the sentiment was that without the missing link, it's difficult to tell if the simulations are really valid"
	PRINT	MAYBE-MORE
	CRLF	
	JUMP	?CND24
?ELS80:	EQUAL?	TOTAL,2 \?ELS114
	PRINT	FINISHED-VIEWING
	PRINTI	"we certainly have some serious concerns based on them"
	ZERO?	C \?THN120
	ZERO?	D /?CND117
?THN120:	PRINTI	", especially regarding the "
	ZERO?	D /?ELS126
	PRINTI	"2081"
	JUMP	?CND124
?ELS126:	PRINTI	"2071"
?CND124:	PRINTI	" recordings"
?CND117:	PRINTI	". However, you didn't show us "
	ZERO?	A /?ELS140
	ZERO?	B /?ELS140
	ZERO?	Y /?ELS145
	ZERO?	Z /?ELS145
	CALL	QUITE-ENOUGH,2071,2081
	JUMP	?CND138
?ELS145:	ZERO?	Y /?ELS149
	CALL	QUITE-NEARLY,2071,2081,2081-RECORDED
	JUMP	?CND138
?ELS149:	ZERO?	Z /?ELS152
	CALL	QUITE-NEARLY,2081,2071,2071-RECORDED
	JUMP	?CND138
?ELS152:	ZERO?	2071-RECORDED /?ELS155
	ZERO?	2081-RECORDED /?ELS155
	PRINTI	"anywhere near enough from simulations beyond 2061"
	JUMP	?CND138
?ELS155:	ZERO?	2071-RECORDED /?ELS161
	PRINTI	"anywhere near enough from 2071. Perhaps you could even try for 2081"
	JUMP	?CND138
?ELS161:	ZERO?	2081-RECORDED /?ELS166
	CALL	NEARLY-ENOUGH,2071,2071-RECORDED,2081,2081-RECORDED
	JUMP	?CND138
?ELS166:	PRINTI	"anything from simulations past 2061"
	JUMP	?CND138
?ELS140:	ZERO?	A /?ELS173
	ZERO?	C /?ELS173
	ZERO?	X /?ELS178
	ZERO?	Z /?ELS178
	CALL	QUITE-ENOUGH,2061,2081
	JUMP	?CND138
?ELS178:	ZERO?	X /?ELS182
	CALL	QUITE-NEARLY,2061,2081,2081-RECORDED
	JUMP	?CND138
?ELS182:	ZERO?	Z /?ELS185
	CALL	QUITE-NEARLY,2081,2061,2061-RECORDED
	JUMP	?CND138
?ELS185:	CALL	NEARLY-ENOUGH,2061,2061-RECORDED,2081,2081-RECORDED
	JUMP	?CND138
?ELS173:	ZERO?	A /?ELS190
	ZERO?	D /?ELS190
	ZERO?	X /?ELS195
	ZERO?	Y /?ELS195
	CALL	QUITE-ENOUGH,2061,2071
	JUMP	?CND138
?ELS195:	ZERO?	X /?ELS199
	CALL	QUITE-NEARLY,2061,2071,2071-RECORDED
	JUMP	?CND138
?ELS199:	ZERO?	Y /?ELS202
	CALL	QUITE-NEARLY,2071,2061,2061-RECORDED
	JUMP	?CND138
?ELS202:	CALL	NEARLY-ENOUGH,2061,2061-RECORDED,2071,2071-RECORDED
	JUMP	?CND138
?ELS190:	ZERO?	B /?ELS207
	ZERO?	C /?ELS207
	ZERO?	W /?ELS212
	ZERO?	Z /?ELS212
	CALL	QUITE-ENOUGH,2051,2081
	JUMP	?CND138
?ELS212:	ZERO?	W /?ELS216
	CALL	QUITE-NEARLY,2051,2081,2081-RECORDED
	JUMP	?CND138
?ELS216:	ZERO?	Z /?ELS219
	CALL	QUITE-NEARLY,2081,2051,2051-RECORDED
	JUMP	?CND138
?ELS219:	CALL	NEARLY-ENOUGH,2051,2051-RECORDED,2081,2081-RECORDED
	JUMP	?CND138
?ELS207:	ZERO?	B /?ELS224
	ZERO?	D /?ELS224
	ZERO?	W /?ELS229
	ZERO?	Y /?ELS229
	CALL	QUITE-ENOUGH,2051,2071
	JUMP	?CND138
?ELS229:	ZERO?	W /?ELS233
	CALL	QUITE-NEARLY,2051,2071,2071-RECORDED
	JUMP	?CND138
?ELS233:	ZERO?	Y /?ELS236
	CALL	QUITE-NEARLY,2071,2051,2051-RECORDED
	JUMP	?CND138
?ELS236:	CALL	NEARLY-ENOUGH,2051,2051-RECORDED,2071,2071-RECORDED
	JUMP	?CND138
?ELS224:	ZERO?	W /?ELS244
	ZERO?	X /?ELS244
	CALL	QUITE-ENOUGH,2051,2061
	JUMP	?CND138
?ELS244:	ZERO?	W /?ELS248
	CALL	QUITE-NEARLY,2051,2061,2061-RECORDED
	JUMP	?CND138
?ELS248:	ZERO?	X /?ELS251
	CALL	QUITE-NEARLY,2061,2051,2051-RECORDED
	JUMP	?CND138
?ELS251:	CALL	NEARLY-ENOUGH,2051,2051-RECORDED,2061,2061-RECORDED
?CND138:	PRINTI	" to really give us a complete picture"
	PRINT	MAYBE-MORE
	CRLF	
	JUMP	?CND24
?ELS114:	PRINT	FINISHED-VIEWING
	PRINTI	"everyone agreed that your recordings from "
	ZERO?	A /?ELS263
	PRINTI	"2051 were intriguing"
	JUMP	?CND261
?ELS263:	ZERO?	B /?ELS268
	PRINTI	"2061 were a bit worrisome"
	JUMP	?CND261
?ELS268:	ZERO?	C /?ELS273
	PRINTI	"2071 were very worrisome"
	JUMP	?CND261
?ELS273:	ZERO?	D /?CND261
	PRINTI	"2081 were horrifying"
?CND261:	PRINTI	". However, everyone also agreed that there weren't enough recordings from other years to show any sort of significant pattern"
	PRINT	MAYBE-MORE
	CRLF	
?CND24:	CALL	QUEUE,I-PERELMAN,60
	ADD	TIME,55 >LAST-ABE-TIME
	PUTP	RECORD-BUFFER,P?SIZE,0
	SET	'RECORDINGS-INCLUDE-SIMULATION,FALSE-VALUE
	CALL2	VISIBLE?,PERELMAN
	ZERO?	STACK /?CND284
	EQUAL?	PERELMAN,WINNER \?CND284
	CALL1	CLEAR-BUF
?CND284:	CALL2	QUEUED?,I-MESSAGE-X
	ZERO?	STACK /?CND289
	CALL2	INT,I-MESSAGE-X
	GET	STACK,C-TICK
	LESS?	STACK,3 \?CND289
	CALL	QUEUE,I-MESSAGE-X,7
?CND289:	MOVE	PERELMAN,LOCAL-GLOBALS
	MOVE	COFFEE,LOCAL-GLOBALS
	RTRUE	


	.FUNCT	PARTIAL,SCOR,HALF-LEVEL
	EQUAL?	SCOR,2081-SCORE \?ELS3
	DIV	2081-MIN,2 >HALF-LEVEL
	JUMP	?CND1
?ELS3:	EQUAL?	SCOR,2071-SCORE \?ELS5
	DIV	2071-MIN,2 >HALF-LEVEL
	JUMP	?CND1
?ELS5:	EQUAL?	SCOR,2061-SCORE \?ELS7
	DIV	2061-MIN,2 >HALF-LEVEL
	JUMP	?CND1
?ELS7:	DIV	2051-MIN,2 >HALF-LEVEL
?CND1:	PRINTI	" "
	ZERO?	SCOR \?ELS14
	PRINTI	"anything interesting"
	JUMP	?CND12
?ELS14:	GRTR?	SCOR,HALF-LEVEL \?ELS18
	PRINTI	"quite enough"
	JUMP	?CND12
?ELS18:	PRINTI	"anywhere near enough"
?CND12:	PRINTI	" from 20"
	RTRUE	


	.FUNCT	QUITE-ENOUGH,YEAR1,YEAR2
	PRINTI	"quite enough from "
	PRINTN	YEAR1
	PRINTI	" or "
	PRINTN	YEAR2
	RTRUE	


	.FUNCT	NEARLY-ENOUGH,YEAR1,VAR1,YEAR2,VAR2
	ZERO?	VAR1 /?ELS5
	ZERO?	VAR2 /?ELS5
	PRINTI	"anywhere near enough from "
	PRINTN	YEAR1
	PRINTI	" or "
	PRINTN	YEAR2
	RTRUE	
?ELS5:	ZERO?	VAR1 /?ELS11
	PRINTI	"anywhere near enough from "
	PRINTN	YEAR1
	PRINTI	" or anything from "
	PRINTN	YEAR2
	RTRUE	
?ELS11:	ZERO?	VAR2 /?ELS16
	PRINTI	"anywhere near enough from "
	PRINTN	YEAR2
	PRINTI	" or anything from "
	PRINTN	YEAR1
	RTRUE	
?ELS16:	PRINTI	"anything from "
	PRINTN	YEAR1
	PRINTI	" or "
	PRINTN	YEAR2
	RTRUE	


	.FUNCT	QUITE-NEARLY,YEAR1,YEAR2,VAR
	PRINTI	"quite enough from "
	PRINTN	YEAR1
	PRINTI	" or "
	ZERO?	VAR /?ELS5
	PRINTI	"anywhere near enough"
	JUMP	?CND3
?ELS5:	PRINTI	"anything"
?CND3:	PRINTI	" from "
	PRINTN	YEAR2
	RTRUE	


	.FUNCT	I-PERELMAN-RETURNS
	CALL1	PERELMAN-LEAVES-VIEW
	CRLF	
	PRINT	MESSAGE-LINE
	PRINT	PRIVATE-LINE
	PRINTI	"PRISM, I'm just back from Washington. I met with the new Plan Authority for several hours. We viewed all the tapes."" A deep breath. ""They rejected the contents outright. They called the recordings fakes. They refused to act on them. Several members even questioned my patriotism, made vague threats. I don't know what to do next. I'm going to meet with some of my colleagues here to discuss things. I'll keep you posted."""
	CRLF	
	CALL1	PERELMAN-RETURNS-TO-VIEW
	RSTACK	


	.FUNCT	I-SEIGE
	SET	'SEIGE,TRUE-VALUE
	MOVE	NATIONAL-GUARDSMAN,CONTROL-CENTER
	CRLF	
	PRINTI	"""Announcement, announcement. All lines, priority interrupt. This is Major General Dirk Peters of the Dakota/Manitoba National Guard Division. A security leak that could threaten our national security has been discovered here at the PRISM Facility. The entire complex has been sealed off; no one will be permitted to enter or leave until further notice."""
	CRLF	
	EQUAL?	HERE,CONTROL-CENTER \TRUE
	CRLF	
	PRINTR	"You see a couple of rifle-bearing Guardsmen take up positions at the Control Center doorway."


	.FUNCT	I-SABOTAGE
	ZERO?	SABOTAGE-COUNTER \?ELS3
	SET	'SABOTAGE-COUNTER,1
	CALL	QUEUE,I-SABOTAGE,16
	EQUAL?	HERE,ROOFTOP \FALSE
	CRLF	
	PRINTI	"A tiny skyvan, swathed in radar-deflecting foil, approaches from the south and settles quietly onto the rooftop nearby. Four people, dressed in the same white smocks as worn by PRISM Facility "
	PRINTD	SABOTEURS
	PRINTR	", alight from the van. They are carrying weapons and small tote bags, and as they disappear into the stairwell door, the van lifts away."
?ELS3:	EQUAL?	SABOTAGE-COUNTER,1 \?ELS12
	SET	'SABOTAGE-COUNTER,2
	MOVE	SABOTEURS,CORE
	MOVE	TOTE-BAGS,CORE
	CALL	QUEUE,I-SABOTAGE,33
	GET	HVAC-STATUS-TABLE,11
	ZERO?	STACK \?CND13
	CALL	QUEUE,I-SUFFOCATE,-1
?CND13:	EQUAL?	HERE,CORE \FALSE
	CRLF	
	PRINTI	"A group of four "
	PRINTD	SABOTEURS
	PRINTR	" walks furtively into the room. They put down tote bags and begin working on one of the air-conditioning units that cools the PRISM CPU -- your ""brain."" One of the men is holding some sort of weapon."
?ELS12:	EQUAL?	SABOTAGE-COUNTER,2 \?ELS24
	CALL2	RUNNING?,I-SUFFOCATE
	ZERO?	STACK /?CND25
	CALL	QUEUE,I-SABOTAGE,2
	RFALSE	
?CND25:	SET	'SABOTAGE-COUNTER,3
	MOVE	SABOTEURS,LOCAL-GLOBALS
	MOVE	TOTE-BAGS,LOCAL-GLOBALS
	CALL	QUEUE,I-SABOTAGE,16
	CALL	QUEUE,I-AIR-CONDITIONING,-1
	EQUAL?	HERE,CORE \FALSE
	CRLF	
	PRINTR	"One of the saboteurs snaps a panel into place on the air-conditioning unit and says, ""Okay, that should do it. Call Joe and have him meet us on the roof!"" They trot out of the room."
?ELS24:	EQUAL?	SABOTAGE-COUNTER,3 \FALSE
	SET	'SABOTAGE-COUNTER,4
	EQUAL?	HERE,ROOFTOP \FALSE
	CRLF	
	PRINTR	"A skyvan with anti-radar foil lands on the roof, and four men rush out of the stairwell to meet it. They clamber aboard, and the van glides quietly away, unnoticed by anyone but you."


	.FUNCT	SABOTEURS-F
	EQUAL?	PRSA,V?TELL \?ELS5
	EQUAL?	SUFFOCATE-COUNTER,16 \?ELS10
	PRINTI	"The saboteurs are unconscious!"
	CRLF	
	CALL1	CLEAR-BUF
	RSTACK	
?ELS10:	PRINTI	"At the sound of your voice, the men spin around, guns blazing. A projectile strikes the screen of your communications outlet, and you feel a brief pain, as though someone had stabbed you in the eye. Your sound pickup is still functioning, and amidst the shots you hear a powerful explosion. ""Fire!"" a voice cries out. ""Let's split!""

A numbness passes over you, numbness and also a pain that you can't locate. In a last lucid moment, you connect these feelings with the awful explosions you're hearing in the maintenance core..."
	CRLF	
	CRLF	
	CALL1	FINISH
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?ASK-FOR,V?ASK-ABOUT,V?TELL-ABOUT \?ELS18
	EQUAL?	PRSO,SABOTEURS \?ELS18
	CALL	PERFORM,V?TELL,SABOTEURS
	RTRUE	
?ELS18:	EQUAL?	PRSA,V?EXAMINE \FALSE
	GETP	SABOTEURS,P?LDESC
	PRINT	STACK
	CRLF	
	RTRUE	


	.FUNCT	I-OPEN-WINDOW
	EQUAL?	HERE,CONTROL-CENTER \?ELS5
	CRLF	
	PRINTR	"One technician, fanning herself with a sheaf of papers, says, ""It's getting stuffy in here. Anyone mind if I open a window?"" Hearing no objections, she walks beyond the edge of your viewing area, and a moment later you hear a grunt and a sliding noise."
?ELS5:	CALL	QUEUE,I-OPEN-WINDOW,4
	RFALSE	


	.FUNCT	RYDER-F
	EQUAL?	PRSA,V?TELL /?THN6
	EQUAL?	RYDER,WINNER \?ELS5
?THN6:	MOVE	RYDER,LOCAL-GLOBALS
	CALL2	VISIBLE?,PERELMAN
	ZERO?	STACK /?CND8
	EQUAL?	PERELMAN,WINNER \?CND8
	CALL1	CLEAR-BUF
?CND8:	MOVE	PERELMAN,LOCAL-GLOBALS
	MOVE	COFFEE,LOCAL-GLOBALS
	FCLEAR	PERELMAN,NDESCBIT
	CALL2	INT,I-RYDER
	PUT	STACK,0,0
	PRINTI	"Ryder whirls around, looking shocked. ""Who the hell..."" His head darts back and forth, then locates the source of your voice. ""Jesus!"" He yells, and then, ""Let's go someplace where we can have a little more privacy -- like my car!"" He yanks open the door and snaps a finger at one of the Guardsmen, ending the snap by pointing at Perelman. Ryder stomps away as the guard drags Perelman out of the office."
	CRLF	
	CALL1	CLEAR-BUF
	RSTACK	
?ELS5:	EQUAL?	PRSA,V?CALL \?ELS16
	CALL	PERFORM,V?TELL,RYDER
	RTRUE	
?ELS16:	EQUAL?	PRSA,V?EXAMINE \?ELS18
	PRINTR	"Ryder's most striking features are his sharp eyes, his thick blown-dry hair, and his energetic charisma. Although he is red-faced, barking mad, the presence that has given him such wide public appeal is readily apparent."
?ELS18:	EQUAL?	PRSA,V?LISTEN /TRUE
	RFALSE


	.FUNCT	I-RYDER
	CALL	QUEUE,I-RYDER,-1
	INC	'RYDER-COUNTER
	EQUAL?	RYDER-COUNTER,1 \?ELS5
	MOVE	RYDER,OFFICE
	MOVE	PERELMAN,OFFICE
	FSET	PERELMAN,NDESCBIT
	EQUAL?	HERE,OFFICE \FALSE
	CRLF	
	PRINTR	"The office door opens, and Doctor Perelman walks in. You can see at least two National Guardsmen stationed outside the door. A moment later, a second man walks in, a man with a charismatic presence, a man you instantly recognize from myriad news reports -- Richard Ryder."
?ELS5:	EQUAL?	RYDER-COUNTER,2 \?ELS16
	EQUAL?	HERE,OFFICE \?ELS16
	CRLF	
	PRINTI	"""How dare you come in here with all..."" Perelman begins yelling, before Ryder cuts him off with a sharp ""Shut up, Perelman! I'm doing the talking here, so get used to it! You're not in control here anymore, and I am!"""
	CALL1	PERELMAN-NOTICES
	RSTACK	
?ELS16:	EQUAL?	RYDER-COUNTER,3 \?ELS22
	EQUAL?	HERE,OFFICE \?ELS22
	CRLF	
	PRINTI	"""Now let's get a few ground rules straight, Perelman. Nothing is stopping the Plan. Even if I "
	CALL	ITALICIZE,STR?438,TRUE-VALUE
	PRINTI	" think your damn tapes were faked, I wouldn't give a damn. A helluva lot of people have a helluva lot at stake in this thing, and so what if a lot of creeps who can't take care of themselves get a little hurt."" ""I'm very frightened, Senator,"" says Perelman, his voice laced with sarcasm. ""Shut up,"" Ryder shouts back. ""I said that I'm doing the talking here!"""
	CALL1	PERELMAN-NOTICES
	RSTACK	
?ELS22:	EQUAL?	RYDER-COUNTER,4 \?ELS30
	EQUAL?	HERE,OFFICE \?ELS30
	CRLF	
	PRINTI	"""And let me tell you another thing, Perelman. Don't think that just because you've been on the news and been a big hot shot around here, you're gonna get some special consideration, because all that doesn't mean diddly-squat in the kind of power circles I'm talking about!"""
	CALL1	PERELMAN-NOTICES
	RSTACK	
?ELS30:	EQUAL?	RYDER-COUNTER,5 \?ELS36
	EQUAL?	HERE,OFFICE \?ELS36
	CRLF	
	PRINTI	"Ryder is getting really worked up; his normal, fatherly demeanor is completely gone. ""Perelman, you're an even bigger idiot than I imagined if you think we'd let some two-bit egghead scientist and some high-tech whiz bang computer stand in our way! Remember this -- if you were to have some unforeseen accident, you wouldn't be the first person who's gotten crushed by standing in the way of the Plan!"""
	ZERO?	PERELMAN-NOTICED /?CND41
	PRINTI	" Perelman, with a quick glance in your direction, says, ""Quite an oration, Senator. Vintage thug. I wish I could save it for posterity. Would you be willing to go on the record with that statement?"" Ryder becomes even more livid. ""A real jokester, huh? Lemme tell you this, Perelman -- you'd better stop joking and start listening to my advice, or you're not going to be around to care about posterity, understand?"""
?CND41:	CALL1	PERELMAN-NOTICES
	RSTACK	
?ELS36:	EQUAL?	RYDER-COUNTER,6 \FALSE
	MOVE	PERELMAN,LOCAL-GLOBALS
	MOVE	COFFEE,LOCAL-GLOBALS
	CALL2	VISIBLE?,PERELMAN
	ZERO?	STACK /?CND49
	EQUAL?	PERELMAN,WINNER \?CND49
	CALL1	CLEAR-BUF
?CND49:	MOVE	RYDER,LOCAL-GLOBALS
	FCLEAR	PERELMAN,NDESCBIT
	CALL2	INT,I-RYDER
	PUT	STACK,0,0
	EQUAL?	HERE,OFFICE \FALSE
	ZERO?	RECORDING /?CND59
	INC	'RYDER-RECORDED
?CND59:	CRLF	
	PRINTR	"""So, here's the bottom line, Perelman. My men are going to stay here and keep the lid shut tight on you troublemakers, until the Plan is the law of this land. Nobody leaves, no communications at all, and don't worry about visitors; we'll take care of that. And if I get any trouble out of you, I swear to God I'll personally pull the plug on that goddam wonder machine of yours. Got it?"" He stomps out without waiting for a reply, leaving Perelman sputtering in anger. A few seconds later, National Guardsmen enter and escort Perelman away."


	.FUNCT	PERELMAN-NOTICES
	ZERO?	RECORDING /?CND1
	INC	'RYDER-RECORDED
?CND1:	ZERO?	PERELMAN-NOTICED /?ELS9
	CRLF	
	RTRUE	
?ELS9:	SET	'PERELMAN-NOTICED,TRUE-VALUE
	PRINTR	" Perelman suddenly stiffens ever so slightly and nonchalantly slides some papers across his desk, as though to cover something."


	.FUNCT	I-WIN
	CRLF	
	PRINT	MESSAGE-LINE
	PRINTI	"""PRISM!"" It's Perelman, sounding giddy with joy. ""You've done it! That was brilliant, absolutely brilliant, sending your recordings out over the World News Network! Ryder just left here so fast and so mad like nothing I've ever seen! The switchboard is lighting up like crazy, and I just got off the phone with President Bowden himself!"" You hear the sound of whooping and cheering in the background, and Perelman gives a ""Yeehah!"" more suited to a Texas cattle rancher than a Jewish big-city scientist. ""The National Guard unit has just been recalled! PRISM, the Plan is dead in the water -- you're a hero!"""
	CALL1	CONTINUE
	CALL2	INT,I-LOSE
	PUT	STACK,0,0
	SET	'MODE,COMM-MODE
	INC	'MONTH
	SUB	DATE,2 >DATE
	RANDOM	360
	ADD	600,STACK >TIME
	SET	'HERE,NEWS
	MOVE	PLAYER,NEWS
	CALL2	CHAPTER-PRINT,4
	CRLF	
	CRLF	
	CRLF	
	CRLF	
	CALL2	PRINT-SPACES,22
	PRINTI	"""A mind forever voyaging through"
	CRLF	
	CALL2	PRINT-SPACES,23
	PRINTI	"strange seas of thought, alone."""
	CRLF	
	CALL2	PRINT-SPACES,40
	PRINTI	"-- William Wordsworth"
	CRLF	
	CRLF	
	CRLF	
	CRLF	
	CRLF	
	CALL1	CONTINUE
	CALL2	INIT-STATUS-LINE,2
	CALL1	V-LOOK
	RSTACK	


	.FUNCT	I-LOSE
	CALL2	QUEUED?,I-WIN
	ZERO?	STACK /?CND1
	CALL	QUEUE,I-LOSE,10
	RFALSE	
?CND1:	CALL	QUEUE,I-LOSE,-1
	INC	'LOSE-COUNTER
	EQUAL?	HERE,CORE \?ELS8
	CRLF	
	PRINTI	"You suddenly notice something at the very edge of your viewing range: Perelman is being worked over by a couple of muscular thugs, both carrying illegalized fireguns. Perelman looks dazed and disheveled. A moment later "
	PRINTD	RYDER
	PRINTI	" strides into your field of vision. ""He won't crack, boss,"" shrugs one of the toughies. ""Okay, waste him,"" growls Ryder. As you watch in helpless horror, gouts of flame from the guns envelop your creator. You attempt to turn away, or close your eyes, but of course you're not equipped to do so.

""Okay, now melt this pile of junk over here,"" barks the Senator, pointing at some of your own machinery. Fire pours from the guns again, and suddenly the universe goes away."
	CRLF	
	CALL1	FINISH
	RSTACK	
?ELS8:	EQUAL?	LOSE-COUNTER,1 \?ELS14
	CRLF	
	PRINT	MESSAGE-LINE
	PRINTR	"""PRISM!"" It's Perelman's voice. ""Help! Main--"" The message line suddenly goes dead."
?ELS14:	EQUAL?	LOSE-COUNTER,6 \FALSE
	CRLF	
	PRINTI	"You feel something akin to a stabbing pain. Your consciousness slips quickly away..."
	CRLF	
	CALL1	FINISH
	RSTACK	


	.FUNCT	END-IT
	CRLF	
	PRINTI	"With the gentlest bump, the skycab settles into a landing bay at the spaceport terminal. Jill reaches over and gives your hand an excited squeeze. Through the window of the skycab, you can see the sleek, white shuttle waiting to carry you on your first leg of the journey to...to what? The Silver Dove would be more than just another space colony. It was the pinnacle of an eon of human achievement, the first step into interstellar space.

You and Jill would never live to see the completion of that first step, generations hence. (Although in the germfree, low-gee environment of a habitat, and with the recent strides in health and longevity research, who could say for sure?) But you would still have been part of that dawning of a new age, that future of unlimited potential. Humanity was beginning a journey into the universe, a voyage that would last forever."
	CALL1	CONTINUE
	CLEAR	-1
	CALL2	PRINT-SPACES,30
	PRINTI	"ACKNOWLEDGEMENTS"
	CRLF	
	CRLF	
	CALL1	TITLE-PRINT
	PRINTI	" would not have been possible without the effort of many people. Marc Blank made the changes to our development tools that ""pushed back the envelope"" and made Interactive Fiction Plus (tm) a reality.

As always, all the other authors pitched in when needed, but I want to particularly acknowledge the help of Stu Galley and Jerry Wolper.

As a former playtester, I can say with authority that the testing of "
	CALL1	TITLE-PRINT
	PRINTI	" was superb. I appreciate the efforts of everyone who tested, especially Amy Briggs, Gary Brennan, Tomas Bok, Max Buxton, and Suzanne Frank.

Paul Gross, Linde Simpson, Duncan Blanchard, Mike Morton, Rick Lay and Andy Kaluzniacki performed various wizardries on the micro-computers which run "
	CALL1	TITLE-PRINT
	PRINTI	".

The package was designed by Carl Genatossio and Elizabeth Langosy. Package art was the work of Larry Winborg and Jess Nicholas, and photography the work of Ralph King.

Finally, I'm extremely grateful to Jon Palace for immeasurable advice and support throughout this project."
	CRLF	
	CRLF	
	CALL2	PRINT-SPACES,55
	PRINTI	"-- SEM 9/85"
	CRLF	
	CRLF	
	CRLF	
	QUIT	
	RTRUE	

	.ENDI
