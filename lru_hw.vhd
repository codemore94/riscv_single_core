library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LRUCache is
    generic (
        N : integer := 4  -- Number of cache lines (4-way associative)
    );
    port (
        clk : in std_logic;
        reset : in std_logic;
        addr : in std_logic_vector(7 downto 0);  -- Address to access
        read : in std_logic;
        hit : out std_logic;                     -- Cache hit signal
        lru_out : out std_logic_vector(1 downto 0)  -- LRU line selected
    );
end LRUCache;
