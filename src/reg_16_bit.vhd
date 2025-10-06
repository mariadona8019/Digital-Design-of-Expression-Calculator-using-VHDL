library IEEE;
use ieee.std_logic_1164.all;


entity reg_16_bit is
  port( data_in : in std_logic_vector (15 downto 0);
      clock, load, clear: in std_logic; 
      data_out : out std_logic_vector (15 downto 0));
end reg_16_bit;

-- Architecture implementation: 
architecture regC of reg_16_bit is

begin
  process (clock) 
  begin
    if (clear = '1') then
        data_out <="0000000000000000";
    -- check for positive edge of clock
    elsif (clock'event and clock = '1') then 
      -- if the clear signal is high then reset the register: 
      -- if the load signal is high then load the value of input to registers:
      if load ='1' then 
        data_out <=data_in;
      end if;
    end if;
  end process;
end;
 
