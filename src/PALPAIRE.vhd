---------------------------------------------------------------------------------------------------
--
-- Title       : PALPAIRE
-- Design      : reclama
-- Author      : Andreea Sand
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : PALPAIRE.vhd
-- Generated   : Mon Apr 19 19:54:44 2021
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
--{entity {PALPAIRE} architecture {PALPAIRE}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PALPAIRE is
	 port(
		 CLK : in STD_LOGIC;
		 D_ROM : out STD_LOGIC_VECTOR(0 to 6);
		 A_ROM : inout STD_LOGIC_VECTOR(0 to 3):="1110"
	     );
end PALPAIRE;

--}} End of automatically maintained section

architecture arhi of PALPAIRE is
type MATRIX is array (0 to 7) of std_logic_vector(0 to 6);
signal litera: MATRIX:=("0110001","0110000","0001000","0100100","1111111","1111111","1111111","1111111"); 	
signal CTR: std_logic_vector (0 to 15):= (others=>'0'); 
signal CTRP: std_logic_vector(0 to 2):=(others =>'0');
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
		   CTR<=CTR+1;
		   CTRP<=CTRP+1;
		  if CTRP="111" then 
				i:=i+4;
			else null; 
			end if;
			if i=8 then 
				i:=0; 
			else null;
			end if;		
			end if;
            end process;  
	end arhi;
