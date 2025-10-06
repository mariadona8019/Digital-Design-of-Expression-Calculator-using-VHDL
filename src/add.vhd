library IEEE;
use ieee.std_logic_1164.all;

-- Entity Declaration: 
entity add1 is
  port( A  : in std_logic_vector (15 downto 0);
      --clear : in std_logic;
      Z		: out std_logic_vector (15 downto 0));
end add1;
architecture dataflow of add1 is
component rca
   port( A, B  	: in std_logic_vector (15 downto 0);
      carry_in	: in std_logic;
      sum		: out std_logic_vector (15 downto 0);
      carry_out : out std_logic);
end component;

--signal declarations:
signal C: std_logic_vector (1 downto 0);
signal sum: std_logic_vector (15 downto 0);
signal B: std_logic_vector (15 downto 0);
begin

B <= "0000000000000001";

C(0)<='0';
RCA1: rca port map(A(15 downto 0),B(15 downto 0),C(0),sum(15 downto 0),C(1));
Z(0)<=sum(0);
Z(1)<=sum(1);
Z(2)<=sum(2);
Z(3)<=sum(3);
Z(4)<=sum(4);
Z(5)<=sum(5);
Z(6)<=sum(6);
Z(7)<=sum(7);
Z(8)<=sum(8);
Z(9)<=sum(9);
Z(10)<=sum(10);
Z(11)<=sum(11);
Z(12)<=sum(12);
Z(13)<=sum(13);
Z(14)<=sum(14);
Z(15)<=sum(15);

end dataflow;



