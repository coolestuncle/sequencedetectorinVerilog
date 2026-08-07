# sequencedetectorinVerilog
A program that monitors incoming data seeking a desired sequence, 4'b1001. Upon a positive recognition of the sequence the program outputs a 1. An asynchronous reset is included.


This program served to consolidate my understanding of Verilog.

Fundamentally, the code works parallel to that of a Moore FSM. 

The first always block describes the relationships between the different states. As this block is always sensitive, '@(*)', "next_seq" holds the latest sequence of data

The second always block depicts the sequential relationships of the module's elements. The asynchronous reset is acknowledged via the 'posedge reset' sensitivity. Afterwards is the sequence and output logic that occur during positive clk edges.
