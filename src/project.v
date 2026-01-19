/*
 * Copyright (c) 2024 MeteEKER
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

// HATAYI ÇÖZEN SATIR BURASI: 'tt_um_example' yerine 'tt_um_mete_opamp' yazıyor.
module tt_um_mete_opamp (
    input  wire       VGND,
    input  wire       VDPWR,    // 1.8v power supply
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    inout  wire [7:0] ua,       // Analog pins
    input  wire       ena,      // always 1 when the design is powered
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // Dijital çıkışları 0 yapıyoruz ki hata vermesin
  assign uo_out  = 8'b0;
  assign uio_out = 8'b0;
  assign uio_oe  = 8'b0;

  // Kullanılmayan girişleri susturuyoruz
  wire _unused = &{ui_in, uio_in, ena, clk, rst_n};

endmodule
