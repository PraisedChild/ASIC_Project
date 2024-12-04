module counter (

    input      i_short_counter,
    input      i_long_counter,
    input      clk, rst_n,

    output reg done_FSM,
    output reg done_counter,
    output reg almost_done

);
    
    reg [5:0] long_counter;
    reg [3:0] short_counter;

typedef enum bit [1:0] {

    short_count = 2'b01,
    long_count  = 2'b10

} counter_e;

    counter_e counter_state;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin

            counter_state <= long_count;
            long_counter  <= 0;
            short_counter <= 0;

        end
        else begin
            
            case (counter_state)
                
                short_count:begin

                    short_counter <= short_counter + 1;

                    if(short_counter == 14)begin
                        done_FSM     <= 1;
                        done_counter <= 0;
                        almost_done  <= 0;
                    end
                    else if(short_counter == 15)begin
                        done_FSM     <= 0;
                        done_counter <= 1;
                        almost_done  <= 0;
                        short_counter<= 0;

                        counter_state <= ({i_long_counter,i_short_counter} == 2'b01)? short_count:long_count;
                    end
                    else if(short_counter == 5)begin
                        done_FSM     <= 0;
                        done_counter <= 0;
                        almost_done  <= 1;
                    end
                    else begin
                        done_FSM     <= 0;
                        done_counter <= 0;
                        almost_done  <= 0;
                    end
                end
                long_count:begin

                    long_counter <= long_counter + 1;

                    if(long_counter == 62)begin
                        done_FSM     <= 1;
                        done_counter <= 0;
                        almost_done  <= 0;
                    end
                    else if(long_counter == 63)begin
                        done_FSM     <= 0;
                        done_counter <= 1;
                        almost_done  <= 0;
                        long_counter <= 0;

                        counter_state <= ({i_long_counter,i_short_counter} == 2'b01)? short_count:long_count;
                    end
                    else if(long_counter == 52)begin
                        done_FSM     <= 0;
                        done_counter <= 0;
                        almost_done  <= 1;
                    end
                    else begin
                        done_FSM     <= 0;
                        done_counter <= 0;
                        almost_done  <= 0;
                    end
                end
                default: begin
                    done_FSM     <= 0;
                    done_counter <= 0;
                    almost_done  <= 0;

                    counter_state <= ({i_long_counter,i_short_counter} == 2'b01)? short_count:long_count;
                end
                
            endcase

        end
    end

endmodule