library ieee;
use ieee.std_logic_1164.all;

entity controller is
  port (
    op       : in  std_logic_vector(6 downto 0);
    funct3   : in  std_logic_vector(2 downto 0);
    funct7b5 : in  std_logic;
    Zero     : in  std_logic;
    ResultSrc: out std_logic_vector(1 downto 0);
    MemWrite : out std_logic;
    PCSrc    : out std_logic;
    AluSrc   : out std_logic;
    RegWrite : out std_logic;
    Jump     : out std_logic;
    ImmSrc   : out std_logic_vector(1 downto 0);
    ALUControl: out std_logic_vector(2 downto 0)
  );
end controller;

architecture struct of controller is
  component maindec
    port (
      op        : in  std_logic_vector(6 downto 0);
      ResultSrc : out std_logic_vector(1 downto 0);
      MemWrite  : out std_logic;
      Branch    : out std_logic;
      AluSrc    : out std_logic;
      ImmSrc    : out std_logic_vector(1 downto 0);
      ALuOp     : out std_logic_vector(1 downto 0)
    );
  end component;

  component aludec
    port (
      op5      : in  std_logic; -- Changed to op5 to match signal slicing
      funct3   : in  std_logic_vector(2 downto 0);
      funct7b5 : in  std_logic;
      ALuOp    : in  std_logic_vector(1 downto 0);
      ALUControl : out std_logic_vector(2 downto 0)
    );
  end component;

  signal ALuOp  : std_logic_vector(1 downto 0);
  signal Branch : std_logic;

begin
  -- Instantiate maindec
  md: maindec
    port map (
      op        => op,
      ResultSrc => ResultSrc,
      MemWrite  => MemWrite,
      Branch    => Branch,
      AluSrc    => AluSrc,
      ImmSrc    => ImmSrc,
      ALuOp     => ALuOp
    );

  -- Instantiate aludec
  ad: aludec
    port map (
      op5       => op(5),
      funct3    => funct3,
      funct7b5  => funct7b5,
      ALuOp     => ALuOp,
      ALUControl => ALUControl
    );

  -- Logic for PCSrc
  PCSrc <= (Branch and Zero) or Jump;

end struct;
