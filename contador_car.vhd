library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity contador_car is
 Port ( 
 reset 	: 	in STD_LOGIC;
 carros 	: 	in STD_LOGIC;
 
 bandera : 	in STD_LOGIC := '0';
 
 counter : 	out STD_LOGIC_VECTOR (3 downto 0)
 );
end contador_car;


architecture contador of contador_car is

	signal cnt: unsigned(3 downto 0); 

begin

AGREGAR_QUITAR_CAR:  process(reset,carros) 
								begin
									if reset='1' then
										cnt <= "0000";
									elsif carros'event and carros = '1' then
											if bandera = '1' then
												cnt <= cnt + 1;
											else
												cnt <= cnt - 1;
											end if;
										counter <= std_logic_vector(cnt);
								end if;
							end process; 

end contador;