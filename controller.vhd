library ieee;
use ieee.std_logic_1164.all;

entity controller is
  port(op:in std_logic_vector(6 downto 0);
       funct3:in std_logic_vector(2 downto 0);
       funct7b5,Zero: in std_logic;
       ResultSrc: out std_logic_vector(1 downto 0);
       MemWrite: out std_logic;
       
