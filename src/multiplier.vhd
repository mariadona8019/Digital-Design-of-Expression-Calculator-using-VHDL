library IEEE;
use ieee.std_logic_1164.all;

-- Entity Declaration: 
entity multiplier is
  port( A : in std_logic_vector (7 downto 0);
    B: in std_logic_vector(7 downto 0);
     Z: out std_logic_vector (15 downto 0));
end multiplier;

-- Architecture Implementation:
architecture mul of multiplier is

-- Component Declaration of partial product:
Component partial_product
  port( A  : in std_logic_vector (7 downto 0);
    B:in std_logic_vector(7 downto 0);
      P: out std_logic_vector (64 downto 1));
end Component;

-- Component Declaration of half adder:
Component half_adder1
  port( A, B : in std_logic;
      sum, carry : out std_logic);
end Component;

-- Component Declaration of full_adder:
Component full_adder1
  port( A, B, carry_in : in std_logic;
      sum, carry_out : out std_logic);
end Component;

-- Signal declarations:
signal P: std_logic_vector (64 downto 1);
signal K: std_logic_vector (24 downto 0);
signal L: std_logic_vector (25 downto 0);
signal S: std_logic_vector (37 downto 0);
signal C: std_logic_vector (37 downto 0);

begin

-- Finding the partial products of the 8 bit number: 
result: partial_product port map (A (7 downto 0),B (7 downto 0), P (64 downto 1));

-- First STAGE:
Z(0)<=P(1);
HA1: half_adder1 port map (P(2), P(9), K(0), L(0));
FA1: full_adder1 port map (P(3), P(10),P(17), S(0), C(0));
FA2: full_adder1 port map (P(4), P(11),P(18), S(1), C(1));
FA3: full_adder1 port map (P(5), P(12),P(19), S(2), C(2));
FA4: full_adder1 port map (P(6), P(13),P(20), S(3), C(3));
FA5: full_adder1 port map (P(7), P(14),P(21), S(4), C(4));
FA6: full_adder1 port map (P(8), P(15),P(22), S(5), C(5));
HA2: half_adder1 port map (P(16), P(23), K(1), L(1));

HA3: half_adder1 port map (P(26), P(33), K(2), L(2));
FA7: full_adder1 port map (P(27), P(34),P(41), S(6), C(6));
FA8: full_adder1 port map (P(28), P(35),P(42), S(7), C(7));
FA9: full_adder1 port map (P(29), P(36),P(43), S(8), C(8));
FA10: full_adder1 port map (P(30), P(37),P(44), S(9), C(9));
FA11: full_adder1 port map (P(31), P(38),P(45), S(10), C(10));
FA12: full_adder1 port map (P(32), P(39),P(46), S(11), C(11));
HA4: half_adder1 port map (P(40), P(47), K(3), L(3));

-- Second STAGE:
Z(1)<=K(0);
HA5: half_adder1 port map (S(0), L(0), K(4), L(4));
FA13: full_adder1 port map (S(1), C(0), P(25), S(12), C(12));
FA14: full_adder1 port map (S(2), C(1), K(2), S(13), C(13));
FA15: full_adder1 port map (S(3), C(2), S(6), S(14), C(14));
FA16: full_adder1 port map (S(4), C(3), S(7), S(15), C(15));
FA17: full_adder1 port map (S(5), C(4), S(8), S(16), C(16));
FA18: full_adder1 port map (K(1), C(5), S(9), S(17), C(17));
FA19: full_adder1 port map (P(24), L(1), S(10), S(18), C(18));

HA6: half_adder1 port map (C(6), P(49), K(5), L(5));
FA20: full_adder1 port map (C(7), P(50), P(57), S(19), C(19));
FA21: full_adder1 port map (C(8), P(51), P(58), S(20), C(20));
FA22: full_adder1 port map (C(9), P(52), P(59), S(21), C(21));
FA23: full_adder1 port map (C(10), P(53), P(60), S(22), C(22));
FA24: full_adder1 port map (C(11), P(54), P(61), S(23), C(23));
FA25: full_adder1 port map (L(3), P(55), P(62), S(24), C(24));
HA7: half_adder1 port map (P(56), P(63), K(6), L(6));

-- Third STAGE
Z(2)<=K(4);
HA8: half_adder1 port map (S(12), L(4), K(7), L(7));
HA9: half_adder1 port map (S(13), C(12), K(8), L(8));
FA26: full_adder1 port map (S(14), C(13), L(2), S(25), C(25));
FA27: full_adder1 port map (S(15), C(14), K(5), S(26), C(26));
FA28: full_adder1 port map (S(16), C(15), S(19), S(27), C(27));
FA29: full_adder1 port map (S(17), C(16), S(20), S(28), C(28));
FA30: full_adder1 port map (S(18), C(17), S(21), S(29), C(29));
FA31: full_adder1 port map (S(11), C(18), S(22), S(30), C(30));
HA10: half_adder1 port map (K(3), S(23), K(9), L(9));
HA11: half_adder1 port map (P(48), S(24), K(10), L(10));

-- Fourth STAGE
Z(3)<=K(7);
HA12: half_adder1 port map (K(8), L(7), K(11), L(11));
HA13: half_adder1 port map (S(25), L(8), K(12), L(12));
HA14: half_adder1 port map (S(26), C(25), K(13), L(13));
FA32: full_adder1 port map (S(27), C(26), L(5), S(31), C(31));
FA33: full_adder1 port map (S(28), C(27), C(19), S(32), C(32));
FA34: full_adder1 port map (S(29), C(28), C(20), S(33), C(33));
FA35: full_adder1 port map (S(30), C(29), C(21), S(34), C(34));
FA36: full_adder1 port map (K(9), C(30), C(22), S(35), C(35));
FA37: full_adder1 port map (K(10), L(9), C(23), S(36), C(36));
FA38: full_adder1 port map (K(6), L(10), C(24), S(37), C(37));
HA15: half_adder1 port map (P(24), L(6), K(14), L(14));

-- Fifth STAGE
Z(4)<=K(11);
HA16: half_adder1 port map (K(12), L(11), Z(5), L(15));
FA39: full_adder1 port map (K(13), L(12), L(15), Z(6), L(16));
FA40: full_adder1 port map (S(31), L(13), L(16), Z(7), L(17));
FA41: full_adder1 port map (S(32), C(31), L(17), Z(8), L(18));
FA42: full_adder1 port map (S(33), C(32), L(18), Z(9), L(19));
FA43: full_adder1 port map (S(34), C(33), L(19), Z(10), L(20));
FA44: full_adder1 port map (S(35), C(34), L(20), Z(11), L(21));
FA45: full_adder1 port map (S(36), C(35), L(21), Z(12), L(22));
FA46: full_adder1 port map (S(37), C(36), L(22), Z(13), L(23));
FA47: full_adder1 port map (K(14), C(37), L(23), Z(14), L(24));
HA17: half_adder1 port map (L(14), L(24), Z(15), L(25));

end mul;
