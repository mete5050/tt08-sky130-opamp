/*
 * Copyright (c) 2024 MeteEKER
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

// DİKKAT: Modül ismi info.yaml'daki 'top_module' ile AYNI OLMALI
module tt_um_mete_opamp (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // Bu bir Analog proje.
  // Dijital pinleri kullanmadığımız için hepsini 0'a (Logic Low) çekiyoruz.
  // Bu sayede dijital testlerde hata almayız.

  assign uo_out  = 8'b0;
  assign uio_out = 8'b0;
  assign uio_oe  = 8'b0;

  // Kullanılmayan girişleri birleştirip 'unused' yapıyoruz ki uyarı vermesin
  wire _unused = &{ui_in, uio_in, ena, clk, rst_n};

endmodule
