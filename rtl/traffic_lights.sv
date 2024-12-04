module traffic_lights (

    input        clk, rst_n,
    input        i_sensor_1_1, i_sensor_1_5,
    input        i_sensor_2_1, i_sensor_2_5,
    input        i_sensor_3_1, i_sensor_3_5,
    input        i_sensor_4_1, i_sensor_4_5,
    input        counter_done,

    output reg   short_counter,
    output reg   long_counter,
    output [3:0] current_state

);
    
    typedef enum bit [2:0] {
        RED    = 3'b001,
        YELLOW = 3'b010,
        GREEN  = 3'b100
    } lights_e;

    lights_e o_1, o_2, o_3, o_4; //4 traffic lights each with the three possibilities of being red, green, or yellow

    typedef enum bit [3:0] {
        light_1 = 4'b0001,
        light_2 = 4'b0010,
        light_3 = 4'b0100,
        light_4 = 4'b1000
    } state_e;

    state_e cs, ns;

    //the design will include 2 main aspects, 1, there will be rotational cycle for opening the traffic lights, 2nd, 
    //the sensors will be checked by the start of these cycles, and based on the result it will either be assigned 10 seconds or 60 seconds or 0 seconds

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
        cs <= light_1;
        else
        cs <= ns;
    end

    always @(*) begin
        
        case (cs)
            light_1: begin //we dictate the amount of time each traffic light is assigned in the previous cycle, so in light_1 we look at sensors of light_2
                if(i_sensor_2_5) begin

                    long_counter  = 1;
                    short_counter = 0;

                end
                else if(i_sensor_2_1) begin
                    
                    long_counter  = 0;
                    short_counter = 1;

                end
                else begin
                    
                    long_counter  = 0;
                    short_counter = 0;

                end
            end
            light_2: begin 
                if(i_sensor_3_5) begin

                    long_counter  = 1;
                    short_counter = 0;

                end
                else if(i_sensor_3_1) begin
                    
                    long_counter  = 0;
                    short_counter = 1;

                end
                else begin
                    
                    long_counter  = 0;
                    short_counter = 0;

                end
            end
            light_3: begin 
                if(i_sensor_4_5) begin

                    long_counter  = 1;
                    short_counter = 0;

                end
                else if(i_sensor_4_1) begin
                    
                    long_counter  = 0;
                    short_counter = 1;

                end
                else begin
                    
                    long_counter  = 0;
                    short_counter = 0;

                end
            end
            light_4: begin 
                if(i_sensor_1_5) begin

                    long_counter  = 1;
                    short_counter = 0;

                end
                else if(i_sensor_1_1) begin
                    
                    long_counter  = 0;
                    short_counter = 1;

                end
                else begin
                    
                    long_counter  = 0;
                    short_counter = 0;

                end
            end
            default:  begin
                long_counter  = 0;
                short_counter = 0;
            end
        endcase
    end
    
    always @(*) begin
        
        case (cs)
            light_1: begin //we dictate the amount of time each traffic light is assigned in the previous cycle, so in light_1 we look at sensors of light_2
                if(counter_done || (!long_counter&!short_counter))begin
                    ns <= light_2;
                end
                else 
                    ns <= light_1;
            end
            light_2: begin 
                if(counter_done || (!long_counter&!short_counter))begin
                    ns <= light_3;
                end
                else 
                    ns <= light_2;
            end
            light_3: begin 
                if(counter_done || (!long_counter&!short_counter))begin
                    ns <= light_4;
                end
                else 
                    ns <= light_3;
            end
            light_4: begin 
                if(counter_done || (!long_counter&!short_counter))begin
                    ns <= light_1;
                end
                else 
                    ns <= light_4;
            end
            default:  begin
                ns <= light_1;
            end
        endcase
    end

    assign current_state = cs;

endmodule