"INTERRUPTS for
			A MIND FOREVER VOYAGING
	     (c) 1985 by Infocom, Inc.  All Rights Reserved."

;"the purpose of this file is to get stuff needed very often, such as
interrupts that run every turn, into the pre-load"

<ROUTINE I-PERELMAN ("AUX" (TOLD <>))
	 <COND (<OR <G? ,PART-FLAG 2>
		    ,REVIEWING-RECORDINGS>
		<DISABLE <INT I-PERELMAN>>
		<RFALSE>)>
	 <QUEUE I-PERELMAN -1>
	 <COND (<AND <G? ,TIME 536>
		     <NOT <G? ,LAST-ABE-TIME 536>>> ;"it's 8:56am"
		<COND (<EQUAL? ,HERE ,CONTROL-CENTER>
		       <TELL CR "Doctor Perelman walks jauntily into the ">
		       <PRINTD ,CONTROL-CENTER-OBJECT>
		       <TELL
". \"Good morning to all,\" he calls cheerily and begins chatting with
the chief of the night shift." CR>
		       <SET TOLD T>)>
		<PUT-PERELMAN-IN-THE-RIGHT-PLACE>)
	       (<AND <G? ,TIME 550>
		     <NOT <G? ,LAST-ABE-TIME 550>>> ;"it's 9:10am"
		<COND (<EQUAL? ,HERE ,CONTROL-CENTER>
		       <COND (<IN? ,PERELMAN ,CONTROL-CENTER>
			      <TELL CR
"Perelman stops talking to the technician, who hangs up his
white overcoat and leaves the control room. Perelman crosses
the room and picks up a thick report." CR>)
			     (T
			      <TELL CR
"Perelman enters, looks around, and picks up a thick report." CR>)>
		       <SET TOLD T>)>
		<PUT-PERELMAN-IN-THE-RIGHT-PLACE>)
	       (<AND <G? ,TIME 599>
		     <NOT <G? ,LAST-ABE-TIME 599>>> ;"it's 9:59am"
		<COND (<AND <EQUAL? ,HERE ,CONTROL-CENTER>
			    <IN? ,PERELMAN ,CONTROL-CENTER>>
		       <TELL CR
"Perelman puts down the report and walks toward the door. He calls to
one of the technicians. \"Nat, I'll be in my office.\"" CR>
		       <SET TOLD T>)>
		<PUT-PERELMAN-IN-THE-RIGHT-PLACE>)
	       (<AND <G? ,TIME 616>
		     <NOT <G? ,LAST-ABE-TIME 616>>> ;"it's 10:16am"
		<SET TOLD <PERELMAN-WALKS-IN-WITH-COFFEE>>
		<PUT-PERELMAN-IN-THE-RIGHT-PLACE>)
	       (<AND <G? ,TIME 711>
		     <NOT <G? ,LAST-ABE-TIME 711>>> ;"it's 11:51am"
		<COND (<AND <EQUAL? ,HERE ,OFFICE>
			    <IN? ,PERELMAN ,OFFICE>>
		       <TELL CR
"The telephone buzzes. \"Perelman,\" says Perelman into the receiver. The
voice at the other end is so quiet that even your sensitive audio monitors
can't pick it up. \"Hi, Aseejh.\" Pause. \"Yes, let's get together on that.\"
He glances up at his terminal. \"It's almost lunch time; want to meet me in
the cafeteria?\" Pause. \"Okay, ten minutes.\" Perelman replaces the receiver
and leaves the room." CR>
		       <SET TOLD T>)>
		<PUT-PERELMAN-IN-THE-RIGHT-PLACE>)
	       (<AND <G? ,TIME 790>
		     <NOT <G? ,LAST-ABE-TIME 790>>> ;"it's 1:10pm"
		<SET TOLD <PERELMAN-WALKS-IN-WITH-COFFEE>>
		<PUT-PERELMAN-IN-THE-RIGHT-PLACE>)
	       (<AND <G? ,TIME 834>
		     <NOT <G? ,LAST-ABE-TIME 834>>> ;"it's 1:54pm"
		<COND (<AND <EQUAL? ,HERE ,OFFICE>
		       	    <IN? ,PERELMAN ,OFFICE>>
		       <CRLF>
		       <PRINTD ,PRICE>
		       <TELL
", Doctor Perelman's secretary, appears in the doorway. \"Doc, don't forget,
you've got a meeting with Vera at two o'clock.\" He glances at his watch,
mumbles some impolite things under his breath, and rushes out." CR>
		       <SET TOLD T>)>
		<PUT-PERELMAN-IN-THE-RIGHT-PLACE>)
	       (<AND <G? ,TIME 980>
		     <NOT <G? ,LAST-ABE-TIME 980>>> ;"it's 4:20pm"
		<COND (<EQUAL? ,HERE ,OFFICE>
		       <TELL CR
"Doctor Perelman walks into the office, carrying a pile of pink message slips.
He scans them, drops all but one into a basket on his desk, picks up the phone
receiver, and presses two or three buttons. Your sensitive audio pickup hears
a few rings, a click, and then a young woman's voice: \"This is ">
		       <PRINTD ,ESTHER>
		       <TELL
". Can't come to the phone now. Please leave a message, though.\" Pause.
\"BEEP!\" Perelman speaks into the phone. \"Hi, it's Dad. I got your message,
but I can't make it; I'm too tied up with the Project. I'll probably be in
the office all evening if you want to talk.\"" CR>
		       <SET TOLD T>)>
		<PUT-PERELMAN-IN-THE-RIGHT-PLACE>)
	       (<AND <G? ,TIME 1157>
		     <NOT <G? ,LAST-ABE-TIME 1157>>> ;"it's 7:17pm"
		<COND (<EQUAL? ,HERE ,OFFICE>
		       <COND (<IN? ,PERELMAN ,OFFICE>
			      <CRLF>
			      <PRINTD ,PRICE>
			      <TELL
", Perelman's secretary, pops her head in the doorway. \"Hey Doc! ">)
			     (T
			      <TELL CR "Perelman enters with his secretary, ">
			      <PRINTD ,PRICE>
			      <TELL ", who asks, \"">)>
		       <TELL
"Need me for anything else tonight?\" Perelman, grinning, responds, \"Not
unless you've decided to dump that unfairly handsome husband of yours.\" She
looks exasperated at what is obviously an old joke and shakes a fist at him
in a mock threat. \"Really, though, I'll be fine,\" says Perelman. \"Scram.\"
She disappears from sight, shouting from the next room, \"Good night, Doc.
Don't stay too late!\"" CR>
		       <SET TOLD T>)>
		<PUT-PERELMAN-IN-THE-RIGHT-PLACE>)
	       (<AND <G? ,TIME 1241>
		     <NOT <G? ,LAST-ABE-TIME 1241>>> ;"it's 8:41pm"
		<COND (<AND <EQUAL? ,HERE ,OFFICE>
			    <IN? ,PERELMAN ,OFFICE>>
		       <TELL
"Perelman shoves some papers into a notebook, types something on his
desk terminal, and leaves the room." CR>
		       <SET TOLD T>)>
		<PUT-PERELMAN-IN-THE-RIGHT-PLACE>)
	       (<AND <G? ,TIME 1281>
		     <NOT <G? ,LAST-ABE-TIME 1281>>> ;"it's 9:21pm"
		<COND (<EQUAL? ,HERE ,CONTROL-CENTER>
		       <TELL CR "Doctor Perelman walks into the ">
		       <PRINTD ,CONTROL-CENTER-OBJECT>
		       <TELL
". He wanders around the room, talking quietly with a few technicians.
He picks up a hefty printout from the printer and settles into a
swivel chair to read it." CR>
		       <SET TOLD T>)>
		<PUT-PERELMAN-IN-THE-RIGHT-PLACE>)
	       (<AND <G? ,TIME 1312>
		     <NOT <G? ,LAST-ABE-TIME 1312>>> ;"it's 9:52pm"
		<COND (<AND <EQUAL? ,HERE ,CONTROL-CENTER>
			    <IN? ,PERELMAN ,CONTROL-CENTER>>
		       <TELL CR
"Perelman puts down the printout and rubs his eyes. He stands and
unsuccessfully stifles a yawn. \"I'm going home,\" he announces to
the tiny evening staff">
		       <COND (<PROB 50>
			      <TELL
". Try not to call me unless it's an emergency">)>
		       <TELL ".\" He leaves the control complex." CR>
		       <SET TOLD T>)>
		<PUT-PERELMAN-IN-THE-RIGHT-PLACE>)
	       (<AND <G? ,TIME 1318>
		     <NOT <G? ,LAST-ABE-TIME 1318>>> ;"it's 10:03pm"
		<COND (<EQUAL? ,HERE ,OFFICE>
		       <TELL
"Doctor Perelman walks wearily into the office, puts on a thin overcoat, and
grabs a notebook stuffed with papers. He stops at the doorway, glancing about
the room, and" ,SPOTS-ACTIVE-LIGHT ". A smile breaks through the weary lines
on his face. He raises his hand to his forehead in a friendly salute. \"Good
night, PRISM.\" He dims the light and closes the office door. The sensors on
your monitor automatically adjust to the lower light level." CR>
		       <SET TOLD T>)>)>
	 <SETG LAST-ABE-TIME ,TIME>
	 <COND (.TOLD
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE PUT-PERELMAN-IN-THE-RIGHT-PLACE ()
	 <COND (<L? ,TIME 536>
		<COND (<AND <VISIBLE? ,PERELMAN>
			    <EQUAL? ,PERELMAN ,WINNER>>
		       <CLEAR-BUF>)>
		<MOVE ,PERELMAN ,LOCAL-GLOBALS>
		<MOVE ,COFFEE ,LOCAL-GLOBALS>)
	       (<AND <G? ,TIME 535>
		     <L? ,TIME 550>>
		<MOVE ,PERELMAN ,CONTROL-CENTER>
		<MOVE ,COFFEE ,LOCAL-GLOBALS>
		<PUTP ,PERELMAN ,P?LDESC
"Doctor Perelman is at the far end of the room, speaking to the head
technician of the night shift.">)
	       (<AND <G? ,TIME 549>
		     <L? ,TIME 599>>
		<MOVE ,PERELMAN ,CONTROL-CENTER>
		<MOVE ,COFFEE ,LOCAL-GLOBALS>
		<PUTP ,PERELMAN ,P?LDESC
"Doctor Perelman is here, reading a report.">)
	       (<AND <G? ,TIME 598>
		     <L? ,TIME 616>>
		<COND (<AND <VISIBLE? ,PERELMAN>
			    <EQUAL? ,PERELMAN ,WINNER>>
		       <CLEAR-BUF>)>
		<MOVE ,PERELMAN ,LOCAL-GLOBALS>
		<MOVE ,COFFEE ,LOCAL-GLOBALS>)
	       (<AND <G? ,TIME 615>
		     <L? ,TIME 711>>
		<MOVE ,PERELMAN ,OFFICE>
		<MOVE ,COFFEE ,OFFICE>
		<PUTP ,PERELMAN ,P?LDESC
"Doctor Perelman is sitting at his desk, reading through stacks of papers
and occasionally typing on his desk terminal.">)
	       (<AND <G? ,TIME 710>
		     <L? ,TIME 790>>
		<COND (<AND <VISIBLE? ,PERELMAN>
			    <EQUAL? ,PERELMAN ,WINNER>>
		       <CLEAR-BUF>)>
		<MOVE ,PERELMAN ,LOCAL-GLOBALS>
		<MOVE ,COFFEE ,LOCAL-GLOBALS>)
	       (<AND <G? ,TIME 789>
		     <L? ,TIME 834>>
		<MOVE ,PERELMAN ,OFFICE>
		<MOVE ,COFFEE ,OFFICE>
		<PUTP ,PERELMAN ,P?LDESC
"Doctor Perelman is sitting at his desk, reading through stacks of papers
and occasionally typing on his desk terminal.">)
	       (<AND <G? ,TIME 833>
		     <L? ,TIME 980>>
		<COND (<AND <VISIBLE? ,PERELMAN>
			    <EQUAL? ,PERELMAN ,WINNER>>
		       <CLEAR-BUF>)>
		<MOVE ,COFFEE ,LOCAL-GLOBALS>
		<MOVE ,PERELMAN ,LOCAL-GLOBALS>)
	       (<AND <G? ,TIME 979>
		     <L? ,TIME 1241>>
		<MOVE ,PERELMAN ,OFFICE>
		<PUTP ,PERELMAN ,P?LDESC
"Doctor Perelman is sitting at his desk, reading through stacks of papers
and occasionally typing on his desk terminal.">)
	       (<AND <G? ,TIME 1240>
		     <L? ,TIME 1281>>
		<COND (<AND <VISIBLE? ,PERELMAN>
			    <EQUAL? ,PERELMAN ,WINNER>>
		       <CLEAR-BUF>)>
		<MOVE ,PERELMAN ,LOCAL-GLOBALS>
		<MOVE ,COFFEE ,LOCAL-GLOBALS>)
	       (<AND <G? ,TIME 1280>
		     <L? ,TIME 1312>>
		<MOVE ,PERELMAN ,CONTROL-CENTER>
		<MOVE ,COFFEE ,LOCAL-GLOBALS>
		<PUTP ,PERELMAN ,P?LDESC
"Doctor Perelman is sitting in a swivel chair, reading a long printout.">)
	       (<G? ,TIME 1311>
		<COND (<AND <VISIBLE? ,PERELMAN>
			    <EQUAL? ,PERELMAN ,WINNER>>
		       <CLEAR-BUF>)>
		<MOVE ,PERELMAN ,LOCAL-GLOBALS>
		<MOVE ,COFFEE ,LOCAL-GLOBALS>)>>

<ROUTINE I-JILL ("AUX" OLD-JILL-LOC)
	 <COND (<EQUAL? ,SYEAR 2061>
		<COND (<NOT <IN-APARTMENT?>>
		       <RFALSE>)>
		<SETG MITCHELL-NEWS-FLAG T>
		<QUEUE I-APARTMENT -1>
		<SETG FOLLOW-FLAG 1>
		<QUEUE I-UNFOLLOW 2>
		<SCORE 119> ;"4 points"
		<MOVE ,JILL ,BEDROOM>
		<COND (<FSET? ,APARTMENT-DOOR ,OPENBIT>
		       <TELL CR "You hear a noise from the open doorway">)
		      (<EQUAL? ,HERE ,LIVING-ROOM>
		       <TELL CR "The apartment door opens">)
		      (T
		       <TELL CR "You hear the apartment door open">)>
		<TELL " and">
		<COND (<NOT <EQUAL? <LOC ,PLAYER> ,HERE>>
		       <MOVE ,PLAYER ,HERE>
		       <TELL " you stand as">)>
		<TELL
" Jill comes running into the room. She seems terribly upset, throws herself
against you, and begins sobbing uncontrollably. As you attempt to comfort her,
she begins speaking between the sobs.|
|
\"It's Mitchell,\" she begins, and a lifelong fear of injury to your only
child clutches at your heart. \"He's gone off and joined the Church of God's
Word. He came and collected all his stuff about an hour ago. He said he's
going to an orientation camp in Arizona. He says he'll never be able to
speak to you or me again unless we join the Church. I followed him all the
way to the airport but he wouldn't listen to me! He wouldn't even say goodbye
to me! He wouldn't even...\" She begins sobbing even more uncontrollably,
breaks away from you, and ">
		<COND (<EQUAL? ,HERE ,BEDROOM>
		       <TELL "throws herself down onto the bed." CR>
		       <RTRUE>)
		      (T
		       <TELL "runs into the bedroom." CR>
		       <RTRUE>)>)
	       (<AND <NOT <FSET? ,JILL ,TOUCHBIT>> ;"it's 2041 or 2051"
		     <IN-APARTMENT?>>
		<FSET ,JILL ,TOUCHBIT>
		<COND (<EQUAL? ,JILL-COUNTER 0>
		       <RFALSE>)
		      (T
		       <CRLF>)>
		<COND (<EQUAL? ,JILL-COUNTER 1 2>
		       <SETG FOLLOW-FLAG 2>
		       <QUEUE I-UNFOLLOW 2>
		       <TELL
"Jill appears in the bedroom doorway. \"Perry, have you been out all
night? You know how I worry.\" She returns to the bedroom." CR>)
		      (<EQUAL? ,JILL-COUNTER 3 6 7> 
		       <SETG FOLLOW-FLAG 3>
		       <QUEUE I-UNFOLLOW 2>
		       <TELL
"Jill enters from the kitchen. \"Hi, hon. You're home early!\" She kisses
you before returning to the kitchen." CR>)
		      (<OR <EQUAL? ,JILL-COUNTER 4 5>
			   <EQUAL? ,JILL-COUNTER 8 9 10>>
		       <COND (<EQUAL? ,JILL-COUNTER 4 10>
			      <TELL "Jill looks up from her book">)
			     (<EQUAL? ,JILL-COUNTER 5 8>
			      <TELL "Jill looks up from her painting">)
			     (T
			      <TELL
"Jill stops working for a moment and smiles at you">)>
		       <SETG YES-NO-FLAG 7>
		       <QUEUE I-YES-NO 2>
		       <TELL
". \"Hi, hon. Any news from your agent today?\"" CR>)
		      (T ;"JILL-COUNTER is 11 or 12"
		       <SETG FOLLOW-FLAG 2>
		       <QUEUE I-UNFOLLOW 2>
		       <TELL "Jill enters from the bedroom, ">
		       <COND (<EQUAL? ,JILL-COUNTER 11>
			      <TELL "her hair wrapped in a towel">)
			     (T
			      <TELL "wearing a robe">)>
		       <TELL
". \"Perry, I wish you wouldn't stay out so late.\" She heads
back into the bedroom." CR>)>
		<RTRUE>)
	       (<EQUAL? ,JILL-COUNTER 14>
		<QUEUE I-JILL -1>
		<SET OLD-JILL-LOC <LOC ,JILL>>
		<PUT-JILL-IN-THE-RIGHT-PLACE>
		<COND (<EQUAL? ,HERE .OLD-JILL-LOC>
		       <TELL CR
"With a deep sigh, Jill stops cleaning the mess">
		       <COND (<NOT <IN? ,JILL ,HERE>>
			      <SETG FOLLOW-FLAG 15>
		       	      <QUEUE I-UNFOLLOW <+ ,ELAPSED-TIME 2>>
		       	      <TELL " and leaves the room">)>
		       <TELL "." CR>)
		      (<IN? ,JILL ,HERE>
		       <TELL CR "Jill walks slowly into the room." CR>)>)
	       (<AND <G? ,STIME 1402> ;"11:22pm"
		     <EQUAL? ,JILL-COUNTER 12>>
		<SETG JILL-COUNTER 0>
		<MOVE ,JILL ,BEDROOM>
		<FCLEAR ,JILL-BOOK ,NDESCBIT>
		<COND (<EQUAL? ,HERE ,BEDROOM>
		       <TELL CR
"Jill puts down her book and curls under the covers. Moments later,
her breathing indicates that she is asleep." CR>
		       <RTRUE>)>)
	       (<AND <G? ,STIME 1299> ;"9:39pm"
		     <EQUAL? ,JILL-COUNTER 11>>
		<SETG JILL-COUNTER 12>
		<MOVE ,JILL ,BEDROOM>
		<MOVE ,JILL-BOOK ,BEDROOM>
		<FSET ,JILL-BOOK ,NDESCBIT>
		<COND (<EQUAL? ,HERE ,BEDROOM>
		       <TELL CR
"Jill enters and picks up her book. She slips into bed and begins reading." CR>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,BATHROOM>
		       <SETG FOLLOW-FLAG 4>
		       <QUEUE I-UNFOLLOW 2>
		       <TELL CR
"Jill finishes drying her hair and leaves the bathroom." CR>
		       <RTRUE>)>)
	       (<AND <G? ,STIME 1242> ;"8:42"
		     <EQUAL? ,JILL-COUNTER 10>>
		<SETG JILL-COUNTER 11>
		<MOVE ,JILL ,BATHROOM>
		<MOVE ,JILL-BOOK ,BEDROOM>
		<FCLEAR ,JILL-BOOK ,NDESCBIT>
		<COND (<EQUAL? ,HERE ,BATHROOM>
		       <TELL CR "Jill enters and begins wetting her hair." CR>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,BEDROOM>
		       <SETG FOLLOW-FLAG 5>
		       <QUEUE I-UNFOLLOW 2>
		       <TELL CR
"Jill enters from the living room, placing her book down near the bed. She
wanders around for a minute, looking bored. \"I think I'll do my hair,\"
she says, stepping into the bathroom." CR>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,LIVING-ROOM>
		       <SETG FOLLOW-FLAG 2>
		       <QUEUE I-UNFOLLOW 2>
		       <TELL CR
"Jill stands, stretches, and walks into the bedroom." CR>
		       <RTRUE>)>)
	       (<AND <G? ,STIME 1137> ;"6:57pm"
		     <EQUAL? ,JILL-COUNTER 9>>
		<SETG JILL-COUNTER 10>
		<MOVE ,JILL ,LIVING-ROOM>
		<MOVE ,JILL-BOOK ,LIVING-ROOM>
		<FSET ,JILL-BOOK ,NDESCBIT>
		<COND (<EQUAL? ,HERE ,LIVING-ROOM>
		       <TELL CR
"Jill picks up a book and sits down on the couch to read it." CR>
		       <RTRUE>)>)
	       (<AND <G? ,STIME 1084>
		     <EQUAL? ,JILL-COUNTER 8>>
		<SETG JILL-COUNTER 9>
		<MOVE ,JILL ,LIVING-ROOM>
		<COND (<EQUAL? ,HERE ,LIVING-ROOM>
		       <TELL CR
"Jill puts down the paintbrush and begins cleaning up the room." CR>
		       <RTRUE>)>)
	       (<AND <G? ,STIME 912>
		     <EQUAL? ,JILL-COUNTER 7>>
		<SETG JILL-COUNTER 8>
		<MOVE ,JILL ,LIVING-ROOM>
		<COND (<EQUAL? ,HERE ,LIVING-ROOM>
		       <TELL CR
"Jill enters the living room and looks around as though trying to
decide what to do. She walks over to her easel, stares at it for a
few moments, and then picks up a paintbrush." CR>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,KITCHEN>
		       <SETG FOLLOW-FLAG 6>
		       <QUEUE I-UNFOLLOW 2>
		       <TELL CR
"Jill finishes the last of the dishes and walks into the living room." CR>
		       <RTRUE>)>)
	       (<AND <G? ,STIME 859>
		     <EQUAL? ,JILL-COUNTER 6>>
		<SETG JILL-COUNTER 7>
		<MOVE ,JILL ,KITCHEN>
		<MOVE ,SALAD ,LOCAL-GLOBALS>
		<COND (<EQUAL? ,HERE ,KITCHEN>
		       <TELL CR
"Jill finishes her salad, walks over to the sink,
and begins cleaning some dishes." CR>
		       <RTRUE>)>)
	       (<AND <G? ,STIME 813>
		     <EQUAL? ,JILL-COUNTER 5>>
		<SETG JILL-COUNTER 6>
		<MOVE ,SALAD ,KITCHEN>
		<FSET ,SALAD ,NDESCBIT>
		<MOVE ,JILL ,KITCHEN>
		<FCLEAR ,REFRIGERATOR ,OPENBIT>
		<COND (<EQUAL? ,HERE ,KITCHEN>
		       <TELL CR "Jill walks in and gets a ">
		       <PRINTD ,SALAD>
		       <TELL " from the ">
		       <PRINTD ,REFRIGERATOR>
		       <TELL ". She sits at the ">
		       <PRINTD ,DINETTE-SET>
		       <TELL " and begins slowly munching on the salad." CR>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,LIVING-ROOM>
		       <SETG FOLLOW-FLAG 3>
		       <QUEUE I-UNFOLLOW 2>
		       <TELL CR
"Jill lays down her brush. \"I'm getting hungry.\"
She heads off into the kitchen." CR>
		       <RTRUE>)>)
	       (<AND <G? ,STIME 697>
		     <EQUAL? ,JILL-COUNTER 4>>
		<SETG JILL-COUNTER 5>
		<MOVE ,JILL ,LIVING-ROOM>
		<FCLEAR ,JILL-BOOK ,NDESCBIT>
		<COND (<EQUAL? ,HERE ,LIVING-ROOM>
		       <TELL CR
"Jill puts down the book and stretches. She walks over to her easel, stares
at the painting for a moment, and picks up a paintbrush." CR>
		       <RTRUE>)>)
	       (<AND <G? ,STIME 644>
		     <EQUAL? ,JILL-COUNTER 3>>
		<SETG JILL-COUNTER 4>
		<MOVE ,JILL ,LIVING-ROOM>
		<MOVE ,JILL-BOOK ,LIVING-ROOM>
		<FSET ,JILL-BOOK ,NDESCBIT>
		<MOVE ,SALAD ,REFRIGERATOR>
		<FCLEAR ,SALAD ,NDESCBIT>
		<COND (<EQUAL? ,HERE ,LIVING-ROOM>
		       <TELL CR
"Jill walks from the kitchen to the bedroom, returns with her book, settles
onto the couch, and begins reading." CR>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,BEDROOM>
		       <TELL CR
"Jill walks into the bedroom, picks up her book, and returns
to the living room." CR>)
		      (<EQUAL? ,HERE ,KITCHEN>
		       <SETG FOLLOW-FLAG 6>
		       <QUEUE I-UNFOLLOW 2>
		       <FCLEAR ,REFRIGERATOR ,OPENBIT>
		       <TELL CR "Jill puts the salad in the ">
		       <PRINTD ,REFRIGERATOR>
		       <TELL " and goes into the living room." CR>
		       <RTRUE>)>)
	       (<AND <G? ,STIME 591>
		     <EQUAL? ,JILL-COUNTER 2>>
		<SETG JILL-COUNTER 3>
		<MOVE ,JILL ,KITCHEN>
		<MOVE ,SALAD ,KITCHEN>
		<FSET ,SALAD ,NDESCBIT>
		<COND (<EQUAL? ,HERE ,KITCHEN>
		       <TELL CR "Jill enters and begins making a salad." CR>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,BEDROOM>
		       <SETG FOLLOW-FLAG 7>
		       <QUEUE I-UNFOLLOW 2>
		       <TELL CR
"Jill walks out of the room, toward the living room." CR>
		       <RTRUE>)
		      (<EQUAL? ,HERE ,LIVING-ROOM>
		       <SETG FOLLOW-FLAG 3>
		       <QUEUE I-UNFOLLOW 2>
		       <TELL CR
"Jill passes through on her way from the bedroom to the kitchen." CR>
		       <RTRUE>)>)
	       (<AND <G? ,STIME 522>
		     <EQUAL? ,JILL-COUNTER 1>>
		<SETG JILL-COUNTER 2>
		<MOVE ,JILL ,BEDROOM>
		<COND (<EQUAL? ,HERE ,BEDROOM>
		       <TELL CR
"Jill finishes dressing and begins neatening up the room." CR>
		       <RTRUE>)>)
	       (<AND <G? ,STIME 478>
		     <L? ,STIME 1380> ;"otherwise she'd wake up a minute later"
		     <EQUAL? ,JILL-COUNTER 0>>
		<SETG JILL-COUNTER 1>
		<MOVE ,JILL ,BEDROOM>
		<COND (<EQUAL? ,HERE ,BEDROOM>
		       <TELL CR
"Jill rubs her eyes and rolls out of bed. \"Morning, honey! I sure slept
like a stone!\" She gives you a quick kiss and begins dressing." CR>
		       <RTRUE>)>)
	       (<AND ,JILL-NOT-SPOKEN-YET
		     <IN? ,JILL ,HERE>
		     <NOT <EQUAL? ,JILL-COUNTER 0>>
		     <PROB 5>>
		<SETG JILL-NOT-SPOKEN-YET <>>
		<COND (<EQUAL? ,SYEAR 2041>
		       <TELL CR
"Jill looks up. \"Perry, I heard a news report yesterday about interest rates
and housing prices. If the economy keeps going the way it's going, and someone
buys your Africa book, we might be able to afford a house next year!\"" CR>)
		      (T
		       <TELL CR
"\"Oh, Perry! Clave called while you were out,\" says Jill. \"The firm is
sending him to Japan for a week; he'll call when he gets back. He says not
to worry, he'll only be in the American section. He says that the kids keep
asking for you.\"" CR>)>)>
	 <RFALSE>>

<ROUTINE I-MITCHELL ()
	 <COND (<AND <NOT <IN-APARTMENT?>>
		     <NOT <EQUAL? ,HERE ,PARKVIEW-HALL>>>
		<DISABLE <INT I-MITCHELL>>)
	       (<AND <G? ,STIME 1374> ;"11:22pm"
		     <EQUAL? ,MITCHELL-COUNTER 4>>
		<SETG MITCHELL-COUNTER 0>
		<MOVE ,HOMEWORK ,LOCAL-GLOBALS>
		<MOVE ,MITCHELL ,LOCAL-GLOBALS>
		<COND (<EQUAL? ,HERE ,LIVING-ROOM>
		       <SETG FOLLOW-FLAG 14>
		       <QUEUE I-UNFOLLOW 2>
		       <TELL CR
"\"Good night, Dad.\" Mitch gives you a quick kiss and goes to his
\"room\" on the other side of the partition." CR>
		       <RTRUE>)>)
	       (<AND <G? ,STIME 1120>
		     <EQUAL? ,MITCHELL-COUNTER 3>>
		<SETG MITCHELL-COUNTER 4>
		<MOVE ,HOMEWORK ,LIVING-ROOM>
		<MOVE ,LOGIC-GAME ,LOCAL-GLOBALS>
		<COND (<EQUAL? ,HERE ,LIVING-ROOM>
		       <TELL CR "Mitchell puts away the ">
		       <PRINTD ,LOGIC-GAME>
		       <TELL " and spreads out his homework." CR>
		       <RTRUE>)>)
	       (<AND <G? ,STIME 1011>
		     <EQUAL? ,MITCHELL-COUNTER 2>>
		<SETG MITCHELL-COUNTER 3>
		<MOVE ,MITCHELL ,LIVING-ROOM>
		<MOVE ,LOGIC-GAME ,MITCHELL>
		<COND (<EQUAL? ,HERE ,PARKVIEW-HALL>
		       <SETG FOLLOW-FLAG 11>
		       <QUEUE I-UNFOLLOW 2>
		       <TELL
"Mitchell comes running down the hall. \"Hey Dad" ,ALGEBRA " He ">
		       <COND (<NOT <FSET? ,APARTMENT-DOOR ,OPENBIT>>
			      <TELL "opens the door and ">)>
		       <TELL "bounds into the apartment">
		       <COND (<NOT <FSET? ,APARTMENT-DOOR ,OPENBIT>>
			      <TELL ", closing the door behind him">)>
		       <TELL "." CR>
		       <RTRUE>)
		      (T
		       <COND (<EQUAL? ,HERE ,LIVING-ROOM>
		       	      <COND (<NOT <FSET? ,APARTMENT-DOOR ,OPENBIT>>
				     <TELL "The door opens and ">)>
			      <TELL "Mitchell runs into the apartment. ">)
		      	     (T
		       	      <TELL "You hear ">
			      <COND (<NOT <FSET? ,APARTMENT-DOOR ,OPENBIT>>
				     <TELL
"the front door open, followed by ">)>
			      <TELL "Mitchell's voice. ">)>
		       <TELL "\"I'm home" ,ALGEBRA>
		       <COND (<EQUAL? ,HERE ,LIVING-ROOM>
			      <TELL " He pulls out his favorite ">
			      <PRINTD ,LOGIC-GAME>
			      <TELL " and settles into a corner.">)>
		       <CRLF>
		       <RTRUE>)>)
	       (<AND <G? ,STIME 505> ;"8:25am"
		     <EQUAL? ,MITCHELL-COUNTER 1>>
		<SETG MITCHELL-COUNTER 2>
		<MOVE ,MITCHELL ,LOCAL-GLOBALS>
		<COND (<EQUAL? ,HERE ,PARKVIEW-HALL>
		       <SETG FOLLOW-FLAG 10>
		       <QUEUE I-UNFOLLOW 2>
		       <TELL CR
"Mitchell emerges from the apartment, carrying his lunch box. \"Hi, Dad!
See you later!\" He dashes down the stairs." CR>
		       <RTRUE>)
		      (T
		       <SETG FOLLOW-FLAG 12>
		       <QUEUE I-UNFOLLOW 2>
		       <TELL CR
"\"Mom! Dad!\" yells Mitchell. \"I'm off to school!\"">
		       <COND (<EQUAL? ,HERE ,LIVING-ROOM>
		       	      <TELL " Mitchell waves to you and leaves.">)>
		       <CRLF>
		       <RTRUE>)>)
	       (<AND <G? ,STIME 463>
		     <L? ,STIME 720> ;"else he wakes after sleeping a minute"
		     <EQUAL? ,MITCHELL-COUNTER 0>>
		<SETG MITCHELL-COUNTER 1>
		<MOVE ,MITCHELL ,LIVING-ROOM>
		<COND (<EQUAL? ,HERE ,LIVING-ROOM>
		       <TELL CR
"Mitchell appears from behind his partition and begins
getting ready for school." CR>
		       <RTRUE>)>)>
	 <RFALSE>>

<ROUTINE I-APARTMENT ()
	 <COND (<EQUAL? ,JILL-COUNTER 13>
		<SETG JILL-COUNTER 14>
		<QUEUE I-JILL 28>
		<COND (<IN? ,JILL ,HERE>
		       <TELL CR
"Jill, with a few final sniffles, stops crying and begins
straightening up the apartment." CR>
		       <RTRUE>)>
		<RFALSE>)
	       (<NOT <IN-APARTMENT?>>
	        <DISABLE <INT I-APARTMENT>>
		<RFALSE>)
	       (<OR <G? ,STIME 1320>
		    <L? ,STIME 480>>
		<QUEUE I-APARTMENT 30>)
	       (<AND <NOT <EQUAL? ,SYEAR 2041>>
		     <NOT ,APARTMENT-RAID-FLAG>>
		<COND (<PROB ,RAID-PROB>
		       <COND (<FSET? ,APARTMENT-DOOR ,OPENBIT>
			      <TELL CR
"You hear a commotion in the hallway and then">)
			     (T
			      <TELL CR
"WHAM! The door of your apartment slams open and">)>
		       <COND (<NOT <EQUAL? ,HERE ,LIVING-ROOM>>
			      <TELL ", as you rush into the living room,">)>
		       <TELL
" a half-dozen Border Security Force officers storm in, rifles ready.
You freeze as they tramp about the apartment wielding Rad-Detectors. ">
		       <SETG APARTMENT-RAID-FLAG T>
		       <SETG HERE ,LIVING-ROOM>
		       <MOVE ,PLAYER ,LIVING-ROOM>
		       <COND (<EQUAL? ,SYEAR 2071>
			      <TELL
"Almost without reason, they tear your curtains, spill food onto the kitchen
floor, and overturn furniture. ">
			      <COND (,BOOK-PURCHASED
				     <TELL
"One of the officers picks up an old, beautiful ">
				     <PRINTD ,BOOK>
				     <TELL
" that you've owned for years and smiles gleefully
as he rips it to shreds. ">)>)>
		       <TELL
"After a few nightmare minutes, they seem satisfied">
		       <COND (<EQUAL? ,SYEAR 2051>
			      <SCORE 8> ;"3 points"
			      <TELL
" and begin to file out. The apparent leader turns to you. \"Sorry for the
inconvenience,\" he says apologetically. \"You know how things are. We're only
doing it for your own protection.\" He closes the door behind him. You hear
sobbing and turn to see Jill crying in the corner of the living room">
			      <COND (<IN? ,MITCHELL ,HERE>
				     <TELL
". Mitchell, exhibiting the innocent resilience of a child,
resumes his normal activities">)>
			      <TELL "." CR>
			      <FCLEAR ,APARTMENT-DOOR ,OPENBIT>
			      <DISABLE <INT I-JILL>>
			      <QUEUE I-APARTMENT 10>
			      <SETG JILL-COUNTER 13>
			      <MOVE ,PLAYER ,LIVING-ROOM>
			      <MOVE ,JILL ,LIVING-ROOM>)
			     (<EQUAL? ,SYEAR 2061>
			      <SCORE 9> ;"4 points"
			      <FCLEAR ,APARTMENT-DOOR ,OPENBIT>
			      <DISABLE <INT I-APARTMENT>>
			      <TELL
" and begin to leave. One officer turns to you. \"The place is clean,\"
he says gruffly. \"Keep it that way.\" He slams the door behind him." CR>)
			     (T
			      <SCORE 10> ;"5 points"
			      <FSET ,APARTMENT-DOOR ,OPENBIT>
			      <DISABLE <INT I-APARTMENT>>
			      <TELL
" and march out without a word, leaving the door open behind them." CR>)>)
		      (T
		       <SETG RAID-PROB <+ ,RAID-PROB 6>>
		       <RFALSE>)>)>>

<ROUTINE I-CURFEW ()
	 <COND (<EQUAL? ,HERE ,JAIL-CELL>
		<COND (<G? ,ELAPSED-TIME 100>
		       <QUEUE I-CURFEW 5>
		       <RFALSE>)
		      (T
		       <MOVE ,BLANKET ,JAIL-CELL>
		       <SETG LIGHT-LEVEL 3>
		       <TELL CR
"A bored cop comes along, opens your cell, and steers you out of the building.
\"We find you out after curfew again,\" he says, \"we won't treat you so easy.
You goddam vagrants, you oughtta be thrown outta town.\" He settles for
throwing you out of the ">
		       <PRINTD ,POLICE-STATION-OBJECT>
		       <TELL "." CR CR>
		       <GOTO ,ELM-AND-PARK>)>)
	       (<AND <G? ,STIME 420>
		     <L? ,STIME 1260>>
		<DISABLE <INT I-CURFEW>>
		<RFALSE>)
	       (<NOT <FSET? ,HERE ,STREETBIT>>
		<QUEUE I-CURFEW -1>
		<RFALSE>)
	       (<PROB 8>
		<COND (<EQUAL? ,SYEAR 2071>
		       <SCORE 117> ;"8 points"
		       <JIGS-UP
"|
A police car pulls up next to you, and a fat, leering officer leans a red
face out the window. \"Hey, geezer! Ever hear of curfew?\" Even from three
meters away you can smell the odor of beer from the car. The barrel of a
pellet gun suddenly emerges from the window, and as you turn to run, a
tremendous explosion from behind is followed by a spasm of pain...">)
		      (T
		       <COND (<G? ,STIME 1260>
			      <QUEUE I-CURFEW <+ 420 <- 1440 ,STIME>>>)
			     (T
			      <QUEUE I-CURFEW <- 420 ,STIME>>)>
		       <SCORE 116> ;"2 points"
		       <TELL CR
"A police car pulls up next to you and a burly cop gets out. He discovers
that you have no curfew pass and hustles you into the rear. Minutes later,
you are flung into a tiny cell." CR CR>
		       <GOTO ,JAIL-CELL>)>)
	       (T
		<QUEUE I-CURFEW -1>
		<RFALSE>)>>

<ROUTINE I-SUNRISE-SUNSET ("AUX" X)
	 <SET X <- <* ,SMONTH 20> 20>> ;"June day 4 hours longer than Jan day"
	 <COND (<AND <G? <+ ,STIME .X> 455> ;"7:35am in Jan, 5:55am in June"
		     <NOT <G? <+ ,LAST-SUN-TIME .X> 455>>>
		<SETG LIGHT-LEVEL 1>
		<COND (<FSET? ,HERE ,OUTSIDEBIT>
		       <TELL CR
"You begin to see the faint glow of dawn from the east." CR>)>)
	       (<AND <G? <+ ,STIME .X> 469> ;"7:49am in Jan, 6:09am in June"
		     <NOT <G? <+ ,LAST-SUN-TIME .X> 469>>>
		<SETG LIGHT-LEVEL 2>
		<COND (<FSET? ,HERE ,OUTSIDEBIT>
		       <COND (<EQUAL? ,SYEAR 2041 2051>
		       	      <TELL CR
"The first rays of the sun begin streaming between
the buildings to the east." CR>)
		      	     (T
		       	      <SCORE 118> ;"2 points"
			      <TELL CR
"The glow in the east brightens, as the sun attempts to break
through the hazy smog." CR>)>)>)
	       (<AND <G? <+ ,STIME .X> 490> ;"8:10am in Jan, 6:30am in June"
		     <NOT <G? <+ ,LAST-SUN-TIME .X> 490>>>
	        <SETG LIGHT-LEVEL 3>
		<COND (<FSET? ,HERE ,OUTSIDEBIT>
		       <TELL CR
"The sky continues to brighten. Dawn is over; day has begun." CR>)>)
	       (<AND <G? ,STIME 725>
		     <NOT <G? ,LAST-SUN-TIME 725>>>
		<COND (<FSET? ,HERE ,OUTSIDEBIT>
		       <COND (<G? .X 50> ;"April - June"
		       	      <COND (<EQUAL? ,SYEAR 2041 2051>
			      	     <TELL CR
"The sun, beating down warmly on you, has reached its midday apex." CR>)
			     	    (T
			      	     <SCORE 118> ;"2 points"
				     <TELL CR
"The diffuse glow of the sun is nearly straight overhead,
another gray noontime." CR>)>)
			     (T ;"January - March"
		       	      <COND (<EQUAL? ,SYEAR 2041 2051>
			             <TELL CR
"The noontime sun has risen fairly high in the southern sky, taking
some of the chill out of this wintry day." CR>)
			            (T
			             <SCORE 118> ;"2 points"
				     <TELL CR
"The sun's feeble glow is skirting the building tops toward the south,
providing little comfort or warmth on this gray, dismal day." CR>)>)>)>)
	       (<AND <G? <- ,STIME .X> 1010> ;"4:50pm in Jan, 6:30pm in June"
		     <NOT <G? <- ,LAST-SUN-TIME .X> 1010>>>
		<SETG LIGHT-LEVEL 2>
		<COND (<FSET? ,HERE ,OUTSIDEBIT>
		       <COND (<EQUAL? ,SYEAR 2041 2051>
		              <TELL CR
"The sun is dropping very low in the western sky." CR>)
		             (T
		              <SCORE 118> ;"2 points"
			      <TELL CR
"The sky is darkening as the sun sinks into the smoggy
haze of the horizon." CR>)>)>)
	       (<AND <G? <- ,STIME .X> 1028> ;"5:08pm in Jan, 6:48pm in June"
		     <NOT <G? <- ,LAST-SUN-TIME .X> 1028>>>
		<SETG LIGHT-LEVEL 1>
		<COND (<FSET? ,HERE ,OUTSIDEBIT>
		       <COND (<EQUAL? ,SYEAR 2041 2051>
		       	      <TELL CR
"Twilight casts its long shadows across the city as the
sun disappears in the west." CR>)
		             (T
		              <TELL CR
"The dusk continues to gather; an ominous darkness
settles onto the city." CR>)>)>)
	       (<AND <G? <- ,STIME .X> 1049> ;"5:29pm in Jan, 7:19pm in June"
		     <NOT <G? <- ,LAST-SUN-TIME .X> 1049>>>
		<SETG LIGHT-LEVEL 0>
		<COND (<FSET? ,HERE ,OUTSIDEBIT>
		       <TELL CR "It is night." CR>)>)>
	 <SETG LAST-SUN-TIME ,STIME>
	 <RFALSE>>

<ROUTINE I-SKYCAB ("AUX" OLD-WINNER)
	 <QUEUE I-SKYCAB -1>
	 <SETG SKYCAB-COUNTER <+ ,SKYCAB-COUNTER 1>>
	 <COND (<EQUAL? ,SKYCAB-COUNTER 1>
		<TELL CR
"The gentle voice of your domestic computer calls softly from one
of its many unseen speakers. \"The skycab you asked for is now
waiting on the roof.\" Jill ">
		<COND (<EQUAL? ,HERE ,MASTER-BEDROOM>
		       <TELL "summons the robutler to carry your baggage">)
		      (T
		       <TELL
"appears at the top of the steps with the robutler,
who is carrying several bags">)>
		<TELL ". \"Algie has everything, Perry. Let's get going!\"|
|
You take a last look around the apartment and follow Jill and Algie into the
hallway and up to the roofpad. As you clamber into the waiting skycab, Jill
gives the robutler a fond farewell pat. The skycab climbs lazily and veers
off to the northeast." CR CR>
		<MOVE ,MAGAZINE ,JILL>
		<GOTO ,SKYCAB>
		<MOVE ,SEAT ,SKYCAB>
		<MOVE ,PLAYER ,SEAT>
		<MOVE ,JILL ,HERE>)
	       (<EQUAL? ,SKYCAB-COUNTER 2>
		<TELL CR
"The cab enters the central Rockvil traffic pattern, gently curving along
the ring of downtown parks. ">
		<SET OLD-WINNER ,WINNER>
		<SETG WINNER ,PLAYER>
		<PERFORM ,V?EXAMINE ,PARK-OBJECT>
		<SETG WINNER .OLD-WINNER>
		<TELL CR "Jill, glancing through yet another ">
		<PRINTD ,MAGAZINE-ARTICLE>
		<TELL
" on the Silver Dove, says, \"This story talks about the new athletics and
art forms that are still being discovered for the weightless area at the axes
of the habitats. Oh, Perry, I'm so excited,\" she adds, unnecessarily." CR>)
	       (<EQUAL? ,SKYCAB-COUNTER 3>
		<TELL CR
"The skycab continues its wide arc around the downtown area, approaching
the Rockvil Pier. ">
		<SET OLD-WINNER ,WINNER>
		<SETG WINNER ,PLAYER>
		<PERFORM ,V?EXAMINE ,RIVER>
		<SETG WINNER .OLD-WINNER>
		<RTRUE>)
	       (<EQUAL? ,SKYCAB-COUNTER 4>
		<TELL CR
"As the cab whisks northward along the edge of the river, y" ,RS-DESC CR>)
	       (<EQUAL? ,SKYCAB-COUNTER 5>
		<TELL CR
"As the skycab begins its approach to the spaceport, it passes over
the museum established on the site of the former BSF Base, a sobering
monument to one of mankind's great follies.|
|
Suddenly the ">
		<PRINTD ,VIEWSCREEN>
		<TELL
" lights up, and Mitchell's face appears. \"Hi, Mom, Dad! I wanted to wish you
bon voyage, and I enlisted a little help!\" He expands the field of vision to
include the entire living room of his spacious apartment at the Marine Biology
Institute in Nova Scotia. The room is filled with your grandchildren and
great-grandchildren, plus various in-laws, more than twenty members of the
Simm clan. Everyone is hooting, yelling, waving, and blowing kisses. \"We're
having a big party in your honor -- I'm only sorry we couldn't be there with
you. We're real proud of you both, and excited for you, too. Call me when you
get to the habitat! Bye!\" The clan signs off by singing Auld Lang Syne, and
when the screen goes dark, you notice that Jill's eyes are wet, and a second
later you realize that yours are, as well." CR>)
	       (<EQUAL? ,SKYCAB-COUNTER 6>
		<END-IT>)>>

<ROUTINE I-SUFFOCATE ()
	 <SETG SUFFOCATE-COUNTER <+ ,SUFFOCATE-COUNTER 1>>
	 <COND (<EQUAL? ,SUFFOCATE-COUNTER 17>
		<DISABLE <INT I-SUFFOCATE>>
		<MOVE ,SABOTEURS ,LOCAL-GLOBALS>
		<COND (<EQUAL? ,HERE ,CORE>
		       <TELL CR
"A National Guard patrol enters the area and rushes to the side of the
prone bodies. \"Still breathing, but barely!\" shouts the leader. They
grab the saboteurs and carry them out." CR>
		       <RTRUE>)
		      (T
		       <RFALSE>)>)
	       (<EQUAL? ,SUFFOCATE-COUNTER 16>
		<DISABLE <INT I-SABOTAGE>>
		<QUEUE I-SUFFOCATE 24>
		<PUTP ,SABOTEURS ,P?LDESC
"Four men, dressed in white smocks, are lying on the ground, unconscious.">
		<COND (<EQUAL? ,HERE ,CORE>
		       <TELL CR
"One of the men suddenly gasps and falls over. The others dash to his side,
then slowly pass out themselves." CR>
		       <RTRUE>)>)
	       (<AND <EQUAL? ,SUFFOCATE-COUNTER 13>
		     <EQUAL? ,HERE ,CORE>>
		<TELL CR
"The saboteur with the gun says, \"Hurry, will ya! I need to get
some fresh air!\" The apparent leader replies, \"We're working as
fast as we can! Keep your cool.\"" CR>
		<RTRUE>)
	       (<AND <EQUAL? ,SUFFOCATE-COUNTER 8>
		     <EQUAL? ,HERE ,CORE>>
		<SETG YES-NO-FLAG 8>
		<QUEUE I-YES-NO 2>
		<TELL CR
"One of the men, tugging at the collar of his smock, says, \"Stuffy in
here, isn't it?\"" CR>
		<RTRUE>)>
	 <RFALSE>>

<ROUTINE I-AIR-CONDITIONING ()
	 <SETG AIR-CONDITIONING-COUNTER <+ ,AIR-CONDITIONING-COUNTER 1>>
	 <COND (<EQUAL? ,AIR-CONDITIONING-COUNTER 20 35>
		<V-DIAGNOSE>
		<RTRUE>)
	       (<EQUAL? ,AIR-CONDITIONING-COUNTER 46>
		<COND (,SIMULATING
		       <TELL CR
"The raging fever must be affecting your mind; the world around you seems to
be shimmering away and vanishing. Then suddenly -- you're out of ">
		       <PRINTD ,SIMULATION-MODE>
		       <TELL
"! Something is terribly wrong! Nothing feels right. You can't
even think straight. Your functions are fading..." CR CR>
		       <FINISH>)
		      (T
		       <TELL CR
"The dysfunction of your systems is becoming incredibly serious, and you
feel it as almost a burning pain. It numbs your mind, blocks your thought
patterns. You feel your consciousness fade away..." CR CR>
		       <FINISH>)>)>
	 <RFALSE>>

<ROUTINE I-RORSCHACH ()
	 <QUEUE I-RORSCHACH -1>
	 <COND (<G? ,GRIMWOLD-COUNTER 0>
		<SETG GRIMWOLD-COUNTER <+ ,GRIMWOLD-COUNTER 1>>
		<COND (<G? ,GRIMWOLD-COUNTER 8>
		       <MOVE ,GRIMWOLD ,LOCAL-GLOBALS>
		       <MOVE ,PERELMAN ,LOCAL-GLOBALS>
		       <FCLEAR ,PERELMAN ,NDESCBIT>
		       <DISABLE <INT I-RORSCHACH>>
		       <SETG GRIMWOLD-COUNTER 0>
		       <MOVE ,COFFEE ,LOCAL-GLOBALS>
		       <COND (<AND <VISIBLE? ,PERELMAN>
				   <EQUAL? ,PERELMAN ,WINNER>>
			      <CLEAR-BUF>)>
		       <QUEUE I-PERELMAN 30>
		       <SETG LAST-ABE-TIME <+ ,TIME 25>>
		       <TELL CR
"\"Hmmph!\" says Grimwold, whirling and heading for the door. \"This rudeness
will certainly figure in my report!\" Perelman looks at you with a mixture of
annoyance and puzzlement, then rushes off after the psychiatrist." CR>)
		      (T
		       <TELL CR
"After a moment, Grimwold again asks, \"Can we begin now?\"" CR>)>
		<RTRUE>)>
	 <COND (<NOT <IN? ,GRIMWOLD ,OFFICE>>
		<MOVE ,GRIMWOLD ,OFFICE>
		<MOVE ,PERELMAN ,OFFICE>
		<FSET ,PERELMAN ,NDESCBIT>
		<COND (<NOT <EQUAL? ,HERE ,OFFICE>>
		       <QUEUE I-RORSCHACH 1>
		       <RFALSE>)
		      (T
		       <DISABLE <INT I-MESSAGE-E>>
		       <TELL CR
"Perelman enters with Dr. Ernest Grimwold, a quintessential Viennese
psychiatrist whom you met a few days earlier, and nods to you. \"Good ">
		       <COND (<G? ,TIME 720>
			      <TELL "afternoon">)
			     (T
			      <TELL "morning">)>
		       <TELL ", PRISM. You remember Dr. Grimwold.\"">)>)
	       (<NOT <EQUAL? ,HERE ,OFFICE>>
		<QUEUE I-RORSCHACH 1>
		<RFALSE>)
	       (T
		<DISABLE <INT I-MESSAGE-E>>
		<TELL CR
"Perelman" ,SPOTS-ACTIVE-LIGHT " come on. \"Ah, here you are. PRISM, you
remember Dr. Ernest Grimwold.\" You recognize and greet the psychiatrist
who gave you a series of psych tests a few days ago.">)>
	 <SETG GRIMWOLD-COUNTER 1>
	 <TELL CR CR
"\"It's a pleasure to see you again,\" says Grimwold, in an accent that
matches his appearance perfectly. \"This should take only a couple of
minutes. I'm going to show you some patterns, and I simply want you to
tell me the single word that comes to mind when you see them. Don't think
about it; just say the first word you think of.\"|
|
Grimwold reaches below your viewing area and picks up a sheaf of placards.
\"Ready to begin?\" he asks." CR>>

<ROUTINE BLOT-ACTION ("AUX" (CNT 0) WORDS-IN-RESPONSE)
	 <REPEAT ()
		 <COND (<EQUAL? .CNT 0>
			<INIT-STATUS-LINE 18>
			<STATUS-LINE>)
		       (T
			<TELL
"Grimwold nods knowingly, mumbles under his breath,
and makes a note in his pad. ">)>
		 <INK-BLOT>
		 <TELL "\"Okay, here's the ">
		 <COND (<EQUAL? .CNT 0>
			<TELL "first">)
		       (T
			<TELL "next">)>
		 <TELL
" one,\" he says, holding a card up to your visual unit." CR>
		 <REPEAT ()
		      <CRLF>
		      <PRINTI ">">
		      <READ ,P-INBUF ,P-LEXV>
		      <SET WORDS-IN-RESPONSE <BLOT-WORD-COUNT>>
		      <COND (<G? .WORDS-IN-RESPONSE 1>
			     <TELL
"\"You're not following my instructions, PRISM. Just tell me the
one word that pops into your mind.\"" CR>
			     <AGAIN>)
			    (<ZERO? <GETB ,P-LEXV ,P-LEXWORDS>>
			     <TELL "\"I beg your pardon?\"" CR>
			     <AGAIN>)
			    (<EQUAL? <GET ,P-LEXV 1> ,W?RESTORE ,W?SAVE>
			     <TELL "You can't ">
			     <COND (<EQUAL? <GET ,P-LEXV 1> ,W?RESTORE>
			       	    <TELL "RESTORE">)
			      	   (T
			       	    <TELL "SAVE">)>
			     <TELL
" right now -- you're in the middle of an important psych test!" CR>
			     <AGAIN>)
			    (<EQUAL? <GET ,P-LEXV 1> ,W?QUIT ,W?Q>
			     <V-QUIT>
			     <AGAIN>)
			    (<EQUAL? <GET ,P-LEXV 1> ,W?RESTART>
			     <V-RESTART>
			     <AGAIN>)
			    (<EQUAL? <GET ,P-LEXV 1> ,W?SCRIPT>
			     <V-SCRIPT>
			     <AGAIN>)
			    (<EQUAL? <GET ,P-LEXV 1> ,W?UNSCRIPT>
			     <V-UNSCRIPT>
			     <AGAIN>)
			    (T
			     <RETURN>)>>
		 <COND (<EQUAL? .CNT 4>
			<MOVE ,GRIMWOLD ,LOCAL-GLOBALS>
			<MOVE ,PERELMAN ,LOCAL-GLOBALS>
			<MOVE ,COFFEE ,LOCAL-GLOBALS>
			<FCLEAR ,PERELMAN ,NDESCBIT>
			<COND (<AND <VISIBLE? ,PERELMAN>
				    <EQUAL? ,PERELMAN ,WINNER>>
			       <CLEAR-BUF>)>
			<QUEUE I-PERELMAN 30>
			<SETG LAST-ABE-TIME <+ ,TIME 25>>
			<SETG GRIMWOLD-COUNTER 0>
			<INIT-STATUS-LINE 2>
			<TELL
"Grimwold makes a final notation in his notebook. \"Thanks, PRISM.\" He
picks up all the placards and leaves the room along with Perelman." CR>
			<DISABLE <INT I-RORSCHACH>>
			<RETURN>)
		       (T
			<STATUS-LINE>
			<INCREMENT-TIME 1>
			<SET CNT <+ .CNT 1>>
			<AGAIN>)>>>

<ROUTINE BLOT-WORD-COUNT ("AUX" WORD-COUNT REVISED-COUNT)
	 <SET WORD-COUNT <GETB ,P-LEXV ,P-LEXWORDS>>
	 <SET REVISED-COUNT .WORD-COUNT>
	 ;<COND (,DEBUG
		<TELL
"[WORD-COUNT = " N .WORD-COUNT ", REVISED-COUNT = " N .REVISED-COUNT "]" CR>)>
	 <REPEAT ()
		 <COND (<EQUAL? .WORD-COUNT 0>
			<RETURN>)>
		 <COND (<EQUAL? <GET ,P-LEXV <- <* 2 .WORD-COUNT> 1>> ,W?QUOTE>
			;<COND (,DEBUG
			       <TELL
"[subtracting one from REVISED-COUNT due to quote]" CR>)>
			<SET REVISED-COUNT <- .REVISED-COUNT 1>>)>
		 <SET WORD-COUNT <- .WORD-COUNT 1>>>
	 <COND (<EQUAL? <GET ,P-LEXV 1> ,W?SAY ,W?ANSWER>
		;<COND (,DEBUG
		       <TELL
"[subtracting one from REVISED-COUNT due to SAY or ANSWER]" CR>)>
		<SET REVISED-COUNT <- .REVISED-COUNT 1>>)>
	 <COND (<OR <EQUAL? <GET ,P-LEXV 1> ,W?GRIMWOLD ,W?PSYCHIATR>
		    <EQUAL? <GET ,P-LEXV 1> ,W?DR ,W?DOCTOR>>
		;<COND (,DEBUG
		       <TELL
"[subtracting two from REVISED-COUNT due to GRIMWOLD,]" CR>)>
		<SET REVISED-COUNT <- .REVISED-COUNT 2>>)>
	 ;<COND (,DEBUG
		<TELL
"[returning a REVISED-COUNT value of " N .REVISED-COUNT "]" CR>)>
	 .REVISED-COUNT>

<ROUTINE INK-BLOT ("AUX" (X 12) (Y 5) (CNT 4) SIDE-OFFSET CENTER-OFFSET CHAR)
	 <BUFOUT <>>
	 <SCREEN ,S-WINDOW>
	 <SET CENTER-OFFSET <RANDOM 6>>
	 <SET SIDE-OFFSET <RANDOM <- 16 .CENTER-OFFSET>>>
	 <SET X <+ 22 .SIDE-OFFSET>>
	 <SET CHAR <RANDOM 3>> ;"1 = blanks, 2 = x's, 3 = angle brackets"
	 <REPEAT ()
		 <INVERSE-LINE .CNT T>
		 <SET CNT <+ .CNT 1>>
		 <COND (<EQUAL? .CNT 19>
			<RETURN>)>>
	 <COND (<EQUAL? .CHAR 2 3> ;"not blanks"
		<HLIGHT 1>)>
	 <REPEAT ()
		 <REPEAT ()
			 <CURSET .Y .X>
			 <COND (<EQUAL? .CHAR 1>
			 	<TELL " ">)
			       (<EQUAL? .CHAR 2>
				<TELL "X">)
			       (T
				<TELL ">">)>
			 <CURSET .Y <- 81 .X>>
			 <COND (<EQUAL? .CHAR 1>
			 	<TELL " ">)
			       (<EQUAL? .CHAR 2>
				<TELL "X">)
			       (T
				<TELL "<">)>
			 <COND (<EQUAL? .X <- 40 .CENTER-OFFSET>>
				<RETURN>)
			       (T
				<SET X <+ .X 1>>)>>
		 <COND (<EQUAL? .Y 17>
			<RETURN>)
		       (T
			<COND (<PROB 40>
			       <SET SIDE-OFFSET <+ .SIDE-OFFSET <RANDOM 3>>>)
			      (<PROB 67>
			       <SET SIDE-OFFSET <- .SIDE-OFFSET <RANDOM 3>>>)>
			<COND (<PROB 40>
			       <SET CENTER-OFFSET
				    <- .CENTER-OFFSET <RANDOM 2>>>)
			      (<PROB 67>
			       <SET CENTER-OFFSET
				    <+ .CENTER-OFFSET <RANDOM 2>>>)>
			<COND (<L? .SIDE-OFFSET 0>
			       <SET SIDE-OFFSET 1>)>
			<COND (<L? .CENTER-OFFSET 0>
			       <SET CENTER-OFFSET 0>)>
			<COND (<G? <+ .SIDE-OFFSET .CENTER-OFFSET> 18>
			       <SET CENTER-OFFSET <- .CENTER-OFFSET 1>>
			       <SET SIDE-OFFSET <- 18 .CENTER-OFFSET>>)>
			<SET X <+ 22 .SIDE-OFFSET>>
			<SET Y <+ .Y 1>>)>>
	 <COND (<EQUAL? .CHAR 2 3> ;"blanks"
		<HLIGHT 0>)>
	 <SCREEN ,S-TEXT>
	 <BUFOUT T>>

<ROUTINE I-POST-OFFICE ()
	 <QUEUE I-POST-OFFICE -1>
	 <COND (<NOT <EQUAL? ,HERE ,POST-OFFICE>>
		<DISABLE <INT I-POST-OFFICE>>)
	       (<EQUAL? ,STIME 960>
		<TELL "The open window">
		<COND (<EQUAL? ,SYEAR 2071>
		       <TELL " closes">)
		      (T
		       <TELL "s close">)>
		<TELL
", and those still waiting wander listlessly out of the ">
		<PRINTD ,POST-OFFICE-OBJECT>
		<TELL "." CR>
		<RTRUE>)
	       (<OR <AND <EQUAL? ,SYEAR 2071>
			 <G? ,STIME 888>
			 <L? ,STIME 901>>
		    <AND <EQUAL? ,SYEAR 2061>
			 <G? ,STIME 594>
			 <L? ,STIME 601>>>
		<TELL "A line is forming at the window with the sign." CR>
		<QUEUE I-POST-OFFICE 15>
		<RTRUE>)>
	 <RFALSE>>

<ROUTINE I-WILD-DOGS ()
	 <COND (<NOT <EQUAL? ,HERE ,MAIN-STREET-BRIDGE>>
		<DISABLE <INT I-WILD-DOGS>>
		<RFALSE>)>
	 <SETG WILD-DOG-COUNTER <+ ,WILD-DOG-COUNTER 1>>
	 <COND (<EQUAL? ,WILD-DOG-COUNTER 1>
		<MOVE ,BARKING ,HERE>
		<TELL "You hear the sound of distant barking to the east." CR>)
	       (<EQUAL? ,WILD-DOG-COUNTER 2 3>
		<TELL
"The barking continues. In fact, the sound seems to be getting closer." CR>)
	       (<EQUAL? ,WILD-DOG-COUNTER 4>
		<SCORE 45> ;"3 points"
		<JIGS-UP
"A pack of wild dogs enters the bridge from the east, barking wildly. They
tear towards you, driven by mindless animal hunger, saliva dripping from
rabid fangs. You run toward the city, but the fastest of the dogs lunges
and sinks its fangs into your leg. You fall, and in a split second the other
animals are on top of you as well.">)>>

<ROUTINE I-CAFETERIA ()
	 <COND (<NOT <EQUAL? ,HERE ,CAFETERIA>>
		<DISABLE <INT I-CAFETERIA>>)
	       (<EQUAL? ,TIME 480 705 1035>
		<TELL CR "The room begins to fill with mealtime crowds." CR>)
	       (<EQUAL? ,TIME 570 795 1125>
		<TELL CR "The mealtime crowds begin to disperse." CR>)>
	 <RFALSE>>