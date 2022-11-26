---------------------------------------------------------------------------------------------------
--
-- Title       : reclama
-- Design      : reclama
-- Author      : Andreea Sand
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : reclama.vhd
-- Generated   : Mon Apr 12 22:07:49 2021
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {reclama} architecture {reclama}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity reclama is
	 port(
		 clk : in STD_LOGIC;
		 S : in STD_LOGIC_VECTOR(0 to 2);
		 A : out STD_LOGIC_VECTOR(0 to 3):="1110";
		 C : out STD_LOGIC_VECTOR(0 to 6)
	     );
end reclama;

--}} End of automatically maintained section  
--dispaly pentru 4 litere
--A=4 anozi activi pe 0
--c=7 catozi activi pe 0
--s=semnalul de selectie(o sa fie de ex 8 regimuri)	

architecture arh of reclama is	

signal C0,C1,C2,C3,C4,C5,C6,C7: std_logic_vector(0 to 6);
signal A0,A1,A2,A3,A4,A5,A6,A7: std_logic_vector(0 to 3):="1110";  

component AFISARE_SIMPLA is
	port (A_ROM:inout std_logic_vector(0 to 3):="1110";
	CLK: in std_logic;
	D_ROM:out std_logic_vector(0 to 6));	 
end component; 

component PALPAIRE is
	port (A_ROM:inout std_logic_vector(0 to 3);
	CLK: in std_logic;
	D_ROM:out std_logic_vector(0 to 6));	 
end component; 

component DEPLASARE_DREAPTA is
	port (A_ROM:inout std_logic_vector(0 to 3);
	CLK: in std_logic;
	D_ROM:out std_logic_vector(0 to 6));	 
end component; 

component DEPLASARE_STANGA is
	port (A_ROM:inout std_logic_vector(0 to 3);
	CLK: in std_logic;
	D_ROM:out std_logic_vector(0 to 6));	 
end component;	

component LITERA_CU_LITERA is
	port (A_ROM:inout std_logic_vector(0 to 3);
	CLK: in std_logic;
	D_ROM:out std_logic_vector(0 to 6));	 
end component;	


component NIVEL is
	port (A_ROM:inout std_logic_vector(0 to 3);
	CLK: in std_logic;
	D_ROM:out std_logic_vector(0 to 6));	 
end component;	

component REGIM6 is
	port (A_ROM:inout std_logic_vector(0 to 3);
	CLK: in std_logic;
	D_ROM:out std_logic_vector(0 to 6));	 
end component;	

component REGIM7 is
	port (A_ROM:inout std_logic_vector(0 to 3);
	CLK: in std_logic;
	D_ROM:out std_logic_vector(0 to 6));	 
end component;	


begin

	R0: AFISARE_SIMPLA port map (A0,CLK,C0);
	R1: PALPAIRE port map (A1,CLK,C1);
	R2: DEPLASARE_DREAPTA port map (A2,CLK,C2);
	R3: DEPLASARE_STANGA port map (A3,CLK,C3);
	R4: LITERA_CU_LITERA port map (A4,CLK,C4);
	R5: NIVEL port map (A5,CLK,C5);
	--R6: REGIM6 port map (A6,CLK,C6);
	--R7: REGIM7 port map (A7,CLK,C7);
	
	process(CLK)
	begin 
		case S is 
			when"000" => 
			C<=C0;
			A<=A0;
			when "001" =>
			C<=C1; 
			A<=A1;
			when "010" =>
			C<=C2;
			A<=A2;
			when "011" =>
			C<=C3;
			A<=A3;
			when "100" =>
			C<=C4;
			A<=A4;
			when "101" =>
			C<=C5;
			A<=A5;
			when "110" =>
			C<=C6;
			A<=A6;
			when "111" =>
			C<=C7;
			A<=A7;
			when others =>
			C<="1111111";
		end case;
	end process;
	
end architecture;			
