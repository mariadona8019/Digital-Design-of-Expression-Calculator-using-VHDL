library IEEE;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

 
entity main3 is
  port( A ,B : in std_logic_vector (7 downto 0);
       clock: in std_logic;
       load: in std_logic;
       clear: in std_logic;
              Z	: inout std_logic_vector (15 downto 0);
  end_flag : out std_logic);
end main3;

architecture operation of main3 is

-- Component Declaration of 8-bit register:
Component reg_8_bit 
  port( data_in : in std_logic_vector (7 downto 0);
      clock, load, clear: in std_logic; 
      data_out : out std_logic_vector (7 downto 0));
end Component;

-- Component Declaration of 16-bit register:
Component reg_16_bit 
  port( data_in : in std_logic_vector (15 downto 0);
      clock, load, clear: in std_logic; 
      data_out : out std_logic_vector (15 downto 0));
end Component;

-- Component Declaration of multiplier:
Component multiplier
  port( A ,B 	: in std_logic_vector (7 downto 0);
      Z		: out std_logic_vector (15 downto 0));
end Component;

-- Component Declaration of shifter:
Component shift
  port( A: in std_logic_vector (15 downto 0);
    Z: out std_logic_vector (15 downto 0));
end Component;

-- Component Declaration of addition:
component add1 is
  port( A  : in std_logic_vector (15 downto 0);
      Z		: out std_logic_vector (15 downto 0));
end component;

-- Signal Declarations:

-- Signals for 8-bit Register:
signal A2 : std_logic_vector (7 downto 0);
signal B2 : std_logic_vector (7 downto 0);

-- Signals for multiplier: 
signal Z1 : std_logic_vector(15 downto 0);

-- Signals for shifting: 
signal Z2 : std_logic_vector(15 downto 0);

-- Signals for adding: 
signal Z3 : std_logic_vector(15 downto 0);

--signal for end_flag
--signal Z_buf : std_logic_vector(15 downto 0);

begin

-- Store the 8-bit number into a 8-bit register:
RegA: reg_8_bit port map ( A(7 downto 0), clock, load, clear, A2(7 downto 0));
RegB: reg_8_bit port map ( B(7 downto 0), clock, load, clear, B2(7 downto 0));

-- Perform the operation: 
mul: multiplier port map (A2(7 downto 0),B2(7 downto 0), Z1(15 downto 0));

--Shifting operation:
shift1: shift port map( Z1(15 downto 0),Z2(15 downto 0)); 

--Addition operation:
adding: add1 port map ( Z2(15 downto 0),Z3(15 downto 0));

-- Store the 16-bit number into a 16-bit register:
RegZ: reg_16_bit port map ( Z3(15 downto 0), clock, load, clear, Z(15 downto 0));
--Z <= Z_buf;
process (clock)
begin
    if(Z = Z3) then
      end_flag <= '1';
    else
      end_flag <= '0';
    end if;
end process;
end operation;