ieee.ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity datapath is
  port(clk, reset           : in     std_logic;
       ResultSrc            : in     std_logic_vector(1 downto 0);
       PCSrc, ALUSrc        : in     std_logic;
       RegWrite             : in     std_logic_vector(1 downto 0);
       ImmSrc               : in     std_logic_vector(2 downto 0);
       ALUControl           : in     std_logic_vector(2 downto 0);
       Zero                 : out    std_logic;
       PC                   : buffer std_logic_vector(31 downto 0);
       Instr                : in     std_logic_vector(31 downto 0);
       ALUResult, WriteData : buffer std_logic_vector(31 downto 0);
       ReadData             : in     std_logic_vector(31 downto 0));
end;

architecture struct of datapath is
  component flopr generic(width : integer) :
                    port(clk, reset : in  std_logic;
                         d          : in  std_logic_vector(width-1 downto 0);
                         q          : out std_logic_vector(width-1 downto 0));
  end component;
  component adder
    port(a, b : in  std_logic_vector(31 downto 0);
         y    : out std_logic_vector(31 downto 0));
  end component;
  component mux2 generic(width : integer);
                 port(d0, d1, d2 : in  std_logic_vector(width-1 downto 0);
                      s          : in  std_logic_vector(1 downto 0);
                      y          : out std_logic_vector(width-1 downto 0));
  end component;
  component regfile
    port(clk: in std_logic;
         
         )


