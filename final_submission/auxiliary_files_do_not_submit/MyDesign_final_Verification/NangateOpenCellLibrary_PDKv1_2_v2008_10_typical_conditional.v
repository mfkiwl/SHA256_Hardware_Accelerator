// 
// ******************************************************************************
// *                                                                            *
// *                   Copyright (C) 2004-2008, Nangate Inc.                    *
// *                           All rights reserved.                             *
// *                                                                            *
// * Nangate and the Nangate logo are trademarks of Nangate Inc.                *
// *                                                                            *
// * All trademarks, logos, software marks, and trade names (collectively the   *
// * "Marks") in this program are proprietary to Nangate or other respective    *
// * owners that have granted Nangate the right and license to use such Marks.  *
// * You are not permitted to use the Marks without the prior written consent   *
// * of Nangate or such third party that may own the Marks.                     *
// *                                                                            *
// * This file has been provided pursuant to a License Agreement containing     *
// * restrictions on its use.  This file contains valuable trade secrets and    *
// * proprietary information of Nangate Inc., and is protected by U.S. and      *
// * international laws and/or treaties.                                        *
// *                                                                            *
// * The copyright notice(s) in this file does not indicate actual or intended  *
// * publication of this file.                                                  *
// *                                                                            *
// *          NGLibraryCreator Development_version build 200810101607           *
// *                                                                            *
// ******************************************************************************

primitive seq29 (IQ, nextstate, CK, NOTIFIER);
  output IQ;
  input nextstate;
  input CK;
  input NOTIFIER;
  reg IQ;

  table
// nextstate          CK    NOTIFIER     : @IQ :          IQ
           0           0           ?       : ? :           0;
           1           0           ?       : ? :           1;
           0           0           ?       : 0 :           0; // reduce pessimism
           1           0           ?       : 1 :           1; // reduce pessimism
           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           ?           1           ?       : ? :           -; // Ignore non-triggering clock edge
           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq30 (IQ, nextstate, CK, NOTIFIER);
  output IQ;
  input nextstate;
  input CK;
  input NOTIFIER;
  reg IQ;

  table
// nextstate          CK    NOTIFIER     : @IQ :          IQ
           0           0           ?       : ? :           0;
           1           0           ?       : ? :           1;
           0           0           ?       : 0 :           0; // reduce pessimism
           1           0           ?       : 1 :           1; // reduce pessimism
           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           ?           1           ?       : ? :           -; // Ignore non-triggering clock edge
           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq31 (IQ, nextstate, CK, NOTIFIER);
  output IQ;
  input nextstate;
  input CK;
  input NOTIFIER;
  reg IQ;

  table
// nextstate          CK    NOTIFIER     : @IQ :          IQ
           0           0           ?       : ? :           0;
           1           0           ?       : ? :           1;
           0           0           ?       : 0 :           0; // reduce pessimism
           1           0           ?       : 1 :           1; // reduce pessimism
           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           ?           1           ?       : ? :           -; // Ignore non-triggering clock edge
           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq32 (IQ, nextstate, CK, NOTIFIER);
  output IQ;
  input nextstate;
  input CK;
  input NOTIFIER;
  reg IQ;

  table
// nextstate          CK    NOTIFIER     : @IQ :          IQ
           0           0           ?       : ? :           0;
           1           0           ?       : ? :           1;
           0           0           ?       : 0 :           0; // reduce pessimism
           1           0           ?       : 1 :           1; // reduce pessimism
           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           ?           1           ?       : ? :           -; // Ignore non-triggering clock edge
           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq33 (IQ, nextstate, CK, NOTIFIER);
  output IQ;
  input nextstate;
  input CK;
  input NOTIFIER;
  reg IQ;

  table
// nextstate          CK    NOTIFIER     : @IQ :          IQ
           0           0           ?       : ? :           0;
           1           0           ?       : ? :           1;
           0           0           ?       : 0 :           0; // reduce pessimism
           1           0           ?       : 1 :           1; // reduce pessimism
           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           ?           1           ?       : ? :           -; // Ignore non-triggering clock edge
           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq34 (IQ, nextstate, CK, NOTIFIER);
  output IQ;
  input nextstate;
  input CK;
  input NOTIFIER;
  reg IQ;

  table
// nextstate          CK    NOTIFIER     : @IQ :          IQ
           0           0           ?       : ? :           0;
           1           0           ?       : ? :           1;
           0           0           ?       : 0 :           0; // reduce pessimism
           1           0           ?       : 1 :           1; // reduce pessimism
           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           ?           1           ?       : ? :           -; // Ignore non-triggering clock edge
           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq35 (IQ, nextstate, CK, NOTIFIER);
  output IQ;
  input nextstate;
  input CK;
  input NOTIFIER;
  reg IQ;

  table
// nextstate          CK    NOTIFIER     : @IQ :          IQ
           0           0           ?       : ? :           0;
           1           0           ?       : ? :           1;
           0           0           ?       : 0 :           0; // reduce pessimism
           1           0           ?       : 1 :           1; // reduce pessimism
           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           ?           1           ?       : ? :           -; // Ignore non-triggering clock edge
           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq36 (IQ, nextstate, CK, NOTIFIER);
  output IQ;
  input nextstate;
  input CK;
  input NOTIFIER;
  reg IQ;

  table
// nextstate          CK    NOTIFIER     : @IQ :          IQ
           0           0           ?       : ? :           0;
           1           0           ?       : ? :           1;
           0           0           ?       : 0 :           0; // reduce pessimism
           1           0           ?       : 1 :           1; // reduce pessimism
           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           ?           1           ?       : ? :           -; // Ignore non-triggering clock edge
           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq37 (IQ, SN, RN, nextstate, CK, NOTIFIER);
  output IQ;
  input SN;
  input RN;
  input nextstate;
  input CK;
  input NOTIFIER;
  reg IQ;

  table
       // SN          RN   nextstate          CK    NOTIFIER     : @IQ :          IQ
           1           ?           0           r           ?       : ? :           0;
           ?           1           1           r           ?       : ? :           1;
           1           ?           0           *           ?       : 0 :           0; // reduce pessimism
           ?           1           1           *           ?       : 1 :           1; // reduce pessimism
           1           1           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           1           1           ?           f           ?       : ? :           -; // Ignore non-triggering clock edge
           0           1           ?           ?           ?       : ? :           1; // SN activated
           *           1           ?           ?           ?       : 1 :           1; // Cover all transitions on SN
           ?           0           ?           ?           ?       : ? :           0; // RN activated
           1           *           ?           ?           ?       : 0 :           0; // Cover all transitions on RN
           ?           ?           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq38 (IQ, SN, RN, nextstate, CK, NOTIFIER);
  output IQ;
  input SN;
  input RN;
  input nextstate;
  input CK;
  input NOTIFIER;
  reg IQ;

  table
       // SN          RN   nextstate          CK    NOTIFIER     : @IQ :          IQ
           1           ?           0           r           ?       : ? :           0;
           ?           1           1           r           ?       : ? :           1;
           1           ?           0           *           ?       : 0 :           0; // reduce pessimism
           ?           1           1           *           ?       : 1 :           1; // reduce pessimism
           1           1           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           1           1           ?           f           ?       : ? :           -; // Ignore non-triggering clock edge
           0           1           ?           ?           ?       : ? :           1; // SN activated
           *           1           ?           ?           ?       : 1 :           1; // Cover all transitions on SN
           ?           0           ?           ?           ?       : ? :           0; // RN activated
           1           *           ?           ?           ?       : 0 :           0; // Cover all transitions on RN
           ?           ?           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq39 (IQ, RN, nextstate, CK, NOTIFIER);
  output IQ;
  input RN;
  input nextstate;
  input CK;
  input NOTIFIER;
  reg IQ;

  table
       // RN   nextstate          CK    NOTIFIER     : @IQ :          IQ
           ?           0           r           ?       : ? :           0;
           1           1           r           ?       : ? :           1;
           ?           0           *           ?       : 0 :           0; // reduce pessimism
           1           1           *           ?       : 1 :           1; // reduce pessimism
           1           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           1           ?           f           ?       : ? :           -; // Ignore non-triggering clock edge
           0           ?           ?           ?       : ? :           0; // RN activated
           *           ?           ?           ?       : 0 :           0; // Cover all transitions on RN
           ?           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq40 (IQ, RN, nextstate, CK, NOTIFIER);
  output IQ;
  input RN;
  input nextstate;
  input CK;
  input NOTIFIER;
  reg IQ;

  table
       // RN   nextstate          CK    NOTIFIER     : @IQ :          IQ
           ?           0           r           ?       : ? :           0;
           1           1           r           ?       : ? :           1;
           ?           0           *           ?       : 0 :           0; // reduce pessimism
           1           1           *           ?       : 1 :           1; // reduce pessimism
           1           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           1           ?           f           ?       : ? :           -; // Ignore non-triggering clock edge
           0           ?           ?           ?       : ? :           0; // RN activated
           *           ?           ?           ?       : 0 :           0; // Cover all transitions on RN
           ?           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq41 (IQ, SN, nextstate, CK, NOTIFIER);
  output IQ;
  input SN;
  input nextstate;
  input CK;
  input NOTIFIER;
  reg IQ;

  table
       // SN   nextstate          CK    NOTIFIER     : @IQ :          IQ
           1           0           r           ?       : ? :           0;
           ?           1           r           ?       : ? :           1;
           1           0           *           ?       : 0 :           0; // reduce pessimism
           ?           1           *           ?       : 1 :           1; // reduce pessimism
           1           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           1           ?           f           ?       : ? :           -; // Ignore non-triggering clock edge
           0           ?           ?           ?       : ? :           1; // SN activated
           *           ?           ?           ?       : 1 :           1; // Cover all transitions on SN
           ?           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq42 (IQ, SN, nextstate, CK, NOTIFIER);
  output IQ;
  input SN;
  input nextstate;
  input CK;
  input NOTIFIER;
  reg IQ;

  table
       // SN   nextstate          CK    NOTIFIER     : @IQ :          IQ
           1           0           r           ?       : ? :           0;
           ?           1           r           ?       : ? :           1;
           1           0           *           ?       : 0 :           0; // reduce pessimism
           ?           1           *           ?       : 1 :           1; // reduce pessimism
           1           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           1           ?           f           ?       : ? :           -; // Ignore non-triggering clock edge
           0           ?           ?           ?       : ? :           1; // SN activated
           *           ?           ?           ?       : 1 :           1; // Cover all transitions on SN
           ?           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq43 (IQ, nextstate, CK, NOTIFIER);
  output IQ;
  input nextstate;
  input CK;
  input NOTIFIER;
  reg IQ;

  table
// nextstate          CK    NOTIFIER     : @IQ :          IQ
           0           r           ?       : ? :           0;
           1           r           ?       : ? :           1;
           0           *           ?       : 0 :           0; // reduce pessimism
           1           *           ?       : 1 :           1; // reduce pessimism
           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           ?           f           ?       : ? :           -; // Ignore non-triggering clock edge
           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq44 (IQ, nextstate, CK, NOTIFIER);
  output IQ;
  input nextstate;
  input CK;
  input NOTIFIER;
  reg IQ;

  table
// nextstate          CK    NOTIFIER     : @IQ :          IQ
           0           r           ?       : ? :           0;
           1           r           ?       : ? :           1;
           0           *           ?       : 0 :           0; // reduce pessimism
           1           *           ?       : 1 :           1; // reduce pessimism
           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           ?           f           ?       : ? :           -; // Ignore non-triggering clock edge
           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq45 (IQ, nextstate, G, NOTIFIER);
  output IQ;
  input nextstate;
  input G;
  input NOTIFIER;
  reg IQ;

  table
// nextstate           G    NOTIFIER     : @IQ :          IQ
           0           1           ?       : ? :           0;
           1           1           ?       : ? :           1;
           0           1           ?       : 0 :           0; // reduce pessimism
           1           1           ?       : 1 :           1; // reduce pessimism
           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           ?           0           ?       : ? :           -; // Ignore non-triggering clock edge
           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq46 (IQ, nextstate, G, NOTIFIER);
  output IQ;
  input nextstate;
  input G;
  input NOTIFIER;
  reg IQ;

  table
// nextstate           G    NOTIFIER     : @IQ :          IQ
           0           1           ?       : ? :           0;
           1           1           ?       : ? :           1;
           0           1           ?       : 0 :           0; // reduce pessimism
           1           1           ?       : 1 :           1; // reduce pessimism
           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           ?           0           ?       : ? :           -; // Ignore non-triggering clock edge
           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq47 (IQ, nextstate, GN, NOTIFIER);
  output IQ;
  input nextstate;
  input GN;
  input NOTIFIER;
  reg IQ;

  table
// nextstate          GN    NOTIFIER     : @IQ :          IQ
           0           0           ?       : ? :           0;
           1           0           ?       : ? :           1;
           0           0           ?       : 0 :           0; // reduce pessimism
           1           0           ?       : 1 :           1; // reduce pessimism
           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           ?           1           ?       : ? :           -; // Ignore non-triggering clock edge
           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq48 (IQ, nextstate, GN, NOTIFIER);
  output IQ;
  input nextstate;
  input GN;
  input NOTIFIER;
  reg IQ;

  table
// nextstate          GN    NOTIFIER     : @IQ :          IQ
           0           0           ?       : ? :           0;
           1           0           ?       : ? :           1;
           0           0           ?       : 0 :           0; // reduce pessimism
           1           0           ?       : 1 :           1; // reduce pessimism
           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           ?           1           ?       : ? :           -; // Ignore non-triggering clock edge
           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq49 (IQ, SN, RN, nextstate, CK, NOTIFIER);
  output IQ;
  input SN;
  input RN;
  input nextstate;
  input CK;
  input NOTIFIER;
  reg IQ;

  table
       // SN          RN   nextstate          CK    NOTIFIER     : @IQ :          IQ
           1           ?           0           r           ?       : ? :           0;
           ?           1           1           r           ?       : ? :           1;
           1           ?           0           *           ?       : 0 :           0; // reduce pessimism
           ?           1           1           *           ?       : 1 :           1; // reduce pessimism
           1           1           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           1           1           ?           f           ?       : ? :           -; // Ignore non-triggering clock edge
           0           1           ?           ?           ?       : ? :           1; // SN activated
           *           1           ?           ?           ?       : 1 :           1; // Cover all transitions on SN
           ?           0           ?           ?           ?       : ? :           0; // RN activated
           1           *           ?           ?           ?       : 0 :           0; // Cover all transitions on RN
           ?           ?           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq50 (IQ, SN, RN, nextstate, CK, NOTIFIER);
  output IQ;
  input SN;
  input RN;
  input nextstate;
  input CK;
  input NOTIFIER;
  reg IQ;

  table
       // SN          RN   nextstate          CK    NOTIFIER     : @IQ :          IQ
           1           ?           0           r           ?       : ? :           0;
           ?           1           1           r           ?       : ? :           1;
           1           ?           0           *           ?       : 0 :           0; // reduce pessimism
           ?           1           1           *           ?       : 1 :           1; // reduce pessimism
           1           1           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           1           1           ?           f           ?       : ? :           -; // Ignore non-triggering clock edge
           0           1           ?           ?           ?       : ? :           1; // SN activated
           *           1           ?           ?           ?       : 1 :           1; // Cover all transitions on SN
           ?           0           ?           ?           ?       : ? :           0; // RN activated
           1           *           ?           ?           ?       : 0 :           0; // Cover all transitions on RN
           ?           ?           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq51 (IQ, RN, nextstate, CK, NOTIFIER);
  output IQ;
  input RN;
  input nextstate;
  input CK;
  input NOTIFIER;
  reg IQ;

  table
       // RN   nextstate          CK    NOTIFIER     : @IQ :          IQ
           ?           0           r           ?       : ? :           0;
           1           1           r           ?       : ? :           1;
           ?           0           *           ?       : 0 :           0; // reduce pessimism
           1           1           *           ?       : 1 :           1; // reduce pessimism
           1           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           1           ?           f           ?       : ? :           -; // Ignore non-triggering clock edge
           0           ?           ?           ?       : ? :           0; // RN activated
           *           ?           ?           ?       : 0 :           0; // Cover all transitions on RN
           ?           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq52 (IQ, RN, nextstate, CK, NOTIFIER);
  output IQ;
  input RN;
  input nextstate;
  input CK;
  input NOTIFIER;
  reg IQ;

  table
       // RN   nextstate          CK    NOTIFIER     : @IQ :          IQ
           ?           0           r           ?       : ? :           0;
           1           1           r           ?       : ? :           1;
           ?           0           *           ?       : 0 :           0; // reduce pessimism
           1           1           *           ?       : 1 :           1; // reduce pessimism
           1           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           1           ?           f           ?       : ? :           -; // Ignore non-triggering clock edge
           0           ?           ?           ?       : ? :           0; // RN activated
           *           ?           ?           ?       : 0 :           0; // Cover all transitions on RN
           ?           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq53 (IQ, SN, nextstate, CK, NOTIFIER);
  output IQ;
  input SN;
  input nextstate;
  input CK;
  input NOTIFIER;
  reg IQ;

  table
       // SN   nextstate          CK    NOTIFIER     : @IQ :          IQ
           1           0           r           ?       : ? :           0;
           ?           1           r           ?       : ? :           1;
           1           0           *           ?       : 0 :           0; // reduce pessimism
           ?           1           *           ?       : 1 :           1; // reduce pessimism
           1           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           1           ?           f           ?       : ? :           -; // Ignore non-triggering clock edge
           0           ?           ?           ?       : ? :           1; // SN activated
           *           ?           ?           ?       : 1 :           1; // Cover all transitions on SN
           ?           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq54 (IQ, SN, nextstate, CK, NOTIFIER);
  output IQ;
  input SN;
  input nextstate;
  input CK;
  input NOTIFIER;
  reg IQ;

  table
       // SN   nextstate          CK    NOTIFIER     : @IQ :          IQ
           1           0           r           ?       : ? :           0;
           ?           1           r           ?       : ? :           1;
           1           0           *           ?       : 0 :           0; // reduce pessimism
           ?           1           *           ?       : 1 :           1; // reduce pessimism
           1           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           1           ?           f           ?       : ? :           -; // Ignore non-triggering clock edge
           0           ?           ?           ?       : ? :           1; // SN activated
           *           ?           ?           ?       : 1 :           1; // Cover all transitions on SN
           ?           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq55 (IQ, nextstate, CK, NOTIFIER);
  output IQ;
  input nextstate;
  input CK;
  input NOTIFIER;
  reg IQ;

  table
// nextstate          CK    NOTIFIER     : @IQ :          IQ
           0           r           ?       : ? :           0;
           1           r           ?       : ? :           1;
           0           *           ?       : 0 :           0; // reduce pessimism
           1           *           ?       : 1 :           1; // reduce pessimism
           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           ?           f           ?       : ? :           -; // Ignore non-triggering clock edge
           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq56 (IQ, nextstate, CK, NOTIFIER);
  output IQ;
  input nextstate;
  input CK;
  input NOTIFIER;
  reg IQ;

  table
// nextstate          CK    NOTIFIER     : @IQ :          IQ
           0           r           ?       : ? :           0;
           1           r           ?       : ? :           1;
           0           *           ?       : 0 :           0; // reduce pessimism
           1           *           ?       : 1 :           1; // reduce pessimism
           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           ?           f           ?       : ? :           -; // Ignore non-triggering clock edge
           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive

primitive seq57 (IQ, nextstate, G, NOTIFIER);
  output IQ;
  input nextstate;
  input G;
  input NOTIFIER;
  reg IQ;

  table
// nextstate           G    NOTIFIER     : @IQ :          IQ
           0           1           ?       : ? :           0;
           1           1           ?       : ? :           1;
           0           1           ?       : 0 :           0; // reduce pessimism
           1           1           ?       : 1 :           1; // reduce pessimism
           *           ?           ?       : ? :           -; // Ignore all edges on nextstate
           ?           0           ?       : ? :           -; // Ignore non-triggering clock edge
           ?           ?           *       : ? :           x; // Any NOTIFIER change
  endtable
endprimitive


`celldefine
module AND2_X1 (A1, A2, ZN);

  input A1;
  input A2;
  output ZN;

  and(ZN, A1, A2);

  specify
    if((A2 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module AND2_X2 (A1, A2, ZN);

  input A1;
  input A2;
  output ZN;

  and(ZN, A1, A2);

  specify
    if((A2 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module AND2_X4 (A1, A2, ZN);

  input A1;
  input A2;
  output ZN;

  and(ZN, A1, A2);

  specify
    if((A2 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module AND3_X1 (A1, A2, A3, ZN);

  input A1;
  input A2;
  input A3;
  output ZN;

  and(ZN, i_414, A3);
  and(i_414, A1, A2);

  specify
    if((A2 == 1'b1) && (A3 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A3 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1)) (A3 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module AND3_X2 (A1, A2, A3, ZN);

  input A1;
  input A2;
  input A3;
  output ZN;

  and(ZN, i_416, A3);
  and(i_416, A1, A2);

  specify
    if((A2 == 1'b1) && (A3 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A3 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1)) (A3 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module AND3_X4 (A1, A2, A3, ZN);

  input A1;
  input A2;
  input A3;
  output ZN;

  and(ZN, i_418, A3);
  and(i_418, A1, A2);

  specify
    if((A2 == 1'b1) && (A3 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A3 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1)) (A3 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module AND4_X1 (A1, A2, A3, A4, ZN);

  input A1;
  input A2;
  input A3;
  input A4;
  output ZN;

  and(ZN, i_420, A4);
  and(i_420, i_421, A3);
  and(i_421, A1, A2);

  specify
    if((A2 == 1'b1) && (A3 == 1'b1) && (A4 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A3 == 1'b1) && (A4 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (A4 == 1'b1)) (A3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (A3 == 1'b1)) (A4 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module AND4_X2 (A1, A2, A3, A4, ZN);

  input A1;
  input A2;
  input A3;
  input A4;
  output ZN;

  and(ZN, i_424, A4);
  and(i_424, i_425, A3);
  and(i_425, A1, A2);

  specify
    if((A2 == 1'b1) && (A3 == 1'b1) && (A4 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A3 == 1'b1) && (A4 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (A4 == 1'b1)) (A3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (A3 == 1'b1)) (A4 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module AND4_X4 (A1, A2, A3, A4, ZN);

  input A1;
  input A2;
  input A3;
  input A4;
  output ZN;

  and(ZN, i_428, A4);
  and(i_428, i_429, A3);
  and(i_429, A1, A2);

  specify
    if((A2 == 1'b1) && (A3 == 1'b1) && (A4 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A3 == 1'b1) && (A4 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (A4 == 1'b1)) (A3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (A3 == 1'b1)) (A4 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module ANTENNA_X1 (A);

  input A;

endmodule
`endcelldefine


`celldefine
module AOI211_X1 (A, B, C1, C2, ZN);

  input A;
  input B;
  input C1;
  input C2;
  output ZN;

  not(ZN, i_432);
  or(i_432, i_433, A);
  or(i_433, i_434, B);
  and(i_434, C1, C2);

  specify
    if((B == 1'b0) && (C1 == 1'b0) && (C2 == 1'b0)) (A => ZN) = (0.1, 0.1);
    if((B == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0)) (A => ZN) = (0.1, 0.1);
    if((B == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0)) (B => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (C1 == 1'b0) && (C2 == 1'b0)) (B => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (B => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B == 1'b0) && (C2 == 1'b1)) (C1 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B == 1'b0) && (C1 == 1'b1)) (C2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module AOI211_X2 (A, B, C1, C2, ZN);

  input A;
  input B;
  input C1;
  input C2;
  output ZN;

  not(ZN, i_438);
  or(i_438, i_439, A);
  or(i_439, i_440, B);
  and(i_440, C1, C2);

  specify
    if((B == 1'b0) && (C1 == 1'b0) && (C2 == 1'b0)) (A => ZN) = (0.1, 0.1);
    if((B == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0)) (A => ZN) = (0.1, 0.1);
    if((B == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0)) (B => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (C1 == 1'b0) && (C2 == 1'b0)) (B => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (B => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B == 1'b0) && (C2 == 1'b1)) (C1 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B == 1'b0) && (C1 == 1'b1)) (C2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module AOI211_X4 (A, B, C1, C2, ZN);

  input A;
  input B;
  input C1;
  input C2;
  output ZN;

  not(ZN, i_444);
  or(i_444, i_445, A);
  or(i_445, i_446, B);
  and(i_446, C1, C2);

  specify
    if((B == 1'b0) && (C1 == 1'b0) && (C2 == 1'b0)) (A => ZN) = (0.1, 0.1);
    if((B == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0)) (A => ZN) = (0.1, 0.1);
    if((B == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0)) (B => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (C1 == 1'b0) && (C2 == 1'b0)) (B => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (B => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B == 1'b0) && (C2 == 1'b1)) (C1 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B == 1'b0) && (C1 == 1'b1)) (C2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module AOI21_X1 (A, B1, B2, ZN);

  input A;
  input B1;
  input B2;
  output ZN;

  not(ZN, i_450);
  or(i_450, A, i_451);
  and(i_451, B1, B2);

  specify
    if((B1 == 1'b1) && (B2 == 1'b0)) (A => ZN) = (0.1, 0.1);
    if((B1 == 1'b0) && (B2 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((B1 == 1'b0) && (B2 == 1'b0)) (A => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module AOI21_X2 (A, B1, B2, ZN);

  input A;
  input B1;
  input B2;
  output ZN;

  not(ZN, i_454);
  or(i_454, A, i_455);
  and(i_455, B1, B2);

  specify
    if((B1 == 1'b1) && (B2 == 1'b0)) (A => ZN) = (0.1, 0.1);
    if((B1 == 1'b0) && (B2 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((B1 == 1'b0) && (B2 == 1'b0)) (A => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module AOI21_X4 (A, B1, B2, ZN);

  input A;
  input B1;
  input B2;
  output ZN;

  not(ZN, i_458);
  or(i_458, A, i_459);
  and(i_459, B1, B2);

  specify
    if((B1 == 1'b1) && (B2 == 1'b0)) (A => ZN) = (0.1, 0.1);
    if((B1 == 1'b0) && (B2 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((B1 == 1'b0) && (B2 == 1'b0)) (A => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module AOI221_X1 (A, B1, B2, C1, C2, ZN);

  input A;
  input B1;
  input B2;
  input C1;
  input C2;
  output ZN;

  not(ZN, i_462);
  or(i_462, i_463, i_465);
  or(i_463, i_464, A);
  and(i_464, C1, C2);
  and(i_465, B1, B2);

  specify
    if((B1 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b0) || (B1 == 1'b0) && (B2 == 1'b0) && (C2 == 1'b0) || (B1 == 1'b0) && (B2 == 1'b0) && (C1 == 1'b0)) (A => ZN) = (0.1, 0.1);
    if((B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0) || (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((B1 == 1'b1) && (B2 == 1'b0) && (C2 == 1'b0) || (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0)) (A => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C2 == 1'b1)) (C1 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b0) && (B2 == 1'b0) && (C2 == 1'b1)) (C1 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (C2 == 1'b1)) (C1 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1)) (C2 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b0) && (B2 == 1'b0) && (C1 == 1'b1)) (C2 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1)) (C2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module AOI221_X2 (A, B1, B2, C1, C2, ZN);

  input A;
  input B1;
  input B2;
  input C1;
  input C2;
  output ZN;

  not(ZN, i_470);
  or(i_470, i_471, i_473);
  or(i_471, i_472, A);
  and(i_472, C1, C2);
  and(i_473, B1, B2);

  specify
    if((B1 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b0) || (B1 == 1'b0) && (B2 == 1'b0) && (C2 == 1'b0) || (B1 == 1'b0) && (B2 == 1'b0) && (C1 == 1'b0)) (A => ZN) = (0.1, 0.1);
    if((B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0) || (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) || (B1 == 1'b1) && (B2 == 1'b0) && (C2 == 1'b0)) (A => ZN) = (0.1, 0.1);
    if((B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C2 == 1'b1)) (C1 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b0) && (B2 == 1'b0) && (C2 == 1'b1)) (C1 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (C2 == 1'b1)) (C1 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1)) (C2 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b0) && (B2 == 1'b0) && (C1 == 1'b1)) (C2 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1)) (C2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module AOI221_X4 (A, B1, B2, C1, C2, ZN);

  input A;
  input B1;
  input B2;
  input C1;
  input C2;
  output ZN;

  not(ZN, i_478);
  or(i_478, i_479, i_481);
  or(i_479, i_480, A);
  and(i_480, C1, C2);
  and(i_481, B1, B2);

  specify
    if((B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0) || (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) || (B1 == 1'b1) && (B2 == 1'b0) && (C2 == 1'b0)) (A => ZN) = (0.1, 0.1);
    if((B1 == 1'b0) && (B2 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0)) (A => ZN) = (0.1, 0.1);
    if((B1 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b0) || (B1 == 1'b0) && (B2 == 1'b0) && (C1 == 1'b0)) (A => ZN) = (0.1, 0.1);
    if((B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C2 == 1'b1)) (C1 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b0) && (B2 == 1'b0) && (C2 == 1'b1)) (C1 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (C2 == 1'b1)) (C1 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1)) (C2 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b0) && (B2 == 1'b0) && (C1 == 1'b1)) (C2 => ZN) = (0.1, 0.1);
    if((A == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1)) (C2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module AOI222_X1 (A1, A2, B1, B2, C1, C2, ZN);

  input A1;
  input A2;
  input B1;
  input B2;
  input C1;
  input C2;
  output ZN;

  not(ZN, i_486);
  or(i_486, i_487, i_490);
  or(i_487, i_488, i_489);
  and(i_488, A1, A2);
  and(i_489, B1, B2);
  and(i_490, C1, C2);

  specify
    if((A2 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0) || (A2 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0) && (C2 == 1'b0) || (A2 == 1'b1) && (B1 == 1'b0) && (C1 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0) || (A1 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b0) || (A1 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0) && (C2 == 1'b0) || (A1 == 1'b1) && (B1 == 1'b0) && (C1 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0) || (A1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b0) || (A1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b0) || (A1 == 1'b0) && (A2 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1) || (A1 == 1'b0) && (A2 == 1'b1) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B1 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b0) || (A1 == 1'b0) && (B1 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b0) || (A1 == 1'b0) && (A2 == 1'b0) && (B1 == 1'b1) && (C1 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (B1 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1) || (A1 == 1'b0) && (B1 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0) || (A2 == 1'b0) && (B1 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b0) && (C2 == 1'b1)) (C1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C2 == 1'b1) || (A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C2 == 1'b1)) (C1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (C2 == 1'b1) || (A1 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (C2 == 1'b1)) (C1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0) && (C2 == 1'b1) || (A1 == 1'b0) && (A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C2 == 1'b1)) (C1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) || (A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1)) (C2 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b0) && (C1 == 1'b1)) (C2 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1) || (A1 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1)) (C2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0) && (C1 == 1'b1) || (A1 == 1'b0) && (A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1)) (C2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module AOI222_X2 (A1, A2, B1, B2, C1, C2, ZN);

  input A1;
  input A2;
  input B1;
  input B2;
  input C1;
  input C2;
  output ZN;

  not(ZN, i_496);
  or(i_496, i_497, i_500);
  or(i_497, i_498, i_499);
  and(i_498, A1, A2);
  and(i_499, B1, B2);
  and(i_500, C1, C2);

  specify
    if((A2 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0) || (A2 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0) && (C2 == 1'b0) || (A2 == 1'b1) && (B1 == 1'b0) && (C1 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B1 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b0) || (A1 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0) && (C2 == 1'b0) || (A1 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0) && (C1 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0) || (A1 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0) || (A1 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0) || (A1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b0) || (A1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b0) || (A1 == 1'b0) && (A2 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1) || (A1 == 1'b0) && (A2 == 1'b1) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B1 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b0) || (A1 == 1'b0) && (B1 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b0) || (A1 == 1'b0) && (A2 == 1'b0) && (B1 == 1'b1) && (C1 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (B1 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1) || (A1 == 1'b0) && (B1 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0) || (A2 == 1'b0) && (B1 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b0) && (C2 == 1'b1)) (C1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C2 == 1'b1) || (A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C2 == 1'b1)) (C1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (C2 == 1'b1) || (A1 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (C2 == 1'b1)) (C1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0) && (C2 == 1'b1) || (A1 == 1'b0) && (A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C2 == 1'b1)) (C1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) || (A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1)) (C2 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b0) && (C1 == 1'b1)) (C2 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1) || (A1 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1)) (C2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0) && (C1 == 1'b1) || (A1 == 1'b0) && (A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1)) (C2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module AOI222_X4 (A1, A2, B1, B2, C1, C2, ZN);

  input A1;
  input A2;
  input B1;
  input B2;
  input C1;
  input C2;
  output ZN;

  not(ZN, i_506);
  or(i_506, i_507, i_510);
  or(i_507, i_508, i_509);
  and(i_508, A1, A2);
  and(i_509, B1, B2);
  and(i_510, C1, C2);

  specify
    if((A2 == 1'b1) && (B1 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b0) || (A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0) && (C1 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b0) || (A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0) || (A2 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1) || (A2 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0) || (A1 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1) || (A1 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b0) || (A1 == 1'b1) && (B1 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b0) || (A1 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0) && (C2 == 1'b0) || (A1 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0) && (C1 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b0) || (A1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b0) || (A1 == 1'b0) && (A2 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1) || (A1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0) || (A2 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B1 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b0) || (A1 == 1'b0) && (B1 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b0) || (A1 == 1'b0) && (A2 == 1'b0) && (B1 == 1'b1) && (C1 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (B1 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1) || (A1 == 1'b0) && (B1 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0) || (A2 == 1'b0) && (B1 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b0) && (C2 == 1'b1)) (C1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C2 == 1'b1) || (A1 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (C2 == 1'b1) || (A2 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (C2 == 1'b1)) (C1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C2 == 1'b1)) (C1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0) && (C2 == 1'b1) || (A1 == 1'b0) && (A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C2 == 1'b1)) (C1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) || (A1 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1) || (A2 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1)) (C2 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b0) && (C1 == 1'b1)) (C2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1)) (C2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0) && (C1 == 1'b1) || (A1 == 1'b0) && (A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1)) (C2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module AOI22_X1 (A1, A2, B1, B2, ZN);

  input A1;
  input A2;
  input B1;
  input B2;
  output ZN;

  not(ZN, i_516);
  or(i_516, i_517, i_518);
  and(i_517, A1, A2);
  and(i_518, B1, B2);

  specify
    if((A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (B2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (B2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (B1 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (B1 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module AOI22_X2 (A1, A2, B1, B2, ZN);

  input A1;
  input A2;
  input B1;
  input B2;
  output ZN;

  not(ZN, i_522);
  or(i_522, i_523, i_524);
  and(i_523, A1, A2);
  and(i_524, B1, B2);

  specify
    if((A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (B2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (B2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (B1 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (B1 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module AOI22_X4 (A1, A2, B1, B2, ZN);

  input A1;
  input A2;
  input B1;
  input B2;
  output ZN;

  not(ZN, i_528);
  or(i_528, i_529, i_530);
  and(i_529, A1, A2);
  and(i_530, B1, B2);

  specify
    if((A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (B2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (B2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (B1 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (B1 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module BUF_X1 (A, Z);

  input A;
  output Z;

  buf(Z, A);

  specify
    (A => Z) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module BUF_X16 (A, Z);

  input A;
  output Z;

  buf(Z, A);

  specify
    (A => Z) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module BUF_X2 (A, Z);

  input A;
  output Z;

  buf(Z, A);

  specify
    (A => Z) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module BUF_X32 (A, Z);

  input A;
  output Z;

  buf(Z, A);

  specify
    (A => Z) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module BUF_X4 (A, Z);

  input A;
  output Z;

  buf(Z, A);

  specify
    (A => Z) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module BUF_X8 (A, Z);

  input A;
  output Z;

  buf(Z, A);

  specify
    (A => Z) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module CLKBUF_X1 (A, Z);

  input A;
  output Z;

  buf(Z, A);

  specify
    (A => Z) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module CLKBUF_X2 (A, Z);

  input A;
  output Z;

  buf(Z, A);

  specify
    (A => Z) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module CLKBUF_X3 (A, Z);

  input A;
  output Z;

  buf(Z, A);

  specify
    (A => Z) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module CLKGATETST_X1 (CK, E, SE, GCK);

  input CK;
  input E;
  input SE;
  output GCK;
  reg NOTIFIER;

  and(GCK, IQ, CK);
  seq29(IQ, nextstate, CK, NOTIFIER);
  not(IQn, IQ);
  or(nextstate, E, SE);


  specify
    if((E == 1'b1) && (SE == 1'b1)) (CK => GCK) = (0.1, 0.1);

    $width(negedge CK, 0.1, 0, NOTIFIER);
    $setup(posedge E, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge E, 0.1, NOTIFIER);
    $setup(negedge E, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge E, 0.1, NOTIFIER);
    $setup(posedge SE, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge SE, 0.1, NOTIFIER);
    $setup(negedge SE, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SE, 0.1, NOTIFIER);
  endspecify

endmodule
`endcelldefine


`celldefine
module CLKGATETST_X2 (CK, E, SE, GCK);

  input CK;
  input E;
  input SE;
  output GCK;
  reg NOTIFIER;

  and(GCK, IQ, CK);
  seq30(IQ, nextstate, CK, NOTIFIER);
  not(IQn, IQ);
  or(nextstate, E, SE);


  specify
    if((E == 1'b1) && (SE == 1'b1)) (CK => GCK) = (0.1, 0.1);

    $width(negedge CK, 0.1, 0, NOTIFIER);
    $setup(posedge E, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge E, 0.1, NOTIFIER);
    $setup(negedge E, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge E, 0.1, NOTIFIER);
    $setup(posedge SE, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge SE, 0.1, NOTIFIER);
    $setup(negedge SE, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SE, 0.1, NOTIFIER);
  endspecify

endmodule
`endcelldefine


`celldefine
module CLKGATETST_X4 (CK, E, SE, GCK);

  input CK;
  input E;
  input SE;
  output GCK;
  reg NOTIFIER;

  and(GCK, IQ, CK);
  seq31(IQ, nextstate, CK, NOTIFIER);
  not(IQn, IQ);
  or(nextstate, E, SE);


  specify
    if((E == 1'b1) && (SE == 1'b1)) (CK => GCK) = (0.1, 0.1);

    $width(negedge CK, 0.1, 0, NOTIFIER);
    $setup(posedge E, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge E, 0.1, NOTIFIER);
    $setup(negedge E, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge E, 0.1, NOTIFIER);
    $setup(posedge SE, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge SE, 0.1, NOTIFIER);
    $setup(negedge SE, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SE, 0.1, NOTIFIER);
  endspecify

endmodule
`endcelldefine


`celldefine
module CLKGATETST_X8 (CK, E, SE, GCK);

  input CK;
  input E;
  input SE;
  output GCK;
  reg NOTIFIER;

  and(GCK, IQ, CK);
  seq32(IQ, nextstate, CK, NOTIFIER);
  not(IQn, IQ);
  or(nextstate, E, SE);


  specify
    if((E == 1'b1) && (SE == 1'b1)) (CK => GCK) = (0.1, 0.1);

    $width(negedge CK, 0.1, 0, NOTIFIER);
    $setup(posedge E, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge E, 0.1, NOTIFIER);
    $setup(negedge E, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge E, 0.1, NOTIFIER);
    $setup(posedge SE, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge SE, 0.1, NOTIFIER);
    $setup(negedge SE, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SE, 0.1, NOTIFIER);
  endspecify

endmodule
`endcelldefine


`celldefine
module CLKGATE_X1 (CK, E, GCK);

  input CK;
  input E;
  output GCK;
  reg NOTIFIER;

  and(GCK, CK, IQ);
  seq33(IQ, nextstate, CK, NOTIFIER);
  not(IQn, IQ);
  buf(nextstate, E);


  specify
    if((E == 1'b1)) (CK => GCK) = (0.1, 0.1);

    $width(negedge CK, 0.1, 0, NOTIFIER);
    $setup(posedge E, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge E, 0.1, NOTIFIER);
    $setup(negedge E, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge E, 0.1, NOTIFIER);
  endspecify

endmodule
`endcelldefine


`celldefine
module CLKGATE_X2 (CK, E, GCK);

  input CK;
  input E;
  output GCK;
  reg NOTIFIER;

  and(GCK, CK, IQ);
  seq34(IQ, nextstate, CK, NOTIFIER);
  not(IQn, IQ);
  buf(nextstate, E);


  specify
    if((E == 1'b1)) (CK => GCK) = (0.1, 0.1);

    $width(negedge CK, 0.1, 0, NOTIFIER);
    $setup(posedge E, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge E, 0.1, NOTIFIER);
    $setup(negedge E, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge E, 0.1, NOTIFIER);
  endspecify

endmodule
`endcelldefine


`celldefine
module CLKGATE_X4 (CK, E, GCK);

  input CK;
  input E;
  output GCK;
  reg NOTIFIER;

  and(GCK, CK, IQ);
  seq35(IQ, nextstate, CK, NOTIFIER);
  not(IQn, IQ);
  buf(nextstate, E);


  specify
    if((E == 1'b1)) (CK => GCK) = (0.1, 0.1);

    $width(negedge CK, 0.1, 0, NOTIFIER);
    $setup(posedge E, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge E, 0.1, NOTIFIER);
    $setup(negedge E, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge E, 0.1, NOTIFIER);
  endspecify

endmodule
`endcelldefine


`celldefine
module CLKGATE_X8 (CK, E, GCK);

  input CK;
  input E;
  output GCK;
  reg NOTIFIER;

  and(GCK, CK, IQ);
  seq36(IQ, nextstate, CK, NOTIFIER);
  not(IQn, IQ);
  buf(nextstate, E);


  specify
    if((E == 1'b1)) (CK => GCK) = (0.1, 0.1);

    $width(negedge CK, 0.1, 0, NOTIFIER);
    $setup(posedge E, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge E, 0.1, NOTIFIER);
    $setup(negedge E, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge E, 0.1, NOTIFIER);
  endspecify

endmodule
`endcelldefine


`celldefine
module DFFRS_X1 (CK, D, RN, SN, Q, QN);

  input CK;
  input D;
  input RN;
  input SN;
  output Q;
  output QN;
  reg NOTIFIER;

  seq37(IQ, SN, RN, nextstate, CK, NOTIFIER);
  and(IQN, i_534, i_535);
  not(i_534, IQ);
  not(i_535, i_536);
  and(i_536, i_537, i_538);
  not(i_537, SN);
  not(i_538, RN);
  buf(Q, IQ);
  buf(QN, IQN);
  buf(nextstate, D);


  specify
    if((RN == 1'b1) && (SN == 1'b1)) (posedge CK => (Q +: D)) = (0.1, 0.1);
    if((CK == 1'b1) && (SN == 1'b0)) (RN => Q) = (0.1, 0.1);
    if((CK == 1'b0) && (SN == 1'b0)) (RN => Q) = (0.1, 0.1);
    if((CK == 1'b1) && (SN == 1'b1)) (negedge RN => (Q +: 1'b0)) = (0.1, 0.1);
    if((CK == 1'b0) && (SN == 1'b1)) (negedge RN => (Q +: 1'b0)) = (0.1, 0.1);
    if((CK == 1'b1) && (RN == 1'b1)) (negedge SN => (Q +: 1'b1)) = (0.1, 0.1);
    if((CK == 1'b0) && (RN == 1'b1)) (negedge SN => (Q +: 1'b1)) = (0.1, 0.1);
    if((RN == 1'b1) && (SN == 1'b1)) (posedge CK => (QN -: D)) = (0.1, 0.1);
    if((CK == 1'b1) && (SN == 1'b1)) (negedge RN => (QN +: 1'b1)) = (0.1, 0.1);
    if((CK == 1'b0) && (SN == 1'b1)) (negedge RN => (QN +: 1'b1)) = (0.1, 0.1);
    if((CK == 1'b1) && (RN == 1'b1)) (negedge SN => (QN +: 1'b0)) = (0.1, 0.1);
    if((CK == 1'b1) && (RN == 1'b0)) (SN => QN) = (0.1, 0.1);
    if((CK == 1'b0) && (RN == 1'b0)) (SN => QN) = (0.1, 0.1);
    if((CK == 1'b0) && (RN == 1'b1)) (negedge SN => (QN +: 1'b0)) = (0.1, 0.1);

    $width(negedge CK, 0.1, 0, NOTIFIER);
    $width(posedge CK, 0.1, 0, NOTIFIER);
    $setup(negedge D, posedge CK, 0.1, NOTIFIER);
    $setup(posedge D, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge D, 0.1, NOTIFIER);
    $hold(posedge CK, posedge D, 0.1, NOTIFIER);
    $recovery(posedge RN, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge RN, 0.1, NOTIFIER);
    $width(negedge RN, 0.1, 0, NOTIFIER);
    $recovery(posedge SN, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SN, 0.1, NOTIFIER);
    $width(negedge SN, 0.1, 0, NOTIFIER);
  endspecify

endmodule
`endcelldefine


`celldefine
module DFFRS_X2 (CK, D, RN, SN, Q, QN);

  input CK;
  input D;
  input RN;
  input SN;
  output Q;
  output QN;
  reg NOTIFIER;

  seq38(IQ, SN, RN, nextstate, CK, NOTIFIER);
  and(IQN, i_539, i_540);
  not(i_539, IQ);
  not(i_540, i_541);
  and(i_541, i_542, i_543);
  not(i_542, SN);
  not(i_543, RN);
  buf(Q, IQ);
  buf(QN, IQN);
  buf(nextstate, D);


  specify
    if((RN == 1'b1) && (SN == 1'b1)) (posedge CK => (Q +: D)) = (0.1, 0.1);
    if((CK == 1'b1) && (SN == 1'b0)) (RN => Q) = (0.1, 0.1);
    if((CK == 1'b0) && (SN == 1'b0)) (RN => Q) = (0.1, 0.1);
    if((CK == 1'b1) && (SN == 1'b1)) (negedge RN => (Q +: 1'b0)) = (0.1, 0.1);
    if((CK == 1'b0) && (SN == 1'b1)) (negedge RN => (Q +: 1'b0)) = (0.1, 0.1);
    if((CK == 1'b1) && (RN == 1'b1)) (negedge SN => (Q +: 1'b1)) = (0.1, 0.1);
    if((CK == 1'b0) && (RN == 1'b1)) (negedge SN => (Q +: 1'b1)) = (0.1, 0.1);
    if((RN == 1'b1) && (SN == 1'b1)) (posedge CK => (QN -: D)) = (0.1, 0.1);
    if((CK == 1'b1) && (SN == 1'b1)) (negedge RN => (QN +: 1'b1)) = (0.1, 0.1);
    if((CK == 1'b0) && (SN == 1'b1)) (negedge RN => (QN +: 1'b1)) = (0.1, 0.1);
    if((CK == 1'b1) && (RN == 1'b1)) (negedge SN => (QN +: 1'b0)) = (0.1, 0.1);
    if((CK == 1'b1) && (RN == 1'b0)) (SN => QN) = (0.1, 0.1);
    if((CK == 1'b0) && (RN == 1'b0)) (SN => QN) = (0.1, 0.1);
    if((CK == 1'b0) && (RN == 1'b1)) (negedge SN => (QN +: 1'b0)) = (0.1, 0.1);

    $width(negedge CK, 0.1, 0, NOTIFIER);
    $width(posedge CK, 0.1, 0, NOTIFIER);
    $setup(negedge D, posedge CK, 0.1, NOTIFIER);
    $setup(posedge D, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge D, 0.1, NOTIFIER);
    $hold(posedge CK, posedge D, 0.1, NOTIFIER);
    $recovery(posedge RN, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge RN, 0.1, NOTIFIER);
    $width(negedge RN, 0.1, 0, NOTIFIER);
    $recovery(posedge SN, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SN, 0.1, NOTIFIER);
    $width(negedge SN, 0.1, 0, NOTIFIER);
  endspecify

endmodule
`endcelldefine


`celldefine
module DFFR_X1 (CK, D, RN, Q, QN);

  input CK;
  input D;
  input RN;
  output Q;
  output QN;
  reg NOTIFIER;

  seq39(IQ, RN, nextstate, CK, NOTIFIER);
  not(IQN, IQ);
  buf(Q, IQ);
  buf(QN, IQN);
  buf(nextstate, D);


  specify
    if((RN == 1'b1)) (posedge CK => (Q +: D)) = (0.1, 0.1);
    if((CK == 1'b1)) (negedge RN => (Q +: 1'b0)) = (0.1, 0.1);
    if((CK == 1'b0)) (negedge RN => (Q +: 1'b0)) = (0.1, 0.1);
    if((RN == 1'b1)) (posedge CK => (QN -: D)) = (0.1, 0.1);
    if((CK == 1'b1)) (negedge RN => (QN +: 1'b1)) = (0.1, 0.1);
    if((CK == 1'b0)) (negedge RN => (QN +: 1'b1)) = (0.1, 0.1);

    $width(negedge CK, 0.1, 0, NOTIFIER);
    $width(posedge CK, 0.1, 0, NOTIFIER);
    $setup(negedge D, posedge CK, 0.1, NOTIFIER);
    $setup(posedge D, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge D, 0.1, NOTIFIER);
    $hold(posedge CK, posedge D, 0.1, NOTIFIER);
    $recovery(posedge RN, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge RN, 0.1, NOTIFIER);
    $width(negedge RN, 0.1, 0, NOTIFIER);
  endspecify

endmodule
`endcelldefine


`celldefine
module DFFR_X2 (CK, D, RN, Q, QN);

  input CK;
  input D;
  input RN;
  output Q;
  output QN;
  reg NOTIFIER;

  seq40(IQ, RN, nextstate, CK, NOTIFIER);
  not(IQN, IQ);
  buf(Q, IQ);
  buf(QN, IQN);
  buf(nextstate, D);


  specify
    if((RN == 1'b1)) (posedge CK => (Q +: D)) = (0.1, 0.1);
    if((CK == 1'b1)) (negedge RN => (Q +: 1'b0)) = (0.1, 0.1);
    if((CK == 1'b0)) (negedge RN => (Q +: 1'b0)) = (0.1, 0.1);
    if((RN == 1'b1)) (posedge CK => (QN -: D)) = (0.1, 0.1);
    if((CK == 1'b1)) (negedge RN => (QN +: 1'b1)) = (0.1, 0.1);
    if((CK == 1'b0)) (negedge RN => (QN +: 1'b1)) = (0.1, 0.1);

    $width(negedge CK, 0.1, 0, NOTIFIER);
    $width(posedge CK, 0.1, 0, NOTIFIER);
    $setup(negedge D, posedge CK, 0.1, NOTIFIER);
    $setup(posedge D, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge D, 0.1, NOTIFIER);
    $hold(posedge CK, posedge D, 0.1, NOTIFIER);
    $recovery(posedge RN, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge RN, 0.1, NOTIFIER);
    $width(negedge RN, 0.1, 0, NOTIFIER);
  endspecify

endmodule
`endcelldefine


`celldefine
module DFFS_X1 (CK, D, SN, Q, QN);

  input CK;
  input D;
  input SN;
  output Q;
  output QN;
  reg NOTIFIER;

  seq41(IQ, SN, nextstate, CK, NOTIFIER);
  not(IQN, IQ);
  buf(Q, IQ);
  buf(QN, IQN);
  buf(nextstate, D);


  specify
    if((SN == 1'b1)) (posedge CK => (Q +: D)) = (0.1, 0.1);
    if((CK == 1'b1)) (negedge SN => (Q +: 1'b1)) = (0.1, 0.1);
    if((CK == 1'b0)) (negedge SN => (Q +: 1'b1)) = (0.1, 0.1);
    if((SN == 1'b1)) (posedge CK => (QN -: D)) = (0.1, 0.1);
    if((CK == 1'b1)) (negedge SN => (QN +: 1'b0)) = (0.1, 0.1);
    if((CK == 1'b0)) (negedge SN => (QN +: 1'b0)) = (0.1, 0.1);

    $width(negedge CK, 0.1, 0, NOTIFIER);
    $width(posedge CK, 0.1, 0, NOTIFIER);
    $setup(negedge D, posedge CK, 0.1, NOTIFIER);
    $setup(posedge D, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge D, 0.1, NOTIFIER);
    $hold(posedge CK, posedge D, 0.1, NOTIFIER);
    $recovery(posedge SN, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SN, 0.1, NOTIFIER);
    $width(negedge SN, 0.1, 0, NOTIFIER);
  endspecify

endmodule
`endcelldefine


`celldefine
module DFFS_X2 (CK, D, SN, Q, QN);

  input CK;
  input D;
  input SN;
  output Q;
  output QN;
  reg NOTIFIER;

  seq42(IQ, SN, nextstate, CK, NOTIFIER);
  not(IQN, IQ);
  buf(Q, IQ);
  buf(QN, IQN);
  buf(nextstate, D);


  specify
    if((SN == 1'b1)) (posedge CK => (Q +: D)) = (0.1, 0.1);
    if((CK == 1'b1)) (negedge SN => (Q +: 1'b1)) = (0.1, 0.1);
    if((CK == 1'b0)) (negedge SN => (Q +: 1'b1)) = (0.1, 0.1);
    if((SN == 1'b1)) (posedge CK => (QN -: D)) = (0.1, 0.1);
    if((CK == 1'b1)) (negedge SN => (QN +: 1'b0)) = (0.1, 0.1);
    if((CK == 1'b0)) (negedge SN => (QN +: 1'b0)) = (0.1, 0.1);

    $width(negedge CK, 0.1, 0, NOTIFIER);
    $width(posedge CK, 0.1, 0, NOTIFIER);
    $setup(negedge D, posedge CK, 0.1, NOTIFIER);
    $setup(posedge D, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge D, 0.1, NOTIFIER);
    $hold(posedge CK, posedge D, 0.1, NOTIFIER);
    $recovery(posedge SN, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SN, 0.1, NOTIFIER);
    $width(negedge SN, 0.1, 0, NOTIFIER);
  endspecify

endmodule
`endcelldefine


`celldefine
module DFF_X1 (CK, D, Q, QN);

  input CK;
  input D;
  output Q;
  output QN;
  reg NOTIFIER;

  seq43(IQ, nextstate, CK, NOTIFIER);
  not(IQN, IQ);
  buf(Q, IQ);
  buf(QN, IQN);
  buf(nextstate, D);


  specify
    (posedge CK => (Q +: D)) = (0.1, 0.1);
    (posedge CK => (QN -: D)) = (0.1, 0.1);

    $width(negedge CK, 0.1, 0, NOTIFIER);
    $width(posedge CK, 0.1, 0, NOTIFIER);
    $setup(negedge D, posedge CK, 0.1, NOTIFIER);
    $setup(posedge D, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge D, 0.1, NOTIFIER);
    $hold(posedge CK, posedge D, 0.1, NOTIFIER);
  endspecify

endmodule
`endcelldefine


`celldefine
module DFF_X2 (CK, D, Q, QN);

  input CK;
  input D;
  output Q;
  output QN;
  reg NOTIFIER;

  seq44(IQ, nextstate, CK, NOTIFIER);
  not(IQN, IQ);
  buf(Q, IQ);
  buf(QN, IQN);
  buf(nextstate, D);


  specify
    (posedge CK => (Q +: D)) = (0.1, 0.1);
    (posedge CK => (QN -: D)) = (0.1, 0.1);

    $width(negedge CK, 0.1, 0, NOTIFIER);
    $width(posedge CK, 0.1, 0, NOTIFIER);
    $setup(negedge D, posedge CK, 0.1, NOTIFIER);
    $setup(posedge D, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge D, 0.1, NOTIFIER);
    $hold(posedge CK, posedge D, 0.1, NOTIFIER);
  endspecify

endmodule
`endcelldefine


`celldefine
module DLH_X1 (D, G, Q);

  input D;
  input G;
  output Q;
  reg NOTIFIER;

  seq45(IQ, nextstate, G, NOTIFIER);
  not(IQN, IQ);
  buf(Q, IQ);
  buf(nextstate, D);


  specify
    if((G == 1'b1)) (D => Q) = (0.1, 0.1);
    (posedge G => (Q +: D)) = (0.1, 0.1);

    $setup(negedge D, negedge G, 0.1, NOTIFIER);
    $setup(posedge D, negedge G, 0.1, NOTIFIER);
    $hold(negedge G, negedge D, 0.1, NOTIFIER);
    $hold(negedge G, posedge D, 0.1, NOTIFIER);
    $width(posedge G, 0.1, 0, NOTIFIER);
  endspecify

endmodule
`endcelldefine


`celldefine
module DLH_X2 (D, G, Q);

  input D;
  input G;
  output Q;
  reg NOTIFIER;

  seq46(IQ, nextstate, G, NOTIFIER);
  not(IQN, IQ);
  buf(Q, IQ);
  buf(nextstate, D);


  specify
    if((G == 1'b1)) (D => Q) = (0.1, 0.1);
    (posedge G => (Q +: D)) = (0.1, 0.1);

    $setup(negedge D, negedge G, 0.1, NOTIFIER);
    $setup(posedge D, negedge G, 0.1, NOTIFIER);
    $hold(negedge G, negedge D, 0.1, NOTIFIER);
    $hold(negedge G, posedge D, 0.1, NOTIFIER);
    $width(posedge G, 0.1, 0, NOTIFIER);
  endspecify

endmodule
`endcelldefine


`celldefine
module DLL_X1 (D, GN, Q);

  input D;
  input GN;
  output Q;
  reg NOTIFIER;

  seq47(IQ, nextstate, GN, NOTIFIER);
  not(IQN, IQ);
  buf(Q, IQ);
  buf(nextstate, D);


  specify
    if((GN == 1'b0)) (D => Q) = (0.1, 0.1);
    (negedge GN => (Q +: D)) = (0.1, 0.1);

    $setup(negedge D, posedge GN, 0.1, NOTIFIER);
    $setup(posedge D, posedge GN, 0.1, NOTIFIER);
    $hold(posedge GN, negedge D, 0.1, NOTIFIER);
    $hold(posedge GN, posedge D, 0.1, NOTIFIER);
    $width(negedge GN, 0.1, 0, NOTIFIER);
  endspecify

endmodule
`endcelldefine


`celldefine
module DLL_X2 (D, GN, Q);

  input D;
  input GN;
  output Q;
  reg NOTIFIER;

  seq48(IQ, nextstate, GN, NOTIFIER);
  not(IQN, IQ);
  buf(Q, IQ);
  buf(nextstate, D);


  specify
    if((GN == 1'b0)) (D => Q) = (0.1, 0.1);
    (negedge GN => (Q +: D)) = (0.1, 0.1);

    $setup(negedge D, posedge GN, 0.1, NOTIFIER);
    $setup(posedge D, posedge GN, 0.1, NOTIFIER);
    $hold(posedge GN, negedge D, 0.1, NOTIFIER);
    $hold(posedge GN, posedge D, 0.1, NOTIFIER);
    $width(negedge GN, 0.1, 0, NOTIFIER);
  endspecify

endmodule
`endcelldefine


`celldefine
module FA_X1 (A, B, CI, CO, S);

  input A;
  input B;
  input CI;
  output CO;
  output S;

  or(CO, i_544, i_545);
  and(i_544, A, B);
  and(i_545, CI, i_546);
  or(i_546, A, B);
  xor(S, CI, i_550);
  xor(i_550, A, B);

  specify
    if((B == 1'b0) && (CI == 1'b1)) (A => CO) = (0.1, 0.1);
    if((B == 1'b1) && (CI == 1'b0)) (A => CO) = (0.1, 0.1);
    if((A == 1'b1) && (CI == 1'b0)) (B => CO) = (0.1, 0.1);
    if((A == 1'b0) && (CI == 1'b1)) (B => CO) = (0.1, 0.1);
    if((A == 1'b1) && (B == 1'b0)) (CI => CO) = (0.1, 0.1);
    if((A == 1'b0) && (B == 1'b1)) (CI => CO) = (0.1, 0.1);
    if((B == 1'b0) && (CI == 1'b1)) (A => S) = (0.1, 0.1);
    if((B == 1'b0) && (CI == 1'b0)) (A => S) = (0.1, 0.1);
    if((B == 1'b1) && (CI == 1'b1)) (A => S) = (0.1, 0.1);
    if((B == 1'b1) && (CI == 1'b0)) (A => S) = (0.1, 0.1);
    if((A == 1'b0) && (CI == 1'b0)) (B => S) = (0.1, 0.1);
    if((A == 1'b1) && (CI == 1'b0)) (B => S) = (0.1, 0.1);
    if((A == 1'b1) && (CI == 1'b1)) (B => S) = (0.1, 0.1);
    if((A == 1'b0) && (CI == 1'b1)) (B => S) = (0.1, 0.1);
    if((A == 1'b1) && (B == 1'b1)) (CI => S) = (0.1, 0.1);
    if((A == 1'b1) && (B == 1'b0)) (CI => S) = (0.1, 0.1);
    if((A == 1'b0) && (B == 1'b1)) (CI => S) = (0.1, 0.1);
    if((A == 1'b0) && (B == 1'b0)) (CI => S) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


`celldefine
module FILLCELL_X1 ();


endmodule
`endcelldefine


`celldefine
module FILLCELL_X16 ();


endmodule
`endcelldefine


`celldefine
module FILLCELL_X2 ();


endmodule
`endcelldefine


`celldefine
module FILLCELL_X32 ();


endmodule
`endcelldefine



`celldefine
module FILLCELL_X4 ();


endmodule
`endcelldefine



`celldefine
module FILLCELL_X8 ();


endmodule
`endcelldefine



`celldefine
module HA_X1 (A, B, CO, S);

  input A;
  input B;
  output CO;
  output S;

  and(CO, A, B);
  xor(S, A, B);

  specify
    if((B == 1'b1)) (A => CO) = (0.1, 0.1);
    if((A == 1'b1)) (B => CO) = (0.1, 0.1);
    if((B == 1'b0)) (A => S) = (0.1, 0.1);
    if((B == 1'b1)) (A => S) = (0.1, 0.1);
    if((A == 1'b1)) (B => S) = (0.1, 0.1);
    if((A == 1'b0)) (B => S) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module INV_X1 (A, ZN);

  input A;
  output ZN;

  not(ZN, A);

  specify
    (A => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module INV_X16 (A, ZN);

  input A;
  output ZN;

  not(ZN, A);

  specify
    (A => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module INV_X2 (A, ZN);

  input A;
  output ZN;

  not(ZN, A);

  specify
    (A => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module INV_X32 (A, ZN);

  input A;
  output ZN;

  not(ZN, A);

  specify
    (A => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module INV_X4 (A, ZN);

  input A;
  output ZN;

  not(ZN, A);

  specify
    (A => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module INV_X8 (A, ZN);

  input A;
  output ZN;

  not(ZN, A);

  specify
    (A => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module LOGIC0_X1 (Z);

  output Z;

  buf(Z, 0);
endmodule
`endcelldefine



`celldefine
module LOGIC1_X1 (Z);

  output Z;

  buf(Z, 1);
endmodule
`endcelldefine



`celldefine
module MUX2_X1 (A, B, S, Z);

  input A;
  input B;
  input S;
  output Z;

  or(Z, i_552, i_553);
  and(i_552, S, B);
  and(i_553, A, i_554);
  not(i_554, S);

  specify
    if((B == 1'b1) && (S == 1'b0)) (A => Z) = (0.1, 0.1);
    if((B == 1'b0) && (S == 1'b0)) (A => Z) = (0.1, 0.1);
    if((A == 1'b1) && (S == 1'b1)) (B => Z) = (0.1, 0.1);
    if((A == 1'b0) && (S == 1'b1)) (B => Z) = (0.1, 0.1);
    if((A == 1'b1) && (B == 1'b0)) (S => Z) = (0.1, 0.1);
    if((A == 1'b0) && (B == 1'b1)) (S => Z) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module MUX2_X2 (A, B, S, Z);

  input A;
  input B;
  input S;
  output Z;

  or(Z, i_558, i_559);
  and(i_558, S, B);
  and(i_559, A, i_560);
  not(i_560, S);

  specify
    if((B == 1'b1) && (S == 1'b0)) (A => Z) = (0.1, 0.1);
    if((B == 1'b0) && (S == 1'b0)) (A => Z) = (0.1, 0.1);
    if((A == 1'b1) && (S == 1'b1)) (B => Z) = (0.1, 0.1);
    if((A == 1'b0) && (S == 1'b1)) (B => Z) = (0.1, 0.1);
    if((A == 1'b1) && (B == 1'b0)) (S => Z) = (0.1, 0.1);
    if((A == 1'b0) && (B == 1'b1)) (S => Z) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module NAND2_X1 (A1, A2, ZN);

  input A1;
  input A2;
  output ZN;

  not(ZN, i_564);
  and(i_564, A1, A2);

  specify
    if((A2 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module NAND2_X2 (A1, A2, ZN);

  input A1;
  input A2;
  output ZN;

  not(ZN, i_566);
  and(i_566, A1, A2);

  specify
    if((A2 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module NAND2_X4 (A1, A2, ZN);

  input A1;
  input A2;
  output ZN;

  not(ZN, i_568);
  and(i_568, A1, A2);

  specify
    if((A2 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module NAND3_X1 (A1, A2, A3, ZN);

  input A1;
  input A2;
  input A3;
  output ZN;

  not(ZN, i_570);
  and(i_570, i_571, A3);
  and(i_571, A1, A2);

  specify
    if((A2 == 1'b1) && (A3 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A3 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1)) (A3 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module NAND3_X2 (A1, A2, A3, ZN);

  input A1;
  input A2;
  input A3;
  output ZN;

  not(ZN, i_574);
  and(i_574, i_575, A3);
  and(i_575, A1, A2);

  specify
    if((A2 == 1'b1) && (A3 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A3 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1)) (A3 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module NAND3_X4 (A1, A2, A3, ZN);

  input A1;
  input A2;
  input A3;
  output ZN;

  not(ZN, i_578);
  and(i_578, i_579, A3);
  and(i_579, A1, A2);

  specify
    if((A2 == 1'b1) && (A3 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A3 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1)) (A3 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module NAND4_X1 (A1, A2, A3, A4, ZN);

  input A1;
  input A2;
  input A3;
  input A4;
  output ZN;

  not(ZN, i_582);
  and(i_582, i_583, A4);
  and(i_583, i_584, A3);
  and(i_584, A1, A2);

  specify
    if((A2 == 1'b1) && (A3 == 1'b1) && (A4 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A3 == 1'b1) && (A4 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (A4 == 1'b1)) (A3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (A3 == 1'b1)) (A4 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module NAND4_X2 (A1, A2, A3, A4, ZN);

  input A1;
  input A2;
  input A3;
  input A4;
  output ZN;

  not(ZN, i_588);
  and(i_588, i_589, A4);
  and(i_589, i_590, A3);
  and(i_590, A1, A2);

  specify
    if((A2 == 1'b1) && (A3 == 1'b1) && (A4 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A3 == 1'b1) && (A4 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (A4 == 1'b1)) (A3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (A3 == 1'b1)) (A4 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module NAND4_X4 (A1, A2, A3, A4, ZN);

  input A1;
  input A2;
  input A3;
  input A4;
  output ZN;

  not(ZN, i_594);
  and(i_594, i_595, A4);
  and(i_595, i_596, A3);
  and(i_596, A1, A2);

  specify
    if((A2 == 1'b1) && (A3 == 1'b1) && (A4 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A3 == 1'b1) && (A4 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (A4 == 1'b1)) (A3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (A3 == 1'b1)) (A4 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module NOR2_X1 (A1, A2, ZN);

  input A1;
  input A2;
  output ZN;

  not(ZN, i_600);
  or(i_600, A1, A2);

  specify
    if((A2 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module NOR2_X2 (A1, A2, ZN);

  input A1;
  input A2;
  output ZN;

  not(ZN, i_602);
  or(i_602, A1, A2);

  specify
    if((A2 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module NOR2_X4 (A1, A2, ZN);

  input A1;
  input A2;
  output ZN;

  not(ZN, i_604);
  or(i_604, A1, A2);

  specify
    if((A2 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module NOR3_X1 (A1, A2, A3, ZN);

  input A1;
  input A2;
  input A3;
  output ZN;

  not(ZN, i_606);
  or(i_606, i_607, A3);
  or(i_607, A1, A2);

  specify
    if((A2 == 1'b0) && (A3 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A3 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0)) (A3 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module NOR3_X2 (A1, A2, A3, ZN);

  input A1;
  input A2;
  input A3;
  output ZN;

  not(ZN, i_610);
  or(i_610, i_611, A3);
  or(i_611, A1, A2);

  specify
    if((A2 == 1'b0) && (A3 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A3 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0)) (A3 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module NOR3_X4 (A1, A2, A3, ZN);

  input A1;
  input A2;
  input A3;
  output ZN;

  not(ZN, i_614);
  or(i_614, i_615, A3);
  or(i_615, A1, A2);

  specify
    if((A2 == 1'b0) && (A3 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A3 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0)) (A3 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module NOR4_X1 (A1, A2, A3, A4, ZN);

  input A1;
  input A2;
  input A3;
  input A4;
  output ZN;

  not(ZN, i_618);
  or(i_618, i_619, A4);
  or(i_619, i_620, A3);
  or(i_620, A1, A2);

  specify
    if((A2 == 1'b0) && (A3 == 1'b0) && (A4 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A3 == 1'b0) && (A4 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (A4 == 1'b0)) (A3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (A3 == 1'b0)) (A4 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module NOR4_X2 (A1, A2, A3, A4, ZN);

  input A1;
  input A2;
  input A3;
  input A4;
  output ZN;

  not(ZN, i_624);
  or(i_624, i_625, A4);
  or(i_625, i_626, A3);
  or(i_626, A1, A2);

  specify
    if((A2 == 1'b0) && (A3 == 1'b0) && (A4 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A3 == 1'b0) && (A4 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (A4 == 1'b0)) (A3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (A3 == 1'b0)) (A4 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module NOR4_X4 (A1, A2, A3, A4, ZN);

  input A1;
  input A2;
  input A3;
  input A4;
  output ZN;

  not(ZN, i_630);
  or(i_630, i_631, A4);
  or(i_631, i_632, A3);
  or(i_632, A1, A2);

  specify
    if((A2 == 1'b0) && (A3 == 1'b0) && (A4 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A3 == 1'b0) && (A4 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (A4 == 1'b0)) (A3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (A3 == 1'b0)) (A4 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module OAI211_X1 (A, B, C1, C2, ZN);

  input A;
  input B;
  input C1;
  input C2;
  output ZN;

  not(ZN, i_636);
  and(i_636, i_637, B);
  and(i_637, i_638, A);
  or(i_638, C1, C2);

  specify
    if((B == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((B == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0)) (A => ZN) = (0.1, 0.1);
    if((B == 1'b1) && (C1 == 1'b1) && (C2 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0)) (B => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (B => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (C1 == 1'b1) && (C2 == 1'b1)) (B => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B == 1'b1) && (C2 == 1'b0)) (C1 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B == 1'b1) && (C1 == 1'b0)) (C2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module OAI211_X2 (A, B, C1, C2, ZN);

  input A;
  input B;
  input C1;
  input C2;
  output ZN;

  not(ZN, i_642);
  and(i_642, i_643, B);
  and(i_643, i_644, A);
  or(i_644, C1, C2);

  specify
    if((B == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((B == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0)) (A => ZN) = (0.1, 0.1);
    if((B == 1'b1) && (C1 == 1'b1) && (C2 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0)) (B => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (B => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (C1 == 1'b1) && (C2 == 1'b1)) (B => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B == 1'b1) && (C2 == 1'b0)) (C1 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B == 1'b1) && (C1 == 1'b0)) (C2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module OAI211_X4 (A, B, C1, C2, ZN);

  input A;
  input B;
  input C1;
  input C2;
  output ZN;

  not(ZN, i_648);
  and(i_648, i_649, B);
  and(i_649, i_650, A);
  or(i_650, C1, C2);

  specify
    if((B == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((B == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0)) (A => ZN) = (0.1, 0.1);
    if((B == 1'b1) && (C1 == 1'b1) && (C2 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0)) (B => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (B => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (C1 == 1'b1) && (C2 == 1'b1)) (B => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B == 1'b1) && (C2 == 1'b0)) (C1 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B == 1'b1) && (C1 == 1'b0)) (C2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module OAI21_X1 (A, B1, B2, ZN);

  input A;
  input B1;
  input B2;
  output ZN;

  not(ZN, i_654);
  and(i_654, A, i_655);
  or(i_655, B1, B2);

  specify
    if((B1 == 1'b1) && (B2 == 1'b0)) (A => ZN) = (0.1, 0.1);
    if((B1 == 1'b0) && (B2 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((B1 == 1'b1) && (B2 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B2 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module OAI21_X2 (A, B1, B2, ZN);

  input A;
  input B1;
  input B2;
  output ZN;

  not(ZN, i_658);
  and(i_658, A, i_659);
  or(i_659, B1, B2);

  specify
    if((B1 == 1'b1) && (B2 == 1'b0)) (A => ZN) = (0.1, 0.1);
    if((B1 == 1'b0) && (B2 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((B1 == 1'b1) && (B2 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B2 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module OAI21_X4 (A, B1, B2, ZN);

  input A;
  input B1;
  input B2;
  output ZN;

  not(ZN, i_662);
  and(i_662, A, i_663);
  or(i_663, B1, B2);

  specify
    if((B1 == 1'b1) && (B2 == 1'b0)) (A => ZN) = (0.1, 0.1);
    if((B1 == 1'b0) && (B2 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((B1 == 1'b1) && (B2 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B2 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module OAI221_X1 (A, B1, B2, C1, C2, ZN);

  input A;
  input B1;
  input B2;
  input C1;
  input C2;
  output ZN;

  not(ZN, i_666);
  and(i_666, i_667, i_669);
  and(i_667, i_668, A);
  or(i_668, C1, C2);
  or(i_669, B1, B2);

  specify
    if((B1 == 1'b0) && (B2 == 1'b1) && (C2 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0) || (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((B1 == 1'b1) && (B2 == 1'b1) && (C2 == 1'b1) || (B1 == 1'b1) && (C1 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b1) && (B2 == 1'b1) && (C2 == 1'b0)) (C1 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C2 == 1'b0)) (C1 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C2 == 1'b0)) (C1 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0)) (C2 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b1) && (B2 == 1'b1) && (C1 == 1'b0)) (C2 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0)) (C2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module OAI221_X2 (A, B1, B2, C1, C2, ZN);

  input A;
  input B1;
  input B2;
  input C1;
  input C2;
  output ZN;

  not(ZN, i_674);
  and(i_674, i_675, i_677);
  and(i_675, i_676, A);
  or(i_676, C1, C2);
  or(i_677, B1, B2);

  specify
    if((B1 == 1'b0) && (B2 == 1'b1) && (C2 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0) || (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((B1 == 1'b1) && (B2 == 1'b1) && (C2 == 1'b1) || (B1 == 1'b1) && (C1 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b1) && (B2 == 1'b1) && (C2 == 1'b0)) (C1 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C2 == 1'b0)) (C1 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C2 == 1'b0)) (C1 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0)) (C2 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b1) && (B2 == 1'b1) && (C1 == 1'b0)) (C2 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0)) (C2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module OAI221_X4 (A, B1, B2, C1, C2, ZN);

  input A;
  input B1;
  input B2;
  input C1;
  input C2;
  output ZN;

  not(ZN, i_682);
  and(i_682, i_683, i_685);
  and(i_683, i_684, A);
  or(i_684, C1, C2);
  or(i_685, B1, B2);

  specify
    if((B1 == 1'b0) && (B2 == 1'b1) && (C2 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0) || (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((B1 == 1'b1) && (B2 == 1'b1) && (C2 == 1'b1) || (B1 == 1'b1) && (C1 == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b1) && (B2 == 1'b1) && (C2 == 1'b0)) (C1 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C2 == 1'b0)) (C1 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C2 == 1'b0)) (C1 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0)) (C2 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b1) && (B2 == 1'b1) && (C1 == 1'b0)) (C2 => ZN) = (0.1, 0.1);
    if((A == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0)) (C2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module OAI222_X1 (A1, A2, B1, B2, C1, C2, ZN);

  input A1;
  input A2;
  input B1;
  input B2;
  input C1;
  input C2;
  output ZN;

  not(ZN, i_690);
  and(i_690, i_691, i_694);
  and(i_691, i_692, i_693);
  or(i_692, A1, A2);
  or(i_693, B1, B2);
  or(i_694, C1, C2);

  specify
    if((A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b1) || (A2 == 1'b0) && (B1 == 1'b1) && (C1 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1) || (A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0) || (A1 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b1) && (C1 == 1'b1) || (A1 == 1'b0) && (B1 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b1) || (A1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1) || (A1 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b1) || (A1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1) || (A2 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B1 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1) || (A2 == 1'b1) && (B1 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (B1 == 1'b0) && (C1 == 1'b1) || (A1 == 1'b1) && (B1 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b1) || (A2 == 1'b1) && (B1 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (B1 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0) || (A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B1 == 1'b1) && (C2 == 1'b0)) (C1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C2 == 1'b0) || (A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b1) && (C2 == 1'b0)) (C1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C2 == 1'b0) || (A1 == 1'b1) && (A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C2 == 1'b0)) (C1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C2 == 1'b0)) (C1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0)) (C2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B1 == 1'b1) && (C1 == 1'b0)) (C2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) || (A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b1) && (C1 == 1'b0)) (C2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) || (A1 == 1'b1) && (A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0)) (C2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module OAI222_X2 (A1, A2, B1, B2, C1, C2, ZN);

  input A1;
  input A2;
  input B1;
  input B2;
  input C1;
  input C2;
  output ZN;

  not(ZN, i_700);
  and(i_700, i_701, i_704);
  and(i_701, i_702, i_703);
  or(i_702, A1, A2);
  or(i_703, B1, B2);
  or(i_704, C1, C2);

  specify
    if((A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0) || (A2 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B1 == 1'b1) && (C1 == 1'b1) || (A2 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b1) && (C2 == 1'b1) || (A2 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0) || (A1 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1) || (A1 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b1) && (C1 == 1'b1) || (A1 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b1) && (C2 == 1'b1) || (A1 == 1'b0) && (B1 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b1) || (A1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b1) || (A1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1) || (A2 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B1 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1) || (A2 == 1'b1) && (B1 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A2 == 1'b1) && (B1 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b1) || (A1 == 1'b1) && (B1 == 1'b0) && (C1 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B1 == 1'b1) && (C2 == 1'b0)) (C1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C2 == 1'b0) || (A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b1) && (C2 == 1'b0)) (C1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C2 == 1'b0) || (A1 == 1'b1) && (A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C2 == 1'b0)) (C1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C2 == 1'b0)) (C1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0)) (C2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B1 == 1'b1) && (C1 == 1'b0)) (C2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) || (A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b1) && (C1 == 1'b0)) (C2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) || (A1 == 1'b1) && (A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0)) (C2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module OAI222_X4 (A1, A2, B1, B2, C1, C2, ZN);

  input A1;
  input A2;
  input B1;
  input B2;
  input C1;
  input C2;
  output ZN;

  not(ZN, i_710);
  and(i_710, i_711, i_714);
  and(i_711, i_712, i_713);
  or(i_712, A1, A2);
  or(i_713, B1, B2);
  or(i_714, C1, C2);

  specify
    if((A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0) || (A2 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B1 == 1'b1) && (C1 == 1'b1) || (A2 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b1) && (C2 == 1'b1) || (A2 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b0) || (A1 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1) || (A1 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) && (C2 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b1) && (C1 == 1'b1) || (A1 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b1) && (C2 == 1'b1) || (A1 == 1'b0) && (B1 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b1) || (A1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b1) && (C2 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0) || (A1 == 1'b1) && (A2 == 1'b0) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b1)) (B1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b1) && (B1 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
    if((A2 == 1'b1) && (B1 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b1) || (A1 == 1'b1) && (B1 == 1'b0) && (C1 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b0) && (C1 == 1'b1) && (C2 == 1'b0) || (A1 == 1'b1) && (A2 == 1'b0) && (B1 == 1'b0) && (C1 == 1'b0) && (C2 == 1'b1)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B1 == 1'b1) && (C2 == 1'b0)) (C1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C2 == 1'b0) || (A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b1) && (C2 == 1'b0)) (C1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C2 == 1'b0) || (A1 == 1'b1) && (A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C2 == 1'b0)) (C1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C2 == 1'b0)) (C1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0)) (C2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B1 == 1'b1) && (C1 == 1'b0)) (C2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0) || (A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b1) && (C1 == 1'b0)) (C2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b1) && (B2 == 1'b0) && (C1 == 1'b0) || (A1 == 1'b1) && (A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (C1 == 1'b0)) (C2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module OAI22_X1 (A1, A2, B1, B2, ZN);

  input A1;
  input A2;
  input B1;
  input B2;
  output ZN;

  not(ZN, i_720);
  and(i_720, i_721, i_722);
  or(i_721, A1, A2);
  or(i_722, B1, B2);

  specify
    if((A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B2 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (B2 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (B2 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (B1 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (B1 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module OAI22_X2 (A1, A2, B1, B2, ZN);

  input A1;
  input A2;
  input B1;
  input B2;
  output ZN;

  not(ZN, i_726);
  and(i_726, i_727, i_728);
  or(i_727, A1, A2);
  or(i_728, B1, B2);

  specify
    if((A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B2 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (B2 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (B2 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (B1 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (B1 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module OAI22_X4 (A1, A2, B1, B2, ZN);

  input A1;
  input A2;
  input B1;
  input B2;
  output ZN;

  not(ZN, i_732);
  and(i_732, i_733, i_734);
  or(i_733, A1, A2);
  or(i_734, B1, B2);

  specify
    if((A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B2 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (B2 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (B2 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b0) && (B1 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (A2 == 1'b1) && (B1 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (B1 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module OAI33_X1 (A1, A2, A3, B1, B2, B3, ZN);

  input A1;
  input A2;
  input A3;
  input B1;
  input B2;
  input B3;
  output ZN;

  not(ZN, i_738);
  and(i_738, i_739, i_741);
  or(i_739, i_740, A3);
  or(i_740, A1, A2);
  or(i_741, i_742, B3);
  or(i_742, B1, B2);

  specify
    if((A2 == 1'b0) && (A3 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (B3 == 1'b0) || (A2 == 1'b0) && (A3 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b0) && (B3 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (A3 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (B3 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A2 == 1'b0) && (A3 == 1'b0) && (B1 == 1'b1)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A3 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (B3 == 1'b0) || (A1 == 1'b0) && (A3 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b0) && (B3 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A3 == 1'b0) && (B1 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A3 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (B3 == 1'b1)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (B3 == 1'b1)) (A3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b1) || (A1 == 1'b0) && (A2 == 1'b0) && (B1 == 1'b1) && (B3 == 1'b1)) (A3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (B1 == 1'b1) && (B2 == 1'b0) && (B3 == 1'b0)) (A3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b1) && (B3 == 1'b0) || (A1 == 1'b0) && (A2 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b0) && (B3 == 1'b1)) (A3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (A3 == 1'b0) && (B2 == 1'b0) && (B3 == 1'b0) || (A1 == 1'b0) && (A2 == 1'b0) && (A3 == 1'b1) && (B2 == 1'b0) && (B3 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (A3 == 1'b1) && (B2 == 1'b0) && (B3 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B2 == 1'b0) && (B3 == 1'b0)) (B1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (A3 == 1'b1) && (B1 == 1'b0) && (B3 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B1 == 1'b0) && (B3 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (A3 == 1'b0) && (B1 == 1'b0) && (B3 == 1'b0) || (A1 == 1'b0) && (A2 == 1'b0) && (A3 == 1'b1) && (B1 == 1'b0) && (B3 == 1'b0)) (B2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0)) (B3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (A3 == 1'b0) && (B1 == 1'b0) && (B2 == 1'b0) || (A1 == 1'b0) && (A2 == 1'b0) && (A3 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0)) (B3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b1) && (A3 == 1'b1) && (B1 == 1'b0) && (B2 == 1'b0)) (B3 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module OR2_X1 (A1, A2, ZN);

  input A1;
  input A2;
  output ZN;

  or(ZN, A1, A2);

  specify
    if((A2 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module OR2_X2 (A1, A2, ZN);

  input A1;
  input A2;
  output ZN;

  or(ZN, A1, A2);

  specify
    if((A2 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module OR2_X4 (A1, A2, ZN);

  input A1;
  input A2;
  output ZN;

  or(ZN, A1, A2);

  specify
    if((A2 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module OR3_X1 (A1, A2, A3, ZN);

  input A1;
  input A2;
  input A3;
  output ZN;

  or(ZN, i_748, A3);
  or(i_748, A1, A2);

  specify
    if((A2 == 1'b0) && (A3 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A3 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0)) (A3 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module OR3_X2 (A1, A2, A3, ZN);

  input A1;
  input A2;
  input A3;
  output ZN;

  or(ZN, i_750, A3);
  or(i_750, A1, A2);

  specify
    if((A2 == 1'b0) && (A3 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A3 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0)) (A3 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module OR3_X4 (A1, A2, A3, ZN);

  input A1;
  input A2;
  input A3;
  output ZN;

  or(ZN, i_752, A3);
  or(i_752, A1, A2);

  specify
    if((A2 == 1'b0) && (A3 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A3 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0)) (A3 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module OR4_X1 (A1, A2, A3, A4, ZN);

  input A1;
  input A2;
  input A3;
  input A4;
  output ZN;

  or(ZN, i_754, A4);
  or(i_754, i_755, A3);
  or(i_755, A1, A2);

  specify
    if((A2 == 1'b0) && (A3 == 1'b0) && (A4 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A3 == 1'b0) && (A4 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (A4 == 1'b0)) (A3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (A3 == 1'b0)) (A4 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module OR4_X2 (A1, A2, A3, A4, ZN);

  input A1;
  input A2;
  input A3;
  input A4;
  output ZN;

  or(ZN, i_758, A4);
  or(i_758, i_759, A3);
  or(i_759, A1, A2);

  specify
    if((A2 == 1'b0) && (A3 == 1'b0) && (A4 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A3 == 1'b0) && (A4 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (A4 == 1'b0)) (A3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (A3 == 1'b0)) (A4 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module OR4_X4 (A1, A2, A3, A4, ZN);

  input A1;
  input A2;
  input A3;
  input A4;
  output ZN;

  or(ZN, i_762, A4);
  or(i_762, i_763, A3);
  or(i_763, A1, A2);

  specify
    if((A2 == 1'b0) && (A3 == 1'b0) && (A4 == 1'b0)) (A1 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A3 == 1'b0) && (A4 == 1'b0)) (A2 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (A4 == 1'b0)) (A3 => ZN) = (0.1, 0.1);
    if((A1 == 1'b0) && (A2 == 1'b0) && (A3 == 1'b0)) (A4 => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module SDFFRS_X1 (CK, D, RN, SE, SI, SN, Q, QN);

  input CK;
  input D;
  input RN;
  input SE;
  input SI;
  input SN;
  output Q;
  output QN;
  reg NOTIFIER;

  seq49(IQ, SN, RN, nextstate, CK, NOTIFIER);
  and(IQN, i_766, i_767);
  not(i_766, IQ);
  not(i_767, i_768);
  and(i_768, i_769, i_770);
  not(i_769, SN);
  not(i_770, RN);
  buf(Q, IQ);
  buf(QN, IQN);
  or(nextstate, i_771, i_772);
  and(i_771, SE, SI);
  and(i_772, D, i_773);
  not(i_773, SE);


  specify
    if((RN == 1'b1) && (SE == 1'b0) && (SI == 1'b1) && (SN == 1'b1)) (posedge CK => (Q +: D)) = (0.1, 0.1);
    if((CK == 1'b1) && (SN == 1'b0)) (RN => Q) = (0.1, 0.1);
    if((CK == 1'b0) && (SN == 1'b0)) (RN => Q) = (0.1, 0.1);
    if((CK == 1'b1) && (SN == 1'b1)) (negedge RN => (Q +: 1'b0)) = (0.1, 0.1);
    if((CK == 1'b0) && (SN == 1'b1)) (negedge RN => (Q +: 1'b0)) = (0.1, 0.1);
    if((CK == 1'b1) && (RN == 1'b1)) (negedge SN => (Q +: 1'b1)) = (0.1, 0.1);
    if((CK == 1'b0) && (RN == 1'b1)) (negedge SN => (Q +: 1'b1)) = (0.1, 0.1);
    if((RN == 1'b1) && (SE == 1'b0) && (SI == 1'b1) && (SN == 1'b1)) (posedge CK => (QN -: D)) = (0.1, 0.1);
    if((CK == 1'b1) && (SN == 1'b1)) (negedge RN => (QN +: 1'b1)) = (0.1, 0.1);
    if((CK == 1'b0) && (SN == 1'b1)) (negedge RN => (QN +: 1'b1)) = (0.1, 0.1);
    if((CK == 1'b1) && (RN == 1'b1)) (negedge SN => (QN +: 1'b0)) = (0.1, 0.1);
    if((CK == 1'b1) && (RN == 1'b0)) (SN => QN) = (0.1, 0.1);
    if((CK == 1'b0) && (RN == 1'b0)) (SN => QN) = (0.1, 0.1);
    if((CK == 1'b0) && (RN == 1'b1)) (negedge SN => (QN +: 1'b0)) = (0.1, 0.1);

    $width(negedge CK, 0.1, 0, NOTIFIER);
    $width(posedge CK, 0.1, 0, NOTIFIER);
    $setup(negedge D, posedge CK, 0.1, NOTIFIER);
    $setup(posedge D, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge D, 0.1, NOTIFIER);
    $hold(posedge CK, posedge D, 0.1, NOTIFIER);
    $recovery(posedge RN, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge RN, 0.1, NOTIFIER);
    $width(negedge RN, 0.1, 0, NOTIFIER);
    $setup(negedge SE, posedge CK, 0.1, NOTIFIER);
    $setup(posedge SE, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge SE, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SE, 0.1, NOTIFIER);
    $setup(negedge SI, posedge CK, 0.1, NOTIFIER);
    $setup(posedge SI, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge SI, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SI, 0.1, NOTIFIER);
    $recovery(posedge SN, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SN, 0.1, NOTIFIER);
    $width(negedge SN, 0.1, 0, NOTIFIER);
  endspecify

endmodule
`endcelldefine



`celldefine
module SDFFRS_X2 (CK, D, RN, SE, SI, SN, Q, QN);

  input CK;
  input D;
  input RN;
  input SE;
  input SI;
  input SN;
  output Q;
  output QN;
  reg NOTIFIER;

  seq50(IQ, SN, RN, nextstate, CK, NOTIFIER);
  and(IQN, i_777, i_778);
  not(i_777, IQ);
  not(i_778, i_779);
  and(i_779, i_780, i_781);
  not(i_780, SN);
  not(i_781, RN);
  buf(Q, IQ);
  buf(QN, IQN);
  or(nextstate, i_782, i_783);
  and(i_782, SE, SI);
  and(i_783, D, i_784);
  not(i_784, SE);


  specify
    if((RN == 1'b1) && (SE == 1'b0) && (SI == 1'b1) && (SN == 1'b1)) (posedge CK => (Q +: D)) = (0.1, 0.1);
    if((CK == 1'b1) && (SN == 1'b0)) (RN => Q) = (0.1, 0.1);
    if((CK == 1'b0) && (SN == 1'b0)) (RN => Q) = (0.1, 0.1);
    if((CK == 1'b1) && (SN == 1'b1)) (negedge RN => (Q +: 1'b0)) = (0.1, 0.1);
    if((CK == 1'b0) && (SN == 1'b1)) (negedge RN => (Q +: 1'b0)) = (0.1, 0.1);
    if((CK == 1'b1) && (RN == 1'b1)) (negedge SN => (Q +: 1'b1)) = (0.1, 0.1);
    if((CK == 1'b0) && (RN == 1'b1)) (negedge SN => (Q +: 1'b1)) = (0.1, 0.1);
    if((RN == 1'b1) && (SE == 1'b0) && (SI == 1'b1) && (SN == 1'b1)) (posedge CK => (QN -: D)) = (0.1, 0.1);
    if((CK == 1'b1) && (SN == 1'b1)) (negedge RN => (QN +: 1'b1)) = (0.1, 0.1);
    if((CK == 1'b0) && (SN == 1'b1)) (negedge RN => (QN +: 1'b1)) = (0.1, 0.1);
    if((CK == 1'b1) && (RN == 1'b1)) (negedge SN => (QN +: 1'b0)) = (0.1, 0.1);
    if((CK == 1'b1) && (RN == 1'b0)) (SN => QN) = (0.1, 0.1);
    if((CK == 1'b0) && (RN == 1'b0)) (SN => QN) = (0.1, 0.1);
    if((CK == 1'b0) && (RN == 1'b1)) (negedge SN => (QN +: 1'b0)) = (0.1, 0.1);

    $width(negedge CK, 0.1, 0, NOTIFIER);
    $width(posedge CK, 0.1, 0, NOTIFIER);
    $setup(negedge D, posedge CK, 0.1, NOTIFIER);
    $setup(posedge D, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge D, 0.1, NOTIFIER);
    $hold(posedge CK, posedge D, 0.1, NOTIFIER);
    $recovery(posedge RN, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge RN, 0.1, NOTIFIER);
    $width(negedge RN, 0.1, 0, NOTIFIER);
    $setup(negedge SE, posedge CK, 0.1, NOTIFIER);
    $setup(posedge SE, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge SE, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SE, 0.1, NOTIFIER);
    $setup(negedge SI, posedge CK, 0.1, NOTIFIER);
    $setup(posedge SI, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge SI, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SI, 0.1, NOTIFIER);
    $recovery(posedge SN, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SN, 0.1, NOTIFIER);
    $width(negedge SN, 0.1, 0, NOTIFIER);
  endspecify

endmodule
`endcelldefine



`celldefine
module SDFFR_X1 (CK, D, RN, SE, SI, Q, QN);

  input CK;
  input D;
  input RN;
  input SE;
  input SI;
  output Q;
  output QN;
  reg NOTIFIER;

  seq51(IQ, RN, nextstate, CK, NOTIFIER);
  not(IQN, IQ);
  buf(Q, IQ);
  buf(QN, IQN);
  or(nextstate, i_788, i_789);
  and(i_788, SE, SI);
  and(i_789, D, i_790);
  not(i_790, SE);


  specify
    if((RN == 1'b1) && (SE == 1'b0) && (SI == 1'b1)) (posedge CK => (Q +: D)) = (0.1, 0.1);
    if((CK == 1'b1)) (negedge RN => (Q +: 1'b0)) = (0.1, 0.1);
    if((CK == 1'b0)) (negedge RN => (Q +: 1'b0)) = (0.1, 0.1);
    if((RN == 1'b1) && (SE == 1'b0) && (SI == 1'b1)) (posedge CK => (QN -: D)) = (0.1, 0.1);
    if((CK == 1'b1)) (negedge RN => (QN +: 1'b1)) = (0.1, 0.1);
    if((CK == 1'b0)) (negedge RN => (QN +: 1'b1)) = (0.1, 0.1);

    $width(negedge CK, 0.1, 0, NOTIFIER);
    $width(posedge CK, 0.1, 0, NOTIFIER);
    $setup(negedge D, posedge CK, 0.1, NOTIFIER);
    $setup(posedge D, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge D, 0.1, NOTIFIER);
    $hold(posedge CK, posedge D, 0.1, NOTIFIER);
    $recovery(posedge RN, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge RN, 0.1, NOTIFIER);
    $width(negedge RN, 0.1, 0, NOTIFIER);
    $setup(negedge SE, posedge CK, 0.1, NOTIFIER);
    $setup(posedge SE, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge SE, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SE, 0.1, NOTIFIER);
    $setup(negedge SI, posedge CK, 0.1, NOTIFIER);
    $setup(posedge SI, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge SI, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SI, 0.1, NOTIFIER);
  endspecify

endmodule
`endcelldefine



`celldefine
module SDFFR_X2 (CK, D, RN, SE, SI, Q, QN);

  input CK;
  input D;
  input RN;
  input SE;
  input SI;
  output Q;
  output QN;
  reg NOTIFIER;

  seq52(IQ, RN, nextstate, CK, NOTIFIER);
  not(IQN, IQ);
  buf(Q, IQ);
  buf(QN, IQN);
  or(nextstate, i_794, i_795);
  and(i_794, SE, SI);
  and(i_795, D, i_796);
  not(i_796, SE);


  specify
    if((RN == 1'b1) && (SE == 1'b0) && (SI == 1'b1)) (posedge CK => (Q +: D)) = (0.1, 0.1);
    if((CK == 1'b1)) (negedge RN => (Q +: 1'b0)) = (0.1, 0.1);
    if((CK == 1'b0)) (negedge RN => (Q +: 1'b0)) = (0.1, 0.1);
    if((RN == 1'b1) && (SE == 1'b0) && (SI == 1'b1)) (posedge CK => (QN -: D)) = (0.1, 0.1);
    if((CK == 1'b1)) (negedge RN => (QN +: 1'b1)) = (0.1, 0.1);
    if((CK == 1'b0)) (negedge RN => (QN +: 1'b1)) = (0.1, 0.1);

    $width(negedge CK, 0.1, 0, NOTIFIER);
    $width(posedge CK, 0.1, 0, NOTIFIER);
    $setup(negedge D, posedge CK, 0.1, NOTIFIER);
    $setup(posedge D, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge D, 0.1, NOTIFIER);
    $hold(posedge CK, posedge D, 0.1, NOTIFIER);
    $recovery(posedge RN, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge RN, 0.1, NOTIFIER);
    $width(negedge RN, 0.1, 0, NOTIFIER);
    $setup(negedge SE, posedge CK, 0.1, NOTIFIER);
    $setup(posedge SE, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge SE, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SE, 0.1, NOTIFIER);
    $setup(negedge SI, posedge CK, 0.1, NOTIFIER);
    $setup(posedge SI, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge SI, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SI, 0.1, NOTIFIER);
  endspecify

endmodule
`endcelldefine



`celldefine
module SDFFS_X1 (CK, D, SE, SI, SN, Q, QN);

  input CK;
  input D;
  input SE;
  input SI;
  input SN;
  output Q;
  output QN;
  reg NOTIFIER;

  seq53(IQ, SN, nextstate, CK, NOTIFIER);
  not(IQN, IQ);
  buf(Q, IQ);
  buf(QN, IQN);
  or(nextstate, i_800, i_801);
  and(i_800, SE, SI);
  and(i_801, D, i_802);
  not(i_802, SE);


  specify
    if((SE == 1'b0) && (SI == 1'b1) && (SN == 1'b1)) (posedge CK => (Q +: D)) = (0.1, 0.1);
    if((CK == 1'b1)) (negedge SN => (Q +: 1'b1)) = (0.1, 0.1);
    if((CK == 1'b0)) (negedge SN => (Q +: 1'b1)) = (0.1, 0.1);
    if((SE == 1'b0) && (SI == 1'b1) && (SN == 1'b1)) (posedge CK => (QN -: D)) = (0.1, 0.1);
    if((CK == 1'b1)) (negedge SN => (QN +: 1'b0)) = (0.1, 0.1);
    if((CK == 1'b0)) (negedge SN => (QN +: 1'b0)) = (0.1, 0.1);

    $width(negedge CK, 0.1, 0, NOTIFIER);
    $width(posedge CK, 0.1, 0, NOTIFIER);
    $setup(negedge D, posedge CK, 0.1, NOTIFIER);
    $setup(posedge D, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge D, 0.1, NOTIFIER);
    $hold(posedge CK, posedge D, 0.1, NOTIFIER);
    $setup(negedge SE, posedge CK, 0.1, NOTIFIER);
    $setup(posedge SE, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge SE, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SE, 0.1, NOTIFIER);
    $setup(negedge SI, posedge CK, 0.1, NOTIFIER);
    $setup(posedge SI, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge SI, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SI, 0.1, NOTIFIER);
    $recovery(posedge SN, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SN, 0.1, NOTIFIER);
    $width(negedge SN, 0.1, 0, NOTIFIER);
  endspecify

endmodule
`endcelldefine



`celldefine
module SDFFS_X2 (CK, D, SE, SI, SN, Q, QN);

  input CK;
  input D;
  input SE;
  input SI;
  input SN;
  output Q;
  output QN;
  reg NOTIFIER;

  seq54(IQ, SN, nextstate, CK, NOTIFIER);
  not(IQN, IQ);
  buf(Q, IQ);
  buf(QN, IQN);
  or(nextstate, i_806, i_807);
  and(i_806, SE, SI);
  and(i_807, D, i_808);
  not(i_808, SE);


  specify
    if((SE == 1'b0) && (SI == 1'b1) && (SN == 1'b1)) (posedge CK => (Q +: D)) = (0.1, 0.1);
    if((CK == 1'b1)) (negedge SN => (Q +: 1'b1)) = (0.1, 0.1);
    if((CK == 1'b0)) (negedge SN => (Q +: 1'b1)) = (0.1, 0.1);
    if((SE == 1'b0) && (SI == 1'b1) && (SN == 1'b1)) (posedge CK => (QN -: D)) = (0.1, 0.1);
    if((CK == 1'b1)) (negedge SN => (QN +: 1'b0)) = (0.1, 0.1);
    if((CK == 1'b0)) (negedge SN => (QN +: 1'b0)) = (0.1, 0.1);

    $width(negedge CK, 0.1, 0, NOTIFIER);
    $width(posedge CK, 0.1, 0, NOTIFIER);
    $setup(negedge D, posedge CK, 0.1, NOTIFIER);
    $setup(posedge D, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge D, 0.1, NOTIFIER);
    $hold(posedge CK, posedge D, 0.1, NOTIFIER);
    $setup(negedge SE, posedge CK, 0.1, NOTIFIER);
    $setup(posedge SE, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge SE, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SE, 0.1, NOTIFIER);
    $setup(negedge SI, posedge CK, 0.1, NOTIFIER);
    $setup(posedge SI, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge SI, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SI, 0.1, NOTIFIER);
    $recovery(posedge SN, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SN, 0.1, NOTIFIER);
    $width(negedge SN, 0.1, 0, NOTIFIER);
  endspecify

endmodule
`endcelldefine



`celldefine
module SDFF_X1 (CK, D, SE, SI, Q, QN);

  input CK;
  input D;
  input SE;
  input SI;
  output Q;
  output QN;
  reg NOTIFIER;

  seq55(IQ, nextstate, CK, NOTIFIER);
  not(IQN, IQ);
  buf(Q, IQ);
  buf(QN, IQN);
  or(nextstate, i_812, i_813);
  and(i_812, SE, SI);
  and(i_813, D, i_814);
  not(i_814, SE);


  specify
    if((SE == 1'b0) && (SI == 1'b1)) (posedge CK => (Q +: D)) = (0.1, 0.1);
    if((SE == 1'b0) && (SI == 1'b1)) (posedge CK => (QN -: D)) = (0.1, 0.1);

    $width(negedge CK, 0.1, 0, NOTIFIER);
    $width(posedge CK, 0.1, 0, NOTIFIER);
    $setup(negedge D, posedge CK, 0.1, NOTIFIER);
    $setup(posedge D, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge D, 0.1, NOTIFIER);
    $hold(posedge CK, posedge D, 0.1, NOTIFIER);
    $setup(negedge SE, posedge CK, 0.1, NOTIFIER);
    $setup(posedge SE, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge SE, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SE, 0.1, NOTIFIER);
    $setup(negedge SI, posedge CK, 0.1, NOTIFIER);
    $setup(posedge SI, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge SI, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SI, 0.1, NOTIFIER);
  endspecify

endmodule
`endcelldefine



`celldefine
module SDFF_X2 (CK, D, SE, SI, Q, QN);

  input CK;
  input D;
  input SE;
  input SI;
  output Q;
  output QN;
  reg NOTIFIER;

  seq56(IQ, nextstate, CK, NOTIFIER);
  not(IQN, IQ);
  buf(Q, IQ);
  buf(QN, IQN);
  or(nextstate, i_818, i_819);
  and(i_818, SE, SI);
  and(i_819, D, i_820);
  not(i_820, SE);


  specify
    if((SE == 1'b0) && (SI == 1'b1)) (posedge CK => (Q +: D)) = (0.1, 0.1);
    if((SE == 1'b0) && (SI == 1'b1)) (posedge CK => (QN -: D)) = (0.1, 0.1);

    $width(negedge CK, 0.1, 0, NOTIFIER);
    $width(posedge CK, 0.1, 0, NOTIFIER);
    $setup(negedge D, posedge CK, 0.1, NOTIFIER);
    $setup(posedge D, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge D, 0.1, NOTIFIER);
    $hold(posedge CK, posedge D, 0.1, NOTIFIER);
    $setup(negedge SE, posedge CK, 0.1, NOTIFIER);
    $setup(posedge SE, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge SE, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SE, 0.1, NOTIFIER);
    $setup(negedge SI, posedge CK, 0.1, NOTIFIER);
    $setup(posedge SI, posedge CK, 0.1, NOTIFIER);
    $hold(posedge CK, negedge SI, 0.1, NOTIFIER);
    $hold(posedge CK, posedge SI, 0.1, NOTIFIER);
  endspecify

endmodule
`endcelldefine



`celldefine
module TBUF_X1 (A, EN, Z);

  input A;
  input EN;
  output Z;

  bufif0(Z, Z_in, Z_enable);
  buf(Z_enable, EN);
  buf(Z_in, A);

  specify
    if((EN == 1'b0)) (A => Z) = (0.1, 0.1);
    (EN => Z) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module TBUF_X16 (A, EN, Z);

  input A;
  input EN;
  output Z;

  bufif0(Z, Z_in, Z_enable);
  buf(Z_enable, EN);
  buf(Z_in, A);

  specify
    if((EN == 1'b0)) (A => Z) = (0.1, 0.1);
    (EN => Z) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module TBUF_X2 (A, EN, Z);

  input A;
  input EN;
  output Z;

  bufif0(Z, Z_in, Z_enable);
  buf(Z_enable, EN);
  buf(Z_in, A);

  specify
    if((EN == 1'b0)) (A => Z) = (0.1, 0.1);
    (EN => Z) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module TBUF_X4 (A, EN, Z);

  input A;
  input EN;
  output Z;

  bufif0(Z, Z_in, Z_enable);
  buf(Z_enable, EN);
  buf(Z_in, A);

  specify
    if((EN == 1'b0)) (A => Z) = (0.1, 0.1);
    (EN => Z) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module TBUF_X8 (A, EN, Z);

  input A;
  input EN;
  output Z;

  bufif0(Z, Z_in, Z_enable);
  buf(Z_enable, EN);
  buf(Z_in, A);

  specify
    if((EN == 1'b0)) (A => Z) = (0.1, 0.1);
    (EN => Z) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module TINV_X1 (EN, I, ZN);

  input EN;
  input I;
  output ZN;

  bufif0(ZN, ZN_in, ZN_enable);
  buf(ZN_enable, EN);
  not(ZN_in, I);

  specify
    (EN => ZN) = (0.1, 0.1);
    if((EN == 1'b0)) (I => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module TLAT_X1 (D, G, OE, Q);

  input D;
  input G;
  input OE;
  output Q;
  reg NOTIFIER;

  bufif0(Q, Q_in, Q_enable);
  not(Q_enable, OE);
  seq57(IQ, nextstate, G, NOTIFIER);
  not(IQN, IQ);
  buf(Q_in, IQ);
  buf(nextstate, D);


  specify
    if((G == 1'b1) && (OE == 1'b1)) (D => Q) = (0.1, 0.1);
    if((OE == 1'b1)) (posedge G => (Q +: D)) = (0.1, 0.1);
    (OE => Q) = (0.1, 0.1);

    $setup(negedge D, negedge G, 0.1, NOTIFIER);
    $setup(posedge D, negedge G, 0.1, NOTIFIER);
    $hold(negedge G, negedge D, 0.1, NOTIFIER);
    $hold(negedge G, posedge D, 0.1, NOTIFIER);
    $width(posedge G, 0.1, 0, NOTIFIER);
  endspecify

endmodule
`endcelldefine



`celldefine
module XNOR2_X1 (A, B, ZN);

  input A;
  input B;
  output ZN;

  not(ZN, i_824);
  xor(i_824, A, B);

  specify
    if((B == 1'b0)) (A => ZN) = (0.1, 0.1);
    if((B == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((A == 1'b1)) (B => ZN) = (0.1, 0.1);
    if((A == 1'b0)) (B => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module XNOR2_X2 (A, B, ZN);

  input A;
  input B;
  output ZN;

  not(ZN, i_826);
  xor(i_826, A, B);

  specify
    if((B == 1'b0)) (A => ZN) = (0.1, 0.1);
    if((B == 1'b1)) (A => ZN) = (0.1, 0.1);
    if((A == 1'b1)) (B => ZN) = (0.1, 0.1);
    if((A == 1'b0)) (B => ZN) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module XOR2_X1 (A, B, Z);

  input A;
  input B;
  output Z;

  xor(Z, A, B);

  specify
    if((B == 1'b0)) (A => Z) = (0.1, 0.1);
    if((B == 1'b1)) (A => Z) = (0.1, 0.1);
    if((A == 1'b1)) (B => Z) = (0.1, 0.1);
    if((A == 1'b0)) (B => Z) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine



`celldefine
module XOR2_X2 (A, B, Z);

  input A;
  input B;
  output Z;

  xor(Z, A, B);

  specify
    if((B == 1'b0)) (A => Z) = (0.1, 0.1);
    if((B == 1'b1)) (A => Z) = (0.1, 0.1);
    if((A == 1'b1)) (B => Z) = (0.1, 0.1);
    if((A == 1'b0)) (B => Z) = (0.1, 0.1);
  endspecify

endmodule
`endcelldefine


//
// End of file
//
