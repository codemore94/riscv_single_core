entity backprob
end entity;

architecture of backprob begin
                           signal delta:integer;

                           process(clk,rst)
                             delta <= partial_deriv(params);
                             ;
