

	.FUNCT	I-PERELMAN,TOLD=0
	GRTR?	PART-FLAG,2 /?THN4
	ZERO?	REVIEWING-RECORDINGS /?CND1
?THN4:	CALL2	INT,I-PERELMAN
	PUT	STACK,0,0
	RFALSE	
?CND1:	CALL	QUEUE,I-PERELMAN,-1
	GRTR?	TIME,536 \?ELS8
	GRTR?	LAST-ABE-TIME,536 /?ELS8
	EQUAL?	HERE,CONTROL-CENTER \?CND11
	CRLF	
	PRINTI	"Doctor Perelman walks jauntily into the "
	PRINTD	CONTROL-CENTER-OBJECT
	PRINTI	". ""Good morning to all,"" he calls cheerily and begins chatting with the chief of the night shift."
	CRLF	
	SET	'TOLD,TRUE-VALUE
?CND11:	CALL1	PUT-PERELMAN-IN-THE-RIGHT-PLACE
	JUMP	?CND6
?ELS8:	GRTR?	TIME,550 \?ELS19
	GRTR?	LAST-ABE-TIME,550 /?ELS19
	EQUAL?	HERE,CONTROL-CENTER \?CND22
	IN?	PERELMAN,CONTROL-CENTER \?ELS27
	CRLF	
	PRINTI	"Perelman stops talking to the technician, who hangs up his white overcoat and leaves the control room. Perelman crosses the room and picks up a thick report."
	CRLF	
	JUMP	?CND25
?ELS27:	CRLF	
	PRINTI	"Perelman enters, looks around, and picks up a thick report."
	CRLF	
?CND25:	SET	'TOLD,TRUE-VALUE
?CND22:	CALL1	PUT-PERELMAN-IN-THE-RIGHT-PLACE
	JUMP	?CND6
?ELS19:	GRTR?	TIME,599 \?ELS35
	GRTR?	LAST-ABE-TIME,599 /?ELS35
	EQUAL?	HERE,CONTROL-CENTER \?CND38
	IN?	PERELMAN,CONTROL-CENTER \?CND38
	CRLF	
	PRINTI	"Perelman puts down the report and walks toward the door. He calls to one of the technicians. ""Nat, I'll be in my office."""
	CRLF	
	SET	'TOLD,TRUE-VALUE
?CND38:	CALL1	PUT-PERELMAN-IN-THE-RIGHT-PLACE
	JUMP	?CND6
?ELS35:	GRTR?	TIME,616 \?ELS46
	GRTR?	LAST-ABE-TIME,616 /?ELS46
	CALL1	PERELMAN-WALKS-IN-WITH-COFFEE >TOLD
	CALL1	PUT-PERELMAN-IN-THE-RIGHT-PLACE
	JUMP	?CND6
?ELS46:	GRTR?	TIME,711 \?ELS50
	GRTR?	LAST-ABE-TIME,711 /?ELS50
	EQUAL?	HERE,OFFICE \?CND53
	IN?	PERELMAN,OFFICE \?CND53
	CRLF	
	PRINTI	"The telephone buzzes. ""Perelman,"" says Perelman into the receiver. The voice at the other end is so quiet that even your sensitive audio monitors can't pick it up. ""Hi, Aseejh."" Pause. ""Yes, let's get together on that."" He glances up at his terminal. ""It's almost lunch time; want to meet me in the cafeteria?"" Pause. ""Okay, ten minutes."" Perelman replaces the receiver and leaves the room."
	CRLF	
	SET	'TOLD,TRUE-VALUE
?CND53:	CALL1	PUT-PERELMAN-IN-THE-RIGHT-PLACE
	JUMP	?CND6
?ELS50:	GRTR?	TIME,790 \?ELS61
	GRTR?	LAST-ABE-TIME,790 /?ELS61
	CALL1	PERELMAN-WALKS-IN-WITH-COFFEE >TOLD
	CALL1	PUT-PERELMAN-IN-THE-RIGHT-PLACE
	JUMP	?CND6
?ELS61:	GRTR?	TIME,834 \?ELS65
	GRTR?	LAST-ABE-TIME,834 /?ELS65
	EQUAL?	HERE,OFFICE \?CND68
	IN?	PERELMAN,OFFICE \?CND68
	CRLF	
	PRINTD	PRICE
	PRINTI	", Doctor Perelman's secretary, appears in the doorway. ""Doc, don't forget, you've got a meeting with Vera at two o'clock."" He glances at his watch, mumbles some impolite things under his breath, and rushes out."
	CRLF	
	SET	'TOLD,TRUE-VALUE
?CND68:	CALL1	PUT-PERELMAN-IN-THE-RIGHT-PLACE
	JUMP	?CND6
?ELS65:	GRTR?	TIME,980 \?ELS76
	GRTR?	LAST-ABE-TIME,980 /?ELS76
	EQUAL?	HERE,OFFICE \?CND79
	CRLF	
	PRINTI	"Doctor Perelman walks into the office, carrying a pile of pink message slips. He scans them, drops all but one into a basket on his desk, picks up the phone receiver, and presses two or three buttons. Your sensitive audio pickup hears a few rings, a click, and then a young woman's voice: ""This is "
	PRINTD	ESTHER
	PRINTI	". Can't come to the phone now. Please leave a message, though."" Pause. ""BEEP!"" Perelman speaks into the phone. ""Hi, it's Dad. I got your message, but I can't make it; I'm too tied up with the Project. I'll probably be in the office all evening if you want to talk."""
	CRLF	
	SET	'TOLD,TRUE-VALUE
?CND79:	CALL1	PUT-PERELMAN-IN-THE-RIGHT-PLACE
	JUMP	?CND6
?ELS76:	GRTR?	TIME,1157 \?ELS87
	GRTR?	LAST-ABE-TIME,1157 /?ELS87
	EQUAL?	HERE,OFFICE \?CND90
	IN?	PERELMAN,OFFICE \?ELS95
	CRLF	
	PRINTD	PRICE
	PRINTI	", Perelman's secretary, pops her head in the doorway. ""Hey Doc! "
	JUMP	?CND93
?ELS95:	CRLF	
	PRINTI	"Perelman enters with his secretary, "
	PRINTD	PRICE
	PRINTI	", who asks, """
?CND93:	PRINTI	"Need me for anything else tonight?"" Perelman, grinning, responds, ""Not unless you've decided to dump that unfairly handsome husband of yours."" She looks exasperated at what is obviously an old joke and shakes a fist at him in a mock threat. ""Really, though, I'll be fine,"" says Perelman. ""Scram."" She disappears from sight, shouting from the next room, ""Good night, Doc. Don't stay too late!"""
	CRLF	
	SET	'TOLD,TRUE-VALUE
?CND90:	CALL1	PUT-PERELMAN-IN-THE-RIGHT-PLACE
	JUMP	?CND6
?ELS87:	GRTR?	TIME,1241 \?ELS107
	GRTR?	LAST-ABE-TIME,1241 /?ELS107
	EQUAL?	HERE,OFFICE \?CND110
	IN?	PERELMAN,OFFICE \?CND110
	PRINTI	"Perelman shoves some papers into a notebook, types something on his desk terminal, and leaves the room."
	CRLF	
	SET	'TOLD,TRUE-VALUE
?CND110:	CALL1	PUT-PERELMAN-IN-THE-RIGHT-PLACE
	JUMP	?CND6
?ELS107:	GRTR?	TIME,1281 \?ELS118
	GRTR?	LAST-ABE-TIME,1281 /?ELS118
	EQUAL?	HERE,CONTROL-CENTER \?CND121
	CRLF	
	PRINTI	"Doctor Perelman walks into the "
	PRINTD	CONTROL-CENTER-OBJECT
	PRINTI	". He wanders around the room, talking quietly with a few technicians. He picks up a hefty printout from the printer and settles into a swivel chair to read it."
	CRLF	
	SET	'TOLD,TRUE-VALUE
?CND121:	CALL1	PUT-PERELMAN-IN-THE-RIGHT-PLACE
	JUMP	?CND6
?ELS118:	GRTR?	TIME,1312 \?ELS129
	GRTR?	LAST-ABE-TIME,1312 /?ELS129
	EQUAL?	HERE,CONTROL-CENTER \?CND132
	IN?	PERELMAN,CONTROL-CENTER \?CND132
	CRLF	
	PRINTI	"Perelman puts down the printout and rubs his eyes. He stands and unsuccessfully stifles a yawn. ""I'm going home,"" he announces to the tiny evening staff"
	RANDOM	100
	LESS?	50,STACK /?CND139
	PRINTI	". Try not to call me unless it's an emergency"
?CND139:	PRINTI	"."" He leaves the control complex."
	CRLF	
	SET	'TOLD,TRUE-VALUE
?CND132:	CALL1	PUT-PERELMAN-IN-THE-RIGHT-PLACE
	JUMP	?CND6
?ELS129:	GRTR?	TIME,1318 \?CND6
	GRTR?	LAST-ABE-TIME,1318 /?CND6
	EQUAL?	HERE,OFFICE \?CND6
	PRINTI	"Doctor Perelman walks wearily into the office, puts on a thin overcoat, and grabs a notebook stuffed with papers. He stops at the doorway, glancing about the room, and"
	PRINT	SPOTS-ACTIVE-LIGHT
	PRINTI	". A smile breaks through the weary lines on his face. He raises his hand to his forehead in a friendly salute. ""Good night, PRISM."" He dims the light and closes the office door. The sensors on your monitor automatically adjust to the lower light level."
	CRLF	
	SET	'TOLD,TRUE-VALUE
?CND6:	SET	'LAST-ABE-TIME,TIME
	ZERO?	TOLD /FALSE
	RTRUE	


	.FUNCT	PUT-PERELMAN-IN-THE-RIGHT-PLACE
	LESS?	TIME,536 \?ELS5
	CALL2	VISIBLE?,PERELMAN
	ZERO?	STACK /?CND6
	EQUAL?	PERELMAN,WINNER \?CND6
	CALL1	CLEAR-BUF
?CND6:	MOVE	PERELMAN,LOCAL-GLOBALS
	MOVE	COFFEE,LOCAL-GLOBALS
	RTRUE	
?ELS5:	GRTR?	TIME,535 \?ELS12
	LESS?	TIME,550 \?ELS12
	MOVE	PERELMAN,CONTROL-CENTER
	MOVE	COFFEE,LOCAL-GLOBALS
	PUTP	PERELMAN,P?LDESC,STR?7
	RTRUE	
?ELS12:	GRTR?	TIME,549 \?ELS16
	LESS?	TIME,599 \?ELS16
	MOVE	PERELMAN,CONTROL-CENTER
	MOVE	COFFEE,LOCAL-GLOBALS
	PUTP	PERELMAN,P?LDESC,STR?8
	RTRUE	
?ELS16:	GRTR?	TIME,598 \?ELS20
	LESS?	TIME,616 \?ELS20
	CALL2	VISIBLE?,PERELMAN
	ZERO?	STACK /?CND23
	EQUAL?	PERELMAN,WINNER \?CND23
	CALL1	CLEAR-BUF
?CND23:	MOVE	PERELMAN,LOCAL-GLOBALS
	MOVE	COFFEE,LOCAL-GLOBALS
	RTRUE	
?ELS20:	GRTR?	TIME,615 \?ELS29
	LESS?	TIME,711 \?ELS29
	MOVE	PERELMAN,OFFICE
	MOVE	COFFEE,OFFICE
	PUTP	PERELMAN,P?LDESC,STR?9
	RTRUE	
?ELS29:	GRTR?	TIME,710 \?ELS33
	LESS?	TIME,790 \?ELS33
	CALL2	VISIBLE?,PERELMAN
	ZERO?	STACK /?CND36
	EQUAL?	PERELMAN,WINNER \?CND36
	CALL1	CLEAR-BUF
?CND36:	MOVE	PERELMAN,LOCAL-GLOBALS
	MOVE	COFFEE,LOCAL-GLOBALS
	RTRUE	
?ELS33:	GRTR?	TIME,789 \?ELS42
	LESS?	TIME,834 \?ELS42
	MOVE	PERELMAN,OFFICE
	MOVE	COFFEE,OFFICE
	PUTP	PERELMAN,P?LDESC,STR?9
	RTRUE	
?ELS42:	GRTR?	TIME,833 \?ELS46
	LESS?	TIME,980 \?ELS46
	CALL2	VISIBLE?,PERELMAN
	ZERO?	STACK /?CND49
	EQUAL?	PERELMAN,WINNER \?CND49
	CALL1	CLEAR-BUF
?CND49:	MOVE	COFFEE,LOCAL-GLOBALS
	MOVE	PERELMAN,LOCAL-GLOBALS
	RTRUE	
?ELS46:	GRTR?	TIME,979 \?ELS55
	LESS?	TIME,1241 \?ELS55
	MOVE	PERELMAN,OFFICE
	PUTP	PERELMAN,P?LDESC,STR?9
	RTRUE	
?ELS55:	GRTR?	TIME,1240 \?ELS59
	LESS?	TIME,1281 \?ELS59
	CALL2	VISIBLE?,PERELMAN
	ZERO?	STACK /?CND62
	EQUAL?	PERELMAN,WINNER \?CND62
	CALL1	CLEAR-BUF
?CND62:	MOVE	PERELMAN,LOCAL-GLOBALS
	MOVE	COFFEE,LOCAL-GLOBALS
	RTRUE	
?ELS59:	GRTR?	TIME,1280 \?ELS68
	LESS?	TIME,1312 \?ELS68
	MOVE	PERELMAN,CONTROL-CENTER
	MOVE	COFFEE,LOCAL-GLOBALS
	PUTP	PERELMAN,P?LDESC,STR?10
	RTRUE	
?ELS68:	GRTR?	TIME,1311 \FALSE
	CALL2	VISIBLE?,PERELMAN
	ZERO?	STACK /?CND73
	EQUAL?	PERELMAN,WINNER \?CND73
	CALL1	CLEAR-BUF
?CND73:	MOVE	PERELMAN,LOCAL-GLOBALS
	MOVE	COFFEE,LOCAL-GLOBALS
	RTRUE	


	.FUNCT	I-JILL,OLD-JILL-LOC
	EQUAL?	SYEAR,2061 \?ELS3
	CALL1	IN-APARTMENT?
	ZERO?	STACK /FALSE
	SET	'MITCHELL-NEWS-FLAG,TRUE-VALUE
	CALL	QUEUE,I-APARTMENT,-1
	SET	'FOLLOW-FLAG,1
	CALL	QUEUE,I-UNFOLLOW,2
	CALL2	SCORE,119
	MOVE	JILL,BEDROOM
	FSET?	APARTMENT-DOOR,OPENBIT \?ELS9
	CRLF	
	PRINTI	"You hear a noise from the open doorway"
	JUMP	?CND7
?ELS9:	EQUAL?	HERE,LIVING-ROOM \?ELS13
	CRLF	
	PRINTI	"The apartment door opens"
	JUMP	?CND7
?ELS13:	CRLF	
	PRINTI	"You hear the apartment door open"
?CND7:	PRINTI	" and"
	LOC	PLAYER
	EQUAL?	STACK,HERE /?CND22
	MOVE	PLAYER,HERE
	PRINTI	" you stand as"
?CND22:	PRINTI	" Jill comes running into the room. She seems terribly upset, throws herself against you, and begins sobbing uncontrollably. As you attempt to comfort her, she begins speaking between the sobs.

""It's Mitchell,"" she begins, and a lifelong fear of injury to your only child clutches at your heart. ""He's gone off and joined the Church of God's Word. He came and collected all his stuff about an hour ago. He said he's going to an orientation camp in Arizona. He says he'll never be able to speak to you or me again unless we join the Church. I followed him all the way to the airport but he wouldn't listen to me! He wouldn't even say goodbye to me! He wouldn't even..."" She begins sobbing even more uncontrollably, breaks away from you, and "
	EQUAL?	HERE,BEDROOM \?ELS31
	PRINTR	"throws herself down onto the bed."
?ELS31:	PRINTR	"runs into the bedroom."
?ELS3:	FSET?	JILL,TOUCHBIT /?ELS39
	CALL1	IN-APARTMENT?
	ZERO?	STACK /?ELS39
	FSET	JILL,TOUCHBIT
	ZERO?	JILL-COUNTER /FALSE
	CRLF	
	EQUAL?	JILL-COUNTER,1,2 \?ELS49
	SET	'FOLLOW-FLAG,2
	CALL	QUEUE,I-UNFOLLOW,2
	PRINTR	"Jill appears in the bedroom doorway. ""Perry, have you been out all night? You know how I worry."" She returns to the bedroom."
?ELS49:	EQUAL?	JILL-COUNTER,3,6,7 \?ELS53
	SET	'FOLLOW-FLAG,3
	CALL	QUEUE,I-UNFOLLOW,2
	PRINTR	"Jill enters from the kitchen. ""Hi, hon. You're home early!"" She kisses you before returning to the kitchen."
?ELS53:	EQUAL?	JILL-COUNTER,4,5 /?THN58
	EQUAL?	JILL-COUNTER,8,9,10 \?ELS57
?THN58:	EQUAL?	JILL-COUNTER,4,10 \?ELS62
	PRINTI	"Jill looks up from her book"
	JUMP	?CND60
?ELS62:	EQUAL?	JILL-COUNTER,5,8 \?ELS66
	PRINTI	"Jill looks up from her painting"
	JUMP	?CND60
?ELS66:	PRINTI	"Jill stops working for a moment and smiles at you"
?CND60:	SET	'YES-NO-FLAG,7
	CALL	QUEUE,I-YES-NO,2
	PRINTR	". ""Hi, hon. Any news from your agent today?"""
?ELS57:	SET	'FOLLOW-FLAG,2
	CALL	QUEUE,I-UNFOLLOW,2
	PRINTI	"Jill enters from the bedroom, "
	EQUAL?	JILL-COUNTER,11 \?ELS81
	PRINTI	"her hair wrapped in a towel"
	JUMP	?CND79
?ELS81:	PRINTI	"wearing a robe"
?CND79:	PRINTR	". ""Perry, I wish you wouldn't stay out so late."" She heads back into the bedroom."
?ELS39:	EQUAL?	JILL-COUNTER,14 \?ELS91
	CALL	QUEUE,I-JILL,-1
	LOC	JILL >OLD-JILL-LOC
	CALL1	PUT-JILL-IN-THE-RIGHT-PLACE
	EQUAL?	HERE,OLD-JILL-LOC \?ELS94
	CRLF	
	PRINTI	"With a deep sigh, Jill stops cleaning the mess"
	IN?	JILL,HERE /?CND97
	SET	'FOLLOW-FLAG,15
	ADD	ELAPSED-TIME,2
	CALL	QUEUE,I-UNFOLLOW,STACK
	PRINTI	" and leaves the room"
?CND97:	PRINTI	"."
	CRLF	
	RFALSE	
?ELS94:	IN?	JILL,HERE \FALSE
	CRLF	
	PRINTI	"Jill walks slowly into the room."
	CRLF	
	RFALSE	
?ELS91:	GRTR?	STIME,1402 \?ELS109
	EQUAL?	JILL-COUNTER,12 \?ELS109
	SET	'JILL-COUNTER,0
	MOVE	JILL,BEDROOM
	FCLEAR	JILL-BOOK,NDESCBIT
	EQUAL?	HERE,BEDROOM \FALSE
	CRLF	
	PRINTR	"Jill puts down her book and curls under the covers. Moments later, her breathing indicates that she is asleep."
?ELS109:	GRTR?	STIME,1299 \?ELS118
	EQUAL?	JILL-COUNTER,11 \?ELS118
	SET	'JILL-COUNTER,12
	MOVE	JILL,BEDROOM
	MOVE	JILL-BOOK,BEDROOM
	FSET	JILL-BOOK,NDESCBIT
	EQUAL?	HERE,BEDROOM \?ELS123
	CRLF	
	PRINTR	"Jill enters and picks up her book. She slips into bed and begins reading."
?ELS123:	EQUAL?	HERE,BATHROOM \FALSE
	SET	'FOLLOW-FLAG,4
	CALL	QUEUE,I-UNFOLLOW,2
	CRLF	
	PRINTR	"Jill finishes drying her hair and leaves the bathroom."
?ELS118:	GRTR?	STIME,1242 \?ELS131
	EQUAL?	JILL-COUNTER,10 \?ELS131
	SET	'JILL-COUNTER,11
	MOVE	JILL,BATHROOM
	MOVE	JILL-BOOK,BEDROOM
	FCLEAR	JILL-BOOK,NDESCBIT
	EQUAL?	HERE,BATHROOM \?ELS136
	CRLF	
	PRINTR	"Jill enters and begins wetting her hair."
?ELS136:	EQUAL?	HERE,BEDROOM \?ELS140
	SET	'FOLLOW-FLAG,5
	CALL	QUEUE,I-UNFOLLOW,2
	CRLF	
	PRINTR	"Jill enters from the living room, placing her book down near the bed. She wanders around for a minute, looking bored. ""I think I'll do my hair,"" she says, stepping into the bathroom."
?ELS140:	EQUAL?	HERE,LIVING-ROOM \FALSE
	SET	'FOLLOW-FLAG,2
	CALL	QUEUE,I-UNFOLLOW,2
	CRLF	
	PRINTR	"Jill stands, stretches, and walks into the bedroom."
?ELS131:	GRTR?	STIME,1137 \?ELS148
	EQUAL?	JILL-COUNTER,9 \?ELS148
	SET	'JILL-COUNTER,10
	MOVE	JILL,LIVING-ROOM
	MOVE	JILL-BOOK,LIVING-ROOM
	FSET	JILL-BOOK,NDESCBIT
	EQUAL?	HERE,LIVING-ROOM \FALSE
	CRLF	
	PRINTR	"Jill picks up a book and sits down on the couch to read it."
?ELS148:	GRTR?	STIME,1084 \?ELS157
	EQUAL?	JILL-COUNTER,8 \?ELS157
	SET	'JILL-COUNTER,9
	MOVE	JILL,LIVING-ROOM
	EQUAL?	HERE,LIVING-ROOM \FALSE
	CRLF	
	PRINTR	"Jill puts down the paintbrush and begins cleaning up the room."
?ELS157:	GRTR?	STIME,912 \?ELS166
	EQUAL?	JILL-COUNTER,7 \?ELS166
	SET	'JILL-COUNTER,8
	MOVE	JILL,LIVING-ROOM
	EQUAL?	HERE,LIVING-ROOM \?ELS171
	CRLF	
	PRINTR	"Jill enters the living room and looks around as though trying to decide what to do. She walks over to her easel, stares at it for a few moments, and then picks up a paintbrush."
?ELS171:	EQUAL?	HERE,KITCHEN \FALSE
	SET	'FOLLOW-FLAG,6
	CALL	QUEUE,I-UNFOLLOW,2
	CRLF	
	PRINTR	"Jill finishes the last of the dishes and walks into the living room."
?ELS166:	GRTR?	STIME,859 \?ELS179
	EQUAL?	JILL-COUNTER,6 \?ELS179
	SET	'JILL-COUNTER,7
	MOVE	JILL,KITCHEN
	MOVE	SALAD,LOCAL-GLOBALS
	EQUAL?	HERE,KITCHEN \FALSE
	CRLF	
	PRINTR	"Jill finishes her salad, walks over to the sink, and begins cleaning some dishes."
?ELS179:	GRTR?	STIME,813 \?ELS188
	EQUAL?	JILL-COUNTER,5 \?ELS188
	SET	'JILL-COUNTER,6
	MOVE	SALAD,KITCHEN
	FSET	SALAD,NDESCBIT
	MOVE	JILL,KITCHEN
	FCLEAR	REFRIGERATOR,OPENBIT
	EQUAL?	HERE,KITCHEN \?ELS193
	CRLF	
	PRINTI	"Jill walks in and gets a "
	PRINTD	SALAD
	PRINTI	" from the "
	PRINTD	REFRIGERATOR
	PRINTI	". She sits at the "
	PRINTD	DINETTE-SET
	PRINTR	" and begins slowly munching on the salad."
?ELS193:	EQUAL?	HERE,LIVING-ROOM \FALSE
	SET	'FOLLOW-FLAG,3
	CALL	QUEUE,I-UNFOLLOW,2
	CRLF	
	PRINTR	"Jill lays down her brush. ""I'm getting hungry."" She heads off into the kitchen."
?ELS188:	GRTR?	STIME,697 \?ELS207
	EQUAL?	JILL-COUNTER,4 \?ELS207
	SET	'JILL-COUNTER,5
	MOVE	JILL,LIVING-ROOM
	FCLEAR	JILL-BOOK,NDESCBIT
	EQUAL?	HERE,LIVING-ROOM \FALSE
	CRLF	
	PRINTR	"Jill puts down the book and stretches. She walks over to her easel, stares at the painting for a moment, and picks up a paintbrush."
?ELS207:	GRTR?	STIME,644 \?ELS216
	EQUAL?	JILL-COUNTER,3 \?ELS216
	SET	'JILL-COUNTER,4
	MOVE	JILL,LIVING-ROOM
	MOVE	JILL-BOOK,LIVING-ROOM
	FSET	JILL-BOOK,NDESCBIT
	MOVE	SALAD,REFRIGERATOR
	FCLEAR	SALAD,NDESCBIT
	EQUAL?	HERE,LIVING-ROOM \?ELS221
	CRLF	
	PRINTR	"Jill walks from the kitchen to the bedroom, returns with her book, settles onto the couch, and begins reading."
?ELS221:	EQUAL?	HERE,BEDROOM \?ELS225
	CRLF	
	PRINTI	"Jill walks into the bedroom, picks up her book, and returns to the living room."
	CRLF	
	RFALSE	
?ELS225:	EQUAL?	HERE,KITCHEN \FALSE
	SET	'FOLLOW-FLAG,6
	CALL	QUEUE,I-UNFOLLOW,2
	FCLEAR	REFRIGERATOR,OPENBIT
	CRLF	
	PRINTI	"Jill puts the salad in the "
	PRINTD	REFRIGERATOR
	PRINTR	" and goes into the living room."
?ELS216:	GRTR?	STIME,591 \?ELS235
	EQUAL?	JILL-COUNTER,2 \?ELS235
	SET	'JILL-COUNTER,3
	MOVE	JILL,KITCHEN
	MOVE	SALAD,KITCHEN
	FSET	SALAD,NDESCBIT
	EQUAL?	HERE,KITCHEN \?ELS240
	CRLF	
	PRINTR	"Jill enters and begins making a salad."
?ELS240:	EQUAL?	HERE,BEDROOM \?ELS244
	SET	'FOLLOW-FLAG,7
	CALL	QUEUE,I-UNFOLLOW,2
	CRLF	
	PRINTR	"Jill walks out of the room, toward the living room."
?ELS244:	EQUAL?	HERE,LIVING-ROOM \FALSE
	SET	'FOLLOW-FLAG,3
	CALL	QUEUE,I-UNFOLLOW,2
	CRLF	
	PRINTR	"Jill passes through on her way from the bedroom to the kitchen."
?ELS235:	GRTR?	STIME,522 \?ELS252
	EQUAL?	JILL-COUNTER,1 \?ELS252
	SET	'JILL-COUNTER,2
	MOVE	JILL,BEDROOM
	EQUAL?	HERE,BEDROOM \FALSE
	CRLF	
	PRINTR	"Jill finishes dressing and begins neatening up the room."
?ELS252:	GRTR?	STIME,478 \?ELS261
	LESS?	STIME,1380 \?ELS261
	ZERO?	JILL-COUNTER \?ELS261
	SET	'JILL-COUNTER,1
	MOVE	JILL,BEDROOM
	EQUAL?	HERE,BEDROOM \FALSE
	CRLF	
	PRINTR	"Jill rubs her eyes and rolls out of bed. ""Morning, honey! I sure slept like a stone!"" She gives you a quick kiss and begins dressing."
?ELS261:	ZERO?	JILL-NOT-SPOKEN-YET /FALSE
	IN?	JILL,HERE \FALSE
	ZERO?	JILL-COUNTER /FALSE
	RANDOM	100
	LESS?	5,STACK /FALSE
	SET	'JILL-NOT-SPOKEN-YET,FALSE-VALUE
	EQUAL?	SYEAR,2041 \?ELS275
	CRLF	
	PRINTI	"Jill looks up. ""Perry, I heard a news report yesterday about interest rates and housing prices. If the economy keeps going the way it's going, and someone buys your Africa book, we might be able to afford a house next year!"""
	CRLF	
	RFALSE	
?ELS275:	CRLF	
	PRINTI	"""Oh, Perry! Clave called while you were out,"" says Jill. ""The firm is sending him to Japan for a week; he'll call when he gets back. He says not to worry, he'll only be in the American section. He says that the kids keep asking for you."""
	CRLF	
	RFALSE	


	.FUNCT	I-MITCHELL
	CALL1	IN-APARTMENT?
	ZERO?	STACK \?ELS3
	EQUAL?	HERE,PARKVIEW-HALL /?ELS3
	CALL2	INT,I-MITCHELL
	PUT	STACK,0,0
	RFALSE	
?ELS3:	GRTR?	STIME,1374 \?ELS7
	EQUAL?	MITCHELL-COUNTER,4 \?ELS7
	SET	'MITCHELL-COUNTER,0
	MOVE	HOMEWORK,LOCAL-GLOBALS
	MOVE	MITCHELL,LOCAL-GLOBALS
	EQUAL?	HERE,LIVING-ROOM \FALSE
	SET	'FOLLOW-FLAG,14
	CALL	QUEUE,I-UNFOLLOW,2
	CRLF	
	PRINTR	"""Good night, Dad."" Mitch gives you a quick kiss and goes to his ""room"" on the other side of the partition."
?ELS7:	GRTR?	STIME,1120 \?ELS16
	EQUAL?	MITCHELL-COUNTER,3 \?ELS16
	SET	'MITCHELL-COUNTER,4
	MOVE	HOMEWORK,LIVING-ROOM
	MOVE	LOGIC-GAME,LOCAL-GLOBALS
	EQUAL?	HERE,LIVING-ROOM \FALSE
	CRLF	
	PRINTI	"Mitchell puts away the "
	PRINTD	LOGIC-GAME
	PRINTR	" and spreads out his homework."
?ELS16:	GRTR?	STIME,1011 \?ELS27
	EQUAL?	MITCHELL-COUNTER,2 \?ELS27
	SET	'MITCHELL-COUNTER,3
	MOVE	MITCHELL,LIVING-ROOM
	MOVE	LOGIC-GAME,MITCHELL
	EQUAL?	HERE,PARKVIEW-HALL \?ELS32
	SET	'FOLLOW-FLAG,11
	CALL	QUEUE,I-UNFOLLOW,2
	PRINTI	"Mitchell comes running down the hall. ""Hey Dad"
	PRINT	ALGEBRA
	PRINTI	" He "
	FSET?	APARTMENT-DOOR,OPENBIT /?CND35
	PRINTI	"opens the door and "
?CND35:	PRINTI	"bounds into the apartment"
	FSET?	APARTMENT-DOOR,OPENBIT /?CND42
	PRINTI	", closing the door behind him"
?CND42:	PRINTR	"."
?ELS32:	EQUAL?	HERE,LIVING-ROOM \?ELS53
	FSET?	APARTMENT-DOOR,OPENBIT /?CND54
	PRINTI	"The door opens and "
?CND54:	PRINTI	"Mitchell runs into the apartment. "
	JUMP	?CND51
?ELS53:	PRINTI	"You hear "
	FSET?	APARTMENT-DOOR,OPENBIT /?CND65
	PRINTI	"the front door open, followed by "
?CND65:	PRINTI	"Mitchell's voice. "
?CND51:	PRINTI	"""I'm home"
	PRINT	ALGEBRA
	EQUAL?	HERE,LIVING-ROOM \?CND74
	PRINTI	" He pulls out his favorite "
	PRINTD	LOGIC-GAME
	PRINTI	" and settles into a corner."
?CND74:	CRLF	
	RTRUE	
?ELS27:	GRTR?	STIME,505 \?ELS82
	EQUAL?	MITCHELL-COUNTER,1 \?ELS82
	SET	'MITCHELL-COUNTER,2
	MOVE	MITCHELL,LOCAL-GLOBALS
	EQUAL?	HERE,PARKVIEW-HALL \?ELS87
	SET	'FOLLOW-FLAG,10
	CALL	QUEUE,I-UNFOLLOW,2
	CRLF	
	PRINTR	"Mitchell emerges from the apartment, carrying his lunch box. ""Hi, Dad! See you later!"" He dashes down the stairs."
?ELS87:	SET	'FOLLOW-FLAG,12
	CALL	QUEUE,I-UNFOLLOW,2
	CRLF	
	PRINTI	"""Mom! Dad!"" yells Mitchell. ""I'm off to school!"""
	EQUAL?	HERE,LIVING-ROOM \?CND94
	PRINTI	" Mitchell waves to you and leaves."
?CND94:	CRLF	
	RTRUE	
?ELS82:	GRTR?	STIME,463 \FALSE
	LESS?	STIME,720 \FALSE
	ZERO?	MITCHELL-COUNTER \FALSE
	SET	'MITCHELL-COUNTER,1
	MOVE	MITCHELL,LIVING-ROOM
	EQUAL?	HERE,LIVING-ROOM \FALSE
	CRLF	
	PRINTR	"Mitchell appears from behind his partition and begins getting ready for school."


	.FUNCT	I-APARTMENT
	EQUAL?	JILL-COUNTER,13 \?ELS5
	SET	'JILL-COUNTER,14
	CALL	QUEUE,I-JILL,28
	IN?	JILL,HERE \FALSE
	CRLF	
	PRINTR	"Jill, with a few final sniffles, stops crying and begins straightening up the apartment."
?ELS5:	CALL1	IN-APARTMENT?
	ZERO?	STACK \?ELS12
	CALL2	INT,I-APARTMENT
	PUT	STACK,0,0
	RFALSE	
?ELS12:	GRTR?	STIME,1320 /?THN15
	LESS?	STIME,480 \?ELS14
?THN15:	CALL	QUEUE,I-APARTMENT,30
	RSTACK	
?ELS14:	EQUAL?	SYEAR,2041 /FALSE
	ZERO?	APARTMENT-RAID-FLAG \FALSE
	RANDOM	100
	LESS?	RAID-PROB,STACK /?ELS25
	FSET?	APARTMENT-DOOR,OPENBIT \?ELS28
	CRLF	
	PRINTI	"You hear a commotion in the hallway and then"
	JUMP	?CND26
?ELS28:	CRLF	
	PRINTI	"WHAM! The door of your apartment slams open and"
?CND26:	EQUAL?	HERE,LIVING-ROOM /?CND35
	PRINTI	", as you rush into the living room,"
?CND35:	PRINTI	" a half-dozen Border Security Force officers storm in, rifles ready. You freeze as they tramp about the apartment wielding Rad-Detectors. "
	SET	'APARTMENT-RAID-FLAG,TRUE-VALUE
	SET	'HERE,LIVING-ROOM
	MOVE	PLAYER,LIVING-ROOM
	EQUAL?	SYEAR,2071 \?CND42
	PRINTI	"Almost without reason, they tear your curtains, spill food onto the kitchen floor, and overturn furniture. "
	ZERO?	BOOK-PURCHASED /?CND42
	PRINTI	"One of the officers picks up an old, beautiful "
	PRINTD	BOOK
	PRINTI	" that you've owned for years and smiles gleefully as he rips it to shreds. "
?CND42:	PRINTI	"After a few nightmare minutes, they seem satisfied"
	EQUAL?	SYEAR,2051 \?ELS61
	CALL2	SCORE,8
	PRINTI	" and begin to file out. The apparent leader turns to you. ""Sorry for the inconvenience,"" he says apologetically. ""You know how things are. We're only doing it for your own protection."" He closes the door behind him. You hear sobbing and turn to see Jill crying in the corner of the living room"
	IN?	MITCHELL,HERE \?CND64
	PRINTI	". Mitchell, exhibiting the innocent resilience of a child, resumes his normal activities"
?CND64:	PRINTI	"."
	CRLF	
	FCLEAR	APARTMENT-DOOR,OPENBIT
	CALL2	INT,I-JILL
	PUT	STACK,0,0
	CALL	QUEUE,I-APARTMENT,10
	SET	'JILL-COUNTER,13
	MOVE	PLAYER,LIVING-ROOM
	MOVE	JILL,LIVING-ROOM
	RTRUE	
?ELS61:	EQUAL?	SYEAR,2061 \?ELS72
	CALL2	SCORE,9
	FCLEAR	APARTMENT-DOOR,OPENBIT
	CALL2	INT,I-APARTMENT
	PUT	STACK,0,0
	PRINTR	" and begin to leave. One officer turns to you. ""The place is clean,"" he says gruffly. ""Keep it that way."" He slams the door behind him."
?ELS72:	CALL2	SCORE,10
	FSET	APARTMENT-DOOR,OPENBIT
	CALL2	INT,I-APARTMENT
	PUT	STACK,0,0
	PRINTR	" and march out without a word, leaving the door open behind them."
?ELS25:	ADD	RAID-PROB,6 >RAID-PROB
	RFALSE	


	.FUNCT	I-CURFEW
	EQUAL?	HERE,JAIL-CELL \?ELS5
	GRTR?	ELAPSED-TIME,100 \?ELS10
	CALL	QUEUE,I-CURFEW,5
	RFALSE	
?ELS10:	MOVE	BLANKET,JAIL-CELL
	SET	'LIGHT-LEVEL,3
	CRLF	
	PRINTI	"A bored cop comes along, opens your cell, and steers you out of the building. ""We find you out after curfew again,"" he says, ""we won't treat you so easy. You goddam vagrants, you oughtta be thrown outta town."" He settles for throwing you out of the "
	PRINTD	POLICE-STATION-OBJECT
	PRINTI	"."
	CRLF	
	CRLF	
	CALL2	GOTO,ELM-AND-PARK
	RSTACK	
?ELS5:	GRTR?	STIME,420 \?ELS18
	LESS?	STIME,1260 \?ELS18
	CALL2	INT,I-CURFEW
	PUT	STACK,0,0
	RFALSE	
?ELS18:	FSET?	HERE,STREETBIT /?ELS22
	CALL	QUEUE,I-CURFEW,-1
	RFALSE	
?ELS22:	RANDOM	100
	LESS?	8,STACK /?ELS24
	EQUAL?	SYEAR,2071 \?ELS29
	CALL2	SCORE,117
	CALL2	JIGS-UP,STR?11
	RSTACK	
?ELS29:	GRTR?	STIME,1260 \?ELS34
	SUB	1440,STIME
	ADD	420,STACK
	CALL	QUEUE,I-CURFEW,STACK
	JUMP	?CND32
?ELS34:	SUB	420,STIME
	CALL	QUEUE,I-CURFEW,STACK
?CND32:	CALL2	SCORE,116
	CRLF	
	PRINTI	"A police car pulls up next to you and a burly cop gets out. He discovers that you have no curfew pass and hustles you into the rear. Minutes later, you are flung into a tiny cell."
	CRLF	
	CRLF	
	CALL2	GOTO,JAIL-CELL
	RSTACK	
?ELS24:	CALL	QUEUE,I-CURFEW,-1
	RFALSE	


	.FUNCT	I-SUNRISE-SUNSET,X
	MUL	SMONTH,20
	SUB	STACK,20 >X
	ADD	STIME,X
	GRTR?	STACK,455 \?ELS3
	ADD	LAST-SUN-TIME,X
	GRTR?	STACK,455 /?ELS3
	SET	'LIGHT-LEVEL,1
	FSET?	HERE,OUTSIDEBIT \?CND1
	CRLF	
	PRINTI	"You begin to see the faint glow of dawn from the east."
	CRLF	
	JUMP	?CND1
?ELS3:	ADD	STIME,X
	GRTR?	STACK,469 \?ELS12
	ADD	LAST-SUN-TIME,X
	GRTR?	STACK,469 /?ELS12
	SET	'LIGHT-LEVEL,2
	FSET?	HERE,OUTSIDEBIT \?CND1
	EQUAL?	SYEAR,2041,2051 \?ELS20
	CRLF	
	PRINTI	"The first rays of the sun begin streaming between the buildings to the east."
	CRLF	
	JUMP	?CND1
?ELS20:	CALL2	SCORE,118
	CRLF	
	PRINTI	"The glow in the east brightens, as the sun attempts to break through the hazy smog."
	CRLF	
	JUMP	?CND1
?ELS12:	ADD	STIME,X
	GRTR?	STACK,490 \?ELS28
	ADD	LAST-SUN-TIME,X
	GRTR?	STACK,490 /?ELS28
	SET	'LIGHT-LEVEL,3
	FSET?	HERE,OUTSIDEBIT \?CND1
	CRLF	
	PRINTI	"The sky continues to brighten. Dawn is over; day has begun."
	CRLF	
	JUMP	?CND1
?ELS28:	GRTR?	STIME,725 \?ELS37
	GRTR?	LAST-SUN-TIME,725 /?ELS37
	FSET?	HERE,OUTSIDEBIT \?CND1
	GRTR?	X,50 \?ELS45
	EQUAL?	SYEAR,2041,2051 \?ELS48
	CRLF	
	PRINTI	"The sun, beating down warmly on you, has reached its midday apex."
	CRLF	
	JUMP	?CND1
?ELS48:	CALL2	SCORE,118
	CRLF	
	PRINTI	"The diffuse glow of the sun is nearly straight overhead, another gray noontime."
	CRLF	
	JUMP	?CND1
?ELS45:	EQUAL?	SYEAR,2041,2051 \?ELS59
	CRLF	
	PRINTI	"The noontime sun has risen fairly high in the southern sky, taking some of the chill out of this wintry day."
	CRLF	
	JUMP	?CND1
?ELS59:	CALL2	SCORE,118
	CRLF	
	PRINTI	"The sun's feeble glow is skirting the building tops toward the south, providing little comfort or warmth on this gray, dismal day."
	CRLF	
	JUMP	?CND1
?ELS37:	SUB	STIME,X
	GRTR?	STACK,1010 \?ELS67
	SUB	LAST-SUN-TIME,X
	GRTR?	STACK,1010 /?ELS67
	SET	'LIGHT-LEVEL,2
	FSET?	HERE,OUTSIDEBIT \?CND1
	EQUAL?	SYEAR,2041,2051 \?ELS75
	CRLF	
	PRINTI	"The sun is dropping very low in the western sky."
	CRLF	
	JUMP	?CND1
?ELS75:	CALL2	SCORE,118
	CRLF	
	PRINTI	"The sky is darkening as the sun sinks into the smoggy haze of the horizon."
	CRLF	
	JUMP	?CND1
?ELS67:	SUB	STIME,X
	GRTR?	STACK,1028 \?ELS83
	SUB	LAST-SUN-TIME,X
	GRTR?	STACK,1028 /?ELS83
	SET	'LIGHT-LEVEL,1
	FSET?	HERE,OUTSIDEBIT \?CND1
	EQUAL?	SYEAR,2041,2051 \?ELS91
	CRLF	
	PRINTI	"Twilight casts its long shadows across the city as the sun disappears in the west."
	CRLF	
	JUMP	?CND1
?ELS91:	CRLF	
	PRINTI	"The dusk continues to gather; an ominous darkness settles onto the city."
	CRLF	
	JUMP	?CND1
?ELS83:	SUB	STIME,X
	GRTR?	STACK,1049 \?CND1
	SUB	LAST-SUN-TIME,X
	GRTR?	STACK,1049 /?CND1
	SET	'LIGHT-LEVEL,0
	FSET?	HERE,OUTSIDEBIT \?CND1
	CRLF	
	PRINTI	"It is night."
	CRLF	
?CND1:	SET	'LAST-SUN-TIME,STIME
	RFALSE	


	.FUNCT	I-SKYCAB,OLD-WINNER
	CALL	QUEUE,I-SKYCAB,-1
	INC	'SKYCAB-COUNTER
	EQUAL?	SKYCAB-COUNTER,1 \?ELS5
	CRLF	
	PRINTI	"The gentle voice of your domestic computer calls softly from one of its many unseen speakers. ""The skycab you asked for is now waiting on the roof."" Jill "
	EQUAL?	HERE,MASTER-BEDROOM \?ELS10
	PRINTI	"summons the robutler to carry your baggage"
	JUMP	?CND8
?ELS10:	PRINTI	"appears at the top of the steps with the robutler, who is carrying several bags"
?CND8:	PRINTI	". ""Algie has everything, Perry. Let's get going!""

You take a last look around the apartment and follow Jill and Algie into the hallway and up to the roofpad. As you clamber into the waiting skycab, Jill gives the robutler a fond farewell pat. The skycab climbs lazily and veers off to the northeast."
	CRLF	
	CRLF	
	MOVE	MAGAZINE,JILL
	CALL2	GOTO,SKYCAB
	MOVE	SEAT,SKYCAB
	MOVE	PLAYER,SEAT
	MOVE	JILL,HERE
	RTRUE	
?ELS5:	EQUAL?	SKYCAB-COUNTER,2 \?ELS20
	CRLF	
	PRINTI	"The cab enters the central Rockvil traffic pattern, gently curving along the ring of downtown parks. "
	SET	'OLD-WINNER,WINNER
	SET	'WINNER,PLAYER
	CALL	PERFORM,V?EXAMINE,PARK-OBJECT
	SET	'WINNER,OLD-WINNER
	CRLF	
	PRINTI	"Jill, glancing through yet another "
	PRINTD	MAGAZINE-ARTICLE
	PRINTR	" on the Silver Dove, says, ""This story talks about the new athletics and art forms that are still being discovered for the weightless area at the axes of the habitats. Oh, Perry, I'm so excited,"" she adds, unnecessarily."
?ELS20:	EQUAL?	SKYCAB-COUNTER,3 \?ELS28
	CRLF	
	PRINTI	"The skycab continues its wide arc around the downtown area, approaching the Rockvil Pier. "
	SET	'OLD-WINNER,WINNER
	SET	'WINNER,PLAYER
	CALL	PERFORM,V?EXAMINE,RIVER
	SET	'WINNER,OLD-WINNER
	RTRUE	
?ELS28:	EQUAL?	SKYCAB-COUNTER,4 \?ELS32
	CRLF	
	PRINTI	"As the cab whisks northward along the edge of the river, y"
	PRINT	RS-DESC
	CRLF	
	RTRUE	
?ELS32:	EQUAL?	SKYCAB-COUNTER,5 \?ELS36
	CRLF	
	PRINTI	"As the skycab begins its approach to the spaceport, it passes over the museum established on the site of the former BSF Base, a sobering monument to one of mankind's great follies.

Suddenly the "
	PRINTD	VIEWSCREEN
	PRINTR	" lights up, and Mitchell's face appears. ""Hi, Mom, Dad! I wanted to wish you bon voyage, and I enlisted a little help!"" He expands the field of vision to include the entire living room of his spacious apartment at the Marine Biology Institute in Nova Scotia. The room is filled with your grandchildren and great-grandchildren, plus various in-laws, more than twenty members of the Simm clan. Everyone is hooting, yelling, waving, and blowing kisses. ""We're having a big party in your honor -- I'm only sorry we couldn't be there with you. We're real proud of you both, and excited for you, too. Call me when you get to the habitat! Bye!"" The clan signs off by singing Auld Lang Syne, and when the screen goes dark, you notice that Jill's eyes are wet, and a second later you realize that yours are, as well."
?ELS36:	EQUAL?	SKYCAB-COUNTER,6 \FALSE
	CALL1	END-IT
	RSTACK	


	.FUNCT	I-SUFFOCATE
	INC	'SUFFOCATE-COUNTER
	EQUAL?	SUFFOCATE-COUNTER,17 \?ELS3
	CALL2	INT,I-SUFFOCATE
	PUT	STACK,0,0
	MOVE	SABOTEURS,LOCAL-GLOBALS
	EQUAL?	HERE,CORE \FALSE
	CRLF	
	PRINTR	"A National Guard patrol enters the area and rushes to the side of the prone bodies. ""Still breathing, but barely!"" shouts the leader. They grab the saboteurs and carry them out."
?ELS3:	EQUAL?	SUFFOCATE-COUNTER,16 \?ELS12
	CALL2	INT,I-SABOTAGE
	PUT	STACK,0,0
	CALL	QUEUE,I-SUFFOCATE,24
	PUTP	SABOTEURS,P?LDESC,STR?12
	EQUAL?	HERE,CORE \FALSE
	CRLF	
	PRINTR	"One of the men suddenly gasps and falls over. The others dash to his side, then slowly pass out themselves."
?ELS12:	EQUAL?	SUFFOCATE-COUNTER,13 \?ELS19
	EQUAL?	HERE,CORE \?ELS19
	CRLF	
	PRINTR	"The saboteur with the gun says, ""Hurry, will ya! I need to get some fresh air!"" The apparent leader replies, ""We're working as fast as we can! Keep your cool."""
?ELS19:	EQUAL?	SUFFOCATE-COUNTER,8 \FALSE
	EQUAL?	HERE,CORE \FALSE
	SET	'YES-NO-FLAG,8
	CALL	QUEUE,I-YES-NO,2
	CRLF	
	PRINTR	"One of the men, tugging at the collar of his smock, says, ""Stuffy in here, isn't it?"""


	.FUNCT	I-AIR-CONDITIONING
	INC	'AIR-CONDITIONING-COUNTER
	EQUAL?	AIR-CONDITIONING-COUNTER,20,35 \?ELS3
	CALL1	V-DIAGNOSE
	RTRUE	
?ELS3:	EQUAL?	AIR-CONDITIONING-COUNTER,46 \FALSE
	ZERO?	SIMULATING /?ELS8
	CRLF	
	PRINTI	"The raging fever must be affecting your mind; the world around you seems to be shimmering away and vanishing. Then suddenly -- you're out of "
	PRINTD	SIMULATION-MODE
	PRINTI	"! Something is terribly wrong! Nothing feels right. You can't even think straight. Your functions are fading..."
	CRLF	
	CRLF	
	CALL1	FINISH
	RFALSE	
?ELS8:	CRLF	
	PRINTI	"The dysfunction of your systems is becoming incredibly serious, and you feel it as almost a burning pain. It numbs your mind, blocks your thought patterns. You feel your consciousness fade away..."
	CRLF	
	CRLF	
	CALL1	FINISH
	RFALSE	


	.FUNCT	I-RORSCHACH
	CALL	QUEUE,I-RORSCHACH,-1
	GRTR?	GRIMWOLD-COUNTER,0 \?CND1
	INC	'GRIMWOLD-COUNTER
	GRTR?	GRIMWOLD-COUNTER,8 \?ELS6
	MOVE	GRIMWOLD,LOCAL-GLOBALS
	MOVE	PERELMAN,LOCAL-GLOBALS
	FCLEAR	PERELMAN,NDESCBIT
	CALL2	INT,I-RORSCHACH
	PUT	STACK,0,0
	SET	'GRIMWOLD-COUNTER,0
	MOVE	COFFEE,LOCAL-GLOBALS
	CALL2	VISIBLE?,PERELMAN
	ZERO?	STACK /?CND7
	EQUAL?	PERELMAN,WINNER \?CND7
	CALL1	CLEAR-BUF
?CND7:	CALL	QUEUE,I-PERELMAN,30
	ADD	TIME,25 >LAST-ABE-TIME
	CRLF	
	PRINTR	"""Hmmph!"" says Grimwold, whirling and heading for the door. ""This rudeness will certainly figure in my report!"" Perelman looks at you with a mixture of annoyance and puzzlement, then rushes off after the psychiatrist."
?ELS6:	CRLF	
	PRINTR	"After a moment, Grimwold again asks, ""Can we begin now?"""
?CND1:	IN?	GRIMWOLD,OFFICE /?ELS20
	MOVE	GRIMWOLD,OFFICE
	MOVE	PERELMAN,OFFICE
	FSET	PERELMAN,NDESCBIT
	EQUAL?	HERE,OFFICE /?ELS23
	CALL	QUEUE,I-RORSCHACH,1
	RFALSE	
?ELS23:	CALL2	INT,I-MESSAGE-E
	PUT	STACK,0,0
	CRLF	
	PRINTI	"Perelman enters with Dr. Ernest Grimwold, a quintessential Viennese psychiatrist whom you met a few days earlier, and nods to you. ""Good "
	GRTR?	TIME,720 \?ELS30
	PRINTI	"afternoon"
	JUMP	?CND28
?ELS30:	PRINTI	"morning"
?CND28:	PRINTI	", PRISM. You remember Dr. Grimwold."""
	JUMP	?CND18
?ELS20:	EQUAL?	HERE,OFFICE /?ELS40
	CALL	QUEUE,I-RORSCHACH,1
	RFALSE	
?ELS40:	CALL2	INT,I-MESSAGE-E
	PUT	STACK,0,0
	CRLF	
	PRINTI	"Perelman"
	PRINT	SPOTS-ACTIVE-LIGHT
	PRINTI	" come on. ""Ah, here you are. PRISM, you remember Dr. Ernest Grimwold."" You recognize and greet the psychiatrist who gave you a series of psych tests a few days ago."
?CND18:	SET	'GRIMWOLD-COUNTER,1
	CRLF	
	CRLF	
	PRINTR	"""It's a pleasure to see you again,"" says Grimwold, in an accent that matches his appearance perfectly. ""This should take only a couple of minutes. I'm going to show you some patterns, and I simply want you to tell me the single word that comes to mind when you see them. Don't think about it; just say the first word you think of.""

Grimwold reaches below your viewing area and picks up a sheaf of placards. ""Ready to begin?"" he asks."


	.FUNCT	BLOT-ACTION,CNT=0,WORDS-IN-RESPONSE
?PRG1:	ZERO?	CNT \?ELS5
	CALL2	INIT-STATUS-LINE,18
	CALL1	STATUS-LINE
	JUMP	?CND3
?ELS5:	PRINTI	"Grimwold nods knowingly, mumbles under his breath, and makes a note in his pad. "
?CND3:	CALL1	INK-BLOT
	PRINTI	"""Okay, here's the "
	ZERO?	CNT \?ELS14
	PRINTI	"first"
	JUMP	?CND12
?ELS14:	PRINTI	"next"
?CND12:	PRINTI	" one,"" he says, holding a card up to your visual unit."
	CRLF	
?PRG23:	CRLF	
	PRINTI	">"
	READ	P-INBUF,P-LEXV
	CALL1	BLOT-WORD-COUNT >WORDS-IN-RESPONSE
	GRTR?	WORDS-IN-RESPONSE,1 \?ELS27
	PRINTI	"""You're not following my instructions, PRISM. Just tell me the one word that pops into your mind."""
	CRLF	
	JUMP	?PRG23
?ELS27:	GETB	P-LEXV,P-LEXWORDS
	ZERO?	STACK \?ELS31
	PRINTI	"""I beg your pardon?"""
	CRLF	
	JUMP	?PRG23
?ELS31:	GET	P-LEXV,1
	EQUAL?	STACK,W?RESTORE,W?SAVE \?ELS35
	PRINTI	"You can't "
	GET	P-LEXV,1
	EQUAL?	STACK,W?RESTORE \?ELS40
	PRINTI	"RESTORE"
	JUMP	?CND38
?ELS40:	PRINTI	"SAVE"
?CND38:	PRINTI	" right now -- you're in the middle of an important psych test!"
	CRLF	
	JUMP	?PRG23
?ELS35:	GET	P-LEXV,1
	EQUAL?	STACK,W?QUIT,W?Q \?ELS50
	CALL1	V-QUIT
	JUMP	?PRG23
?ELS50:	GET	P-LEXV,1
	EQUAL?	STACK,W?RESTART \?ELS52
	CALL1	V-RESTART
	JUMP	?PRG23
?ELS52:	GET	P-LEXV,1
	EQUAL?	STACK,W?SCRIPT \?ELS54
	CALL1	V-SCRIPT
	JUMP	?PRG23
?ELS54:	GET	P-LEXV,1
	EQUAL?	STACK,W?UNSCRIPT \?REP24
	CALL1	V-UNSCRIPT
	JUMP	?PRG23
?REP24:	EQUAL?	CNT,4 \?ELS61
	MOVE	GRIMWOLD,LOCAL-GLOBALS
	MOVE	PERELMAN,LOCAL-GLOBALS
	MOVE	COFFEE,LOCAL-GLOBALS
	FCLEAR	PERELMAN,NDESCBIT
	CALL2	VISIBLE?,PERELMAN
	ZERO?	STACK /?CND62
	EQUAL?	PERELMAN,WINNER \?CND62
	CALL1	CLEAR-BUF
?CND62:	CALL	QUEUE,I-PERELMAN,30
	ADD	TIME,25 >LAST-ABE-TIME
	SET	'GRIMWOLD-COUNTER,0
	CALL2	INIT-STATUS-LINE,2
	PRINTI	"Grimwold makes a final notation in his notebook. ""Thanks, PRISM."" He picks up all the placards and leaves the room along with Perelman."
	CRLF	
	CALL2	INT,I-RORSCHACH
	PUT	STACK,0,0
	RTRUE	
?ELS61:	CALL1	STATUS-LINE
	CALL2	INCREMENT-TIME,1
	INC	'CNT
	JUMP	?PRG1


	.FUNCT	BLOT-WORD-COUNT,WORD-COUNT,REVISED-COUNT
	GETB	P-LEXV,P-LEXWORDS >WORD-COUNT
	SET	'REVISED-COUNT,WORD-COUNT
?PRG1:	ZERO?	WORD-COUNT \?CND3
	JUMP	?REP2
?CND3:	MUL	2,WORD-COUNT
	SUB	STACK,1
	GET	P-LEXV,STACK
	EQUAL?	STACK,W?QUOTE \?CND6
	DEC	'REVISED-COUNT
?CND6:	DEC	'WORD-COUNT
	JUMP	?PRG1
?REP2:	GET	P-LEXV,1
	EQUAL?	STACK,W?SAY,W?ANSWER \?CND9
	DEC	'REVISED-COUNT
?CND9:	GET	P-LEXV,1
	EQUAL?	STACK,W?GRIMWOLD,W?PSYCHIATR /?THN15
	GET	P-LEXV,1
	EQUAL?	STACK,W?DR,W?DOCTOR \?CND12
?THN15:	SUB	REVISED-COUNT,2 >REVISED-COUNT
	RETURN	REVISED-COUNT
?CND12:	RETURN	REVISED-COUNT


	.FUNCT	INK-BLOT,X=12,Y=5,CNT=4,SIDE-OFFSET,CENTER-OFFSET,CHAR
	BUFOUT	FALSE-VALUE
	SCREEN	S-WINDOW
	RANDOM	6 >CENTER-OFFSET
	SUB	16,CENTER-OFFSET
	RANDOM	STACK >SIDE-OFFSET
	ADD	22,SIDE-OFFSET >X
	RANDOM	3 >CHAR
?PRG1:	CALL	INVERSE-LINE,CNT,TRUE-VALUE
	INC	'CNT
	EQUAL?	CNT,19 \?PRG1
	EQUAL?	CHAR,2,3 \?CND6
	HLIGHT	1
?CND6:	
?PRG9:	
?PRG11:	CURSET	Y,X
	EQUAL?	CHAR,1 \?ELS15
	PRINTI	" "
	JUMP	?CND13
?ELS15:	EQUAL?	CHAR,2 \?ELS19
	PRINTI	"X"
	JUMP	?CND13
?ELS19:	PRINTI	">"
?CND13:	SUB	81,X
	CURSET	Y,STACK
	EQUAL?	CHAR,1 \?ELS28
	PRINTI	" "
	JUMP	?CND26
?ELS28:	EQUAL?	CHAR,2 \?ELS32
	PRINTI	"X"
	JUMP	?CND26
?ELS32:	PRINTI	"<"
?CND26:	SUB	40,CENTER-OFFSET
	EQUAL?	X,STACK \?ELS41
	JUMP	?REP12
?ELS41:	INC	'X
	JUMP	?PRG11
?REP12:	EQUAL?	Y,17 \?ELS46
	JUMP	?REP10
?ELS46:	RANDOM	100
	LESS?	40,STACK /?ELS51
	RANDOM	3
	ADD	SIDE-OFFSET,STACK >SIDE-OFFSET
	JUMP	?CND49
?ELS51:	RANDOM	100
	LESS?	67,STACK /?CND49
	RANDOM	3
	SUB	SIDE-OFFSET,STACK >SIDE-OFFSET
?CND49:	RANDOM	100
	LESS?	40,STACK /?ELS56
	RANDOM	2
	SUB	CENTER-OFFSET,STACK >CENTER-OFFSET
	JUMP	?CND54
?ELS56:	RANDOM	100
	LESS?	67,STACK /?CND54
	RANDOM	2
	ADD	CENTER-OFFSET,STACK >CENTER-OFFSET
?CND54:	LESS?	SIDE-OFFSET,0 \?CND59
	SET	'SIDE-OFFSET,1
?CND59:	LESS?	CENTER-OFFSET,0 \?CND62
	SET	'CENTER-OFFSET,0
?CND62:	ADD	SIDE-OFFSET,CENTER-OFFSET
	GRTR?	STACK,18 \?CND65
	DEC	'CENTER-OFFSET
	SUB	18,CENTER-OFFSET >SIDE-OFFSET
?CND65:	ADD	22,SIDE-OFFSET >X
	INC	'Y
	JUMP	?PRG9
?REP10:	EQUAL?	CHAR,2,3 \?CND68
	HLIGHT	0
?CND68:	SCREEN	S-TEXT
	BUFOUT	TRUE-VALUE
	RTRUE	


	.FUNCT	I-POST-OFFICE
	CALL	QUEUE,I-POST-OFFICE,-1
	EQUAL?	HERE,POST-OFFICE /?ELS3
	CALL2	INT,I-POST-OFFICE
	PUT	STACK,0,0
	RFALSE	
?ELS3:	EQUAL?	STIME,960 \?ELS5
	PRINTI	"The open window"
	EQUAL?	SYEAR,2071 \?ELS10
	PRINTI	" closes"
	JUMP	?CND8
?ELS10:	PRINTI	"s close"
?CND8:	PRINTI	", and those still waiting wander listlessly out of the "
	PRINTD	POST-OFFICE-OBJECT
	PRINTR	"."
?ELS5:	EQUAL?	SYEAR,2071 \?ELS26
	GRTR?	STIME,888 \?ELS26
	LESS?	STIME,901 /?THN23
?ELS26:	EQUAL?	SYEAR,2061 \FALSE
	GRTR?	STIME,594 \FALSE
	LESS?	STIME,601 \FALSE
?THN23:	PRINTI	"A line is forming at the window with the sign."
	CRLF	
	CALL	QUEUE,I-POST-OFFICE,15
	RTRUE	


	.FUNCT	I-WILD-DOGS
	EQUAL?	HERE,MAIN-STREET-BRIDGE /?CND1
	CALL2	INT,I-WILD-DOGS
	PUT	STACK,0,0
	RFALSE	
?CND1:	INC	'WILD-DOG-COUNTER
	EQUAL?	WILD-DOG-COUNTER,1 \?ELS8
	MOVE	BARKING,HERE
	PRINTR	"You hear the sound of distant barking to the east."
?ELS8:	EQUAL?	WILD-DOG-COUNTER,2,3 \?ELS12
	PRINTR	"The barking continues. In fact, the sound seems to be getting closer."
?ELS12:	EQUAL?	WILD-DOG-COUNTER,4 \FALSE
	CALL2	SCORE,45
	CALL2	JIGS-UP,STR?13
	RSTACK	


	.FUNCT	I-CAFETERIA
	EQUAL?	HERE,CAFETERIA /?ELS3
	CALL2	INT,I-CAFETERIA
	PUT	STACK,0,0
	RFALSE	
?ELS3:	EQUAL?	TIME,480,705,1035 \?ELS5
	CRLF	
	PRINTI	"The room begins to fill with mealtime crowds."
	CRLF	
	RFALSE	
?ELS5:	EQUAL?	TIME,570,795,1125 \FALSE
	CRLF	
	PRINTI	"The mealtime crowds begin to disperse."
	CRLF	
	RFALSE	

	.ENDI
