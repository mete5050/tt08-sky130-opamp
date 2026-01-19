
# High-Performance Two-Stage Operational Amplifier (Sky130)

This repository contains the design and layout of a **Two-Stage Operational Amplifier (OpAmp)** utilizing **Miller Compensation with Nulling Resistor**, designed using the **SkyWater 130nm CMOS technology**.

This project was developed as part of the **EE4010 VLSI Circuit Design** final project and has successfully passed **DRC (Design Rule Check)** and **LVS (Layout Versus Schematic)** verification for the **Tiny Tapeout 08** shuttle.

## 🌟 Project Highlights

- **Technology:** SkyWater 130nm Open Source PDK
- **Topology:** Two-Stage (Differential Input + Common Source Output)
- **Compensation:** Miller Capacitor ($C_c$) + Nulling Resistor ($R_z$)
- **Verification:** Pre-Layout & Post-Layout Simulation (Xschem/Ngspice), Magic VLSI Layout, Netgen LVS.
- **Status:** Tape-out Ready (GDSII Verified) ✅

## 📊 Performance Specifications (Post-Layout)

The design has been optimized to meet high-speed and stability requirements. Below are the final post-layout simulation results:

| Parameter | Target Spec | Post-Layout Result | Status |
| :--- | :--- | :--- | :--- |
| **DC Gain** | $\ge 60$ dB | **64.2 dB** | ✅ PASS |
| **Gain Bandwidth (GBW)** | $\ge 50$ MHz | **124 MHz** | ✅ PASS |
| **Phase Margin** | $\ge 60^{\circ}$ | **64.9^{\circ}$** | ✅ PASS |
| **Slew Rate** | $\ge 50$ V/$\mu$s | **88 V/$\mu$s** | ✅ PASS |
| **Power Consumption** | $\le 1$ mW | **580 $\mu$W** | ✅ PASS |
| **THD (1 kHz)** | $\le 1\%$ | **0.82\%** | ✅ PASS |
| **Core Area** | Minimize | **0.0014 mm$^2$** | ✅ PASS |

## 🔧 Circuit Description

The design consists of three main blocks:
1.  **Differential Input Stage:** Uses an NMOS differential pair with a PMOS active current mirror load to convert differential voltage to single-ended current.
2.  **Gain Stage (Output):** A PMOS Common-Source amplifier that provides the second stage of gain and maximum output swing.
3.  **Bias Network:** A current mirror network ensuring stable operating points for all stages.

**Stability Strategy:** A Miller Compensation Capacitor ($C_c$) is used for pole splitting. To eliminate the Right-Half-Plane (RHP) zero caused by the Miller effect, a Nulling Resistor ($R_z$) is placed in series with $C_c$, significantly improving the Phase Margin to $64.9^{\circ}$.

## 📸 Layout & Verification

The layout was drawn using **Magic VLSI**. It features a compact floorplan with orthogonal routing (Metal 2 vertical, Metal 3 horizontal) and guard rings for latch-up prevention.
<img width="909" height="735" alt="finalprojectlayout" src="https://github.com/user-attachments/assets/5e4d68b8-784d-4351-a0a9-88d9daa0a2a8" />
**Final Layout View:**

*(Note: Please verify the image path in your repo)*

**LVS Check:**
The design matches the schematic uniquely ("Circuits match uniquely") using Netgen.

## 🔌 Pin Configuration

The Tiny Tapeout Analog Interface is used as follows:

| Tiny Tapeout Pin | OpAmp Function | Description |
| :--- | :--- | :--- |
| `ua[0]` | **Vin+** | Non-Inverting Input |
| `ua[1]` | **Vin-** | Inverting Input |
| `ua[2]` | **Vout** | Output Voltage |
| `ua[3]` | **Ibias** | Bias Current Input (10$\mu$A Source) |
| `ua[4] - ua[7]` | N/C | Not Connected |
| `VGND` | **GND** | Ground (0V) |
| `VDPWR` | **VDD** | Power Supply (1.8V) |

## 🧪 How to Test

1.  **Power Up:** Connect 1.8V to `VDPWR` and 0V to `VGND`.
2.  **Bias:** Connect a precise **10$\mu$A current source** to the `Ibias` pin (`ua[3]`).
3.  **Signal:** Apply a differential signal to `ua[0]` and `ua[1]`.
    * *For DC Gain:* Sweep the DC difference.
    * *For Transient:* Apply a small sine wave or pulse.
4.  **Observe:** Measure the output at `ua[2]` using an oscilloscope.

## 👥 Authors

- **Mete Eker**
- **Abdullah Altepe**
- **Şeref Keser**

*Marmara University - EE4010 VLSI Circuit Design Final Project*

---
*Based on Tiny Tapeout Analog Template.*
