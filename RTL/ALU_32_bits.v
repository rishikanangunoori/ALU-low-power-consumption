module ALU_32bit (
    input  [31:0] A,
    input  [31:0] B,
    input  [2:0]  Opcode,
    input         Clk,
    input         Enable,
    input  [1:0]  Power_Mode,

    output reg [31:0] Result,
    output reg        Cout
);

    // =========================================================
    // Arithmetic operand isolation
    // =========================================================

    wire Arithmetic_Enable;

    assign Arithmetic_Enable =
        Enable &&
        ((Opcode == 3'b000) || (Opcode == 3'b001));


    // =========================================================
    // Arithmetic operands
    // =========================================================

    wire [31:0] A_Arithmetic;
    wire [31:0] B_Arithmetic;

    assign A_Arithmetic =
        Arithmetic_Enable ? A : 32'b0;

    assign B_Arithmetic =
        Arithmetic_Enable ?
        ((Opcode == 3'b001) ? ~B : B) :
        32'b0;


    // =========================================================
    // Carry input
    //
    // ADD: A + B + 0
    // SUB: A + ~B + 1
    // =========================================================

    wire CLA_Cin;

    assign CLA_Cin =
        (Arithmetic_Enable && Opcode == 3'b001) ? 1'b1 : 1'b0;


    // =========================================================
    // 32-bit CLA
    // =========================================================

    wire [31:0] CLA_Sum;
    wire        CLA_Cout;

    CLA_Adder_32bit CLA (
        .A(A_Arithmetic),
        .B(B_Arithmetic),
        .Cin(CLA_Cin),
        .Sum(CLA_Sum),
        .Cout(CLA_Cout)
    );


    // =========================================================
    // Main ALU
    //
    // For now Power_Mode is not used to slow the operation.
    // We first verify all FPGA operations.
    // =========================================================

    always @(posedge Clk) begin

        if (!Enable) begin

            Result <= 32'b0;
            Cout   <= 1'b0;

        end
        else begin

            case (Opcode)

                // =============================================
                // ADD
                // =============================================

                3'b000: begin

                    Result <= CLA_Sum;
                    Cout   <= CLA_Cout;

                end


                // =============================================
                // SUB
                // A - B = A + ~B + 1
                // =============================================

                3'b001: begin

                    Result <= CLA_Sum;
                    Cout   <= ~CLA_Cout;

                end


                // =============================================
                // AND
                // =============================================

                3'b010: begin

                    Result <= A & B;
                    Cout   <= 1'b0;

                end


                // =============================================
                // OR
                // =============================================

                3'b011: begin

                    Result <= A | B;
                    Cout   <= 1'b0;

                end


                // =============================================
                // XOR
                // =============================================

                3'b100: begin

                    Result <= A ^ B;
                    Cout   <= 1'b0;

                end


                // =============================================
                // NOT
                // =============================================

                3'b101: begin

                    Result <= ~A;
                    Cout   <= 1'b0;

                end


                // =============================================
                // Invalid opcode
                // =============================================

                default: begin

                    Result <= 32'b0;
                    Cout   <= 1'b0;

                end

            endcase

        end

    end

endmodule
