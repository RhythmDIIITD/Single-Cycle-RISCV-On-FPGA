`timescale 1ns/1ps

`timescale 1ns/1ps

module testbench;

    reg clk;
    wire [31:0] PC_Current;
    wire [31:0] Instr;

    // 32 register wires from Top_Module
    wire [31:0] x0, x1, x2, x3, x4, x5, x6, x7;
    wire [31:0] x8, x9, x10, x11, x12, x13, x14, x15;
    wire [31:0] x16, x17, x18, x19, x20, x21, x22, x23;
    wire [31:0] x24, x25, x26, x27, x28, x29, x30, x31;

    integer i;

    // Instantiate the CPU
    Top_Module UUT (
        .clk(clk),
        .PC_Current(PC_Current),
        .Instr(Instr),
        .x0(x0),   .x1(x1),   .x2(x2),   .x3(x3),
        .x4(x4),   .x5(x5),   .x6(x6),   .x7(x7),
        .x8(x8),   .x9(x9),   .x10(x10), .x11(x11),
        .x12(x12), .x13(x13), .x14(x14), .x15(x15),
        .x16(x16), .x17(x17), .x18(x18), .x19(x19),
        .x20(x20), .x21(x21), .x22(x22), .x23(x23),
        .x24(x24), .x25(x25), .x26(x26), .x27(x27),
        .x28(x28), .x29(x29), .x30(x30), .x31(x31)
    );

    // Clock generation: 10ns period
    initial clk = 0;
    always #5 clk = ~clk;





    initial begin
        #2;

        // Print table header
        $write("Time\tPC\tInstr\t");
        for (i = 0; i < 32; i = i + 1) $write("x%0d\t", i);
        $write("\n");

        // Run simulation for 20 cycles
        repeat (20) begin
            #10;

            $write("%0t\t%h\t%h\t", $time, PC_Current, Instr);
            $write("%h\t%h\t%h\t%h\t%h\t%h\t%h\t%h\t", x0,x1,x2,x3,x4,x5,x6,x7);
            $write("%h\t%h\t%h\t%h\t%h\t%h\t%h\t%h\t", x8,x9,x10,x11,x12,x13,x14,x15);
            $write("%h\t%h\t%h\t%h\t%h\t%h\t%h\t%h\t", x16,x17,x18,x19,x20,x21,x22,x23);
            $write("%h\t%h\t%h\t%h\t%h\t%h\t%h\t%h\t", x24,x25,x26,x27,x28,x29,x30,x31);
            $write("\n");
        end

        $finish;
    end

endmodule
