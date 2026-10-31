# ALU-low-power-consumption
Design and implementation of 32-bit low-power ALU using Verilog HDL
# Design and Implementation of a Low-Power ALU Using Clock Gating in Verilog HDL

## Project Overview

This project presents the design and implementation of a **32-bit Low-Power Arithmetic Logic Unit (ALU)** using Verilog Hardware Description Language (HDL). The main objective is to perform arithmetic and logical operations while reducing unnecessary switching activity through low-power optimization techniques.

The proposed ALU incorporates a 32-bit Carry Look-Ahead Adder (CLA), clock gating, operand isolation, and power-mode control. The design is simulated and verified using Xilinx Vivado and implemented on the Digilent Arty S7-25 FPGA development board.

## Project Details

| Description | Information |
|---|---|
| Project Title | Design and Implementation of a Low-Power ALU Using Clock Gating in Verilog HDL |
| Domain | VLSI Design and Digital Electronics |
| Hardware Description Language | Verilog HDL |
| FPGA Board | Digilent Arty S7-25 |
| FPGA Family | Xilinx Spartan-7 |
| FPGA Device | XC7S25 |
| Design Tool | Xilinx Vivado 2025.1 |
| ALU Architecture | 32-bit ALU |
| Arithmetic Unit | 32-bit Carry Look-Ahead Adder |

## Authors

- **N. Rishika** – 2411EC010110
- **R. Shiva** – 2411EC010117

**Project Guide:** Mr. Shankar Aenagandula

## Objectives

- Design and implement a 32-bit Arithmetic Logic Unit using Verilog HDL.
- Perform arithmetic and logical operations using opcode-based selection.
- Implement a Carry Look-Ahead Adder for arithmetic operations.
- Apply clock gating to control unnecessary clock activity.
- Use operand isolation to reduce unnecessary switching activity.
- Incorporate enable and power-mode control.
- Verify the functionality through simulation in Vivado.
- Implement and test the design on the Arty S7-25 FPGA board.
- Analyze the power characteristics of the optimized design.

## Supported ALU Operations

The ALU performs six basic arithmetic and logical operations.

| Opcode | Operation | Function |
|---|---|---|
| 000 | Addition | A + B |
| 001 | Subtraction | A - B |
| 010 | AND | A & B |
| 011 | OR | A \| B |
| 100 | XOR | A ^ B |
| 101 | NOT | ~A |

## Key Features

### 1. Clock Gating
Controls clock activity in selected functional units when their operations are not required, helping reduce unnecessary switching.

### 2. Carry Look-Ahead Adder
Uses carry-generation and carry-propagation logic to reduce carry propagation delay during addition and subtraction.

### 3. Operand Isolation
Controls the operands supplied to the arithmetic unit when arithmetic operations are inactive, reducing unnecessary internal switching.

### 4. Enable Control
The enable signal determines whether the ALU performs an operation. When disabled, the output is set to zero according to the implemented control logic.

### 5. Power Mode Control

The design supports three operating modes:

| Power Mode | Description |
|---|---|
| 00 | Low Power – operation every 4 clock cycles |
| 01 | Medium Power – operation every 2 clock cycles |
| 10 | High Power – operation every clock cycle |

## Project Architecture

The major functional blocks of the proposed ALU are:

1. **Input Operands:** Accepts two 32-bit inputs, A and B.
2. **Operation Decoder:** Decodes the opcode and selects the required operation.
3. **Clock Control:** Controls clock activity according to the selected operation.
4. **Operand Isolation:** Prevents unnecessary switching in inactive arithmetic circuitry.
5. **Arithmetic Unit:** Performs addition and subtraction using the 32-bit CLA.
6. **Logical Unit:** Performs AND, OR, XOR, and NOT operations.
7. **Output Selection:** Selects the required operation result.
8. **Output Registers:** Store the 32-bit result and carry output.

## Simulation Results

The design is verified using a Verilog testbench in Xilinx Vivado.

| Operation | Input A | Input B | Expected Result |
|---|---:|---:|---:|
| Addition | 3 | 5 | 00000008 |
| Subtraction | 3 | 5 | FFFFFFFE |
| AND | 000000FF | 00000F0F | 0000000F |
| OR | 000000FF | 00000F0F | 00000FFF |
| XOR | 000000FF | 00000F0F | 00000FF0 |
| NOT | 000000FF | — | FFFFFF00 |

The simulation waveform confirms the operation selection and corresponding ALU outputs for the tested input combinations.

## Power Comparison

The project includes a reported comparison between the normal ALU and the optimized ALU.

| ALU Design | Reported Power |
|---|---:|
| Normal ALU | 9.956 W |
| Optimized ALU | 0.122 W |
| Reported Power Reduction | Approximately 98.8% |

**Note:** These are the project's reported comparison values. Actual power estimates depend on FPGA implementation conditions, clock constraints, and switching activity.

## FPGA Implementation

The design is targeted for the **Digilent Arty S7-25 FPGA development board**.

Implementation steps:

1. Develop the Verilog RTL modules.
2. Create the Verilog testbench.
3. Run behavioral simulation in Vivado.
4. Verify the output waveforms.
5. Add the FPGA pin constraints (XDC) file.
6. Run synthesis.
7. Run implementation.
8. Check timing and FPGA resource utilization.
9. Generate the bitstream.
10. Program the Arty S7-25 FPGA board and verify the hardware outputs.

## Tools and Technologies

- Verilog HDL
- Xilinx Vivado 2025.1
- Vivado XSim Simulator
- Digilent Arty S7-25 FPGA
- XDC Constraints
- Carry Look-Ahead Adder
- Clock Gating
- Operand Isolation

## Repository Structure

A suggested repository organization is:

```text
Low-Power-ALU-Using-Clock-Gating/
│
├── RTL/
│   ├── ALU_32bit.v
│   └── CLA_Adder_32bit.v
│
├── Testbench/
│   └── ALU_32bit_tb.v
│
├── Constraints/
│   └── Arty-S7-25-ALU.xdc
│
├── Simulation/
│   └── Waveform_Screenshots/
│
├── Images/
│   ├── Architecture_Diagram.png
│   └── FPGA_Hardware_Implementation.jpg
│
├── Reports/
│   ├── Power_Report/
│   └── Resource_Utilization/
│
└── README.md
```

*Adjust the folder and file names to match the actual files in your repository.*

## Future Scope

- Extend the ALU to support additional arithmetic and logical operations.
- Improve clock gating using FPGA-supported clock-enable or dedicated clock-control resources.
- Explore more advanced low-power optimization techniques.
- Optimize timing and FPGA resource utilization.
- Integrate the ALU into a simple processor architecture.
- Evaluate the design under different clock frequencies and workloads.

## Conclusion

This project demonstrates the design and implementation of a 32-bit low-power ALU using Verilog HDL. By combining a Carry Look-Ahead Adder, clock gating, operand isolation, and power-mode control, the design explores techniques for reducing unnecessary switching activity while maintaining the required arithmetic and logical functionality. Functional simulation and FPGA implementation on the Arty S7-25 provide practical verification of the proposed design.

## Acknowledgment

We sincerely thank our project guide, **Mr. Shankar Aenagandula**, for his valuable guidance and support throughout this project.

---

**Developed by:**  
N. Rishika (2411EC010110)  
R. Shiva (2411EC010117)

**Department of Electronics and Communication Engineering**
