-- full_adder1
library ieee; 
use ieee.std_logic_1164.all; 
entity test_fulladder is
end test_fulladder; 
architecture testbench of test_fulladder is 
signal d,e,f: std_logic; 
signal s1,c1: std_logic; 
component full_adder1 is 
port(A,B,carry_in:in std_logic; 
sum,carry_out: out std_logic); 
end component; 
begin 
g1:full_adder1 port map(d,e,f,s1,c1); 
process 
begin 
d<='0'; 
e<='0'; 
f<='0'; 
wait for 100 ns; 
d<='0'; 
e<='0'; 
f<='1'; 
wait for 100 ns; 
d<='0'; 
e<='1'; 
f<='0'; 
wait for 100 ns; 
d<='0'; 
e<='1'; 
f<='1'; 
wait for 100 ns; 
d<='1'; 
e<='0'; 
f<='0'; 
wait for 100 ns; 
d<='1'; 
e<='0'; 
f<='1'; 
wait for 100 ns; 
d<='1'; 
e<='1'; 
f<='0'; 
wait for 100 ns; 
d<='1'; 
e<='1'; 
f<='1'; 
wait for 100 ns; 
end process; 
end testbench;

-- half_adder
library ieee; 
use ieee.std_logic_1164.all; 
entity test_halfadder is 
end test_halfadder; 
architecture testbench of test_halfadder is 
signal ha,hb: std_logic; 
signal hsum,hcarry: std_logic; 
component half_adder1 
port(A,B:in std_logic; 
sum,carry: out std_logic); 
end component; 
begin 
e1:half_adder1 port map (ha,hb,hsum,hcarry); 
process 
begin 
ha<= '0'; 
hb<='0'; 
wait for 100 ns; 
ha<= '0'; 
hb<='1'; 
wait for 100 ns; 
ha<= '1'; 
hb<='0'; 
wait for 100 ns; 
ha<= '1'; 
hb<='1'; 
wait for 100 ns; 
end process;
end testbench;

-- and1
library ieee;
use ieee.std_logic_1164.all; 
entity and_gate_test is 
end and_gate_test; 
architecture testbench of and_gate_test is 
signal a,b : std_logic ; 
signal c :std_logic ; 
component and1 
port(A,B: in std_logic; 
Z:out std_logic); 
end component; 
begin 
h1: and1 port map(a,b,c); 
process 
begin 
a<= '0'; 
b<='0'; 
wait for 100 ns; 
a<= '0'; 
b<='1'; 
wait for 100 ns; 
a<= '1'; 
b<='0'; 
wait for 100 ns; 
a<= '1'; 
b<='1'; 
wait for 100 ns; 
end process; 
end testbench;

--not_gate
library ieee; 
use ieee.std_logic_1164.all; 
entity test_not is 
end test_not; 
architecture structural of test_not is 
component not_gate 
port(A:in std_logic; 
Z:out std_logic); 
end component; 
signal a,b: std_logic; 
begin 
u1: not_gate port map(a,b); 
process 
begin 
a<='0'; 
wait for 100 ns; 
a<='1'; 
wait for 100 ns; 
end process; 
end structural;

--or1
Library ieee; 
use ieee.std_logic_1164.all; 
entity test_or is 
end test_or; 
architecture testbench of test_or is 
signal a,b: std_logic; 
signal c:std_logic;
component or1 
port(A,B: in std_logic; 
Z: out std_logic); 
end component; 
begin 
u1: or1 port map(a,b,c); 
process 
begin 
a<='0'; 
b<='0'; 
wait for 100 ns; 
a<='0'; 
b<='1'; 
wait for 100 ns; 
a<='1'; 
b<='0'; 
wait for 100 ns; 
a<='1'; 
b<='1'; 
wait for 100 ns; 
end process; 
end testbench;

--xor1
Library ieee; 
use ieee.std_logic_1164.all; 
entity test_xor is 
end test_xor; 
architecture testbench of test_xor is 
signal a,b: std_logic; 
signal c:std_logic; 
component xor1 
port(A,B: in std_logic; 
Z: out std_logic); 
end component; 
begin 
u1: xor1 port map(a,b,c); 
process 
begin 
a<='0'; 
b<='0'; 
wait for 100 ns; 
a<='0'; 
b<='1'; 
wait for 100 ns; 
a<='1'; 
b<='0'; 
wait for 100 ns; 
a<='1'; 
b<='1'; 
wait for 100 ns; 
end process; 
end testbench;

--rca16
library IEEE;
use IEEE.std_logic_1164.all;

entity rca_tb is
end entity;

architecture tb of rca_tb is
component rca is
port( A, B : in std_logic_vector (15 downto 0);
carry_in : in std_logic;
sum : out std_logic_vector (15 downto 0);
carry_out : out std_logic);
end component;

signal A,B,sum: std_logic_vector (15 downto 0);
signal carry_in: std_logic := '0';
signal carry_out: std_logic;

begin

uut: rca port map(
A => A, B => B, carry_in => carry_in,
sum => sum,
carry_out => carry_out);

stim: process
begin

A <= "0000000000000000";
B <= "0000000000000001";
wait for 20 ns;

A <= "0000000000000011";
B <= "0010000000100110";
wait for 20 ns;

A <= "0000000000000001";
B <= "0010000000100110";
wait for 20 ns;

wait;

end process;

end tb;

--multiplier
Library ieee; 
use ieee.std_logic_1164.all; 
entity test_wallace_multiplier is 
end test_wallace_multiplier; 
architecture testbench of test_wallace_multiplier is 
component multiplier
port( A,B: in std_logic_vector(7 downto 0); 
Z: out std_logic_vector(15 downto 0)); 
end component; 

signal A,B: std_logic_vector(7 downto 0); 
signal Z:std_logic_vector(15 downto 0); 
begin 
u1: multiplier port map(A(7 downto 0),B(7 downto 0),Z(15 downto 0)); 
process

begin 
A<="00000000"; 
B<="00000000"; 
wait for 100 ns; 
A<="01110110"; 
B<="11110110"; 
wait for 100 ns;
A<="00101101"; 
B<="10001011"; 
wait for 100 ns;
A<="11111010"; 
B<="00000010"; 
wait for 100 ns;
end process; 
end testbench;

-- reg_8_bit
library ieee; 
use ieee.std_logic_1164.all; 
entity test_8bitreg is 
end test_8bitreg; 
architecture testbench of test_8bitreg is 
signal data_in : STD_LOGIC_VECTOR (7 downto 0); 
signal clock,clear,load : STD_LOGIC; 
signal data_out : STD_LOGIC_VECTOR (7 downto 0); 
component reg_8_bit 
port(data_in :in std_logic_vector(7 downto 0); 
clock,clear,load:in std_logic; 
data_out:out std_logic_vector(7 downto 0)); 
end component; 
begin 
u1: reg_8_bit port map(data_in,clock,clear,load,data_out); 
process 
begin

data_in<="00000000"; 
clock<='1'; 
clear<='0'; 
load<='1'; 
wait for 100 ns; 

data_in<="00011111"; 
clock<= '0'; 
clear<='1'; 
load<='0'; 
wait for 100 ns; 

data_in<="11111111"; 
clock<='1'; 
clear<='0'; 
load<='1'; 
wait for 100 ns;

data_in<="00011101"; 
clock<='0'; 
clear<='0'; 
load<='1'; 
wait for 100 ns;

data_in<="11110001"; 
clock<='1'; 
clear<='0'; 
load<='1'; 
wait for 100 ns;

data_in<="11001101"; 
clock<='0'; 
clear<='0'; 
load<='0'; 
wait for 100 ns;

data_in<="10000001"; 
clock<='1'; 
clear<='0'; 
load<='1'; 
wait for 100 ns;
end process; 
end testbench;

-- final_test
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity testbench_final is
end testbench_final;
architecture test_bench of testbench_final is
  signal A, B: std_logic_vector (7 downto 0);
  signal LOAD, CLEAR, END_FLAG: std_logic; 
  signal CLOCK: std_logic; --:= '0';
  signal Z: std_logic_vector(15 downto 0); 
  constant clock_period: time:= 100 ns; -- 10 MHz

--Here, we are going to define the array of the inputs
--declare record type

type sample is record
  A1, B1: std_logic_vector(7 downto 0);
  load1, clear1: std_logic; -- LOAD, CLEAR
end record;

type sample_array is array (natural range <>) of sample; 
  constant test_data : sample_array := (
  ("10001000", "00010010", '0', '1'),
  ("01111111", "01111111", '1', '0'),
  ("00011001", "01000110", '1', '0'), 
  ("01010100", "01010100", '1', '0'),  
  ("00110011", "00011001", '1', '0'),  
  ("00001010", "00010101", '1', '0'),  
  ("01001001", "01000110", '1', '0'),  
  ("01110101", "01101001", '1', '0'),
  ("11111111", "11111111", '1', '0'), 
  ("10001000", "00010010", '0', '1')); 

component main3
port (
  A: in std_logic_vector (7 downto 0); 
  B: in std_logic_vector(7 downto 0);
  load: in std_logic;
  clear: in std_logic; 
  clock: in std_logic;
  end_flag: out std_logic;
  Z: inout std_logic_vector (15 downto 0));
end component;

begin
  test: main3
    port map(
      A => A,
      B=> B, 
      load => LOAD,
      clear => CLEAR, 
      clock => CLOCK,
      end_flag => END_FLAG, 
      Z => Z );

--This process generates the clock clock_process: process begin
clock_process: process
begin
  CLOCK <= '1'; 
  wait for clock_period/2;
  CLOCK <= '0';
  wait for clock_period/2;
end process;


process
begin
  for i in test_data'range loop
    A <= test_data(i).A1;
    B <= test_data(i).B1;
    LOAD <= test_data(i).load1;
    CLEAR <= test_data(i).clear1;
    wait for 300ns;
  end loop;
  wait;
end process;
end test_bench;


-- shifting operation.
Library ieee; 
use ieee.std_logic_1164.all; 
entity test_shift is 
end test_shift; 
architecture testbench of test_shift is 
component shift
port( A: in std_logic_vector(15 downto 0); 
Z: out std_logic_vector(15 downto 0)); 
end component; 

signal A: std_logic_vector(15 downto 0); 
signal Z:std_logic_vector(15 downto 0); 
begin 
u1: shift port map(A(15 downto 0) ,Z(15 downto 0)); 
process

begin 
A<="0001111110011111";
wait for 10 ns;

A<="0011001100110011";
wait for 10 ns;
end process; 
end testbench;

--additon
Library ieee; 
use ieee.std_logic_1164.all; 
entity test_add is 
end test_add; 
architecture testbench of test_add is 
component add1
port( A  : in std_logic_vector (15 downto 0);
      Z		: out std_logic_vector (15 downto 0));
end component; 

signal A: std_logic_vector(15 downto 0); 
signal Z:std_logic_vector(15 downto 0); 
begin 
u1: add1 port map(A(15 downto 0), Z(15 downto 0)); 
process

begin 
A<="0000000000000010";   
wait for 100 ns;

A<="0000000001100010";   
wait for 100 ns;

wait;

end process; 
end testbench;