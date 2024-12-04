module top_tb ();
        
    reg     clk;
    reg     rst_n;
    reg     i_sensor_1_1;
    reg     i_sensor_1_5;
    reg     i_sensor_2_1;
    reg     i_sensor_2_5;
    reg     i_sensor_3_1;
    reg     i_sensor_3_5;
    reg     i_sensor_4_1;
    reg     i_sensor_4_5;
    wire    LED_RED_1;
    wire    LED_RED_2;
    wire    LED_RED_3;
    wire    LED_RED_4;
    wire    LED_GREEN_1;
    wire    LED_GREEN_2;
    wire    LED_GREEN_3;
    wire    LED_GREEN_4;
    wire    LED_YELLOW_1;
    wire    LED_YELLOW_2;
    wire    LED_YELLOW_3;
    wire    LED_YELLOW_4;

    initial begin
        clk = 0;
        forever begin
            #1 clk = ~clk;
        end
    end
    
    top_module dut (

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
        .LED_RED_1(LED_RED_1),
        .LED_RED_2(LED_RED_2),
        .LED_RED_3(LED_RED_3),
        .LED_RED_4(LED_RED_4),
        .LED_GREEN_1(LED_GREEN_1),
        .LED_GREEN_2(LED_GREEN_2),
        .LED_GREEN_3(LED_GREEN_3),
        .LED_GREEN_4(LED_GREEN_4),
        .LED_YELLOW_1(LED_YELLOW_1),
        .LED_YELLOW_2(LED_YELLOW_2),
        .LED_YELLOW_3(LED_YELLOW_3),
        .LED_YELLOW_4(LED_YELLOW_4)

    );

    initial begin
        
        reset();
        test_cycle_longs();
        reset();
        test_cycle_shorts();
        reset();
        test_cycle_mixed();
        reset();
        test_cycle_zero();
        $stop;

    end

    task reset();

        rst_n        = 0;
        i_sensor_1_1 = 0;
        i_sensor_1_5 = 0;
        i_sensor_2_1 = 0;
        i_sensor_2_5 = 0;
        i_sensor_3_1 = 0;
        i_sensor_3_5 = 0;
        i_sensor_4_1 = 0;
        i_sensor_4_5 = 0;

        repeat(5) @(negedge clk);

    endtask

    task test_cycle_longs();

        rst_n        = 1;
        i_sensor_1_1 = 1;
        i_sensor_1_5 = 1;
        i_sensor_2_1 = 1;
        i_sensor_2_5 = 1;
        i_sensor_3_1 = 1;
        i_sensor_3_5 = 1;
        i_sensor_4_1 = 1;
        i_sensor_4_5 = 1;

        repeat(500) @(negedge clk);

    endtask

    task test_cycle_shorts();
    
        rst_n        = 1;
        i_sensor_1_1 = 1;
        i_sensor_1_5 = 1;
        i_sensor_2_1 = 1;
        i_sensor_2_5 = 0;
        i_sensor_3_1 = 1;
        i_sensor_3_5 = 0;
        i_sensor_4_1 = 1;
        i_sensor_4_5 = 0;

        repeat(100) @(negedge clk);

        i_sensor_1_5 = 0;
    
        repeat(400) @(negedge clk);
        
    endtask

    task test_cycle_mixed();

        rst_n        = 1;
        i_sensor_1_1 = 1;
        i_sensor_1_5 = 1;
        i_sensor_2_1 = 1;
        i_sensor_2_5 = 0;
        i_sensor_3_1 = 1;
        i_sensor_3_5 = 1;
        i_sensor_4_1 = 1;
        i_sensor_4_5 = 0;   

        repeat(500) @(negedge clk);
 
    endtask

    task test_cycle_zero();
    
        rst_n        = 1;
        i_sensor_1_1 = 1;
        i_sensor_1_5 = 1;
        i_sensor_2_1 = 1;
        i_sensor_2_5 = 1;
        i_sensor_3_1 = 0;
        i_sensor_3_5 = 0;
        i_sensor_4_1 = 1;
        i_sensor_4_5 = 1;    

        repeat(500) @(negedge clk);
    
    endtask

endmodule