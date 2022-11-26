---------------------------------------------------------------------------------------------------
--
-- Title       : DEPLASARE_DREAPTA
-- Design      : reclama
-- Author      : Andreea Sand
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : DEPLASARE_DREAPTA.vhd
-- Generated   : Tue Apr 20 08:26:22 2021
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
--{entity {DEPLASARE_DREAPTA} architecture {DEPLASARE_DREAPTA}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DEPLASARE_DREAPTA is
	 port(
		 CLK : in STD_LOGIC;
		 D_ROM : out STD_LOGIC_VECTOR(0 to 6);
		 A_ROM : inout STD_LOGIC_VECTOR(0 to 3):="1110"
	     );
end DEPLASARE_DREAPTA;

--}} End of automatically maintained section

architecture arhi of DEPLASARE_DREAPTA is 
type MATRIX is array (0 to 15) of std_logic_vector(0 to 6);
signal litera: MATRIX:=("0110001","0110000","0001000","0100100","0100100","0110001","0110000","0001000","0001000","0100100","0110001","0110000","0110000","0001000","0100100","0110001");
signal Clk_div: std_logic_vector (0 to 15):= (others=>'0'); 
signal Clk_del: std_logic_vector(0 to 24):=(others =>'0');
begin 
	process(CLK)
	variable i:integer:=0;
	begin
	if CLK='1' and CLK'EVENT then
		case A_ROM is
			when "0111"=>
				D_ROM<=litera(i+1);
				A_ROM<=(A_ROM(3),A_ROM(0),A_ROM(1),A_ROM(2));
				
				when "1011"=>
				D_ROM<=litera(i+2);
				A_ROM<=(A_ROM(3),A_ROM(0),A_ROM(1),A_ROM(2));
				
				when "1101"=>
				D_ROM<=litera(i+3);
				A_ROM<=(A_ROM(3),A_ROM(0),A_ROM(1),A_ROM(2));
				
				when "1110"=>
				D_ROM<=litera(i);
				A_ROM<=(A_ROM(3),A_ROM(0),A_ROM(1),A_ROM(2));
				
				when others=>
				D_ROM<="1111111";
		end case; 
		end if;	 
				Clk_div<=Clk_div+1;
				Clk_del<=Clk_del+1;
			if Clk_del="1111111111111111111111111" then 
				i:=i+4;
			else null; 
			end if;
			if i=16 then 
				i:=0; 
			else null;
			end if;		
	end process;  
end arhi;
