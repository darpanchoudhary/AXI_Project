module axiTest
( input var logic i_clk
, input var logic i_rst
, input var logic i_arst
);

  AXI4SLAVE
  #(.AWIDTH    (12     )
  , .DWIDTH    (32     )
  ) u_axiSlave
  ( .i_aClk    (aClk   )
  , .i_aResetn (aResetn)
  // Read Address Channel (Master -> Slave)
  , .i_arValid (arValid)
  , .o_arReady (arReady)
  , .i_arAddr  (arAddr )
  , .i_arProt  (arProt )
  // Read Data Channel (Slave -> Master)
  , .o_rValid  (rValid )
  , .i_rReady  (rReady )
  , .o_rData   (rData  )
  , .o_rResp   (rResp  )
  // Write Address Channel (Master -> Slave)
  , .i_awValid (awValid)
  , .o_awReady (awReady)
  , .i_awAddr  (awAddr )
  , .i_awProt  (awProt )
  // Write Data Channel (Master -> Slave)
  , .i_wValid  (wValid )
  , .o_wReady  (wReady )
  , .i_wData   (wData  )
  , .i_wStrb   (wStrb  )
  // Write Response Channel (Slave -> Master)
  , .o_bValid  (bValid )
  , .i_bReady  (bReady )
  , .o_bResp   (bResp  )
   );

  generateClock u_generateClock
  ( .o_clk           (aClk ) // Generated clock for testbench
  , .i_rootClk       (i_clk) // V_erilator clock input
  , .i_periodHi      (0    ) // Number of rootClk cycles-1 to stay high
  , .i_periodLo      (0    ) // Number of rootClk cycles-1 to stay low
  , .i_jitterControl (0    ) // Random jitter control (0: none --> higher number: more jitter)
  );

  AXI4DRIVER
  #(.AWIDTH    (12     )
  , .DWIDTH    (32     )
  ) u_axiDriver
  ( .i_aClk    (aClk   )
  , .i_aResetn (aResetn)
  // Read Address Channel (Master -> Slave)
  , .o_arValid (arValid)
  , .i_arReady (arReady)
  , .o_arAddr  (arAddr )
  , .o_arProt  (arProt )
  // Read Data Channel (Slave -> Master)
  , .i_rValid  (rValid )
  , .o_rReady  (rReady )
  , .i_rData   (rData  )
  , .i_rResp   (rResp  )
  // Write Address Channel (Master -> Slave)
  , .o_awValid (awValid)
  , .i_awReady (awReady)
  , .o_awAddr  (awAddr )
  , .o_awProt  (awProt )
  // Write Data Channel (Master -> Slave)
  , .o_wValid  (wValid )
  , .i_wReady  (wReady )
  , .o_wData   (wData  )
  , .o_wStrb   (wStrb  )
  // Write Response Channel (Slave -> Master)
  , .i_bValid  (bValid )
  , .o_bReady  (bReady )
  , .i_bResp   (bResp  )
  );

  endmodule

`resetall
