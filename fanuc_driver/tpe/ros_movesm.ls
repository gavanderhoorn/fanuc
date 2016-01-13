/PROG  ROS_MOVESM
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "rB_cmded_vel";
PROG_SIZE	= 548;
CREATE		= DATE 12-10-02  TIME 12:08:46;
MODIFIED	= DATE 16-01-13  TIME 18:20:26;
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
    :  F[1:msm_ready]=(OFF) ;
    :  F[2:msm_dready]=(OFF) ;
    :   ;
    :  LBL[10] ;
    :   ;
    :  !we're ready for new point ;
    :  F[1:msm_ready]=(ON) ;
    :   ;
    :  !wait for relay ;
    :  WAIT (F[2:msm_dready])    ;
    :   ;
    :  !cache in temp preg ;
    :  PR[2:pos cache]=PR[1:pos]    ;
    :  R[3:dt cache]=R[1:dt]    ;
    :  R[4:cnt cache]=R[2:cnt]    ;
    :   ;
    :  !first rdy low, then ack copy ;
    :  F[1:msm_ready]=(OFF) ;
    :  F[2:msm_dready]=(OFF) ;
    :   ;
    :  !move to point ;
    :J PR[2:pos cache] R[3:dt cache]msec CNT R[4:cnt cache]    ;
    :   ;
    :  !done, repeat ;
    :  JMP LBL[10] ;
/POS
/END
