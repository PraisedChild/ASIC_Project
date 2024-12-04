module actuator_tb (  );

    reg       clk;
    reg [3:0] state;
    reg       almost_done;
    wire      LED_RED_1;
    wire      LED_RED_2;
    wire      LED_RED_3;
    wire      LED_RED_4;
    wire      LED_GREEN_1;
    wire      LED_GREEN_2;
    wire      LED_GREEN_3;
    wire      LED_GREEN_4;
    wire      LED_YELLOW_1;
    wire      LED_YELLOW_2;
    wire      LED_YELLOW_3;
    wire      LED_YELLOW_4;
    
    initial begin
        clk = 0;
        forever begin
            #1 clk = ~clk;
        end
    end
    
    actuator dut (

        .state(state),
        .almost_done(almost_done),
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
        
        test_state_1();
        test_state_2();
        test_state_3();
        test_state_4();
        $stop;

    end

    task test_state_1();

        state       = 4'b0001;
        almost_done = 0;
        repeat(3) @(negedge clk);

        almost_done = 1;
        repeat(3) @(negedge clk);

    endtask

    task test_state_2();

        state       = 4'b0010;
        almost_done = 0;
        repeat(3) @(negedge clk);

        almost_done = 1;
        repeat(3) @(negedge clk);

    endtask

    task test_state_3();

        state       = 4'b0100;
        almost_done = 0;
        repeat(3) @(negedge clk);

        almost_done = 1;
        repeat(3) @(negedge clk);

    endtask

    task test_state_4();

        state       = 4'b1000;
        almost_done = 0;
        repeat(3) @(negedge clk);

        almost_done = 1;
        repeat(3) @(negedge clk);

    endtask



endmodule
