library ieee;
use ieee.std_logic_1164.all;

entity controller is
  port(op:in std_logic_vector(6 downto 0);
       funct3:in std_logic_vector(2 downto 0);
       funct7b5,Zero: in std_logic;
       ResultSrc: out std_logic_vector(1 downto 0);
       MemWrite: out std_logic;
       PCSrc, AluSrc: out std_logic;
       RegWrite: out std_logic;
       Jump: buffer std_logic;
       ImmSrc: out std_logic_vector(1 downto 0);
       ALUControl: out std_logic_vector(2 downto 0));
  end;
architecture struct of controller is
  component maindec
    port(op: in std_logic_vector(6 downto 0);
         ResultSrc: out std_logic_vector(1 downto 0);
         MemWrite: out std_logic;
         Branch,AluSrc: out std_logic;
         ImmSrc: out std_logic_vector(1 downto 0);
         ALuOp: out std_logic_vector(1 downto 0);
         end component;
         signal ALuOp:std_logic_vector(1 downto 0);
         signal Branch: std_logic;
         begin
           md:maindec port map(op,ResultSrc,MemWrite,Branch,AluSrc,RegWrite,Jump,ImmSrc,ALuOp);
           ad:aludec port map(ope(5),funct3,funct7b5,ALuOp,ALUControl);
           PCSrc <= (Branch and Zero) or Jump;
           end;
