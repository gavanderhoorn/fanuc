/PROG  ROS_MOVESM
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "r2";
PROG_SIZE	= 548;
CREATE		= DATE 12-10-02  TIME 12:08:46;
MODIFIED	= DATE 13-04-28  TIME 18:20:26;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 25;
MEMORY_SIZE	= 952;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/MN
    :   ;
    :  !init: not rdy, no ack ;
    :  F[1]=(OFF) ;
    :  F[2]=(OFF) ;
    :   ;
    :  LBL[10] ;
    :   ;
    :  !we're ready for new point ;
    :  F[1]=(ON) ;
    :   ;
    :  !wait for relay ;
    :  WAIT (F[2])    ;
    :   ;
    :  !cache in temp preg ;
    :  PR[2]=PR[1]    ;
    :   ;
    :  !first rdy low, then ack copy ;
    :  F[1]=(OFF) ;
    :  F[2]=(OFF) ;
    :   ;
    :  !move to point ;
    :J PR[2] R[1]% CNT R[2]    ;
    :   ;
    :  !done, repeat ;
    :  JMP LBL[10] ;
/POS
/END
