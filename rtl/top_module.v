module top_module (
    
    input  clk,
    input  rst_n,
    input  i_sensor_1_1,
    input  i_sensor_1_5,
    input  i_sensor_2_1,
    input  i_sensor_2_5,
    input  i_sensor_3_1,
    input  i_sensor_3_5,
    input  i_sensor_4_1,
    input  i_sensor_4_5,
    
    output LED_RED_1,
    output LED_RED_2,
    output LED_RED_3,
    output LED_RED_4,
    output LED_GREEN_1,
    output LED_GREEN_2,
    output LED_GREEN_3,
    output LED_GREEN_4,
    output LED_YELLOW_1,
    output LED_YELLOW_2,
    output LED_YELLOW_3,
    output LED_YELLOW_4

);

//internal wires

wire [3:0] state;
wire almost_done, FSM_done, done_counter;
wire short_counter, long_counter;

counter count_mod (
    .i_short_counter(short_counter),
    .i_long_counter(long_counter),
    .clk(clk), 
    .rst_n(rst_n),
    .done_FSM(FSM_done),
    .done_counter(done_counter),
    .almost_done(almost_done)
);

traffic_lights traff_mod (
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
    .counter_done(FSM_done),
    .short_counter(short_counter),
    .long_counter(long_counter),
    .current_state(state)
);

actuator act_mod (

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

endmodule