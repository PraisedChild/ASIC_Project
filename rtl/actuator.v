module actuator (

    input [3:0] state,
    input       almost_done,

    output reg  LED_RED_1,
    output reg  LED_RED_2,
    output reg  LED_RED_3,
    output reg  LED_RED_4,
    output reg  LED_GREEN_1,
    output reg  LED_GREEN_2,
    output reg  LED_GREEN_3,
    output reg  LED_GREEN_4,
    output reg  LED_YELLOW_1,
    output reg  LED_YELLOW_2,
    output reg  LED_YELLOW_3,
    output reg  LED_YELLOW_4

);

    reg       almost_done_flag;
    reg [3:0] state_mem;


    always@(*)begin

        case(state)
        4'b0001:begin

            LED_GREEN_1  = 1;
            LED_GREEN_2  = 0;
            LED_GREEN_3  = 0;
            LED_GREEN_4  = 0;
            LED_RED_1    = 0;
            LED_RED_2    = 1;
            LED_RED_3    = 1;
            LED_RED_4    = 1;
            LED_YELLOW_1 = 0;
            LED_YELLOW_2 = 0;
            LED_YELLOW_3 = 0;
            LED_YELLOW_4 = 0;

            if(almost_done_flag)begin
                
                LED_YELLOW_1     = 1;
                LED_GREEN_1      = 0;
                
            end
            
        end 
        4'b0010:begin

            LED_GREEN_1  = 0;
            LED_GREEN_2  = 1;
            LED_GREEN_3  = 0;
            LED_GREEN_4  = 0;
            LED_RED_1    = 1;
            LED_RED_2    = 0;
            LED_RED_3    = 1;
            LED_RED_4    = 1;
            LED_YELLOW_1 = 0;
            LED_YELLOW_2 = 0;
            LED_YELLOW_3 = 0;
            LED_YELLOW_4 = 0;

            if(almost_done_flag)begin

                LED_YELLOW_2     = 1;
                LED_GREEN_2      = 0;
                
            end
            
        end
        4'b0100:begin

            LED_GREEN_1  = 0;
            LED_GREEN_2  = 0;
            LED_GREEN_3  = 1;
            LED_GREEN_4  = 0;
            LED_RED_1    = 1;
            LED_RED_2    = 1;
            LED_RED_3    = 0;
            LED_RED_4    = 1;
            LED_YELLOW_1 = 0;
            LED_YELLOW_2 = 0;
            LED_YELLOW_3 = 0;
            LED_YELLOW_4 = 0;

            if(almost_done_flag)begin

                LED_YELLOW_3     = 1;
                LED_GREEN_3      = 0;
                
            end
            
        end
        4'b1000:begin

            LED_GREEN_1  = 0;
            LED_GREEN_2  = 0;
            LED_GREEN_3  = 0;
            LED_GREEN_4  = 1;
            LED_RED_1    = 1;
            LED_RED_2    = 1;
            LED_RED_3    = 1;
            LED_RED_4    = 0;
            LED_YELLOW_1 = 0;
            LED_YELLOW_2 = 0;
            LED_YELLOW_3 = 0;
            LED_YELLOW_4 = 0;

            if(almost_done_flag)begin

                LED_YELLOW_4     = 1;
                LED_GREEN_4      = 0;
                
            end
            
        end
        default:begin
            
            LED_GREEN_1  = 0;
            LED_GREEN_2  = 0;
            LED_GREEN_3  = 0;
            LED_GREEN_4  = 0;
            LED_RED_1    = 1;
            LED_RED_2    = 1;
            LED_RED_3    = 1;
            LED_RED_4    = 1;
            LED_YELLOW_1 = 0;
            LED_YELLOW_2 = 0;
            LED_YELLOW_3 = 0;
            LED_YELLOW_4 = 0;

        end
        endcase
    end

    always@(*)begin
        
        if(almost_done)begin

                almost_done_flag = 1;
                state_mem        = state;

        end

        if(almost_done_flag && state_mem != state)
            almost_done_flag = 0;

    end
endmodule