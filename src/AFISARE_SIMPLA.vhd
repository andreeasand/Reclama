---------------------------------------------------------------------------------------------------
--
-- Title       : AFISARE_SIMPLA
-- Design      : reclama
-- Author      : Andreea Sand
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : AFISARE_SIMPLA.vhd
-- Generated   : Mon Apr 19 15:37:31 2021
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
--{entity {AFISARE_SIMPLA} architecture {AFISARE_SIMPLA}}

library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity AFISARE_SIMPLA is
	 port(
		 clk : in STD_LOGIC;
		 D_ROM : out STD_LOGIC_VECTOR(0 to 6);
		 A_ROM: inout STD_LOGIC_VECTOR(0 to 3):="0111"
	     );
end AFISARE_SIMPLA;

--}} End of automatically maintained section

architecture arhi of AFISARE_SIMPLA is
type MATRIX is array (0 to 3) of std_logic_vector (0 to 6);
signal litera: MATRIX:=("0110001","0110000","0001000","0100100"); 
signal Clk_div: std_logic_vector (0 to 15):= "0000000000000000";
begin
	process (clk)
	begin
		if clk='1' and clk'event then 
			if Clk_div="0000000000000000" then 
			case A_ROM is
				when "0111"=>
					D_ROM<=litera(1);									  
				    A_ROM<=(A_ROM(3),A_ROM(0),A_ROM(1),A_ROM(2));	   --1011
				
				when "1011"=>
					D_ROM<=litera(2);
					A_ROM<=(A_ROM(3),A_ROM(0),A_ROM(1),A_ROM(2));
				
				when "1101"=>
					D_ROM<=litera(3);
					A_ROM<=(A_ROM(3),A_ROM(0),A_ROM(1),A_ROM(2));
				
				when "1110"=>
					D_ROM<=litera(0);									  
					A_ROM<=(A_ROM(3),A_ROM(0),A_ROM(1),A_ROM(2));
				
				when others=>
					D_ROM<="1111111";
			end case;
			else null;
		end if;	
		Clk_div<=Clk_div+1;
	end if;
	end process;
end arhi;
