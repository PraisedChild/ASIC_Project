module counter_tb ();

    reg      i_short_counter;
    reg      i_long_counter;
    reg      clk, rst_n;

    wire     done_FSM;
    wire     done_counter;
    wire     almost_done;  

    counter dut (

        .i_short_counter(i_short_counter),
        .i_long_counter(i_long_counter),
        .clk(clk), 
        .rst_n(rst_n),
        .done_FSM(done_FSM),
        .done_counter(done_counter),
        .almost_done(almost_done)

    );

    initial begin
        clk = 0;
        forever begin
            #1 clk = ~clk;
        end
    end

    initial begin
        
        reset();
        test();
        $stop;

    end

    task reset;

        rst_n           = 0;
        i_short_counter = 0;
        i_long_counter  = 0;

        repeat(3) @(negedge clk);

    endtask


    task test;

        rst_n           = 1;
        i_short_counter = 0;
        i_long_counter  = 1;

        repeat(62) @(negedge clk);

        i_short_counter = 1;
        i_long_counter  = 0;

        repeat(16) @(negedge clk);

        rst_n           = 1;
        i_short_counter = 1;
        i_long_counter  = 0;

        repeat(32) @(negedge clk);

        rst_n           = 1;
        i_short_counter = 0;
        i_long_counter  = 1;

        repeat(128) @(negedge clk);
        rst_n           = 1;
        i_short_counter = 1;
        i_long_counter  = 0;

        repeat(16) @(negedge clk);

        rst_n           = 1;
        i_short_counter = 0;
        i_long_counter  = 1;

        repeat(100) @(negedge clk);

    endtask


endmodule