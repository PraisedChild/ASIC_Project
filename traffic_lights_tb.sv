module traffic_lights_tb ();
    
    reg         clk, rst_n;
    reg         i_sensor_1_1, i_sensor_1_5;
    reg         i_sensor_2_1, i_sensor_2_5;
    reg         i_sensor_3_1, i_sensor_3_5;
    reg         i_sensor_4_1, i_sensor_4_5;
    reg         counter_done;

    wire        short_counter;
    wire        long_counter;
    wire [3:0]  current_state;

    traffic_lights dut (

        .clk(clk), 
        .rst_n(rst_n),
        .i_sensor_1_1(i_sensor_1_1), 
        .i_sensor_1_5(i_sensor_1_5),
        .i_sensor_2_1(i_sensor_2_1), 
        .i_sensor_2_5(i_sensor_2_5),
        .i_sensor_3_1(i_sensor_3_1), 
        .i_sensor_3_5(i_sensor_3_5),
        .i_sensor_4_1(i_sensor_4_1), 
        .i_sensor_4_5(i_sensor_4_5),
        .counter_done(counter_done),
        .short_counter(short_counter),
        .long_counter(long_counter),
        .current_state(current_state)

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

        rst_n = 0;
        repeat(3) @(negedge clk);
        rst_n = 1;

    endtask

    task test;
        
        rst_n = 1;
        i_sensor_1_1 = 1;
        i_sensor_1_5 = 1;
        i_sensor_2_1 = 0;
        i_sensor_2_5 = 0;
        i_sensor_3_1 = $random;
        i_sensor_3_5 = $random;
        i_sensor_4_1 = $random;
        i_sensor_4_5 = $random;
        counter_done = 0;

        repeat(62) @(negedge clk);
        counter_done = 1;
        @(negedge clk);

        counter_done = 0;
        i_sensor_1_1 = 1;
        i_sensor_1_5 = 1;
        i_sensor_2_1 = 1;
        i_sensor_2_5 = 1;
        i_sensor_3_1 = $random;
        i_sensor_3_5 = $random;
        i_sensor_4_1 = $random;
        i_sensor_4_5 = $random;

        repeat(62) @(negedge clk);
        counter_done = 1;
        @(negedge clk);

        counter_done = 0;
        i_sensor_1_1 = 1;
        i_sensor_1_5 = 1;
        i_sensor_2_1 = 1;
        i_sensor_2_5 = 1;
        i_sensor_3_1 = 1;
        i_sensor_3_5 = 1;
        i_sensor_4_1 = 1;
        i_sensor_4_5 = 1;

        repeat(62) @(negedge clk);
        counter_done = 1;
        @(negedge clk);

        counter_done = 0;
        i_sensor_1_1 = 1;
        i_sensor_1_5 = 1;
        i_sensor_2_1 = 1;
        i_sensor_2_5 = 1;
        i_sensor_3_1 = 1;
        i_sensor_3_5 = 1;
        i_sensor_4_1 = 1;
        i_sensor_4_5 = 1;

        repeat(62) @(negedge clk);
        counter_done = 1;
        @(negedge clk);
        
        counter_done = 0;
        i_sensor_1_1 = 1;
        i_sensor_1_5 = 0;
        i_sensor_2_1 = 1;
        i_sensor_2_5 = 1;
        i_sensor_3_1 = 1;
        i_sensor_3_5 = 1;
        i_sensor_4_1 = 1;
        i_sensor_4_5 = 1;

        repeat(14) @(negedge clk);
        counter_done = 1;
        @(negedge clk);

        counter_done = 0;
        i_sensor_1_1 = 1;
        i_sensor_1_5 = 0;
        i_sensor_2_1 = 1;
        i_sensor_2_5 = 0;
        i_sensor_3_1 = 1;
        i_sensor_3_5 = 0;
        i_sensor_4_1 = 1;
        i_sensor_4_5 = 0;     

        repeat(14) @(negedge clk);
        counter_done = 1;
        @(negedge clk);

        i_sensor_1_1 = 1;
        i_sensor_1_5 = 0;
        i_sensor_2_1 = 1;
        i_sensor_2_5 = 0;
        i_sensor_3_1 = 1;
        i_sensor_3_5 = 0;
        i_sensor_4_1 = 1;
        i_sensor_4_5 = 0;  

        repeat(14) @(negedge clk);

        i_sensor_1_1 = 1;
        i_sensor_1_5 = 0;
        i_sensor_2_1 = 1;
        i_sensor_2_5 = 0;
        i_sensor_3_1 = 1;
        i_sensor_3_5 = 0;
        i_sensor_4_1 = 1;
        i_sensor_4_5 = 0;  

        repeat(14) @(negedge clk);

        i_sensor_1_1 = 0;
        i_sensor_1_5 = 0;
        i_sensor_2_1 = 1;
        i_sensor_2_5 = 0;
        i_sensor_3_1 = 1;
        i_sensor_3_5 = 0;
        i_sensor_4_1 = 1;
        i_sensor_4_5 = 0;

        repeat(14) @(negedge clk);

        i_sensor_1_1 = 1;
        i_sensor_1_5 = 0;
        i_sensor_2_1 = 1;
        i_sensor_2_5 = 0;
        i_sensor_3_1 = 0;
        i_sensor_3_5 = 0;
        i_sensor_4_1 = 1;
        i_sensor_4_5 = 0;    

        repeat(14) @(negedge clk);
    endtask
endmodule